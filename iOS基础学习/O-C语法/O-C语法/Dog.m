//
//  Dog.m
//  O-C语法
//
//  Created by 黄启明 on 16/3/6.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#import "Dog.h"

@implementation Dog
//函数的实现
- (id) init
{
    //super 表示父类
    //self 表示对象自己
    self = [super init];
    if (self) {
        ID = 1;
        age = 2;
        price = 60.0f;
    }
    return self;
}
- (id) initWithID:(int)newID
{
    self = [super init];
    if (self) {
        ID = newID;
        age = 2;
        price = 60.0f;
    }
    return self;
}
- (id) initWithID:(int)newID andAge:(int)newAge
{
    self = [super init];
    if (self) {
        ID = newID;
        age = newAge;
        price = 60.0f;
    }
    return self;
}
- (id) initWithID:(int)newID andAge:(int)newAge andPrice:(float)newPrice
{
    self = [super init];
    if (self) {
        ID = newID;
        age = newAge;
        price = newPrice;;
    }
    return self;
}

- (void) setID:(int)newID
{
    ID = newID;
}
- (int) getID
{
    return ID;
}
- (void) setAge:(int)newAge
{
    age = newAge;
}
- (int) getAge
{
    return age;
}
- (void) setPrice:(float)newPrice
{
    price = newPrice;
}
- (float) getPrice
{
    return price;
}

- (void) setID:(int)newID andAge:(int)newAge
{
    ID = newID;
    age = newAge;
}
- (void) setID:(int)newID andAge:(int)newAge andPrice:(float)newPrice
{
    ID = newID;
    age = newAge;
    price = newPrice;
    
}



@end
