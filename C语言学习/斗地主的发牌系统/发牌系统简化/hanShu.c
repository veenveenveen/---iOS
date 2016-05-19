//
//  hanShu.c
//  斗地主的发牌系统
//
//  Created by 黄启明 on 16/3/5.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#include "hanShu.h"
#include <stdlib.h>
#include <time.h>
//定义一个整型数组保存54张牌,全局变量
int cards[54];

//初始化
void init()
{
    
    for (int i = 0; i < 54; i++)
    {
        cards[i] = i;
    }
}
//混牌处理，交换30次
void mix()
{
    for (int i = 0; i < 30; i++)
    {
        int a = random() % 54;
        int b = random() % 54;
        int t = cards[a];
        cards[a] = cards[b];
        cards[b] = t;
    }
}
//将这副扑克牌显示出来
void show()
{
    char style[4][8] = {"♠️","❤️","♦️","♣️"};
    char number[13][3] = {"A","2","3","4","5","6","7","8","9","10","J","Q","K"};
    for (int i = 0; i < 54; i++)
    {
        if (cards[i] == 52)
        {
            printf("小王 ");
        }
        else if (cards[i] == 53)
        {
            printf("大王 ");
        }
        else
        {
            printf("%s%s\t",style[cards[i]/13],number[cards[i]%13]);
        }
        if ((i+1) % 18 == 0) {
            printf("\n");
        }
    }
}