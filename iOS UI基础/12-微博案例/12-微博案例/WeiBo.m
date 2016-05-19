//
//  WeiBo.m
//  12-微博案例
//
//  Created by 黄启明 on 16/4/19.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "WeiBo.h"

@implementation WeiBo

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)weiBoWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

@end
