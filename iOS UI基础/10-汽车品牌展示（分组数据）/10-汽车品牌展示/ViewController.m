//
//  ViewController.m
//  10-汽车品牌展示(分组数据)
//
//  Created by 黄启明 on 16/4/16.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "ViewController.h"
#import "CarModel.h"
@interface ViewController () <UITableViewDataSource>
@property (nonatomic, strong) NSArray *carsArray;
@end

@implementation ViewController
//懒加载
- (NSArray *)carsArray{
    if (_carsArray == nil) {
        //获取plist文件的路径
        NSString *path = [[NSBundle mainBundle]pathForResource:@"cars_simple.plist" ofType:nil];
        //加载plist文件
        NSArray *arr = [NSArray arrayWithContentsOfFile:path];
        //字典转模型
        NSMutableArray *tempMutableArr = [NSMutableArray array];
        for (NSDictionary *dict in arr) {
            CarModel *carMod = [CarModel carModelWithDict:dict];
            [tempMutableArr addObject:carMod];
        }
        _carsArray = tempMutableArr;
    }
    return _carsArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//告诉UITableView要显示几组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.carsArray.count;
}
//设置每组要显示几行数据
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //根据组索引获取组对象
    CarModel *carModel = self.carsArray[section];
    return carModel.cars.count;
}
//设置每一组每一行的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //获取模型数据
    CarModel *carmodel = self.carsArray[indexPath.section];//获取组模型
    NSString *brand = carmodel.cars[indexPath.row];//获取对应的汽车品牌
    //创建单元格
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    //将数据设置给单元格中的子控件
    cell.textLabel.text = brand;
    //返回单元格
    return cell;
}
//设置组标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    CarModel *carmodel = self.carsArray[section];//获取组模型
    return carmodel.title;
}
//设置组描述
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    CarModel *carmodel = self.carsArray[section];//获取组模型
    return carmodel.desc;
}
@end
