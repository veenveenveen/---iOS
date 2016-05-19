//
//  main.c
//  练习1
//
//  Created by 黄启明 on 16/2/29.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    // 请用户从控制台输入三个整型的数，显示这三个数的最大数
    printf("请输入三个整数:");
    int a = 0,b = 0,c = 0;
    scanf("%d%d%d",&a,&b,&c);
    if (a<b) {
        a = b;
    }
    if(a<c){
        a = c;
    }
    printf("这三个数中最大的数是%d\n",a);
    return 0;
}
