//
//  Group.h
//  15-QQ好友列表
//
//  Created by 黄启明 on 16/4/25.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Group : NSObject

@property (nonatomic, strong) NSArray *friends;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) int online;
@property (nonatomic, assign, getter=isVisible) BOOL visible;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)groupWithDict:(NSDictionary *)dict;

@end
