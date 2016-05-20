//
//  ViewController.m
//  pthread演示
//
//  Created by 黄启明 on 16/5/20.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "ViewController.h"
#import <pthread.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%@",[NSThread currentThread]);
    [self demo];
}

- (void)demo{
    pthread_t PID;
    NSString *str = @"string";
    int result = pthread_create(&PID, NULL, task, (__bridge void *)(str));
    if (result == 0) {
        NSLog(@"ok");
    }else{
        NSLog(@"fail");
    }
}

void *task(void * param){
    NSString *str = (__bridge NSString *)(param);
    NSLog(@"task is running %@",[NSThread currentThread]);
    NSLog(@"%@",str);
    return NULL;
}
@end
