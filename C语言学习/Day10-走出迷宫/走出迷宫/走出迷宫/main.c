//
//  main.c
//  走出迷宫
//
//  Created by 黄启明 on 16/3/5.
//  Copyright © 2016年 黄启明. All rights reserved.
//
/*
 
 分析游戏的流程.
 
 1.先显示游戏地图
 
 2.让用户输入小人的前进方向 w.上  a.左  s.下  d.右
 
 3.根据用户输入的前进方向来移动小人
 
 循环的过程。
 
 分析：显示游戏地图
 如果只是要显示游戏地图的话，那么就很简单
 
 但是有一个问题：
 需要将地图上每一个格子的类型存储起来呢？
 地图上的每1行的每1列是一个什么类型的的格子，肯定需要存起来.
 
 使用二维数组来存储是最好的.
 
 
 
 */


#include <stdio.h>
#include <stdlib.h>
#define ROWS 6
#define COLS 8


/**
 *  作用：定义一个数组，用来保存每一个格子的类型
 *  地图上N行N列的格子的类型就存储在这个数组中
 *  因为地图数据需要被多个地方使用  显示游戏地图，移动小人，所以定义成全局变量
 */
char map[ROWS][COLS] =
{
    {'#','#','#','#','#','#','#','#',},
    {'#','0','#','#',' ',' ',' ','#',},
    {'#',' ','#','#',' ','#',' ','#',},
    {'#',' ',' ','#',' ','#',' ','#',},
    {'#','#',' ',' ',' ','#',' ','#',},
    {'#','#','#','#','#','#',' ','#',},
};
/**
 *  用来保存当前小人所在的行坐标
 */
int personCurrentRow = 1;

/**
 *  用来保存当前小人所在的列坐标
 */
int personCurrentCol = 1;

/**
 *  显示游戏地图
 */
void showMap();

/**
 *  让用户输入小人的前进方向
 *
 *  @return 小人的前进方向
 */
char enterDirection();

/**
 *  向上移动
 */
void moveToUp();

/**
 *  向下移动
 */
void moveToDown();

/**
 *  向左移动
 */
void moveToLeft();

/**
 *  向右移动
 */
void moveToRight();

int main(int argc, const char * argv[])
{
    while (1)
    {
        //~~~将控制台输出的信息擦除掉
        system("clear");//将控制台的信息清空，只有在终端运行起来才有效果
        //1.先显示游戏地图，这是一个相对独立的功能，将其定义为一个函数
        showMap();
        //~~~判断一下是否应该结束游戏
        if (map[5][6] == '0') {
            printf("恭喜你，通关！！！\n");
            break;//return 0;
        }
        //2.让用户输入小人的前进方向，这也是一个独立的功能，将其定义成一个函数
        char dir = enterDirection();
        //3.根据用户输入的前进方向来移动小人
        //判断小人的移动方向，根据前进方向来移动小人
        switch (dir)
        {
            case 'w':
            case 'W':
                //应该将小人向上移动
                moveToUp();
                break;
            case 's':
            case 'S':
                //应该将小人向下移动
                moveToDown();
                break;
            case 'a':
            case 'A':
                //应该将小人向左移动
                moveToLeft();
                break;
            case 'd':
            case 'D':
                //应该将小人向右移动
                moveToRight();
                break;
            case 'q':
            case 'Q':
                //结束游戏
                printf("你的智商真低。。。\n");
                return 0;
                break;
        }
    }
    return 0;
}

void showMap()
{
    for (int i = 0; i < ROWS; i++)
    {
        for (int j = 0; j < COLS; j++)
        {
            printf("%c ",map[i][j]);
        }
        printf("\n");
    }
}

char enterDirection()
{
    printf("请输入小人的前进方向: w.上  a.左  s.下  d.右  q.退出\n");
    char dir = 'a';
    scanf("%c",&dir);
    return dir;
}

void moveToUp()
{
    int nextRow = personCurrentRow - 1;
    int nextCol = personCurrentCol;
    if (map[nextRow][nextCol] == ' ')
    {
        map[nextRow][nextCol] = '0';
        map[personCurrentRow][personCurrentCol] = ' ';
        showMap();
        personCurrentRow = nextRow;
        personCurrentCol = nextCol;
    }
}

void moveToDown()
{
    //小人向下移动的原理
    //如何将小人向下移动
    //1.先判断小人能不能向下移动，能动的情况下再移动小人，判断小人的下面的位置是墙还是路，是路就可以移动，根据小人的现在的位置计算下面的位置，保存小人行列坐标的变量应该设置成全局变量
    //下个行坐标在小人当前的行坐标基础上+1，列坐标不变
    int nextRow = personCurrentRow + 1;
    int nextCol = personCurrentCol;
    //2.能动的情况下再移动小人
    //判断小人的下面的位置是墙还是路，是路就可以移动
    if (map[nextRow][nextCol] == ' ')
    {
        //可以移动，移动原理，将下一个位置设置为小人，将小人当前位置设置为空格
        map[nextRow][nextCol] = '0';
        map[personCurrentRow][personCurrentCol] = ' ';
        showMap();
        personCurrentRow = nextRow;
        personCurrentCol = nextCol;
    }
}

void moveToLeft()
{
    int nextRow = personCurrentRow;
    int nextCol = personCurrentCol - 1;
    if (map[nextRow][nextCol] == ' ')
    {
        map[nextRow][nextCol] = '0';
        map[personCurrentRow][personCurrentCol] = ' ';
        showMap();
        personCurrentRow = nextRow;
        personCurrentCol = nextCol;
    }
}

void moveToRight()
{
    int nextRow = personCurrentRow;
    int nextCol = personCurrentCol + 1;
    if (map[nextRow][nextCol] == ' ')
    {
        map[nextRow][nextCol] = '0';
        map[personCurrentRow][personCurrentCol] = ' ';
        showMap();
        personCurrentRow = nextRow;
        personCurrentCol = nextCol;
    }
}
