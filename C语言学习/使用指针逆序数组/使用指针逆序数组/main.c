//
//  main.c
//  使用指针逆序数组
//
//  Created by 黄启明 on 16/3/8.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#include <stdio.h>

void ret(int *p1,int *p2)
{
    int temp = *p1;
    *p1 = *p2;
    *p2 = temp;
}
int main(int argc, const char * argv[])
{
    int arr[] = {6567,8787,55,3,23,123,231};
    int *p = arr;
    int len = sizeof(arr) / sizeof(arr[0]);
    for (int i = 0; i < len/2; i++)
    {
        ret(p+i,p+len-1-i);
    }
    for (int i = 0; i < len; i++) {
        printf("%d\t",*(p++));
    }
               printf("\n");
    return 0;
}
