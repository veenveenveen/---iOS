//
//  main.m
//  综合项目--《购票系统》
//
//  Created by 黄启明 on 16/3/19.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cinema.h"
#import "MovieTicket.h"
void buyMovieTicket(){
    //购买电影票,调用电影院类的buyTicket的方法
    Cinema *cinema = [[Cinema alloc]initWithCinemaName:@"亿达影城"];
    [cinema buyTicket];//开始购票
    
}
void buySongTicket(){
    //购买演唱会票
    
    
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //打印欢迎信息
        printf("************欢迎使用购票系统************\n");
        //提示用户选择
        printf("您可以使用购票系统购买：1.电影票 2.演唱会票\n");
        int num;
        scanf("%d",&num);
        //当用户选择不同的功能，调用不同的函数
        if (num == 1) {
            buyMovieTicket();
        }else if (num == 2){
            buySongTicket();
        }
        //在函数中创建对象，开始购票
    }
    return 0;
}
