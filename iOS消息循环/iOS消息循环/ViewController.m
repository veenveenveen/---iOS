//
//  ViewController.m
//  iOS消息循环
//
//  Created by 黄启明 on 16/5/22.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    BOOL shouldKeepRunning;        // global
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    shouldKeepRunning = YES;

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self demo1];
}

//主线程消息循环

- (void)demo{
    NSTimer *timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(task) userInfo:nil repeats:YES];
    //把定时源加到当前线程下消息循环中
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

- (void)task{
    NSLog(@"%@",[NSRunLoop currentRunLoop].currentMode);
    NSLog(@"task is running");
}


//子线程消息循环

- (void)demo1{
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(task1) object:nil];
    [thread start];
    [self performSelector:@selector(addTask) onThread:thread withObject:nil waitUntilDone:NO];
}

- (void)task1{
    NSLog(@"task1 is running");
    //开启消息循环 使用run方法不能停止消息循环
//1    [[NSRunLoop currentRunLoop] run];
//2   [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:2]];
    
    //3.苹果推荐方式 控制循环的开始和结束
//    BOOL shouldKeepRunning = YES;        // global
    NSRunLoop *theRL = [NSRunLoop currentRunLoop];
    while (shouldKeepRunning && [theRL runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]]);
//    [NSRunLoop currentRunLoop] runMode:<#(nonnull NSString *)#> beforeDate:<#(nonnull NSDate *)#>
    
    NSLog(@"over");
}

- (void)addTask{
    NSLog(@"addTask is running");
}

@end
