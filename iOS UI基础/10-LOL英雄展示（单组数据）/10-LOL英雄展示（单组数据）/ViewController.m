//
//  ViewController.m
//  10-LOL英雄展示（单组数据）
//
//  Created by 黄启明 on 16/4/16.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "ViewController.h"
#import "HeroModel.h"
@interface ViewController () <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) NSArray *herosArray;//保存英雄的集合
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController
//隐藏状态栏
- (BOOL)prefersStatusBarHidden{
    return  YES;
}
//懒加载
- (NSArray *)herosArray{
    if (_herosArray == nil) {
        //获取plist文件的路径
        NSString *path = [[NSBundle mainBundle]pathForResource:@"heros.plist" ofType:nil];
        //读取plist文件
        NSArray *tempArr = [NSArray arrayWithContentsOfFile:path];
        //字典转模型
        NSMutableArray *herosArray = [NSMutableArray array];
        for (NSDictionary *dict in tempArr) {
            HeroModel *heroMod = [HeroModel heroModelWithDict:dict];
            [herosArray addObject:heroMod];
        }
        _herosArray = herosArray;
    }
    return _herosArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //新：统一设置UITableView的每一行的行高（每行的行高一样，建议这种，效率更高）
    self.tableView.rowHeight = 60;
    //新：如果每一行的行高都不一样，要通过代理的方法来实现
//设置分割线的颜色
    self.tableView.separatorColor = [UIColor redColor];
//设置分割线的样式
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//tableHeaderView,一般可以放广告
    
//tableFooterView,一般可以放“加载更多”
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//要显示的组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
//每组显示多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.herosArray.count;
}
//每组的每一行显示什么数据
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HeroModel *heroModel = self.herosArray[indexPath.row];
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    cell.imageView.image = [UIImage imageNamed:heroModel.icon];
    cell.textLabel.text = heroModel.name;
    cell.detailTextLabel.text = heroModel.intro;
    //新：要在单元格的最右边显示一个小箭头，所以要设置单元格对象的某个属性
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    //新：自定义右边的accessory
//    cell.accessoryView = [[UISwitch alloc]init];
    //新：统一设置UITableView的每一行的行高：在viewDidLoad中设置
//设置单元格的背景颜色
    if ((indexPath.row % 2) == 0) {
        cell.backgroundColor = [UIColor grayColor];
    }else{
        cell.backgroundColor = [UIColor yellowColor];
    }
//设置选中的单元格的背景颜色
    UIView *selectdView = [[UIView alloc]init];
    selectdView.backgroundColor = [UIColor greenColor];
    cell.selectedBackgroundView = selectdView;
    return cell;
}
//代理方法，设置行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    int rowNum = indexPath.row;
    if ((rowNum % 2) == 0) {
        return 60;
    }else{
        return 40;
    }
}
@end
