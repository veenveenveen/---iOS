//
//  main.c
//  冒泡排序
//
//  Created by 黄启明 on 16/3/4.
//  Copyright © 2016年 黄启明. All rights reserved.
//
//  冒泡排序算法，将数组中的元素按照从大到小（或从小到大）排序
//  有n个数据，需要比较n-1轮，第i轮比较n-1-i次
//

#include <stdio.h>

int main(int argc, const char * argv[])
{
    int arr[]={13,213,42,34,2,3,5,221,42,42,34,2};
    int length = sizeof(arr) / sizeof(arr[0]);
    for (int i = 0; i < length - 1; i++)
    {
        //这个循环循环一次就完成一轮的比较
        //第i轮比较length-1-i次
        
        for (int j = 0; j < length - 1 -i; j++)
        {
            //内层循环控制每一轮比较的次数
            if (arr[j] < arr[j+1])
            {
                int tem = arr[j];
                arr[j] = arr[j+1];
                arr[j+1] = tem;
            }
        }
    }
    for (int i = 0; i < length; i++)
    {
        printf("%d ",arr[i]);
    }
    printf("\n");
    return 0;
}
