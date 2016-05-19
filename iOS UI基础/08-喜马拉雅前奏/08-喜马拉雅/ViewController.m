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
@property (weak, nonatomic) IBOutlet UIImageView *img;
- (IBAction)scrollBtn:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 告诉UIScrollView里面的内容的实际大小
    self.scrollView.contentSize = self.img.image.size;
    //隐藏滚动指示器
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    //隐藏UIScrollView的内容的内边距
    self.scrollView.contentInset = UIEdgeInsetsMake(50, 50, 50, 50);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)scrollBtn:(id)sender {
//    [UIView animateWithDuration:1 animations:^{
//        CGPoint scrollOffset = self.scrollView.contentOffset;
//        scrollOffset.x += 100;
//        scrollOffset.y += 100;
//        self.scrollView.contentOffset = scrollOffset;
//    }];使用block式动画
    CGPoint scrollOffset = self.scrollView.contentOffset;
    scrollOffset.x += 100;
    scrollOffset.y += 100;
    [self.scrollView setContentOffset:scrollOffset animated:YES];
    
}
@end
