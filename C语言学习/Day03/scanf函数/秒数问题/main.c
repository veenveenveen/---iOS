//
//  main.c
//  秒数问题
//
//  Created by 黄启明 on 16/2/28.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{
    printf("请输入一个秒数：\n");
    int s = 0;
    scanf("%d",&s);
    //求天数
    int day = s / (3600 * 24);
    int dayYuShu = s % (3600 * 24);
    //求小时数
    int hour = dayYuShu / 3600;
    int hourYuShu = dayYuShu % 3600;
    //求分钟数
    int minute = hourYuShu / 60;
    int minuteYuShu = hourYuShu % 60;//求得的该余数即是秒数
    printf("%d秒是%d天%d小时%d分钟%d秒\n",s,day,hour,minute,minuteYuShu);
    return 0;
}
