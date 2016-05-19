//
//  FootView.h
//  11-团购案例
//
//  Created by 黄启明 on 16/4/18.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FootView;

@protocol FootViewDelegate <NSObject>
- (void)footViewdidLoadMore:(FootView *)footView;
@end

@interface FootView : UIView
@property (nonatomic, weak) id<FootViewDelegate> delegate;//UI控件的代理用weak

+ (instancetype)footView;

@end
