//
//  ViewController.m
//  通过修改约束实现动画
//
//  Created by 黄启明 on 16/5/12.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *viewTop;
@property (weak, nonatomic) IBOutlet UIView *orangeView;

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

- (IBAction)btnClick{
    
    self.viewTop.constant += 100;//修改约束
    
    [UIView animateWithDuration:1.5 animations:^{
        [self.orangeView layoutIfNeeded];//只有把重新设置frame的代码放到这里才会有动画
    }];
}

@end
