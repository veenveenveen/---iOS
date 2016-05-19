//
//  HeroModel.m
//  10-LOL英雄展示（单组数据）
//
//  Created by 黄启明 on 16/4/16.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "HeroModel.h"

@implementation HeroModel
- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)heroModelWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}
@end
