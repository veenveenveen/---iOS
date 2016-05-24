//
//  ViewController.m
//  线程的常用属性
//
//  Created by 黄启明 on 16/5/20.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (atomic, assign) int tickets;
@property (nonatomic, strong) NSObject *obj;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tickets = 5;
    self.obj = [[NSObject alloc]init];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self demo];
}

- (void)demo{
    
    NSThread *thread1   = [[NSThread alloc] initWithTarget:self selector:@selector(sellTicket) object:nil];
    thread1.name = @"-------->1";
    thread1.threadPriority = 0.0;
    [thread1 start];
    
    NSThread *thread2 = [[NSThread alloc] initWithTarget:self selector:@selector(sellTicket) object:nil];
    thread2.name = @"2";
    [thread2 start];
    
}

- (void)sellTicket{
    while (YES) {
//        [NSThread sleepForTimeInterval:1];
        @synchronized (self.obj) {
            if (self.tickets > 0) {
                self.tickets -= 1;
                NSLog(@"%@,%d",[NSThread currentThread],self.tickets);
                continue;
            }
            break;
        }
    }
}

- (void)task{
    for (int i = 0; i < 20; i++) {
        NSLog(@"%@ %d",[NSThread currentThread],i);
    }
}
@end
