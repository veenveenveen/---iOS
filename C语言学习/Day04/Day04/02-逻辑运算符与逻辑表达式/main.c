//
//  main.c
//  02-逻辑运算符与逻辑表达式
//
//  Created by 黄启明 on 16/2/29.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    //定义一个年份 int
    int year = 2016;
    //判断这个年份是不是闰年
    int res = (year % 400 == 0) || ((year % 4 == 0) && (year % 100 != 0));
    printf("%d\n",res);
    return 0;
}
