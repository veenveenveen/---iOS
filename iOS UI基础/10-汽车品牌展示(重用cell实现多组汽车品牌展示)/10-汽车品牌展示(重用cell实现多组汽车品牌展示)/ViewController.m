//
//  ViewController.m
//  10-汽车品牌展示(重用cell实现多组汽车品牌展示)
//
//  Created by 黄启明 on 16/4/16.
//  Copyright © 2016年 IOS. All rights reserved.
//  （模型嵌套模型）

#import "ViewController.h"
#import "GroupModel.h"
#import "CarModel.h"
@interface ViewController () <UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate,UISearchBarDelegate>
//定义一个数组保存groupModel
@property (nonatomic, strong) NSArray *group;
@property (nonatomic, strong) CarModel *carMod;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, assign) NSInteger a;
@property (nonatomic, assign) NSInteger b;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (nonatomic, strong) NSMutableArray *carFilterArray;//获取过滤后的数据
@end

@implementation ViewController

#pragma mark - 懒加载数据
- (NSArray *)group{
    if (_group == nil) {
        //获取plist文件的数据
        NSString *path = [[NSBundle mainBundle]pathForResource:@"cars_total.plist" ofType:nil];
        //读取plist文件
        NSArray *tempArr = [NSArray arrayWithContentsOfFile:path];
        //懒加载数据
        NSMutableArray *modArr = [NSMutableArray array];
        for (NSDictionary *dict in tempArr) {
            GroupModel *groupMod = [GroupModel groupModelWithDict:dict];
            [modArr addObject:groupMod];
        }
        _group = modArr;
    }
    return _group;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - 过滤之后的汽车数据
- (NSMutableArray *)carFilterArray{
    if (_carFilterArray == nil) {
        _carFilterArray = [NSMutableArray array];
    }
    return _carFilterArray;
}
#pragma mark - 数据源方法
//设置显示多少组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.searchBar.text.length == 0) {
        return self.group.count;
    }else{
        return 1;
    }
}
//设置每组显示多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.searchBar.text.length == 0) {
        GroupModel *groupMod = self.group[section];
        return groupMod.cars.count;
    }else{
        return self.carFilterArray.count;
    }
}
//设置每组显示什么内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    UIImage *img = [UIImage imageNamed:groupMod.cars[indexPath.row]];
    //单元格重用
    static NSString *strID = @"car_ID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strID];
    }
    if (self.searchBar.text.length == 0) {
        //获取数据
        GroupModel *groupMod = self.group[indexPath.section];
        CarModel *carMod = groupMod.cars[indexPath.row];
        cell.imageView.image = [UIImage imageNamed:carMod.icon];
        cell.textLabel.text = carMod.name;
    }else{
        //若有信息则输入carFilterArray的数据
        CarModel *carMod = self.carFilterArray[indexPath.row];
        cell.imageView.image = [UIImage imageNamed:carMod.icon];
        cell.textLabel.text = carMod.name;
    }
    return cell;
}
//设置组标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (self.searchBar.text.length == 0) {
        GroupModel *groupMod = self.group[section];
        return groupMod.title;
    }else{
        return nil;
    }
}
//设置右侧索引
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
        return [self.group valueForKeyPath:@"title"];
}
#pragma mark - 隐藏状态栏
- (BOOL)prefersStatusBarHidden{
    return YES;
}
#pragma mark - 代理方法
//监听行被选中的代理方法(触发单元格后调用代理的方法实现键盘的隐藏)
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //获取当前被选中的这行的名称
    GroupModel *groupMod = self.group[indexPath.section];
    self.carMod = groupMod.cars[indexPath.row];
    //创建一个弹框
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"编辑" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    alertView.alertViewStyle = UIAlertViewStylePlainTextInput;//设置样式
    [alertView textFieldAtIndex:0].text = self.carMod.name;//设置文本框显示的内容
    [alertView textFieldAtIndex:0].textAlignment = NSTextAlignmentCenter;
    self.a = indexPath.section;
    self.b = indexPath.row;
    //显示
    [alertView show];
    [self.searchBar resignFirstResponder];
}
#pragma mark - alertView的代理方法
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        NSString *name = [alertView textFieldAtIndex:0].text;//拿到文本框的内容
        self.carMod.name = name;//修改名称
        //刷新tableView（重新调用数据源方法）
//        [self.tableView reloadData];//刷新整个tableView
        //创建一个行对象
        NSIndexPath *idxPath = [NSIndexPath indexPathForRow:self.b inSection:self.a];
        [self.tableView reloadRowsAtIndexPaths:@[idxPath] withRowAnimation:UITableViewRowAnimationAutomatic]; //局部刷新
    }
}
#pragma mark - UISearchBarDelegate代理方法
//搜索条文字发生变化时触发
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    [self handleSearchForTeam:searchText];
}
- (void)handleSearchForTeam:(NSString *)searchText{
    if (self.searchBar.text.length == 0) {
        //若输入文本信息为空则刷新数据
        [self.tableView reloadData];
    }else{
        //否则先移除数据
        [self.carFilterArray removeAllObjects];
        //先遍历存放GroupModel的模型数组
        for (GroupModel *groMod in self.group) {
            //内部遍历存放CarModel的数组
            for (CarModel *carMod in groMod.cars) {
                NSString *str1 = [carMod.name uppercaseString];
                NSString *str2 = [searchText uppercaseString];
                if ([str1 containsString:str2]) {
                    [self.carFilterArray addObject:carMod];
                }
            }
        }
        [self.tableView reloadData];
    }
}
@end
