//
//  WeiBoFrame.h
//  12-微博案例
//
//  Created by 黄启明 on 16/4/19.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>
#define nameFont [UIFont systemFontOfSize:12]
#define textFont [UIFont systemFontOfSize:14]

@class WeiBo;

@interface WeiBoFrame : NSObject

@property (nonatomic, strong) WeiBo *weiBo;
@property (nonatomic, assign, readonly) CGRect iconFrame;//保存头像的frame
@property (nonatomic, assign, readonly) CGRect nameFrame;//保存昵称的frame
@property (nonatomic, assign, readonly) CGRect vipFrame;//保存会员的frame
@property (nonatomic, assign, readonly) CGRect textFrame;//保存正文的frame
@property (nonatomic, assign, readonly) CGRect pictureFrame;//保存图片的frame
@property (nonatomic, assign, readonly) CGFloat rowHeight;//行高

@end
