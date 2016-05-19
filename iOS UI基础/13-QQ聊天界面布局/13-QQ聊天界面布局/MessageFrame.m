//
//  MessageFrame.m
//  13-QQ聊天界面布局
//
//  Created by 黄启明 on 16/4/21.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "MessageFrame.h"
#import <UIKit/UIKit.h>
#import "Message.h"
#import "NSString+NSStringExt.h"

@implementation MessageFrame

- (void)setMessage:(Message *)message{
    _message = message;
    CGFloat margin = 5;
    //计算时间label的frame
    //获取屏幕宽度
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    
    CGFloat timeX = 0;
    CGFloat timeY = 0;
    CGFloat timeW = screenW;
    CGFloat timeH = 15;
    if (!message.hideTime) {
        _timeFrame = CGRectMake(timeX, timeY, timeW, timeH);
    }
    //计算头像的frame
    CGFloat iconW = 30;
    CGFloat iconH = 30;
    CGFloat iconY = CGRectGetMaxY(_timeFrame) + margin;
    CGFloat iconX = message.type == MessageTypeOther ? margin : (screenW - iconW - margin);
    _iconFrame = CGRectMake(iconX, iconY, iconW, iconH);
    //计算正文frame
    //先计算正文的大小
    CGSize textSize = [message.text sizeOfTextWithMaxSize:CGSizeMake(200, MAXFLOAT) andFont:textFont];
    CGFloat textW = textSize.width + 40;
    CGFloat textH = textSize.height + 30;
    CGFloat textY = iconY;
    CGFloat textX = message.type == MessageTypeOther ? CGRectGetMaxX(_iconFrame) : (screenW - margin - iconW - textW);
    _textFrame = CGRectMake(textX, textY, textW, textH);
    //计算行高
    //获取头像的最大y值和，正文的最大y值，然后用最大的y值加margin
    CGFloat maxY = MAX(CGRectGetMaxY(_textFrame), CGRectGetMaxY(_iconFrame));
    _rowHeight = maxY + margin;
}

@end
