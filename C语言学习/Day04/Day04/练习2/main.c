//
//  main.c
//  练习2
//
//  Created by 黄启明 on 16/2/29.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    //请用户输入一个实数（浮点型），编写算法对这个实数四舍五入到个位的运算，
    //例如：12.56经过四舍五入运算到13，而12.45经过四舍五入运算到12.
    printf("请输入一个实数：");
    float a = 0.0f;
    scanf("%f",&a);
    if ((a-(int)a)<0.5) {
        printf("%d\n",(int)a);
    }
    else{
        printf("%d\n",(int)a+1);
    }
    return 0;
}
