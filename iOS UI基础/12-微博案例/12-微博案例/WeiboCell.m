//
//  WeiboCell.m
//  12-微博案例
//
//  Created by 黄启明 on 16/4/19.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "WeiboCell.h"
#import "WeiBo.h"
#import "WeiBoFrame.h"

@interface WeiboCell ()
@property (nonatomic, weak) UIImageView *imgViewIcon;
@property (nonatomic, weak) UILabel *labText;
@property (nonatomic, weak) UILabel *labName;
@property (nonatomic, weak) UIImageView *imgViewVip;
@property (nonatomic, weak) UIImageView *imgViewPicture;
@end

@implementation WeiboCell
#pragma mark - 重写weiboFrame属性的set方法
- (void)setWeiboFrame:(WeiBoFrame *)weiboFrame{
    _weiboFrame = weiboFrame;
    //设置单元格中子控件数据
    [self settingData];
    //设置单元格中子控件的frame
    [self settingFrame];
}
//设置数据的方法
- (void)settingData{
    WeiBo *mod = self.weiboFrame.weiBo;
    self.imgViewIcon.image = [UIImage imageNamed:mod.icon];
    self.labName.text = mod.name;
    if (mod.isVip) {//设置会员头像图标是否显示
        self.imgViewVip.hidden = NO;
        self.labName.textColor = [UIColor orangeColor];
    }
    else{
        self.imgViewVip.hidden = YES;
        self.labName.textColor = [UIColor blackColor];
    }
    self.labText.text = mod.text;
    if (mod.picture) {
        self.imgViewPicture.image = [UIImage imageNamed:mod.picture];
        self.imgViewPicture.hidden = NO;
    }else{
        self.imgViewPicture.hidden = YES;
    }
}
//设置frame的方法
- (void)settingFrame{
    //1.头像
    self.imgViewIcon.frame = self.weiboFrame.iconFrame;
    //2.昵称
    self.labName.frame = self.weiboFrame.nameFrame;
    //3.会员
    self.imgViewVip.frame = self.weiboFrame.vipFrame;
    //4.正文
    self.labText.frame = self.weiboFrame.textFrame;
    //5.计算配图
    self.imgViewPicture.frame = self.weiboFrame.pictureFrame;
    
}
//根据给定的字符串，最大的size，给定的字体，来计算文字应该占用的大小
- (CGSize)sizeWithText:(NSString *)text andMaxSize:(CGSize)maxSize andFont:(UIFont *)font{
    NSDictionary *attr = @{NSFontAttributeName:font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size;
}
#pragma mark - 重写init方法
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //创建5个子控件
        UIImageView *imgViewIcon = [[UIImageView alloc] init];
        [self.contentView addSubview:imgViewIcon];
        self.imgViewIcon = imgViewIcon;
        
        UILabel *labText = [[UILabel alloc] init];
        [self.contentView addSubview:labText];
        labText.font = textFont;
        //设置正文label可以自动换行
        labText.numberOfLines = 0;
        self.labText = labText;
        
        UILabel *labName = [[UILabel alloc] init];
        [self.contentView addSubview:labName];
        self.labName = labName;
        labName.font = nameFont;

        UIImageView *imgViewVip = [[UIImageView alloc] init];
        [self.contentView addSubview:imgViewVip];
        imgViewVip.image = [UIImage imageNamed:@"vip"];
        self.imgViewVip = imgViewVip;
        
        UIImageView *imgViewPicture = [[UIImageView alloc] init];
        [self.contentView addSubview:imgViewPicture];
        self.imgViewPicture = imgViewPicture;
    }
    return self;
}

+ (instancetype)weiBoCellWithTableView:(UITableView *)tableView{
    static NSString *weiboID = @"weibo_cell";
    WeiboCell *cell = [tableView dequeueReusableCellWithIdentifier:weiboID];
    if (cell == nil) {
        cell = [[WeiboCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:weiboID];
    }
    return cell;
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
