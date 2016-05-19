//
//  App.h
//  16-应用管理
//
//  Created by 黄启明 on 16/4/25.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface App : NSObject

@property (nonatomic, copy) NSString *size;
@property (nonatomic, copy) NSString *download;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon;
//增加一个是否被下载过的属性
@property (nonatomic, assign,) BOOL isDownloaded;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)appWithDict:(NSDictionary *)dict;

@end
