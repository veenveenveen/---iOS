//
//  main.c
//  发牌系统简化
//
//  Created by 黄启明 on 16/3/5.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#include <stdio.h>
#include "hanShu.h"
#include <stdlib.h>
#include <time.h>

int main(int argc, const char * argv[])
{
    //随机函数
    srandom((unsigned)time(NULL));
    //初始化
    init();
    //混牌
    mix();
    //将牌显示出来
    show();
    return 0;
}

