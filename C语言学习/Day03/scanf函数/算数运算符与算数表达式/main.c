//
//  main.c
//  算数运算符与算数表达式
//
//  Created by 黄启明 on 16/2/28.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{
    int num1 = 11;
    int num2 = 4;
    int num3 = num1 % num2;//a%b的结果一定是在0～b-1之间，浮点型数据不能进行求模运算
    printf("%d\n",num3);
    return 0;
}
