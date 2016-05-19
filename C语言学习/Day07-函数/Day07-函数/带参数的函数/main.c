//
//  main.c
//  带参数的函数
//
//  Created by 黄启明 on 16/3/2.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#include <stdio.h>

//一道面试题
void test1()
{
    for (int i = 0; i < 5; i++)
    {
        for (int j = 0; j < 5; j++)
        {
            //在这里写代码，要求结束外层循环(技巧)
            printf("AAA\n");
            i = 5;
            break;
        }
    }
}

//写一个函数，计算两个整数的和
void getSum(int a,int b)
{
    int sum = a + b;
    printf("%d+%d=%d\n",a,b,sum);
}

//写一个函数，求三个数中的最大值
void getMax(int a,int b,int c)
{
    if (a > b && a > c)
    {
        printf("最大值是%d\n",a);
    }
    else if (b > a && b > c)
    {
        printf("最大值是%d\n",b);
    }
    else
    {
        printf("最大值是%d\n",c);
    }
}

//主函数

int main(int argc, const char * argv[])
{
//    test1();
    return 0;
}
