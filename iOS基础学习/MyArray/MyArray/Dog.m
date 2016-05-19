//
//  Dog.m
//  MyArray
//
//  Created by 黄启明 on 16/3/6.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#import "Dog.h"

@implementation Dog
@synthesize ID = _ID;

//当对象计数器到0的时候，会自动调用
- (void) dealloc
{
    NSLog(@"dog id %d dealloc",_ID);
    [super dealloc];
}
@end
