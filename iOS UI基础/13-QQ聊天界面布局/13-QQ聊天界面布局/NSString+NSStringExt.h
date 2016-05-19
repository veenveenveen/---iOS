//
//  NSString+NSStringExt.h
//  13-QQ聊天界面布局
//
//  Created by 黄启明 on 16/4/21.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (NSStringExt)

- (CGSize)sizeOfTextWithMaxSize:(CGSize)maxSize andFont:(UIFont *)font;
+ (CGSize)sizeWithText:(NSString *)text andMaxSize:(CGSize)maxSize andFont:(UIFont *)font;
@end
