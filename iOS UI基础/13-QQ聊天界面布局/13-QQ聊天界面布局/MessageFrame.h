//
//  MessageFrame.h
//  13-QQ聊天界面布局
//
//  Created by 黄启明 on 16/4/21.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define textFont [UIFont systemFontOfSize:13]

@class Message;

@interface MessageFrame : NSObject

@property (nonatomic, strong) Message *message;//引用数据模型
@property (nonatomic, assign, readonly) CGRect textFrame;//正文的frame
@property (nonatomic, assign, readonly) CGRect timeFrame;//时间lable的frame
@property (nonatomic, assign, readonly) CGRect iconFrame;//头像的frame
@property (nonatomic, assign, readonly) CGFloat rowHeight;//行高

@end
