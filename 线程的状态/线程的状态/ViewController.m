//
//  ViewController.m
//  线程的状态
//
//  Created by 黄启明 on 16/5/20.
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
    //新建状态
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(task) object:nil];
    //就绪状态
    [thread start];

}

-(void)task{
    //运行
    NSLog(@"task is running %@",[NSThread currentThread]);
    //阻塞状态
//    [NSThread sleepForTimeInterval:1];
    [NSThread sleepUntilDate:[NSDate dateWithTimeIntervalSinceNow:2]];
    NSLog(@"线程醒了");
    //死亡
      //手动杀死线程
    [NSThread exit];
    NSLog(@"线程死亡");
}
@end
