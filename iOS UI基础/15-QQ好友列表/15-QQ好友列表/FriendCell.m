//
//  FriendCell.m
//  15-QQ好友列表
//
//  Created by 黄启明 on 16/4/25.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "FriendCell.h"

@implementation FriendCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setFriend:(Friend *)friend{
    _friend = friend;
    self.imageView.image = [UIImage imageNamed:friend.icon];
    self.textLabel.text = friend.name;
    self.detailTextLabel.text = friend.intro;
    if (friend.isvip) {
        self.textLabel.textColor = [UIColor redColor];
    }
}

+ (instancetype)friendCellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"friend_cell";
    FriendCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[FriendCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}
@end
