//
//  questionModel.m
//  07-猜图游戏
//
//  Created by 黄启明 on 16/4/10.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "questionModel.h"

@implementation questionModel
- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        self.answer = dict[@"answer"];
        self.icon = dict[@"icon"];
        self.title = dict[@"title"];
        self.options = dict[@"options"];
    }
    return self;
}
+ (instancetype)questionWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}
@end
