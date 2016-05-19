//
//  main.c
//  01switch-case结构
//
//  Created by 黄启明 on 16/2/29.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    int num1 = 10;
    switch (num1+2) {
        case 11:
            printf("1111\n");
            break;
        case 12:
            printf("3333\n");
            break;
        default:
            printf("2222\n");
            break;
    }
    printf("over\n");
    return 0;
}