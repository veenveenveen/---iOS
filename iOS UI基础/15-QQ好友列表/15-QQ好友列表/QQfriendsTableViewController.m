//
//  QQfriendsTableViewController.m
//  15-QQ好友列表
//
//  Created by 黄启明 on 16/4/25.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "QQfriendsTableViewController.h"
#import "Group.h"
#import "Friend.h"
#import "FriendCell.h"
#import "GroupHeaderView.h"

@interface QQfriendsTableViewController () <GroupHeaderViewDelegate>

//保存所有的好友分组信息
@property (nonatomic, strong) NSArray *groups;

@end

@implementation QQfriendsTableViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    //统一设置每组的组标题的高度
    self.tableView.sectionHeaderHeight = 44;
}

#pragma mark - 隐藏状态栏
- (BOOL)prefersStatusBarHidden{
    return YES;
}

#pragma mark - 懒加载
- (NSArray *)groups{
    if (_groups == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"friends.plist" ofType:nil];
        NSArray *tempArr = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *friendGroups = [NSMutableArray array];
        for (NSDictionary *dict in tempArr) {
            Group *model = [Group groupWithDict:dict];
            [friendGroups addObject:model];
        }
        _groups = friendGroups;
    }
    return _groups;
}
#pragma mark - 实现数据源方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //因为在这个方法中，要根据当前组的状态（是否是展开），来设置不同的返回值，所以需要为group增加一个是否是展开状态的属性
    Group *group = self.groups[section];
    if (group.isVisible) {
        return group.friends.count;
    }else{
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //获取数据
    Group *group = self.groups[indexPath.section];
    Friend *friend = group.friends[indexPath.row];
    //创建单元格
    FriendCell *cell = [FriendCell friendCellWithTableView:tableView];
    //设置单元格数据
    cell.friend = friend;
    //返回单元格
    return cell;
}

//设置每一组的组标题
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    Group *group = self.groups[section];
//    return group.name;
//}//这种方法只能设置每一组的组标题的字符串
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    //不要在这个方法中直接创建一个UIView返回，因为这样无法实现重用该UIView，为了能重用每个Header中的View，所以这里要返回一个UITableViewHeaderFooterView
    //UITableViewHeaderFooterView
    //获取模型数据
    Group *group = self.groups[section];
    //创建UITableViewHeaderFooterView
    GroupHeaderView *headerView = [GroupHeaderView groupHeaderViewWithTableView:tableView];
    headerView.tag = section;
    //设置数据
    headerView.group = group;
    headerView.delegate = self;
    //在刚刚创建好的和HeaderView中，view的frame都是0，因为刚创建好时没有为其赋值
    //但是程序运行起来以后，我们看到的HeaderView是有frame的，因为在当前方法当中，将headerView返回以后，UITableView在执行的时候会用到headerView，UITableView既然要用headerView，就必须将headerView添加到UItableView中，这是UITableview内部会根据一些设置来动态的为headerView的frame设值，也就是说，在UITableview在即将使用headerView的时候，才会为headerView赋值
    //返回这个view
    return headerView;
}
#pragma mark - 实现GroupHeaderViewDelegate的代理方法
- (void)groupHeaderViewDidClickTitleButton:(GroupHeaderView *)groupHeaderView{
//    [self.tableView reloadData];
    //采用局部刷新，只刷新某个组
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:groupHeaderView.tag];
    [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
}
@end
