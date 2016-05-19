//
//  NSString+NSStringExt.m
//  13-QQ聊天界面布局
//
//  Created by 黄启明 on 16/4/21.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "NSString+NSStringExt.h"

@implementation NSString (NSStringExt)

- (CGSize)sizeOfTextWithMaxSize:(CGSize)maxSize andFont:(UIFont *)font{
    NSDictionary *attrs = @{NSFontAttributeName:font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}
+ (CGSize)sizeWithText:(NSString *)text andMaxSize:(CGSize)maxSize andFont:(UIFont *)font{
    return [text sizeOfTextWithMaxSize:maxSize andFont:font];
}

@end
