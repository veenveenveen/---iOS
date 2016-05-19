//
//  AppCell.m
//  16-应用管理
//
//  Created by 黄启明 on 16/4/26.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "AppCell.h"
#import "App.h"

@interface AppCell ()

@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *labName;
@property (weak, nonatomic) IBOutlet UILabel *labDetail;
@property (weak, nonatomic) IBOutlet UIButton *btnDownload;



@end

@implementation AppCell

#pragma mark - 下载按钮单击事件

- (IBAction)btnDownloadClick {
    //禁用按钮
    self.btnDownload.enabled = NO;
    //标记一下已经被点击过了
    self.app.isDownloaded = YES;
    //弹出消息提示label
    //通过代理实现
    if ([self.delegate respondsToSelector:@selector(appCellDidClickDownload:)]) {
        [self.delegate appCellDidClickDownload:self];
    }
}

#pragma mark - 重写app属性的set方法

- (void)setApp:(App *)app{
    _app = app;
    //因为使用的是storyboard中自定义的cell，里面的控件是自定义的，创建cell的时候没有指定cell的类型，因此如果不拖线的话，只能使用默认的cell类型，如果要完全能显示cell中所有的控件，必须要拖线
    self.labName.text = app.name;
    self.labDetail.text = [NSString stringWithFormat:@"大小:%@ | 下载量:%@",app.size,app.download];
    self.icon.image = [UIImage imageNamed:app.icon];
    //更新下载按钮的状态（给模型增加一个属性，通过属性判断是否下载过）
    if (app.isDownloaded) {
        self.btnDownload.enabled = NO;
    }else{
        self.btnDownload.enabled = YES;
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
