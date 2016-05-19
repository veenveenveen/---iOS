//
//  Cinema.m
//  综合项目--《购票系统》
//
//  Created by 黄启明 on 16/3/19.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#import "Cinema.h"
#define ROW 7
#define COL 15

//定义一个全局变量，保存用户选择的电影编号
int selectNo;
@implementation Cinema
//自定义初始化
- (instancetype) initWithCinemaName:(NSString *)name{
    if (self = [super init]) {
        _cinemaName = name;
        for (int i = 0; i < 5; i++) {
            MovieTicket *movieTicket = [MovieTicket new];
            movieTicket.name = [NSString stringWithFormat:@"变形金刚%02d",i+1];
            movieTicket.durationTime = 120;
            movieTicket.actor = @"汽车/人";
            movieTicket.director = @"超哥";
            movieTicket.number = i+1;
            movieTicket.showTime = [NSString stringWithFormat:@"200%d-11-11",i+1];
            movieTicket.startTime = [NSString stringWithFormat:@"1%d:00",i+1];
            movieTicket.price = 9.9f;
            movieTicket.place = [NSString stringWithFormat:@"影厅%02d",i+1];
            tickets[i] = movieTicket;
        }
    }
    return self;
}
//开始购票
- (void) buyTicket{
//    NSLog(@"开始购票");
    //显示正在上映的电影
    [self list];
    
}
//显示正在上映的电影票
- (void) list{
//    NSLog(@"显示正在上映的电影票");
    printf("\n正在上映的电影信息如下：\n\n");
    for (int i = 0; i < 5; i++) {
        NSLog(@"\n\n编号：%d 名称：%@ \n主演：%@ 开始时间：%@ \n导演：%@ 时长：%d \n上映时间：%@\n\n",tickets[i].number,tickets[i].name,tickets[i].actor,tickets[i].startTime,tickets[i].director,tickets[i].durationTime,tickets[i].showTime);
    }
    //提示让用户选择影片
    [self selectMovie];
}
//选择电影

- (void) selectMovie{
//    NSLog(@"选择电影");
    //定义一个全局变量，保存用户选择的电影编号
    //提示用户选择一部电影
    printf("请选择要观看的电影编号:\n");
    //接受用户输入的电影编号
    int num;
    scanf("%d",&num);
    if (num < 0 || num > 5) {
        return;
    }else{
    selectNo = num;
    }
    NSLog(@"\n您已经选择了影片：%@\n\n",tickets[selectNo-1].name);
    //选择排数
    [self selectRow];
}
//选择排数
- (void) selectRow{
//    NSLog(@"选择排数");
    printf("当前影厅有：%d排，每排有：%d个座位\n\n",ROW,COL);
    //把当前座位信息都打印出来
    for (int i = -1; i <ROW; i++) {
        for (int j = -1; j < COL; j++) {
            if (i == -1) {
                printf("%02d ",j+1);
            }else if (j == -1) {
                printf("%02d ",i+1);
            }else{
                printf("+  ");
            }
        }
        printf("\n");
    }
    printf("\n");
    //提示有多少排，多少列
    //提示让用户选择排数
    printf("请选择排数：\n");
    int num;
    scanf("%d",&num);
    if (num < 0 || num > 7) {
        return;
    }else{
        tickets[selectNo-1].rowNum = num;//保存排数信息
    }
    [self selectCol];
}
//选择座位号
- (void) selectCol{
//    NSLog(@"选择座位");
    printf("您选择了%d排，请选择座位：\n",tickets[selectNo-1].rowNum);
    int num;
    scanf("%d",&num);
    if (num < 0 || num > 15) {
        return;
    }else{
        tickets[selectNo-1].colNum = num;//保存座位信息
    }
    NSLog(@"\n\n您选择了的电影是：\n%@\n开始时间：%@\n第%d排%d座\n票价：%.2f\n",tickets[selectNo-1].name,tickets[selectNo-1].startTime,tickets[selectNo-1].rowNum,tickets[selectNo-1].colNum,tickets[selectNo-1].price);
    //确认支付
    printf("请确认：1.确认无误 0.取消\n");
    int flag;
    scanf("%d",&flag);
    if (flag) {
        [self pay];
    }else{
        return;
    }
}
//开始支付
- (void) pay{
//    NSLog(@"开始支付");
    printf("开始支付...\n");
    printf("支付已完成！\n");
    [self printTicket];
}
//出票（打印票）
- (void) printTicket{
//    NSLog(@"开始出票");
    NSLog(@"\n\n恭喜您，购票成功！您的购票信息如下：\n%@  开始时间：%@\n影厅：%@  第%d排%d座\n票价：%.2f\n",tickets[selectNo-1].name,tickets[selectNo-1].startTime,tickets[selectNo-1].place,tickets[selectNo-1].rowNum,tickets[selectNo-1].colNum,tickets[selectNo-1].price);
    //把座位信息打印出来看一下
    for (int i = -1; i < ROW; i++) {
        for (int j = -1; j < COL; j++) {
            //判断是否显示小人
            if (i==(tickets[selectNo-1].rowNum-1)&&j==(tickets[selectNo-1].colNum-1)) {
                printf("@  ");
            }else{
                if (i == -1) {
                    printf("%02d ",j+1);
                }else if (j == -1) {
                    printf("%02d ",i+1);
                }else{
                    printf("+  ");
                }
            }
        }
        printf("\n");
    }
}
@end
