//
//  MusicCell.h
//  my music
//
//  Created by 黄启明 on 16/5/13.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MusicModel.h"

@interface MusicCell : UITableViewCell

@property (nonatomic, strong) MusicModel *musicModel;

+ (instancetype)musicCellWithTableView:(UITableView *)tableView;

@end
