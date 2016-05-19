//
//  main.c
//  05-产生一个随机数
//
//  Created by 黄启明 on 16/2/29.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

int main(int argc, const char * argv[])
{
    int a = arc4random_uniform(20);
    printf("%d\n",a);
    return 0;
}
