//
//  MessageCell.m
//  13-QQ聊天界面布局
//
//  Created by 黄启明 on 16/4/21.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "MessageCell.h"
#import "Message.h"
#import "MessageFrame.h"

@interface MessageCell ()

@property (nonatomic, weak) UILabel *labTime;
@property (nonatomic, weak) UIButton *btnText;
@property (nonatomic, weak) UIImageView *imgViewIcon;

@end

@implementation MessageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //创建时间lable控件 time
        UILabel *labTime = [[UILabel alloc] init];
        labTime.font = [UIFont systemFontOfSize:12];
        labTime.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:labTime];
        self.labTime = labTime;
        //创建按钮控件 text
        UIButton *btnText = [[UIButton alloc] init];
//        [btnText setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        
//        btnText.backgroundColor = [UIColor greenColor];
        //设置按钮内边距
        btnText.contentEdgeInsets = UIEdgeInsetsMake(15, 20, 15, 20);
        
        btnText.titleLabel.numberOfLines = 0;
        btnText.titleLabel.font = textFont;
        [self.contentView addSubview:btnText];
        self.btnText = btnText;
        //创建头像控件 icon
        UIImageView *imgViewIcon = [[UIImageView alloc] init];
        [self.contentView addSubview:imgViewIcon];
        self.imgViewIcon = imgViewIcon;
    }
    //修改单元格背景色
    self.backgroundColor = [UIColor clearColor];
    return self;
}

+ (instancetype)messageCellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"message_cell";
    MessageCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[MessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

- (void)setMessageFame:(MessageFrame *)messageFame{
    _messageFame = messageFame;
    Message *message = messageFame.message;
    //设置每个子控件的数据和frame
    //1.设置时间lable的数据和frame
    self.labTime.text = message.time;
    self.labTime.frame = messageFame.timeFrame;
    self.labTime.hidden = message.hideTime;//时间一样就隐藏
    //2.设置头像
    NSString *iconImg = message.type == MessageTypeMe ? @"me" : @"other";
    self.imgViewIcon.image = [UIImage imageNamed:iconImg];
    self.imgViewIcon.frame = messageFame.iconFrame;
    //3.设置消息正文
    [self.btnText setTitle:message.text forState:UIControlStateNormal];
    self.btnText.frame = messageFame.textFrame;
    //设置正文的背景图
    NSString *imgNor,*imgHighlighted;
    if (message.type == MessageTypeMe) {
        imgNor = @"chat_send_nor";
        imgHighlighted = @"chat_send_press_pic";
        [self.btnText setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }else{
        imgNor = @"chat_recive_nor";
        imgHighlighted = @"chat_recive_press_pic";
        [self.btnText setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    //加载图片
    UIImage *imageNormal = [UIImage imageNamed:imgNor];
    UIImage *imageHighlighted = [UIImage imageNamed:imgHighlighted];
    //用平铺的方式拉伸图片
    imageNormal = [imageNormal stretchableImageWithLeftCapWidth:(imageNormal.size.width * 0.5) topCapHeight:(imageNormal.size.height * 0.5)];
    imageHighlighted = [imageNormal stretchableImageWithLeftCapWidth:(imageHighlighted.size.width * 0.5) topCapHeight:(imageHighlighted.size.height * 0.5)];
    //设置背景图
    [self.btnText setBackgroundImage:imageNormal forState:UIControlStateNormal];
    [self.btnText setBackgroundImage:imageHighlighted forState:UIControlStateHighlighted];
    
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
