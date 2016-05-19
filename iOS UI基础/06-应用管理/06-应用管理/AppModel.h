//
//  AppModel.h
//  06-应用管理
//
//  Created by 黄启明 on 16/4/9.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppModel : NSObject
@property (nonatomic,copy) NSString *icon;
@property (nonatomic,copy) NSString *name;
//提供一个方法出来用来字典转模型
- (instancetype)initWithDict:(NSDictionary *)dict;
//instancetype能够检测真实类型，只能作为返回值，但是不能作为参数的类型
+ (instancetype)appModelWithDict:(NSDictionary *)dict;
@end
