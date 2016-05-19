//
//  main.c
//  猜数字游戏
//
//  Created by 黄启明 on 16/3/1.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

int main(int argc, const char * argv[]) {
    printf("------请猜一个数字，这个数字在10～40之间------\n");
    //产生一个10～40之间的整数
    int a = arc4random_uniform(31) + 10;
    int num = 0;
    printf("请输入你的答案：\n");
    while (num != a) {
        //请用户输入一个数字
        scanf("%d",&num);
        if (num > a) {
            printf("答案错误，结果偏大，请重新输入:\n");
        }
        if (num < a) {
            printf("答案错误，结果偏小，请重新输入:\n");
        }
    }
    printf("恭喜你，回答正确！\n\n");
    return 0;
}
