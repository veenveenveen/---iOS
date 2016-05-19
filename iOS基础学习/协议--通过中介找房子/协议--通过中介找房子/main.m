//
//  main.m
//  协议--通过中介找房子
//
//  Created by 黄启明 on 16/3/30.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#import "LinkHome.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Student *stu = [[Student alloc]init];
        LinkHome *linkHome = [[LinkHome alloc]init];
        stu.delegate = linkHome;
        [stu needHouse];
        /*
            代理类 LinkHome
            代理对象 delegate
            协议 findHouseProtocol
            协议内容 findHouse
         */
    }
    return 0;
}
