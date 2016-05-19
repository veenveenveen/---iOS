//
//  main.c
//  求最大值
//
//  Created by 黄启明 on 16/3/4.
//  Copyright © 2016年 黄启明. All rights reserved.
//
//  

#include <stdio.h>

int main(int argc, const char * argv[])
{
    //求一个整形数组中的最大值
    //定义一个数组
    int arr[] = {12,313,343,5,6,7,88,79,67,69,8,679,};
    int max = INT32_MIN;//INT32_MIN是int类型的最小值
    //写一个循环，找到数组中的最大值，并把这个值赋值给max
    for (int i = 0; i < sizeof(arr) / sizeof(arr[0]); i++) {
        if (arr[i] > max) {
            max = arr[i];
        }
    }
    printf("max = %d\n",max);
    return 0;
}
