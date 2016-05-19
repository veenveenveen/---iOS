//
//  main.c
//  九九乘法表
//
//  Created by 黄启明 on 16/3/1.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{
    for (int i = 1; i <= 9; i++)
    {
        for (int j = 1; j <= i; j++)
        {
            printf("%d*%d=%d\t",i,j,i*j);// \t是制表符，tab键
        }
        printf("\n");
    }
    return 0;
}
