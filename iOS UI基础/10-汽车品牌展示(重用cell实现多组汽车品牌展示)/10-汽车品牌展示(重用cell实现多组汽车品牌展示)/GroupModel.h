//
//  GroupModel.h
//  10-汽车品牌展示(重用cell实现多组汽车品牌展示)
//
//  Created by 黄启明 on 16/4/16.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GroupModel : NSObject
@property (nonatomic, strong) NSArray *cars;
@property (nonatomic, copy) NSString *title;
- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)groupModelWithDict:(NSDictionary *)dict;
@end
