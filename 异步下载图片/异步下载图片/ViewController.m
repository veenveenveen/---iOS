//
//  ViewController.m
//  异步下载图片
//
//  Created by 黄启明 on 16/5/22.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) UIImageView *imageView;

@property (nonatomic, weak) UIScrollView *scrollView;

@end

@implementation ViewController

- (void)loadView{
    //重写此方法默认不会加载xib
    UIScrollView *sc = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.scrollView = sc;
    self.view = sc;
    UIImageView *img = [[UIImageView alloc]init];
    self.imageView = img;
    [self.view addSubview:img];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //开启一个线程
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(downloadImg) object:nil];
    [thread start];
}

- (void)downloadImg{
    [NSThread sleepForTimeInterval:3];
//    NSString *imgAddr = @"http://image.tianjimedia.com/uploadImages/2013/129/G5U8969GT6C3.jpg";
    NSString *imgAddr = @"http://4493bz.1985t.com/uploads/allimg/150910/1-150910160048.jpg";
    NSURL *url = [NSURL URLWithString:imgAddr];
    NSData *data = [NSData dataWithContentsOfURL:url];//已经获取到了图片的原始数据
    UIImage *img = [UIImage imageWithData:data];
    //将更新UI的操作放到主线程中 线程间通信
    [self performSelectorOnMainThread:@selector(updateImgWithImage:) withObject:img waitUntilDone:NO];
//    self.imageView.image = img;
}

- (void)updateImgWithImage:(UIImage *)image{
    
    [self.scrollView setContentSize:image.size];
    
    self.imageView.image = image;
    //根据图片的大小调整图片位置
    [self.imageView sizeToFit];
}

@end
