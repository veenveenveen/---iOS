//
//  CarModel.m
//  10-汽车品牌展示(重用cell实现多组汽车品牌展示)
//
//  Created by 黄启明 on 16/4/16.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "CarModel.h"

@implementation CarModel
- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)carModelWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}
@end
