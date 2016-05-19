//
//  main.c
//  01-比较运算符与比较表达式
//
//  Created by 黄启明 on 16/2/29.
//  Copyright © 2016年 黄启明. All rights reserved.
//


/*   >  >=  <  <=  ==  !=


用比较运算符连接起来的式子，就叫做比较表达式
 
 

*/


#include <stdio.h>

int main(int argc, const char * argv[]){
    printf("请输入你的语文成绩:");
    int yuWenGrade = 0;
    scanf("%d",&yuWenGrade);
    printf("请输入你的数学成绩:");
    int shuXueGrade = 0;
    scanf("%d",&shuXueGrade);
    int a = (yuWenGrade + shuXueGrade) / 2 >85;
    if (a == 0) {
        printf("平均成绩<85\n");
    }
    else{
        printf("平均成绩>85\n");
    }
//    int a = 10,b = 20,c = 30,d = 40;
//    int res = a + b > c + d;
//    printf("res = %d\n",res);
    return 0;
}
