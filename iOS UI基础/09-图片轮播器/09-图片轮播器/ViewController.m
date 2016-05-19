//
//  ViewController.m
//  09-图片轮播器
//
//  Created by 黄启明 on 16/4/14.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //动态创建UIImageView
    CGFloat imgW = 300;
    CGFloat imgH = 130;
    CGFloat imgY = 0;
    for (int i = 0; i < 5; i++) {
        NSString *imgName = [NSString stringWithFormat:@"img_%02d",i+1];
        UIImageView *img = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imgName]];
        CGFloat imgX = i * imgW;
        img.frame = CGRectMake(imgX, imgY, imgW, imgH);
        [self.scrollView addSubview:img];
    }
    CGFloat maxW = CGRectGetMaxX(self.scrollView.subviews.lastObject.frame);
    self.scrollView.contentSize = CGSizeMake(maxW, 0);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    //实现UIScrollView的分页效果
    self.scrollView.pagingEnabled = YES;
    
    self.pageControl.numberOfPages = 5;//设置分页指示器一共有几页
    self.pageControl.currentPage = 0;//设置刚开始显示第几页
//创建一个计时器控件
    self.timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(scrollImage) userInfo:nil repeats:YES];
//bug解决（修改NSTimer优先级和控件一样）
    //创建一个消息循环对象
    NSRunLoop * runLoop = [NSRunLoop currentRunLoop];
    [runLoop addTimer:self.timer forMode:NSRunLoopCommonModes];
}
  - (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //计算当前页
    CGFloat offsetX = scrollView.contentOffset.x;
    offsetX = offsetX + (scrollView.frame.size.width * 0.5);
    NSUInteger page = offsetX / scrollView.frame.size.width;
    self.pageControl.currentPage = page;

}
//即将开始拖拽(bug解决)
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    //停止计时器
    //调用invalidate方法一旦停止计时器，停止以后不可再重用，下次必须重新创建一个新的计时器对象
    [self.timer invalidate];
    //调用完invalidate方法后，这个计时器就已经废了，所以可以直接将self.timer指向nil
    self.timer = nil;
}
//实现拖拽完毕的方法（bug解决）
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    //重新启动计时器
    self.timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(scrollImage) userInfo:nil repeats:YES];
    //再次修改一下新创建的NSTimer对象的优先级
    NSRunLoop * runLoop = [NSRunLoop currentRunLoop];
    [runLoop addTimer:self.timer forMode:NSRunLoopCommonModes];
}
//自动滚动图片的方法
- (void)scrollImage{
    NSUInteger page = self.pageControl.currentPage;
    if (page == (self.pageControl.numberOfPages-1)) {//判断是否滚动到最后一页
        page = 0;
    }else{
        page++;
    }
    CGFloat offsetX = page * self.scrollView.frame.size.width;
//    self.pageControl.currentPage = page;
    [self.scrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
}
@end
