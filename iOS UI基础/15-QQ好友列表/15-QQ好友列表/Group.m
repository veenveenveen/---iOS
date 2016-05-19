//
//  Group.m
//  15-QQ好友列表
//
//  Created by 黄启明 on 16/4/25.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "Group.h"
#import "Friend.h"

@implementation Group

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        NSMutableArray *arrayModels = [NSMutableArray array];
        for (NSDictionary *dict_sub in self.friends) {
            Friend *friend = [Friend friendWithDict:dict_sub];
            [arrayModels addObject:friend];
        }
        _friends = arrayModels;
    }
    return self;
}
+ (instancetype)groupWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

@end
