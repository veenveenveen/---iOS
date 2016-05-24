//
//  ViewController.m
//  GCD异步下载图片
//
//  Created by 黄启明 on 16/5/23.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) UIImageView *imageView;
@property (nonatomic, weak) UIScrollView *sc;

@end

@implementation ViewController

- (void)loadView{
    UIScrollView *sc = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.sc = sc;
    self.view = sc;
    UIImageView *imgView = [[UIImageView alloc] init];
    self.imageView = imgView;
    [self.view addSubview:imgView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self downloadImg];
}

- (void)downloadImg{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSString *imgPath = @"http://4493bz.1985t.com/uploads/allimg/150910/1-150910160048.jpg";
        NSURL *url = [NSURL URLWithString:imgPath];
        NSData *data = [NSData dataWithContentsOfURL:url];
        //闭包
        UIImage *image = [UIImage imageWithData:data];
        //线程通信
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.sc setContentSize:image.size];
            self.imageView.image = image;
            [self.imageView sizeToFit];
        });
    });
}

@end
