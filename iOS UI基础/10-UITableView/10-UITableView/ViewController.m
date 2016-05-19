//
//  ViewController.m
//  10-UITableView
//
//  Created by 黄启明 on 16/4/16.
//  Copyright © 2016年 IOS. All rights reserved.
//
//
#import "ViewController.h"

@interface ViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//告诉UITableView要显示几组,如果不实现，默认分一组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
//告诉UITableView每组要显示几行数据
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 3;
    }else if (section == 1){
        return 2;
    }else{
        return 1;
    }
}
//告诉UITableView每一组的每一行显示什么单元格内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    //为单元格指定数据
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"中国";
        }else if (indexPath.row){
            cell.textLabel.text = @"日本";
        }else{
            cell.textLabel.text = @"韩国";
        }
    } else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            cell.textLabel.text = @"南非";
        }else if (indexPath.row){
            cell.textLabel.text = @"索马里";
        }
    }else{
        cell.textLabel.text = @"荷兰";
    }
    return cell;
}
//每一组的组标题显示什么
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return @"亚洲";
    }else if(section == 1){
        return @"非洲";
    }else{
        return @"欧洲";
    }
}
//每一组的组尾（组描述）显示什么
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return @"亚细亚洲，日出的地方";
    }else if(section == 1){
        return @"阿里非加洲，阳光灼热的地方";
    }else{
        return @"欧罗巴洲，日落的地方";
    }
}
@end
