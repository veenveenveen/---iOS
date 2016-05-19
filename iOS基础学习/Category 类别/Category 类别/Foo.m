//
//  Foo.m
//  Category 类别
//
//  Created by 黄启明 on 16/3/8.
//  Copyright © 2016年 黄启明. All rights reserved.
//
//函数的私有化 实现 

#import "Foo.h"

@interface Foo (Private)
- (void) test2;
@end

@implementation Foo
- (void) test
{
    [self test2];
}
- (void) test2
{
    NSLog(@"函数私有化");
}
@end
