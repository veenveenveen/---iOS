//
//  ViewController.m
//  06-应用管理
//
//  Created by 黄启明 on 16/4/8.
//  Copyright © 2016年 IOS. All rights reserved.
//



#import "ViewController.h"
#import "AppModel.h"
#import "AppView.h"

@interface ViewController ()
@property(nonatomic,strong)NSArray *appArray;//定义一个数组用来存放数据
@end

@implementation ViewController
//懒加载，重写get方法
- (NSArray *)appArray{
    if (_appArray == nil) {
        //获取全路径
        NSString *path = [[NSBundle mainBundle]pathForResource:@"appList.plist" ofType:nil];
        //读取plist文件
        NSArray *arr = [NSArray arrayWithContentsOfFile:path];
        //字典转模型（新建一个模型AppModel）
        NSMutableArray *tempArr = [NSMutableArray array];
        for (NSDictionary *dict in arr) {
            //AppModel *appModel = [[AppModel alloc]initWithDict:dict];
            AppModel *appModel = [AppModel appModelWithDict:dict];//一般用这个类方法
            [tempArr addObject:appModel];
        }
        _appArray = tempArr;
    }
    return _appArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
//九宫格算法
    int allCol = 3;//需要放置的列数
    int allRow = 4;//需要设置的行数
    CGFloat appViewW = 100;//每个大格子的宽度（xib）
    CGFloat appViewH = 120;//每个大格子的高度（xib）
    CGFloat spaceXmargin = 15;//相邻两个大格子x间隙
    CGFloat spaceYmargin = 30;//相邻两个大格子y间隙
    CGFloat viewW = self.view.frame.size.width;//整个view视图的宽度
    CGFloat viewH = self.view.frame.size.height;//整个view视图的高度
    CGFloat leftXmargin = (viewW - appViewW * allCol - spaceXmargin * (allCol-1)) * 0.5;//计算左右两边间隙 乘法效率比除法高
    CGFloat topYmargin = (viewH - appViewH * allRow - spaceYmargin * (allRow-1)-20) * 0.5;//计算上下两边间隙
    for (int i = 0; i < self.appArray.count; i++) {
        int col = i % allCol; //得到列号
        int row = i / allCol; //得到行号
        //添加大格子（各个小控件（图片，标签，按钮）的父控件）(xib)
        //1.添加大格子
        AppView *appView = [AppView loadView];
        //2.设置位置
        CGFloat appViewX = leftXmargin + (appViewW + spaceXmargin) * col;
        CGFloat appViewY = 20 + topYmargin + (appViewH + spaceYmargin) * row;
        appView.frame = CGRectMake(appViewX, appViewY, appViewW, appViewH);
        //3.添加
        [self.view addSubview:appView];
        AppModel *appViewModel = self.appArray[i];
        //4.获取子控件并赋值
        appView.appModel = appViewModel;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
