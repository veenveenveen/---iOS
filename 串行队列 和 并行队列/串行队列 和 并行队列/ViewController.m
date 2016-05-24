//
//  ViewController.m
//  串行队列 和 并行队列
//
//  Created by 黄启明 on 16/5/23.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self demo];
}

//串行队列
- (void)demo{
    //参数1 队列的名字
    //参数2 队列的属性
    dispatch_queue_t serialQueue = dispatch_queue_create("serialQueue", DISPATCH_QUEUE_SERIAL);
    dispatch_sync(serialQueue, ^{
        NSLog(@"%@",[NSThread currentThread]);
    });
}

@end
