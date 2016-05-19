//
//  hanShu.c
//  学生成绩管理系统
//
//  Created by 黄启明 on 16/3/5.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#include "hanShu.h"
#define ITEMS 10

//数据输入
void input(int *n,int *k,char itemName[][40],char name[][40],int score[][ITEMS])
{
    printf("请输入你班级的总人数:");
    scanf("%d",n);
    printf("请输入你班级的学科总数:");
    scanf("%d",k);
    //输入各个学科的名称
    for (int i = 0; i < *k; i++)
    {
        printf("请输入第%d科名称:",i+1);
        scanf("%s",itemName[i]);
    }
    //输入每个同学的姓名和各科成绩
    for (int i = 0; i < *n; i++)
    {
        printf("请输入第%d名同学的姓名:",i+1);
        scanf("%s",name[i]);
        score[i][*k] = 0;
        for (int j = 0; j < *k; j++)
        {
            printf("请输入%s同学的%s科成绩:",name[i],itemName[j]);
            scanf("%d",&score[i][j]);
            score[i][*k] += score[i][j];//计算总成绩
        }
        
    }
}


//数据输出
void show(int *n,int *k,char itemName[][40],char name[][40],int score[][ITEMS])
{
    printf("姓名\t");
    for (int i = 0; i < *k; i++)
    {
        printf("%s\t",itemName[i]);
    }
    printf("总成绩");
    printf("\n");
    for (int i = 0; i < *n; i++)
    {
        printf("%s\t",name[i]);
        for (int j = 0; j <= *k; j++)//会把最后一列作为总分显示
        {
            printf("%d\t",score[i][j]);
        }
        printf("\n");
    }
}
//总分排序
void sort(int *n,int *k,char name[][40],int score[][ITEMS])
{
    for (int i = 0; i < *n-1; i++)
    {
        for (int j = i+1; j < *n; j++)
        {
            //调换总分
            int t = score[i][*k];
            score[i][*k] = score[j][*k];
            score[j][*k] = t;
        }
    }
}