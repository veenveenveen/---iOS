//
//  main.m
//  协议
//
//  Created by 黄启明 on 16/3/7.
//  Copyright © 2016年 黄启明. All rights reserved.
//
//@required
//@optional（缺省）

#import <Foundation/Foundation.h>
#import "MyProtocol.h"
#import "MyTest.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        MyTest *myTest = [[MyTest alloc]init];
        [myTest showInfo];
        //把print：转化为SEl类型
        SEL sel = @selector(print:);
        if ([myTest respondsToSelector:sel]) {//判断myTest是否响应sel方法
            [myTest print:3];
        }
        [myTest printValue:34 andValue:5];
        [myTest release];
        
        //下面用协议的方式
        id <MyProtocol> myProtocol = [[MyTest alloc]init];
        if ([myProtocol respondsToSelector:@selector(print:)]) {
            [myProtocol print:1221];
        }
        [myProtocol printValue:21 andValue:31];
        [myProtocol release];
        
    }
    return 0;
}
