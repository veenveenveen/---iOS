//
//  HeaderView.h
//  15-QQ好友列表
//
//  Created by 黄启明 on 16/4/25.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GroupHeaderView;

@protocol GroupHeaderViewDelegate <NSObject>

- (void)groupHeaderViewDidClickTitleButton:(GroupHeaderView *)groupHeaderView;

@end

@class Group;
@interface GroupHeaderView : UITableViewHeaderFooterView

@property (nonatomic, strong) Group *group;

@property (nonatomic, weak) id<GroupHeaderViewDelegate> delegate;

+ (instancetype)groupHeaderViewWithTableView:(UITableView *)tableView;

@end
