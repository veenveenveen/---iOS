//
//  main.c
//  数组与函数
//
//  Created by 黄启明 on 16/3/4.
//  Copyright © 2016年 黄启明. All rights reserved.
//
//  当数组作为函数的参数传递的时候，在传值的时候会丢失数组的长度
//  为形参赋值的时候，并不是将整个数组传过去，而是将实参数组的地址传给了形参变量

#include <stdio.h>

void test(int arr[],int length)
{
    for (int i = 0; i < length; i++)
    {
        printf("%d\n",arr[i]);
    }
}

/**
 *  求一个数组的和
 *
 *  @param arr1 定义的一个数组
 *  @param len  数组的长度
 */
void getSum(int arr1[],int len)
{
    int sum = 0;
    for (int i = 0; i < len; i++)
    {
        sum += arr1[i];
    }
    printf("sum = %d\n",sum);
}

int main(int argc, const char * argv[])
{
    int sz[] = {122,334,54,21,34};
    getSum(sz,sizeof(sz) / sizeof(sz[0]));
    return 0;
}
