//
//  NSObject+CZ.h
//  02-字典转模型
//
//  Created by 刘超 on 15/8/26.
//  Copyright (c) 2015年 itcast.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (CZ)

- (void)dictChangeModelWithDict:(NSDictionary *)dict;

+ (NSArray *)objcWithFileName:(NSString *)name;


@end
