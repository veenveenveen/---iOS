//
//  ViewController.m
//  08-UIScrollView实现缩放
//
//  Created by 黄启明 on 16/4/14.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //设置缩放比例
    self.scrollView.maximumZoomScale = 2.5;
    self.scrollView.minimumZoomScale = 0.2;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//缩放方法
- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.img;
}
@end
