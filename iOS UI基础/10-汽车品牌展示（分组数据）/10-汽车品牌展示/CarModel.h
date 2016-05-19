//
//  CarModel.h
//  10-汽车品牌展示
//
//  Created by 黄启明 on 16/4/16.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CarModel : UIView
@property (nonatomic, strong) NSArray *cars;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *desc;
- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)carModelWithDict:(NSDictionary *)dict;
@end
