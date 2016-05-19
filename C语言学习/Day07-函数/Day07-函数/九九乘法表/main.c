//
//  main.c
//  九九乘法表
//
//  Created by 黄启明 on 16/3/2.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#include <stdio.h>

/**
 *  打印九九乘法表
 */
void show99()//函数的声明
{
    for (int i = 1; i <=9; i++) {
        for (int j = 1; j <=i; j++) {
            printf("%d*%d=%d\t",j,i,i*j);
        }
        printf("\n");
    }
    
}

int main(int argc, const char * argv[])
{
    show99();//调用自定义的函数
    return 0;
}
