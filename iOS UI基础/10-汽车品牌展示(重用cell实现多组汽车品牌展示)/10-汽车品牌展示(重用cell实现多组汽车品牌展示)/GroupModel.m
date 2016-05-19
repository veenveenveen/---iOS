//
//  GroupModel.m
//  10-汽车品牌展示(重用cell实现多组汽车品牌展示)
//
//  Created by 黄启明 on 16/4/16.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "GroupModel.h"
#import "CarModel.h"
@implementation GroupModel
- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        //模型的嵌套，需要手动做一下字典转模型
        NSMutableArray *carsArr = [NSMutableArray array];
        for (NSDictionary *dictCar in dict[@"cars"]) {
            CarModel *carMod = [CarModel carModelWithDict:dictCar];
            [carsArr addObject:carMod];
        }
        self.cars = carsArr;
    }
    return self;
}
+ (instancetype)groupModelWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}
@end
