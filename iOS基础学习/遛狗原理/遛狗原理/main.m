//
//  main.m
//  遛狗原理
//
//  Created by 黄启明 on 16/3/6.
//  Copyright © 2016年 黄启明. All rights reserved.

//  未使用 ARC

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Dog.h"

int main(int argc, const char * argv[])
{//person,dog
    @autoreleasepool {
        Dog *dog1 = [[Dog alloc]init];
        [dog1 setID:1];
//        
        Dog *dog2 = [[Dog alloc]init];
        [dog2 setID:2];

//        Person *xiaoLi = [[Person alloc]init];
//        [xiaoLi setDog:dog1];

//#if 0//注释
        NSLog(@"dog1 retain cuont is %lu",[dog1 retainCount]);//1
        
        Person *xiaoLi = [[Person alloc]init];
        //小丽要遛狗
        [xiaoLi setDog:dog1];
        NSLog(@"dog1 retain cuont1 is %lu",[dog1 retainCount]);//2
//
        [xiaoLi setDog:dog1];//此时dog1计数器不会加1
//        NSLog(@"dog1 retain cuont2 is %lu",[dog1 retainCount]);//2
//
        Person *xiaoWang = [[Person alloc]init];
        [xiaoWang setDog:dog1];
        NSLog(@"dog1 retain cuont3 is %lu",[dog1 retainCount]);

//        [xiaoWang release];
        NSLog(@"dog1 retain cuont4 is %lu",[dog1 retainCount]);
        [xiaoLi release];
        NSLog(@"dog1 retain cuont5 is %lu",[dog1 retainCount]);
        [xiaoWang setDog:dog2];
        [dog1 release];
        
//#endif

    }
    return 0;
}
