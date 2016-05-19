//
//  main.m
//  Category 类别
//
//  Created by 黄启明 on 16/3/7.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+ReverseString.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        NSString *string = @"中国共产党万岁！hello world";
        NSString *retString = [string reverseString];
        NSLog(@"reversr string is %@",retString);
    }
    return 0;
}
