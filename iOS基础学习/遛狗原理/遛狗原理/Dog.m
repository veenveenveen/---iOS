//
//  Dog.m
//  遛狗原理
//
//  Created by 黄启明 on 16/3/6.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#import "Dog.h"

@implementation Dog
@synthesize ID = _ID;

- (void) dealloc
{
    NSLog(@"dog %d is dealloc.",_ID);
    [super dealloc];
}
@end
