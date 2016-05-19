//
//  FriendCell.h
//  15-QQ好友列表
//
//  Created by 黄启明 on 16/4/25.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Friend.h"
@interface FriendCell : UITableViewCell

@property (nonatomic, strong) Friend *friend;

+ (instancetype)friendCellWithTableView:(UITableView *)tableView;

@end
