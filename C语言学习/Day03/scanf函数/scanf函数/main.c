//
//  main.c
//  scanf函数
//
//  Created by 黄启明 on 16/2/28.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{
    int age = 0;
    int num = 0;
    printf("请输入你的年龄:\n");
    scanf("%d-%d",&age,&num);
    printf("这么巧啊，今年我也是%d岁\n",age);
    return 0;
}
