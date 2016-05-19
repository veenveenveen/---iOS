//
//  main.c
//  交换两个变量的值
//
//  Created by 黄启明 on 16/2/28.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{
//    int a = 10,b = 20,c;
//    c = a;
//    a = b;
//    b = c;
    //交换两个变量的值
    //法则：两数相加再想减
    int a = 10,b = 20;
    a = a + b;
    b = a - b;
    a = a - b;
    printf("a = %d,b = %d\n",a,b);
    return 0;
}
