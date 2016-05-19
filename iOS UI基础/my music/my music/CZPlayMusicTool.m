//
//  CZPlayMusicTool.m
//  06-播放多个文件
//
//  Created by apple on 15/11/29.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "CZPlayMusicTool.h"
#import <AVFoundation/AVFoundation.h>

@interface CZPlayMusicTool ()

@end


static NSMutableDictionary *_players;
@implementation CZPlayMusicTool

+ (void)initialize
{

    _players = [NSMutableDictionary dictionary];

}

//播放音乐
+ (AVAudioPlayer *)playMusicWithName:(NSString *)name
{
    //1.拿着名字取字典里面找 播放器
    
    AVAudioPlayer *player = _players[name];
    
    //2.判断播放器是否存在
    //创建  加载音乐文件
    
    if (player == nil) {
        
        //1.创建播放器对象  指定音乐文件
        
        NSString *path = [[NSBundle mainBundle]pathForResource:name ofType:nil];
        
        NSURL *url = [NSURL fileURLWithPath:path];
        
        player = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
        
        //存在字典里面
        
        [_players setObject:player forKey:name];
        
    }
    
    
    //3.开始播放
    
    [player play];
    
    return player;

}

//暂停音乐

+ (void)pauseMusicWithName:(NSString *)name
{
    //1.根据名字拿到播放器
    
    AVAudioPlayer *player = _players[name];

    
    //2.判断播放器是都存在  暂停
    
    if (player) {
        
        [player pause];
    }

}



//停止音乐

+ (void)stopMusicWithName:(NSString *)name
{
    //1.根据名字拿到播放器
    
    AVAudioPlayer *player = _players[name];
    
    
    //2.判断播放器是都存在  暂停
    
    if (player) {
        
        [player stop];
    }


}


@end
