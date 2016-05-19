//
//  ViewController.m
//  11-团购案例
//
//  Created by 黄启明 on 16/4/17.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "ViewController.h"
#import "TGModel.h"
#import "GoodsCell.h"
#import "FootView.h"
#import "HeaderView.h"

@interface ViewController () <UITableViewDataSource,FootViewDelegate>
@property (nonatomic, strong) NSMutableArray *goods;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController

#pragma mark - 懒加载
- (NSMutableArray *)goods{
    if (_goods == nil) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"tgs.plist" ofType:nil];
        NSArray *tempArr = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *goodArr = [NSMutableArray array];
        for (NSDictionary *dict in tempArr) {
            TGModel *mod = [TGModel tgModelWithDict:dict];
            [goodArr addObject:mod];
        }
        _goods = goodArr;
    }
    return _goods;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView.rowHeight = 44;
    {
//    //设置UITableView的footerView//只能修改x和h,y和w都不能修改
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
//    btn.backgroundColor = [UIColor orangeColor];
//    btn.frame = CGRectMake(20, 0, 0, 40);
//    self.tableView.tableFooterView = btn;
    }
    //设置UITableView的footerView(通过加载xib)
    FootView *footView = [FootView footView];
    self.tableView.tableFooterView = footView;
    //设置FootView的代理
    footView.delegate = self;
    //设置UITableView的headerView(通过加载xib)
    HeaderView *headerView = [HeaderView headerView];
    self.tableView.tableHeaderView = headerView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 数据源方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.goods.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //获取模型数据
    TGModel *goodsModel = self.goods[indexPath.row];
    //创建单元格（通过xib的方式创建单元格）
    GoodsCell *cell = [GoodsCell goodsCellWithTableView:tableView];
    //把模型数据设置给单元格
    {
    //在控制器中直接为每个cell的每个子控件赋值数据造成的问题：
    //1.控制器强依赖于cell，一旦cell内部的子控件发生了变化，那么控制器中的代码也要改（这就造成了紧耦合）
    //2.cell的封装不够完整，凡是用到cell的地方，每次都要编写为cell的子控件赋值的语句
    //3.解决：直接把模型传递给自定义cell，然后在自定义内部解析model中的数据赋值给自定义cell内部的子控件
    }
    cell.tgModel = goodsModel;
    //返回单元格
    return cell;
}
#pragma mark - FootView代理方法
- (void)footViewdidLoadMore:(FootView *)footView{
    //增加一条数据,创建一个模型对象，把模型对象加到goods集合中
    TGModel *model = [[TGModel alloc]init];
    model.title = @"驴肉火烧";
    model.price = @"6.0";
    model.buyCount = @"1000";
    model.icon = @"5ee372ff039073317a49af5442748071";
    [self.goods addObject:model];
    [self.tableView reloadData];//整体刷新，不能用局部刷新
    //局部刷新(此处不能用，局部刷新只适用于UITableView总行数没有发生变化的情况下)
//    NSIndexPath *idxPath = [NSIndexPath indexPathForRow:self.goods.count-2 inSection:0];
//    [self.tableView reloadRowsAtIndexPaths:@[idxPath] withRowAnimation:UITableViewRowAnimationLeft];
    //把UITableView中的最后一行的数据滚动到上面
    NSIndexPath *idxPath = [NSIndexPath indexPathForRow:self.goods.count-1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:idxPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
}
@end
