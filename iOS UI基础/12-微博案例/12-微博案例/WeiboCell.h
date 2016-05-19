//
//  WeiboCell.h
//  12-微博案例
//
//  Created by 黄启明 on 16/4/19.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WeiBoFrame;

@interface WeiboCell : UITableViewCell

@property (nonatomic, strong)  WeiBoFrame *weiboFrame;

+ (instancetype)weiBoCellWithTableView:(UITableView *)tableView;

@end
