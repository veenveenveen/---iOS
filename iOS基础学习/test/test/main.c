//
//  main.c
//  test
//
//  Created by 黄启明 on 16/3/31.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    // insert code here...
    int a = 10;
    int *p = &a;
    *p = 20;
    printf("%d",a);
    printf("Hello, World!\n");
    return 0;
    
}
