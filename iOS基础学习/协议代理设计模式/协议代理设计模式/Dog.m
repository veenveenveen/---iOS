//
//  Dog.m
//  协议代理设计模式
//
//  Created by 黄启明 on 16/3/7.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#import "Dog.h"

@implementation Dog
@synthesize ID = _ID;
@synthesize timer =_timer;
@synthesize delegate;
- (id) init
{
    self = [super init];
    if (self) {
        //创建一个定时器，每隔一秒就调用[self updateTimer];方法
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.1f target:self selector:@selector(updateTimer:)  userInfo:nil repeats:YES];
    }
    return self;
}
- (void) updateTimer:(id)arg
{
    barkCount++;
    NSLog(@"dog bark %d",barkCount);
    //通知狗的主人
    //狗的主人delegate
    [delegate bark:self count:barkCount];//调用delegate里面的bark方法
    
}
@end
