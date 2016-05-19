//
//  ViewController.m
//  03-代码创建控件（按钮）
//
//  Created by 黄启明 on 16/4/6.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {//视图加载完毕后调用，这个方法是系统自动调用的
    [super viewDidLoad];
//1.创建一个按钮
    UIButton *btn = [[UIButton alloc]init];
//2.设置位置
    btn.frame = CGRectMake(100, 100, 120, 120);
//3.添加
    [self.view addSubview:btn];
//4.设置背景图片
    UIImage *normalImg = [UIImage imageNamed:@"btn_01"];
    [btn setBackgroundImage:normalImg forState:UIControlStateNormal];
    UIImage *HighlightedImg = [UIImage imageNamed:@"m_6_634549851983281250_15368219"];
    [btn setBackgroundImage:HighlightedImg forState:UIControlStateHighlighted];
//5.设置文字
    [btn setTitle:@"点我" forState:UIControlStateNormal];
    [btn setTitle:@"点我干啥" forState:UIControlStateHighlighted];
//6.设置文字颜色
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
//7.按钮的点击 addTarget:表示监听器 action:一个方法，监听到按钮点击后要做的事情  forControlEvents:监听到的事件
    [btn addTarget:self action:@selector(btnWay:) forControlEvents:UIControlEventTouchUpInside];
////8.添加一个加号按钮
//    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeContactAdd];
//    [self.view addSubview:addBtn];
////9.监听多个按钮点击
//    [addBtn addTarget:self action:@selector(btnWay:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnWay:(UIButton *)btn{
    
    NSLog(@"%@",btn);
}
//隐藏状态栏
- (BOOL)prefersStatusBarHidden{
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
