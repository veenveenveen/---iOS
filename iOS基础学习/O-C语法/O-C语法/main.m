//
//  main.m
//  O-C语法
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
        int ID = [dog1 getID];
        int age = [dog1 getAge];
        float price = [dog1 getPrice];
        printf("dog1 id is %d,age is %d,price is %.2f\n",ID,age,price);
        Dog *dog2 = [[Dog alloc]initWithID:3 andAge:14 andPrice:60.15];
        ID = [dog2 getID];
        age = [dog2 getAge];
        price = [dog2 getPrice];
        printf("dog2 id is %d,age is %d,price is %.2f\n",ID,age,price);
        [dog2 setID:34 andAge:12 andPrice:89.87];
        ID = [dog2 getID];
        age = [dog2 getAge];
        price = [dog2 getPrice];
        printf("dog2 id is %d,age is %d,price is %.2f\n",ID,age,price);
    }
    return 0;
}
