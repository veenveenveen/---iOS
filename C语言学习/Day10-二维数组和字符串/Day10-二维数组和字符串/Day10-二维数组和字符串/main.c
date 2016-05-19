//
//  main.c
//  Day10-二维数组和字符串
//
//  Created by 黄启明 on 16/3/4.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{
     //二维数组的遍历,双重for循环
    int arr[][4] =
    {
        {12,3123,123,21},
        {21,31,123,13},
        {13,1323,13213,454}
    };
    for (int i = 0; i < 3; i++)
    {
        for (int j = 0; j < 4; j++)
        {
            printf("%d ",arr[i][j]);
        }
        printf("\n");
    }
    return 0;
}
