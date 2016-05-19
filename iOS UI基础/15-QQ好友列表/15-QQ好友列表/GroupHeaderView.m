//
//  HeaderView.m
//  15-QQ好友列表
//
//  Created by 黄启明 on 16/4/25.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "GroupHeaderView.h"
#import "Group.h"
#import "Friend.h"

@interface GroupHeaderView ()

@property (nonatomic, weak) UIButton *btnGroupTitle;
@property (nonatomic, weak) UILabel *labCount;


@end

@implementation GroupHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        //创建按钮
        UIButton *btnGroupTitle = [[UIButton alloc] init];
        //设置按钮的图片
        [btnGroupTitle setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
        //设置按钮中显示模式
        btnGroupTitle.imageView.contentMode = UIViewContentModeCenter;
        //设置图片框超出的部分不要截掉
        btnGroupTitle.imageView.clipsToBounds = NO;
        //设置按钮内容整体左对齐
        [btnGroupTitle setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        //设置按钮内容的内边距
        UIEdgeInsets edgeInset = UIEdgeInsetsMake(0, 15, 0, 0);
        [btnGroupTitle setContentEdgeInsets:edgeInset];
        //设置按钮文字内容内边距
        [btnGroupTitle setTitleEdgeInsets:edgeInset];
        //设置按钮背景图片
        [btnGroupTitle setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg"] forState:UIControlStateNormal];
        [btnGroupTitle setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg_highlighted"] forState:UIControlStateHighlighted];
        [btnGroupTitle addTarget:self action:@selector(btnGroupTitleClick) forControlEvents:UIControlEventTouchUpInside];
        
        [self.contentView addSubview:btnGroupTitle];
        self.btnGroupTitle = btnGroupTitle;
        //创建label
        UILabel *labCount = [[UILabel alloc] init];
        //设置label文字对齐方式
        labCount.textAlignment = NSTextAlignmentRight;
        
        [self.contentView addSubview:labCount];
        self.labCount = labCount; 
    }
    return self;
}

//组标题按钮的点击事件
- (void)btnGroupTitleClick{
    //设置组的状态
    self.group.visible = !self.group.visible;
    //刷新tableView，通过代理来实现
    if ([self.delegate respondsToSelector:@selector(groupHeaderViewDidClickTitleButton:)]) {
        //调用代理方法
        [self.delegate groupHeaderViewDidClickTitleButton:self];
    }
}
//当一个新的headerView加到某个父控件中的时候调用这个方法
- (void)didMoveToSuperview{
    if (self.group.isVisible) {
        //让按钮中的图片实现旋转
        self.btnGroupTitle.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    }else{
        self.btnGroupTitle.imageView.transform = CGAffineTransformMakeRotation(0);
    }
}

- (void)setGroup:(Group *)group{
    _group = group;
    //设置按钮上的数据
    //设置按钮上的文字
    [self.btnGroupTitle setTitle:group.name forState:UIControlStateNormal];
    [self.btnGroupTitle setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //设置label上的文字
    self.labCount.text = [NSString stringWithFormat:@"%d/%u",group.online,group.friends.count];
    
    //设置按钮中的图片旋转问题
    if (self.group.isVisible) {
        //让按钮中的图片实现旋转
        self.btnGroupTitle.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    }else{
        self.btnGroupTitle.imageView.transform = CGAffineTransformMakeRotation(0);
    }
    
}

- (void)layoutSubviews{//这个方法是在当前控件的frame发生改变的时候调用
    [super layoutSubviews];
    //设置按钮frame
    self.btnGroupTitle.frame = self.bounds;
    //设置label的frame
    self.labCount.frame = CGRectMake(self.bounds.size.width-70, 0, 50, self.bounds.size.height);
}

+ (instancetype)groupHeaderViewWithTableView:(UITableView *)tableView{
    static NSString *ID = @"group_header_view";
    GroupHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (headerView == nil) {
        headerView = [[GroupHeaderView alloc] initWithReuseIdentifier:ID];
    }
    return headerView;
}


@end
