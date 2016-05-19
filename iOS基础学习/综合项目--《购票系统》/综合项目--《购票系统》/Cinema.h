//
//  Cinema.h
//  综合项目--《购票系统》
//
//  Created by 黄启明 on 16/3/19.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MovieTicket.h"
@interface Cinema : NSObject
{
    NSString *_cinemaName;//电影院名称
    MovieTicket *tickets[5];//票的集合
}
- (instancetype) initWithCinemaName:(NSString *)name;
//开始购票
- (void) buyTicket;
//显示正在上映的电影票
- (void) list;
//选择电影
- (void) selectMovie;
//选择排数
- (void) selectRow;
//选择座位号
- (void) selectCol;
//开始支付
- (void) pay;
//出票（打印票）
- (void) printTicket;
@end
