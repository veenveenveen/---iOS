//
//  main.m
//  创建查询语句
//
//  Created by 黄启明 on 16/5/16.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // INSERT INTO t_student(name,age,score) VALUES ('xiaoming',18,100.0);
        for (int i = 0; i < 100; i++) {
            NSString *name = [NSString stringWithFormat:@"mingyuexin-%d",i];
            NSString *str = [NSString stringWithFormat:@"INSERT INTO t_student(name,age,score) VALUES ('%@',%d,%.2f);",name,arc4random_uniform(10)+15,arc4random_uniform(400)/10.0+60];
            printf("%s\n",str.UTF8String);
        }
    }
    return 0;
}
