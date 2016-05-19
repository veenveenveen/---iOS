//
//  main.c
//  Day09-数组
//
//  Created by 黄启明 on 16/3/4.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{
    //声明一个数组，存储五个人的成绩
    int scores[5]={0};
    //使用循环，每次循环输入一个成绩，并存储到数组中
    for (int i = 0; i < 5; i++)
    {
        printf("请输入第%d个人的数据\n",i+1);
        scanf("%d",&scores[i]);
    }
    printf("~~~~~不及格成绩清单~~~~~\n");
    for (int i = 0; i < 5; i++)
    {
        if (scores[i] < 60) {
            printf("第%d位同学成绩不及格\n",i+1);
        }
    }
    return 0;
}
