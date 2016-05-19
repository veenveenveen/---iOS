//
//  PlayMusicController.m
//  my music
//
//  Created by 黄启明 on 16/5/13.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "PlayMusicController.h"
#import "CZPlayMusicTool.h"
#import "CZMusicTool.h"

@interface PlayMusicController ()

@property (weak, nonatomic) IBOutlet UIImageView *bgImage;//背景图
@property (weak, nonatomic) IBOutlet UIToolbar *toorbar;//遮盖
@property (weak, nonatomic) IBOutlet UIButton *playOrPause;//播放或暂停
@property (weak, nonatomic) IBOutlet UIView *whiteView;//
@property (weak, nonatomic) IBOutlet UIButton *sliderBtn;
@property (weak, nonatomic) IBOutlet UIView *greenView;
@property (weak, nonatomic) IBOutlet UILabel *totalTime;
@property (weak, nonatomic) IBOutlet UILabel *hideTime;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *musicLable;
@property (weak, nonatomic) IBOutlet UILabel *singerLable;


@property (nonatomic, strong) MusicModel *music;

@property (nonatomic, strong) AVAudioPlayer *player;

@end

@implementation PlayMusicController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //设置toolbar的样式
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 保证界面单一
- (instancetype)init{
    if (self = [super init]) {
        //获取主窗口
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        //设置位置
        self.view.frame = CGRectMake(0, window.frame.size.height, window.frame.size.width, window.frame.size.height);
        //添加
        [window addSubview:self.view];
    }
    return self;
}

#pragma mark - 界面的显示和退出
//显示界面
- (void)show{
    //拿到主窗口
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    //修改frame
    [UIView animateWithDuration:0.5 animations:^{
        self.view.frame = window.bounds;
    }completion:^(BOOL finished) {
        //设置相关数据
        [self play];
    }];
}
- (void)play{
    //播放歌曲
    MusicModel *music = [CZMusicTool playingMusic];
    AVAudioPlayer *player = [CZPlayMusicTool playMusicWithName:music.filename];
    self.player = player;
    self.music = music;
    //设置背景图片，文字
    self.singerLable.text = self.music.singer;
    self.musicLable.text = self.music.name;
    self.bgImage.image = [UIImage imageNamed:self.music.icon];
    self.iconView.image = [UIImage imageNamed:self.music.icon];
    self.totalTime.text = [self setUpTimeStrWithTime:self.player.duration];
    [self.playOrPause setImage:[UIImage imageNamed:@"pause"] forState:UIControlStateNormal];
    self.playOrPause.selected = YES;
    
}

- (void)stop{
    [CZPlayMusicTool stopMusicWithName:self.music.filename];
    //设置背景图片，文字
    self.singerLable.text = nil;
    self.musicLable.text = nil;
    self.bgImage.image = [UIImage imageNamed:self.music.icon];
    self.iconView.image = [UIImage imageNamed:self.music.icon];
    self.totalTime.text = nil;
}

//退出界面
- (IBAction)back {
    //拿到主窗口
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    //修改frame
    [UIView animateWithDuration:0.5 animations:^{
        self.view.frame = CGRectMake(0, window.frame.size.height, window.frame.size.width, window.frame.size.height);
    }];
}

#pragma mark - 上一首 播放/暂停 下一首
- (IBAction)lastMusic {
    //停止当前播放的音乐
    [self stop];
    //找到上一首歌曲
    [CZMusicTool preOfMusic];
    //播放
    [self play];
}
- (IBAction)playOrPauseMusic {
    //判断状态 根据状态 设置播放还是暂停
    if (self.playOrPause.isSelected) {
        [CZPlayMusicTool pauseMusicWithName:self.music.filename];
        [self.playOrPause setImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
    }else{
        [CZPlayMusicTool playMusicWithName:self.music.filename];
        [self.playOrPause setImage:[UIImage imageNamed:@"pause"] forState:UIControlStateNormal];
    }
    self.playOrPause.selected = !self.playOrPause.selected;
}
- (IBAction)nextMusic {
    //停止当前播放的音乐
    [self stop];
    //找到下一首歌曲
    [CZMusicTool nextOfMusic];
    //播放
    [self play];
    
}
#pragma mark - 时间转字符串
- (NSString *)setUpTimeStrWithTime:(NSTimeInterval)time{
    //分
    int minute = time / 60;
    //秒
    int second = (int)time % 60;
    return [NSString stringWithFormat:@"%02d:%02d",minute,second];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
