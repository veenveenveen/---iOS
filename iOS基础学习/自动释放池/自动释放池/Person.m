//
//  Person.m
//  自动释放池
//
//  Created by 黄启明 on 16/3/6.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#import "Person.h"

@implementation Person
@synthesize dog = _dog;
- (void) dealloc
{
    self.dog = nil;
    NSLog(@"person dealloc");
    [super dealloc];
}
@end
