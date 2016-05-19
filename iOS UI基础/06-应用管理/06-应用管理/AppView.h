//
//  AppView.h
//  06-应用管理
//
//  Created by 黄启明 on 16/4/9.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AppModel;

@interface AppView : UIView
@property(nonatomic,strong)AppModel *appModel;
+ (instancetype)loadView;//用来加载xib文件，一般只有模型才会有那种固定的方法的写法
@end
