//
//  main.c
//  双色球的随机摇奖系统
//
//  Created by 黄启明 on 16/3/4.
//  Copyright © 2016年 黄启明. All rights reserved.
//
/*
    双色球的随机摇奖系统
 
 
    1～33 之间选择6个不重复的随机数   红球
    1～16 之间选择一个随机数         蓝球
 
 
*/

#include <stdio.h>
#include <stdlib.h>

/**
 *  打印数组中的所有元素
 *
 *  @param arr    要打印的数组
 *  @param length 数组的长度
 */
void printArray(int arr[],int length);

/**
 *  判断数组中是否包含指定的元素
 *
 *  @param arr    需要判断的数组
 *  @param length 数组的长度
 *  @param key    判断的数据
 *
 *  @return 是否包含
 */
int  isContains(int arr[],int length,int key);

int main(int argc, const char * argv[])
{
    //产生6个 不重复 的随机数
    //准备一个数组，长度为6，将产生的随机数存储到数组中
    int redBalls[6] = {0};
    //循环产生6个随机数
    for (int i = 0; i < 6; i++)
    {
        int num = arc4random_uniform(33)+1;
    //重复的判断原理
    //每产生一个随机数，就判断数组中是否包含这个随机函数，如果包含，需要重新产生
    //调用函数判断redBalls数组是否包含num
        int flag = isContains(redBalls, 6, num);
        if (flag == 0)
        {
            //说明产生的随机数是不重复的,就将数据存储到数组中
            redBalls[i] = num;
            //也可以将i++放在这里
        }
        else
        {
            //说明产生的随机数是重复的，应该重新产生
            //这时i的值不需要自增
            i--;
            
        }
    }
    printArray(redBalls, 6);
    
}

/**
 *  打印数组中的所有元素
 *
 *  @param arr    要打印的数组
 *  @param length 数组的长度
 */
void printArray(int arr[],int length)
{
    printf("-");
    for (int i = 0; i < length; i++)
    {
        printf("%d-",arr[i]);
    }
    printf("\n");
}

/**
 *  判断数组中是否包含指定的元素
 *
 *  @param arr    需要判断的数组
 *  @param length 数组的长度
 *  @param key    判断的数据
 *
 *  @return 是否包含
 */
int  isContains(int arr[],int length,int key)
{
    for (int i = 0; i < length; i++)
    {
        if (arr[i] == key)
        {
            return 1;
        }
    }
    return 0;
}
