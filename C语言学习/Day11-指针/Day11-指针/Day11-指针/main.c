//
//  main.c
//  Day11-指针
//
//  Created by 黄启明 on 16/3/5.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#include <stdio.h>

//写一个函数，返回一个整形数组中的最大值和最小值

void getMaxAndMin(int arr[],int length,int *pMax,int *pMin)
{
    *pMax = INT32_MIN;
    *pMin = INT32_MAX;
    for (int i = 0; i < length ; i++)
    {
        if (arr[i] > *pMax)
        {
            *pMax = arr[i];
        }
        
        if (arr[i] < *pMin)
        {
            *pMin = arr[i];
        }
    }
}

int main(int argc, const char * argv[])
{
    int arr[] = {21,34,234,678,290,567};
    int len = sizeof(arr)/sizeof(arr[0]);
    int max = 0,min = 0;
    getMaxAndMin(arr,len,&max,&min);
    printf("max=%d,min=%d\n",max,min);
//    int num = 200;
//    unsigned char *p1 = &num;
//    printf("%d\n",*p1);
    int *p1 = arr;
    for (int i = 0; i < len; i++)
    {
        printf("%d,",*(p1+i));
    }
    printf("\n");
    return 0;
}
