//
//  TGModel.h
//  11-团购案例
//
//  Created by 黄启明 on 16/4/17.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TGModel : NSObject
@property (nonatomic, copy) NSString *buyCount;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *title;
- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)tgModelWithDict:(NSDictionary *)dict;
@end
