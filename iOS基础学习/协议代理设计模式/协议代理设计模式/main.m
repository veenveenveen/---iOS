//
//  main.m
//  协议代理设计模式
//
//  Created by 黄启明 on 16/3/7.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Dog.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        Person *xiaoLi = [[Person alloc]init];
        Dog *dog = [[Dog alloc]init];
        [dog setID:1];
        [xiaoLi setDog:dog];
//                [xiaoLi release];

        [dog release];
        while (1) {
            [[NSRunLoop currentRunLoop] run];
        }
//        [xiaoLi release];

    }
    return 0;
}
