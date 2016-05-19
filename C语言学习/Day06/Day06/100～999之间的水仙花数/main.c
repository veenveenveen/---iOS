//
//  main.c
//  100～999之间的水仙花数
//
//  Created by 黄启明 on 16/3/1.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{
    int j = 1;
    for (int i = 100; i < 999; i++)
    {
        int baiWei = i / 100;
        int shiWei = i % 100 / 10;
        int geWei = i % 100 % 10;
        if (baiWei * baiWei * baiWei + shiWei * shiWei *shiWei + geWei * geWei *geWei == i)
        {
            printf("第%d个水仙数是%d\n",j,i);
            j++;
        }
    }
    return 0;
}
