//
//  main.c
//  斗地主的发牌系统
//
//  Created by 黄启明 on 16/3/5.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(int argc, const char * argv[])
{
    //定义一个整型数组保存54张牌
    int cards[54];
    int i;
    srandom((unsigned)time(NULL));//随机函数
    //初始化
    for (i = 0; i < 54; i++)
    {
        cards[i] = i;
    }
    //混牌处理，交换30次
    for (i = 0; i < 30; i++)
    {
        int a = random() % 54;
        int b = random() % 54;
        int t = cards[a];
        cards[a] = cards[b];
        cards[b] = t;
    }
    //将这副扑克牌显示出来
    for (i = 0; i < 54; i++)
    {
        if (cards[i]/13 == 0)
        {
            printf("♤%02d ",cards[i]%13+1);
        }
        else if (cards[i]/13 == 1)
        {
            printf("♡%02d ",cards[i]%13+1);
        }
        else if (cards[i]/13 == 2)
        {
            printf("♢%02d ",cards[i]%13+1);
        }
        else if (cards[i]/13 == 3)
        {
            printf("♣%02d ",cards[i]%13+1);
        }
        else if (cards[i] == 52)
        {
            printf("小王 ");
        }
        else if (cards[i] == 53)
        {
            printf("大王 ");
        }
        if ((i+1) % 18 == 0) {
            printf("\n");
        }
    }
    return 0;
}
