//
//  ViewController.m
//  音乐
//
//  Created by 黄启明 on 16/5/10.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController () <AVAudioPlayerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *playOrPause;
@property (weak, nonatomic) IBOutlet UIProgressView *playProgress;

@property (nonatomic, strong) AVAudioPlayer *audioPlayer;//播放器

@property (nonatomic, weak) NSTimer *timer;//进度更新定时器

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSTimer *)timer{
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(updateProgress) userInfo:nil repeats:YES];
    }
    return _timer;
}
//创建播放器
- (AVAudioPlayer *)audioPlayer{
    if (!_audioPlayer) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"草蜢 - 失恋阵线联盟.mp3" ofType:nil];
        NSURL *url = [NSURL fileURLWithPath:path];
        NSError *error = nil;
        _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
        _audioPlayer.numberOfLoops = 0;
        _audioPlayer.delegate = self;
        [_audioPlayer prepareToPlay];
        if (error) {
            NSLog(@"初始化播放器过程发生错误，错误信息%@",error.localizedDescription);
        }
    }
    return  _audioPlayer;
}
//播放音频
- (void)play{
    if (![self.audioPlayer isPlaying]) {
        [self.audioPlayer play];
        self.timer.fireDate = [NSDate distantPast];//恢复定时器
    }
}
//暂停播放
- (void)pause{
    if ([self.audioPlayer isPlaying]) {
        [self.audioPlayer pause];
        self.timer.fireDate = [NSDate distantFuture];//暂停定时器
    }
}
//点击播放/暂停按钮
- (IBAction)playClick:(UIButton *)sender {
    if (sender.tag) {
        sender.tag = 0;
        [sender setImage:[UIImage imageNamed:@"find_setting_h"] forState:UIControlStateNormal];
        [self pause];
    }else{
        sender.tag = 1;
        [sender setImage:[UIImage imageNamed:@"find_setting_n"] forState:UIControlStateNormal];
        [self play];
    }
}
//更新播放进度
- (void)updateProgress{
    float progress = self.audioPlayer.currentTime / self.audioPlayer.duration;
    [self.playProgress setProgress:progress];
}
//播放器代理方法
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    NSLog(@"音乐播放完成");
    [self.playOrPause setImage:[UIImage imageNamed:@"find_setting_h"] forState:UIControlStateNormal];
}

@end
