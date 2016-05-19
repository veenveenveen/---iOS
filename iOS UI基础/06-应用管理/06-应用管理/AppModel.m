//
//  AppModel.m
//  06-应用管理
//
//  Created by 黄启明 on 16/4/9.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "AppModel.h"

@implementation AppModel
- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        self.icon = dict[@"icon"];
        self.name = dict[@"name"];
    }
    return self;
}
+ (instancetype)appModelWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];//为什么用self，所以引入了GoodAppModel
}
@end
