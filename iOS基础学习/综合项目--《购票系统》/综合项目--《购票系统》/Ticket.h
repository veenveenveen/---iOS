//
//  Ticket.h
//  综合项目--《购票系统》
//
//  Created by 黄启明 on 16/3/19.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#import "Common.h"

@interface Ticket : Common
//排数，座位号，地点，开始时间
@property int rowNum;
@property int colNum;
@property NSString *place;
@property NSString *startTime;

- (void) printTicket;
@end
