//
//  DogBark.h
//  协议代理设计模式
//
//  Created by 黄启明 on 16/3/7.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Dog;//@class表示前向声明一个类
//定义一个人和狗通讯的协议
@protocol DogBark <NSObject>

- (void) bark:(Dog *)thisDog count:(int)count;


@end
