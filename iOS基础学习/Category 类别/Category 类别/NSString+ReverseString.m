//
//  NSString+ReverseString.m
//  Category 类别
//
//  Created by 黄启明 on 16/3/7.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#import "NSString+ReverseString.h"

@implementation NSString (ReverseString)
- (id) reverseString
{
    //self 表示字符串本身
    NSUInteger len = [self length];
    NSMutableString *retStr = [NSMutableString stringWithCapacity:len];
    while (len > 0) {
        //从后取一个字符
        unichar c = [self characterAtIndex: --len];
        NSLog(@"c is %C",c);
        NSString * s = [NSString stringWithFormat:@"%C",c];
        [retStr appendString:s];
    }
        return retStr;
}
@end
