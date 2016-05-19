//
//  GoodsCell.m
//  11-团购案例
//
//  Created by 黄启明 on 16/4/17.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "GoodsCell.h"
#import "TGModel.h"

@interface GoodsCell()

@property (weak, nonatomic) IBOutlet UIImageView *imgIcon;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblPrice;
@property (weak, nonatomic) IBOutlet UILabel *lblBuyCount;

@end

@implementation GoodsCell
//重写tgModel的set方法
- (void)setTgModel:(TGModel *)tgModel{
    _tgModel = tgModel;
    //把模型的数据设置给子控件
    self.imgIcon.image = [UIImage imageNamed:tgModel.icon];
    self.lblTitle.text = tgModel.title;
    self.lblPrice.text = [NSString stringWithFormat:@"￥ %@",tgModel.price];
    self.lblBuyCount.text = [NSString stringWithFormat:@"%@人已购买",tgModel.buyCount];
}
//封装的类方法的实现
+ (instancetype)goodsCellWithTableView:(UITableView *)tableView{
    static NSString *goodID = @"good_ID";
    GoodsCell *cell = [tableView dequeueReusableCellWithIdentifier:goodID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"GoodsCell" owner:nil options:nil] firstObject];//在xib文件中指定重用ID
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
