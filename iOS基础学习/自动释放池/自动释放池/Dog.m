//
//  Dog.m
//  自动释放池
//
//  Created by 黄启明 on 16/3/6.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#import "Dog.h"

@implementation Dog
@synthesize ID = _ID;
- (void) dealloc
{
    NSLog(@"dog id %d dealloc",_ID);
    [super dealloc];
}
+ (id) dog
{
//    Dog *d = [[[Dog alloc]init]autorelease];
//    return d;
    return [[[Dog alloc]init]autorelease];//可以这样写
}
@end
