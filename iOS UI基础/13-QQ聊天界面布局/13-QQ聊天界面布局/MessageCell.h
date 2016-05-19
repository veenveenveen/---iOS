//
//  MessageCell.h
//  13-QQ聊天界面布局
//
//  Created by 黄启明 on 16/4/21.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MessageFrame;

@interface MessageCell : UITableViewCell

@property (nonatomic, strong) MessageFrame *messageFame;//为自定义单元格增加一个messageFame属性

+ (instancetype)messageCellWithTableView:(UITableView *)tableView;

@end
