//
//  ViewController.m
//  08-通过代理监听滚动事件
//
//  Created by 黄启明 on 16/4/14.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end
//需求：监听UIScrollView的滚动事件
//分析：要监听UIScrollView的滚动事件，需要通过代理实现，无法通过addTarget实现
//步骤：
//    1.为UIScrollView找一个代理对象，也就是设置UIScrollView的delegate属性
//      self.scrollView.delegate = self;不需要单独创建一个类，直接将控制器作为控件的代理对象即可。
//    2.为了保证代理对象中拥有对应的方法，必须让代理对象遵守对应的代理协议
//    3.在控制器中实现需要的方法
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.scrollView.contentSize = self.imgView.image.size;
    //为UIScrollView找代理
//    self.scrollView.delegate = self;第一种方法
    //第二种方法：拖线
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//即将开始拖拽
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
}
//正在滚动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //输出当前滚动的位置
    NSString *scrollStr = NSStringFromCGPoint(scrollView.contentOffset);
    NSLog(@"%@",scrollStr);
}
//拖拽完毕
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
}
@end
