//
//  CZMusicTool.h
//  my music
//
//  Created by 黄启明 on 16/5/13.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MusicModel;
@interface CZMusicTool : NSObject

+ (NSArray *)musics;
+ (void)nextOfMusic;
+ (void)preOfMusic;
+ (void)setMusicModel:(MusicModel *)musicModel;
+ (MusicModel *)playingMusic;
@end
