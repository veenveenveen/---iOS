//
//  ViewController.m
//  NSThread基本使用
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
    [self demo3];
}

- (void)demo1{
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(task) object:nil];
    [thread start];
}

- (void)demo2{
    [NSThread detachNewThreadSelector:@selector(task) toTarget:self withObject:nil];
}

- (void)demo3{//隐式创建线程
    [self performSelectorInBackground:@selector(task) withObject:nil];
}

/**线程要运行的方法*/
- (void)task{
    NSLog(@"task is running %@",[NSThread currentThread]);
}

@end
