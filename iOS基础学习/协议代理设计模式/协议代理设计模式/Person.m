//
//  Person.m
//  协议代理设计模式
//
//  Created by 黄启明 on 16/3/7.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#import "Person.h"

@implementation Person
@synthesize dog = _dog;
- (void) setDog:(Dog *)dog
{
    if (_dog != dog ) {
        [_dog release];
        _dog = [dog retain];
        //通知dog的主人是self
        [_dog setDelegate:self];
    }
}
- (Dog *) dog
{
    return _dog; 
}
- (void) bark:(Dog *)thisDog count:(int)count
{
    //当狗叫的时候调用 人的方法
    NSLog(@"this dog %d bark %d",[thisDog ID],count);
}
- (void) dealloc
{
    self.dog = nil;
    [super dealloc]; 
}
@end
