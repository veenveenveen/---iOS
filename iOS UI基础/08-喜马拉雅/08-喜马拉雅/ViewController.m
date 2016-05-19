//
//  ViewController.m
//  08-喜马拉雅
//
//  Created by 黄启明 on 16/4/13.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *lastView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat maxY = CGRectGetMaxY(self.lastView.frame);
    self.scrollView.contentSize = CGSizeMake(0, maxY);
    self.scrollView.contentOffset = CGPointMake(0, -74);
    self.scrollView.contentInset = UIEdgeInsetsMake(74, 0, 55, 0);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
