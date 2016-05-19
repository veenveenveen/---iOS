//
//  main.c
//  03-循环结构
//
//  Created by 黄启明 on 16/2/29.
//  Copyright © 2016年 黄启明. All rights reserved.
//
//   while,do-while,for

#include <stdio.h>

int main(int argc, const char * argv[]) {
    printf("你爱我吗？y/n\n");
    char ch = 'a';
    while (ch != 'y') {
        scanf("%c",&ch);
        if (ch != 'y') {
            printf("请重新输入：\n");
        }
        rewind(stdin);//注意 ：scanf 缓冲区
        
    }
    printf("我也爱你!\n");
/*
    int i = 0;
//    int a = 0;
//    int b = 0;
    while (i<5) {
        int a = 0;
        scanf("%d",&a);
//        b = 2 * a;
        printf("%d\n",a*2);
        i++;
    }
    printf("OVER");
*/
    return 0;
}
