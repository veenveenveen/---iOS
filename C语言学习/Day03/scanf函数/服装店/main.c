//
//  main.c
//  服装店
//
//  Created by 黄启明 on 16/2/28.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{
    //定义一个变量保存TShirt的单价
    double tShirt = 45.8;
    //定义一个变量保存裤子的单价
    double kuZiPrice = 120.7;
    //定义一个变量保存TShirt的数量
    int tShirtCount = 3;
    //定义一个变量保存裤子的数量
    int kuZiCount = 5;
    //计算总价格
    double price = tShirt * tShirtCount + kuZiCount * kuZiPrice;
    //计算打折后的价格
    double youHui = price * 0.88;
    printf("总价格 = %lf\n优惠价格 = %lf\n",price,youHui);
    return 0;
}
