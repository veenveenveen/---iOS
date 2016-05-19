//
//  main.c
//  应用-输出星期（指针函数）
//
//  Created by 黄启明 on 16/3/10.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#include <stdio.h>

char *getDay(int n)
{
    //这是一个字符串指针数组
    char *days[] =
    {
        "星期一",
        "星期二",
        "星期三",
        "星期四",
        "星期五",
        "星期六",
        "星期日"
    };
    return n<8&&n>0 ? days[n-1]:"输入错误";
}

int main(int argc, const char * argv[])
{
    int a = 0;
    scanf("%d",&a);
    printf("%s\n",getDay(a));
    
    return 0;
}
