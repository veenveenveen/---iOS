//
//  main.m
//  自动释放池
//
//  Created by 黄启明 on 16/3/6.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Dog.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        Person *xiaoLi = [[Person alloc]init];
//        Dog *dog1 = [[Dog alloc]init];
//        Dog *dog1 = [[[Dog alloc]init]autorelease];//把dog1这条狗放进自动释放池里
        Dog *dog1 = [Dog dog];
        NSLog(@"dog1 retainCount is %lu",[dog1 retainCount]);
        dog1.ID = 1;
        xiaoLi.dog = dog1;
        NSLog(@"dog1 retainCount1 is %lu",[dog1 retainCount]);

//        [dog1 release];
        [xiaoLi release];
        NSLog(@"dog1 retainCount2 is %lu",[dog1 retainCount]);

    }
    return 0;
}
