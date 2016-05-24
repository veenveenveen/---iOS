//
//  ViewController.m
//  GCD
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
//GCD 基本演示
- (void)demo{
//    void (^mytask)(void) = ^{
    
//    };
/*
    //1创建任务
    dispatch_block_t task = ^{
        NSLog(@"task %@",[NSThread currentThread]);
    };
    
    //2获取队列
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    //3将任务放到队列中
    dispatch_async(queue, task);
 */
    //简单写法
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        NSLog(@"task %@",[NSThread currentThread]);
//    });
    for (int i = 0; i < 20; i++) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSLog(@"task %@ %d",[NSThread currentThread],i);
        });
    }
}

@end
