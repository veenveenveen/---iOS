//
//  main.m
//  O-C点语法
//
//  Created by 黄启明 on 16/3/6.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        NSLog(@"Hello, World!");
        Dog *dog1 = [[Dog alloc]init];
        dog1.age = 300;
        int dog1Age = dog1.age;
        NSLog(@"dog1 age is %d",dog1Age);

    }
    return 0;
}
