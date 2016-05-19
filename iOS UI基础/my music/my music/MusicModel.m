//
//  MusicModel.m
//  my music
//
//  Created by 黄启明 on 16/5/13.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "MusicModel.h"

@implementation MusicModel

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)musicModelWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

@end
