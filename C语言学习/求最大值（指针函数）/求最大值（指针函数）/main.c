//
//  main.c
//  求最大值（指针函数）
//
//  Created by 黄启明 on 16/3/10.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#include <stdio.h>

int max(int *p,int len)
{
    int max = *p;
    for (int i = 1; i < len; i++) {
        if (*(p+i) > max) {
            max = *(p+i);
        }
    }
    return max;
}
int main(int argc, const char * argv[]) {
    int a[10] = {1231,4324,543,23,321,1213,12,34,433,2};
    int m = max(a,10);
    printf("max = %d\n",m);
    return 0;
}
