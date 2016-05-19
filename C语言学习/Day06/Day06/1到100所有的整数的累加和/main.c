//
//  main.c
//  1到100所有的整数的累加和
//
//  Created by 黄启明 on 16/3/1.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{
    int sum = 0;
    for (int i = 1; i <=100; i++)
    {
        sum += i;
    }
    printf("sum = %d\n",sum);
    return 0;
}
