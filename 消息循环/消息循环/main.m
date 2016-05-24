//
//  main.m
//  消息循环
//
//  Created by 黄启明 on 16/5/22.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import <Foundation/Foundation.h>

void printNumber(int num){
    NSLog(@"%d",num);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        while (1) {
            NSLog(@"请输入数字：");
            int num = 0;
            scanf("%d",&num);
            if (num == 0) {
                NSLog(@"退出");
                break;
            }else{
                printNumber(num);
            }
            
        }
    }
    return 0;
}
