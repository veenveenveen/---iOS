//
//  main.c
//  翻转数组中的元素
//
//  Created by 黄启明 on 16/3/4.
//  Copyright © 2016年 黄启明. All rights reserved.
//
//  有数组：int arr[5] = {12,32,4,5,45};
//  将元素的值设置为翻转   {45,5,4,32,12};

#include <stdio.h>

int main(int argc, const char * argv[])
{
    int arr[] = {12,34,34,213,32,4,5,45};
    int len = sizeof(arr) / sizeof(arr[0]);
    for (int i = 0; i < len / 2; i++)//循环一次，就进行一次交换
    {
        int tem = arr[i];
        arr[i] = arr[len-1-i];
        arr[len-1-i] = tem;
    }
    for (int i = 0; i < len; i++)
    {
        printf("%d ",arr[i]);
    }
    printf("\n");
    return 0;
}
