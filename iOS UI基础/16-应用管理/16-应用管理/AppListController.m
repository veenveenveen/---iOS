//
//  AppListController.m
//  16-应用管理
//
//  Created by 黄启明 on 16/4/26.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "AppListController.h"
#import "App.h"
#import "AppCell.h"

@interface AppListController () <AppCellDelegate>

@property (nonatomic, strong) NSArray *apps;

@end

@implementation AppListController

#pragma mark - 隐藏状态栏

- (BOOL)prefersStatusBarHidden{
    return YES;
}

#pragma mark - 懒加载

- (NSArray *)apps{
    if (_apps == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"apps_full.plist" ofType:nil];
        NSArray *tempArr = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *appMutArr = [NSMutableArray array];
        for (NSDictionary *dict in tempArr) {
            App *app = [App appWithDict:dict];
            [appMutArr addObject:app];
        }
        _apps = appMutArr;
    }
    return _apps;
}

#pragma mark - viewDidLoad

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 44;
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
    return self.apps.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //获取模型数据
    App *app = self.apps[indexPath.row];
    //创建单元格
    static NSString *ID = @"app_cell";
    AppCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    //把模型数据赋值给单元格
    cell.app = app;
    cell.delegate = self;
    //返回单元格
    return cell;
}

#pragma maek - 实现AppCellDelegate的代理方法

- (void)appCellDidClickDownload:(AppCell *)appCell{
    //创建一个label
    UILabel *labMsg = [[UILabel alloc] init];
    labMsg.text = @"正在下载...";//文字
    labMsg.textAlignment = NSTextAlignmentCenter;//设置文字居中
    labMsg.backgroundColor = [UIColor grayColor];//背景色
    labMsg.textColor = [UIColor blueColor];//前景色（文字颜色）
    labMsg.alpha = 0.0;//透明度（刚开始为0）
    //设置label圆角显示
    labMsg.layer.cornerRadius = 10;//设置圆角半径
    labMsg.layer.masksToBounds = YES;
    CGFloat msgW = 200;
    CGFloat msgH = 30;
    CGFloat msgX = (self.tableView.frame.size.width - msgW) * 0.5;
    CGFloat msgY = (self.tableView.frame.size.height - msgH) * 0.5;
    labMsg.frame = CGRectMake(msgX, msgY, msgW, msgH);//设置frame
    //把label加到self.view(现在使用的是UITableViewController，把labMsg加到tableView中，labMsg会随tableView一起滚动)
//    [self.tableView addSubview:labMsg];
    [[[UIApplication sharedApplication] keyWindow] addSubview:labMsg];//拿到窗口，把label加到窗口中
    
    //实现动画效果
    [UIView animateWithDuration:2.0 animations:^{
        labMsg.alpha = 0.6;
    } completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:2.0 delay:0.5 options:UIViewAnimationOptionCurveLinear animations:^{
                labMsg.alpha = 0;
            } completion:^(BOOL finished) {
                [labMsg removeFromSuperview];
            }];
        }
    }];
    
    
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
