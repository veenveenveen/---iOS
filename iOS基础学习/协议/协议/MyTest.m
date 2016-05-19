//
//  MyTest.m
//  协议
//
//  Created by 黄启明 on 16/3/7.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#import "MyTest.h"

@implementation MyTest
- (void) showInfo;
{
    NSLog(@"shoe info is calling");
}

- (void) print:(int)value
{
    NSLog(@"print value %d",value);
}
- (int) printValue:(int)value1 andValue:(int)value2;
{
    NSLog(@"print value value1 %d and value2 %d",value1,value2);
    return 0;
}
@end
