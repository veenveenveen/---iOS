//
//  HeroModel.h
//  10-LOL英雄展示（单组数据）
//
//  Created by 黄启明 on 16/4/16.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HeroModel : NSObject
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *intro;
@property (nonatomic, copy) NSString *name;
- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)heroModelWithDict:(NSDictionary *)dict;
@end
