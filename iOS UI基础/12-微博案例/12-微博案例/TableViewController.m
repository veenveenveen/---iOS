//
//  TableViewController.m
//  12-微博案例
//
//  Created by 黄启明 on 16/4/19.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "TableViewController.h"
#import "WeiBo.h"
#import "WeiboCell.h"
#import "WeiBoFrame.h"
@interface TableViewController ()

@property (nonatomic, strong) NSArray *weiBoFrame;//很多个frame模型

@end

@implementation TableViewController

#pragma mark - 隐藏状态栏
- (BOOL)prefersStatusBarHidden{
    return YES;
}
#pragma mark - 懒加载
- (NSArray *)weiBoFrame{
    if (_weiBoFrame == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"weibos.plist" ofType:nil];
        NSArray *tempArr = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *weiBoMutArr = [NSMutableArray array];
        for (NSDictionary *dict in tempArr) {
            //创建一个数据模型
            WeiBo *weiBoMod = [WeiBo weiBoWithDict:dict];
            //创建一个frame模型
            WeiBoFrame *weiBoframe = [[WeiBoFrame alloc]init];//创建一个空的frame模型
            weiBoframe.weiBo = weiBoMod;
            [weiBoMutArr addObject:weiBoframe];
        }
        _weiBoFrame = weiBoMutArr;
    }
    return _weiBoFrame;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source 数据源方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.weiBoFrame.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //获取模型数据
    WeiBoFrame *weiboMod = self.weiBoFrame[indexPath.row];
    //创建单元格
    WeiboCell *cell = [WeiboCell weiBoCellWithTableView:tableView];
    //设置单元格数据
    cell.weiboFrame = weiboMod;
    //返回单元格
    return cell;
}
#pragma mark - 代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    WeiBoFrame *weiBoFrame = self.weiBoFrame[indexPath.row];
    return weiBoFrame.rowHeight;
}

@end
