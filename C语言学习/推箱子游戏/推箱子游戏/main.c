//
//  main.c
//  推箱子游戏
//
//  Created by 黄启明 on 16/3/9.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#define kRows 10
#define kCols 11

/**
 *  打印地图
 *
 *  @param map 地图的数组
 */
void printMap(char map[kRows][kCols])
{
    for (int i = 0; i < kRows; i++) {
        printf("%s\n",map[i]);
    }
}

/**
 *  移动的函数
 *
 *  @param map  <#map description#>
 *  @param oldX <#oldX description#>
 *  @param oldY <#oldY description#>
 *  @param newX <#newX description#>
 *  @param newY <#newY description#>
 */
void move1(char map[kRows][kCols],int oldX,int oldY,int newX,int newY)
{
    //交换两个位置的字符
    char temp = map[oldX][oldY];
    map[oldX][oldY] = map[newX][newY];
    map[newX][newY] = temp;
}

int main(int argc, const char * argv[])
{
    //***** 定义变量 *****
    //1.-定义地图
    char map[kRows][kCols] =
    {
        "##########",
        "#0 ####  #",
        "# X####  #",
        "#        #",
        "######   #",
        "#  ####  #",
        "#        #",
        "#   ######",
        "#         ",
        "##########"
    };
    //  -定义变量保存位置信息
    //  定义小人当前位置信息  和   箱子当前位置
    int personX = 1;
    int personY = 1;
    int boxX = 2;
    int boxY = 2;
    //小人将要移动的下一个位置信息
    int personNextX = personX;
    int personNextY = personY;
    //  -定义变量接收用户输入方向
    char direction;
    //  -定义路的字符
    char street = ' ';
    //  -定义箱子的字符
    char box = 'X';
    
    
    //***** 打印地图 *****
    //2.-打印一遍地图
    printMap(map);
    printf("请输入小人的移动方向: w.上 s.下 a.左 d.右 q.退出\n");
    //***** 编写循环控制程序 *****
    while (1) {
        scanf("%c",&direction);
//        getchar();//从键盘上获取一个字符，scanf();缓冲区 或rewind(stdin)；
        rewind(stdin);
        switch (direction) {
            case 'w':
            case 'W':
                personNextX--;
                break;
            case 's':
            case 'S':
                personNextX++;
                break;
            case 'a':
            case 'A':
                personNextY--;
                break;
            case 'd':
            case 'D':
                personNextY++;
                break;
            case 'q':
            case 'Q':
                printf("程序正在退出...\n");
                printf("程序已经退出!\n");
                return 0;
                break;
                
            default:
                break;
        }
        if (map[personNextX][personNextY] == street) {
            //如果是，让小人和路交换
            move1(map, personX, personY, personNextX, personNextY);
            //然后再重新调整小人的位置
            personX = personNextX;
            personY = personNextY;
        }
        else if (map[personNextX][personNextY] == box)
        {
            int boxNextX = boxX + (boxX - personX);
            int boxNextY = boxY + (boxY - personY);
            if (map[boxNextX][boxNextY] == street) {
                move1(map,boxX,boxY,boxNextX,boxNextY);
                move1(map,personX,personY,boxX,boxY);
                boxX = boxNextX;
                boxY = boxNextY;
                personX = personNextX;
                personY = personNextY;
                if (map[boxNextX][boxNextY] == map[8][9]) {
                    printMap(map);
                    printf("恭喜你！！！\n");
                    return 0;
                }
            }
        }
        
    //3.-接收用户输入的方向
    //4.-判断方向
    //5.根据用户输入的方向，判断如何移动
    
    //***** 判断模块（小人是否能走，箱子是否能移动）*****
    //    先判断小人的下一个方向是否是路
    //     如果是路，先让小人移动
    //     如果不是路，再次判断是否是箱子
    //         如果是箱子，计算箱子的下一个位置
    //         再次判断箱子的下一个位置是否是路，如果是路，移动小人和箱子
    //              如何移动小人和箱子？
    //              1.移动箱子到箱子的下一个位置
    //              2.让小人移动到箱子原来的位置
    //             如果不是箱子，什么也不做
    //***** 重绘地图 *****
    printMap(map);
    //6.重绘地图
    //***** 判断是否走出来 *****
    //判断箱子是否被推出来
        //判断是否过关
        
    }
        return 0;
}
