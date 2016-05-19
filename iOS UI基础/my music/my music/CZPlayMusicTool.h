//
//  CZPlayMusicTool.h
//  06-播放多个文件
//
//  Created by apple on 15/11/29.
//  Copyright © 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
@interface CZPlayMusicTool : NSObject


//播放音乐
+ (AVAudioPlayer *)playMusicWithName:(NSString *)name;

//暂停音乐

+ (void)pauseMusicWithName:(NSString *)name;



//停止音乐

+ (void)stopMusicWithName:(NSString *)name;


@end
