//
//  AppCell.h
//  16-应用管理
//
//  Created by 黄启明 on 16/4/26.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AppCell;

@protocol AppCellDelegate <NSObject>

- (void)appCellDidClickDownload:(AppCell *)appCell;

@end

@class App;

@interface AppCell : UITableViewCell

@property (nonatomic, strong) App *app;
@property (nonatomic, weak) id<AppCellDelegate> delegate;

@end
