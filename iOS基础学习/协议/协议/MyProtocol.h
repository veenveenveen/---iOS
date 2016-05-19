//
//  MyProtocol.h
//  协议
//
//  Created by 黄启明 on 16/3/7.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MyProtocol <NSObject>

@optional//可选的
- (void) print:(int)value;
@required//这个方法是必须要实现的
- (int) printValue:(int)value1 andValue:(int)value2;
@end
