//
//  ViewController.m
//  录音
//
//  Created by 黄启明 on 16/5/11.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController () <AVAudioRecorderDelegate>

@property (nonatomic, strong) AVAudioRecorder *audioRecoder;//音频录音机
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;//音频播放器，播放录音文件
@property (nonatomic, strong) NSTimer *timer;//录音声波监控

@property (weak, nonatomic) IBOutlet UIButton *record;//开始录音
@property (weak, nonatomic) IBOutlet UIButton *pause;//暂停录音
@property (weak, nonatomic) IBOutlet UIButton *resume;//恢复录音
@property (weak, nonatomic) IBOutlet UIButton *stop;//停止录音

@property (weak, nonatomic) IBOutlet UIProgressView *audioPower;//音频波动

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setAudioSession];
}

/**
 * 设置音频会话
 */
- (void)setAudioSession{
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    //设置播放和录音状态，以便录制完之后播放录音
    [audioSession setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    [audioSession setActive:YES error:nil];
}

//获取录音文件保存路径
- (NSURL *)getSavePath{
    NSString *urlStr = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    urlStr = [urlStr stringByAppendingString:@"myRecord.caf"];
    NSURL *url = [NSURL fileURLWithPath:urlStr];
    return url;
}

//取得录音文件设置
- (NSDictionary *)getAudioSetting{
    NSMutableDictionary *dicM = [NSMutableDictionary dictionary];
    //设置录音格式
    [dicM setObject:@(kAudioFormatLinearPCM) forKey:AVFormatIDKey];
    //设置录音采样率,8000是电话采样率，对于一般录音已经够了
    [dicM setObject:@(8000) forKey:AVSampleRateKey];
    //设置通道，这里采用单声道
    [dicM setObject:@(1) forKey:AVNumberOfChannelsKey];
    //每个采样点位数，分别为8，16，24，32
    [dicM setObject:@(8) forKey:AVLinearPCMBitDepthKey];
    //是否使用浮点数采样
    [dicM setObject:@(YES) forKey:AVLinearPCMIsFloatKey];
    return dicM;
}

//获取录音机对象
- (AVAudioRecorder *)audioRecoder{
    if (!_audioRecoder) {
        //创建录音文件保存路径
        NSURL *url= [self getSavePath];
        //获取录音格式设置
        NSDictionary *setting = [self getAudioSetting];
        //创建录音机
        NSError *err = nil;
        _audioRecoder = [[AVAudioRecorder alloc] initWithURL:url settings:setting error:&err];
        _audioRecoder.delegate = self;
        _audioRecoder.meteringEnabled = YES;//如果要监测声波必须设置为YES
        if (err) {
            NSLog(@"创建录音机对象时发生错误，错误信息：%@",err.localizedDescription);
            return nil;
        }
    }
    return _audioRecoder;
}

//创建播放器
- (AVAudioPlayer *)audioPlayer{
    if (!_audioPlayer) {
        NSURL *url = [self getSavePath];
        NSError *err = nil;
        _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&err];
        _audioPlayer.numberOfLoops = 0;
        [_audioPlayer prepareToPlay];
        if (err) {
            NSLog(@"创建播放器对象时发生错误，错误信息：%@",err.localizedDescription);
            return nil;
        }
    }
    return _audioPlayer;
}

//录音声波监控定时器
- (NSTimer *)timer{
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.1f target:self selector:@selector(audioPowerChange) userInfo:nil repeats:YES];
    }
    return _timer;
}

//录音声波状态设置
- (void)audioPowerChange{
    [self.audioRecoder updateMeters];//更新测量值
    float power = [self.audioRecoder averagePowerForChannel:0];//取得第一个通道的音频，注意音频强度范围是-160～0
    CGFloat pregress = (1.0/160.0) * (power+160.0);
    [self.audioPower setProgress:pregress];
}

//点击录音按钮
- (IBAction)recordClick:(UIButton *)sender {
    if (![self.audioRecoder isRecording]) {
        [self.audioRecoder record];//首次使用应用时如果使用record会询问用户是否允许使用麦克风
        [self.record setImage:[UIImage imageNamed:@"lyj_lyan"] forState:UIControlStateNormal];
        self.timer.fireDate = [NSDate distantPast];//恢复定时器
    }
}

//点击暂停按钮
- (IBAction)pauseClick:(UIButton *)sender {
    if ([self.audioRecoder isRecording]) {
        [self.audioRecoder pause];
        self.timer.fireDate = [NSDate distantFuture];//暂停定时器
    }
}

//点击恢复按钮
- (IBAction)resumeClick:(UIButton *)sender {
    [self recordClick:sender];
}

//点击停止按钮
- (IBAction)stopClick:(UIButton *)sender {
    [self.audioRecoder stop];
    self.timer.fireDate = [NSDate distantFuture];
    self.audioPower.progress = 0.0;
    [self.record setImage:[UIImage imageNamed:@"lyj_luzhian"] forState:UIControlStateNormal];
}

#pragma mark - 录音机代理方法
//录音完成，录音完成后播放声音
- (void)audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder successfully:(BOOL)flag{
    if (![self.audioPlayer isPlaying]) {
        [self.audioPlayer play];
    }
//    NSLog(@"录音完成");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
