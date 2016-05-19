//
//  TGModel.m
//  11-团购案例
//
//  Created by 黄启明 on 16/4/17.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "TGModel.h"

@implementation TGModel

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)tgModelWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}

@end
