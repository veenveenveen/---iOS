//
//  Dog.h
//  O-C语法
//
//  Created by 黄启明 on 16/3/6.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dog : NSObject
{//写字段
@protected
    int ID;
@public
    int age;
@private
    float price;
}
//写方法,函数的声明
- (id) init;//凡是以init开头的都是构造函数
- (id) initWithID:(int)newID;
- (id) initWithID:(int)newID andAge:(int)newAge;
- (id) initWithID:(int)newID andAge:(int)newAge andPrice:(float)newPrice;

//set/get ID
- (void) setID:(int)newID;
- (int) getID;

- (void) setAge:(int)newAge;
- (int) getAge;

- (void) setPrice:(float)newPrice;
- (float) getPrice;

//函数名为 setID:andAge: 2个参数
- (void) setID:(int)newID andAge:(int)newAge;
//函数名为 setID:andAge:andPrice: 3个参数
- (void) setID:(int)newID andAge:(int)newAge andPrice:(float)newPrice;

@end
