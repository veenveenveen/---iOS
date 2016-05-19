//
//  ViewController.m
//  06-应用管理
//
//  Created by 黄启明 on 16/4/8.
//  Copyright © 2016年 IOS. All rights reserved.
//



#import "ViewController.h"
#import "AppModel.h"

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
//            AppModel *appModel = [[AppModel alloc]initWithDict:dict];
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
    CGFloat appViewW = 100;
    CGFloat appViewH = 120;
    CGFloat spaceXmargin = 15;//x间隙
    CGFloat spaceYmargin = 30;//y间隙
    CGFloat leftXmargin = (self.view.frame.size.width - appViewW * allCol - spaceXmargin * (allCol-1)) *0.5;//计算左右两边间隙 乘法效率比除法高
    CGFloat topYmargin = (self.view.frame.size.height - appViewH * allRow - spaceYmargin * (allRow-1)-20) * 0.5;
    for (int i = 0; i < self.appArray.count; i++) {
        int col = i % allCol; //得到列号
        int row = i / allCol; //得到行号
//添加大格子（各个小控件（图片，标签，按钮）的父控件）(xib)
        //1.添加格子
        UIView *appView = [[UIView alloc]init];
        //2.设置位置
        CGFloat appViewX = leftXmargin + (appViewW + spaceXmargin) * col;
        CGFloat appViewY = 20 + topYmargin + (appViewH + spaceYmargin) * row;
        appView.frame = CGRectMake(appViewX, appViewY, appViewW, appViewH);
        //3.设置背景色
//        appView.backgroundColor = [ UIColor blueColor];
        //4. 添加
        [self.view addSubview:appView];
//取出模型数据
        AppModel *appMod = self.appArray[i];
//添加小控件
        //5.添加图片
        UIImageView *img = [[UIImageView alloc]init];
        CGFloat imgW = 60;
        CGFloat imgH = 70;
        CGFloat imgX = (appViewW - imgW) * 0.5;
        CGFloat imgY = 5;
        img.frame = CGRectMake(imgX, imgY, imgW, imgH);
        [appView addSubview:img];
//        img.backgroundColor = [UIColor greenColor];
        img.image = [UIImage imageNamed:appMod.icon];
        //6.添加标签
        UILabel *lab = [[UILabel alloc]init];
        CGFloat labW = appViewW;
        CGFloat labH = 10;
        CGFloat labY = imgY + imgH + 5;
        CGFloat labX = 0;
        lab.frame = CGRectMake(labX, labY, labW, labH);
        [appView addSubview:lab];
//        lab.backgroundColor = [UIColor redColor];
        [lab setText:appMod.name];
        [lab setTextAlignment:NSTextAlignmentCenter];//文字居中
        lab.font = [UIFont systemFontOfSize:17];
        //7.添加按钮
        UIButton *btn = [[UIButton alloc]init];
        CGFloat btnX = 20;
        CGFloat btnY = labY + labH + 5;
        CGFloat btnW = appViewW - btnX * 2;
        CGFloat btnH = 20;
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        [appView addSubview:btn];
//        btn.backgroundColor = [UIColor grayColor];
        [btn setImage:[UIImage imageNamed:@"aaaa"] forState:UIControlStateNormal];
        [btn setTitle:@"下载" forState:UIControlStateNormal];
        //7.1修改按钮文字大小
//        按钮内部至少有两个控件，一个label，一个imageView
//        label用来显示按钮内部的文字的，imageView是用来显示按钮内部的小图片的（不是背景图片）
        btn.font = [UIFont systemFontOfSize:14];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
