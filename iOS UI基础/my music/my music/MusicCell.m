//
//  MusicCell.m
//  my music
//
//  Created by 黄启明 on 16/5/13.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "MusicCell.h"

@interface MusicCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UILabel *singerLable;


@end

@implementation MusicCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    //设置圆角
    self.iconImage.layer.cornerRadius = 24;
    self.iconImage.layer.masksToBounds = YES;//    cell.imageView.clipsToBounds = YES;
    self.iconImage.layer.borderWidth = 2;
    self.iconImage.layer.borderColor = [UIColor orangeColor].CGColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setMusicModel:(MusicModel *)musicModel{
    _musicModel = musicModel;
    self.nameLable.text = musicModel.name;
    self.singerLable.text = musicModel.singer;
    self.iconImage.image = [UIImage imageNamed:musicModel.singerIcon];
}

+ (instancetype)musicCellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"music";
    MusicCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    return cell;
}

@end
