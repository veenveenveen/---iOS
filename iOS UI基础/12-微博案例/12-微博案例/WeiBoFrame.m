//
//  WeiBoFrame.m
//  12-微博案例
//
//  Created by 黄启明 on 16/4/19.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "WeiBoFrame.h"
#import "WeiBo.h"

@implementation WeiBoFrame

- (void)setWeiBo:(WeiBo *)weiBo{
    _weiBo = weiBo;
    //计算每个控件的frame和行高
    
    //提取统一的间距
    CGFloat margin = 10;
    //1.头像
    CGFloat iconW = 35;
    CGFloat iconH = 35;
    CGFloat iconX = margin;
    CGFloat iconY = margin;
    _iconFrame = CGRectMake(iconX, iconY, iconW, iconH);
    //2.昵称
    CGFloat nameX = CGRectGetMaxX(_iconFrame) +margin;
    CGSize nameSize = [self sizeWithText:weiBo.name andMaxSize:CGSizeMake(MAXFLOAT, MAXFLOAT) andFont:nameFont];
    CGFloat nameW = nameSize.width;
    CGFloat nameH = nameSize.height;
    CGFloat nameY = (iconH - nameH) * 0.5 +iconY;
    _nameFrame = CGRectMake(nameX, nameY, nameW, nameH);
    //3.会员
    CGFloat vipX = CGRectGetMaxX(_nameFrame)  + margin;
    CGFloat vipW = 10;
    CGFloat vipH = 10;
    CGFloat vipY = nameY;
    _vipFrame= CGRectMake(vipX, vipY, vipW, vipH);
    //4.正文
    CGSize textSize = [self sizeWithText:weiBo.text andMaxSize:CGSizeMake(300, MAXFLOAT) andFont:textFont];
    CGFloat textX = iconX;
    CGFloat textY = CGRectGetMaxY(_iconFrame) + margin;
    CGFloat textW = textSize.width;
    CGFloat textH = textSize.height;
    _textFrame = CGRectMake(textX, textY, textW, textH);
    //5.计算配图
    CGFloat picX = iconX;
    CGFloat picY = CGRectGetMaxY(_textFrame) + margin;
    CGFloat picW = 100;
    CGFloat picH = 100;
    _pictureFrame = CGRectMake(picX, picY, picW, picH);
    //6.计算每行的高度
    CGFloat rowHeight = 0;
    if (weiBo.picture) {
        rowHeight = CGRectGetMaxY(_pictureFrame) + margin;
    }else{
        rowHeight = CGRectGetMaxY(_textFrame) + margin;
    }
    _rowHeight = rowHeight;//不要忘了赋值
}

//根据给定的字符串，最大的size，给定的字体，来计算文字应该占用的大小
- (CGSize)sizeWithText:(NSString *)text andMaxSize:(CGSize)maxSize andFont:(UIFont *)font{
    NSDictionary *attr = @{NSFontAttributeName:font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size;
}
@end
