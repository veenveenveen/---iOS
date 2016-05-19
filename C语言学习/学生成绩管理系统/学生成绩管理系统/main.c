//
//  main.c
//  学生成绩管理系统
//
//  Created by 黄启明 on 16/3/5.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#include <stdio.h>
#define STUDENTS 100
#define ITEMS 10
#include "hanShu.h"

int main(int argc, const char * argv[])
{
    int n;//总人数
    int k;//科目总数
    char name[STUDENTS][40];//姓名
    char itemName[ITEMS][40];//科目名称
    int score[STUDENTS][ITEMS];//每人每科成绩
    //将学生姓名，科目，成绩输入
    input(&n,&k,itemName,name,score);
    //将学生姓名，科目，成绩显示出来
    
    //将成绩排序
    sort(&n,&k,name,score);
    show(&n,&k,itemName,name,score);
    return 0;
}
