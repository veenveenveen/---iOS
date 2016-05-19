//
//  HeaderView.m
//  11-团购案例
//
//  Created by 黄启明 on 16/4/18.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "HeaderView.h"

@interface HeaderView () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *headerView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation HeaderView

- (void)awakeFromNib{
    //xib文件加载完毕后自动调用，在这里就表示HeaderView已经从xib中创建好了
    //图片轮播的代码写在这儿
    //1.动态创建UIImageView
    CGFloat imgW = 280;
    CGFloat imgH = 100;
    CGFloat imgY = 0;
    for (int i = 0; i < 5; i++) {
        NSString *imgName = [NSString stringWithFormat:@"ad_%02d",i];
        UIImageView *img = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imgName]];
        CGFloat imgX = imgW * i;
        img.frame = CGRectMake(imgX, imgY, imgW, imgH);
        [self.headerView addSubview:img];
    }
    CGFloat maxX = CGRectGetMaxX(self.headerView.subviews.lastObject.frame);
    self.headerView.contentSize = CGSizeMake(maxX, 0);
    self.headerView.pagingEnabled = YES;
    self.headerView.showsHorizontalScrollIndicator = NO;
    self.pageControl.currentPage = 0;
    self.pageControl.numberOfPages = 5;
    //2.创建一个计时器控件
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(scrollImg) userInfo:nil repeats:YES];
    //bug
    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    [runLoop addTimer:self.timer forMode:NSRunLoopCommonModes];
}

+ (instancetype)headerView{
    return [[[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:nil options:nil] firstObject];
}
//实现UIScrollViewDelegate的代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //计算当前页
    CGFloat offsetX = scrollView.contentOffset.x;
    offsetX = offsetX + (scrollView.frame.size.width * 0.5);
    NSInteger page = offsetX / scrollView.frame.size.width;
    self.pageControl.currentPage = page;
}
//实现计时器控件中的自动滚动方法
- (void)scrollImg{
    NSInteger page = self.pageControl.currentPage;
    if (page == (self.pageControl.numberOfPages - 1)) {
        page = 0;
    }else{
        page ++;
    }
    self.pageControl.currentPage = page;
    CGFloat offsetX = page * self.headerView.frame.size.width;
    [self.headerView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
}
//bug解决
//即将开始拖拽
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.timer invalidate];
    self.timer = nil;
}
//拖拽完毕
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(scrollImg) userInfo:nil repeats:YES];
    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    [runLoop addTimer:self.timer forMode:NSRunLoopCommonModes];
}
@end
