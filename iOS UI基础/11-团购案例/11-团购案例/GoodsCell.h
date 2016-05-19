//
//  GoodsCell.h
//  11-团购案例
//
//  Created by 黄启明 on 16/4/17.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TGModel;

@interface GoodsCell : UITableViewCell

@property (nonatomic, strong) TGModel *tgModel;
//封装一个自定义cell的方法
+ (instancetype)goodsCellWithTableView:(UITableView *)tableView;

@end
