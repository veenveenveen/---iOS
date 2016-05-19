//
//  CZMusicTool.m
//  my music
//
//  Created by 黄启明 on 16/5/13.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "CZMusicTool.h"
#import "MusicModel.h"
#import "NSObject+CZ.h"
#import "MusicModel.h"

static NSArray *_musics;
static MusicModel *_musicModel;
@implementation CZMusicTool

+ (void)initialize{
    _musics = [MusicModel objcWithFileName:@"Musics.plist"];
}

+ (NSArray *)musics{
    return _musics;
}

+ (void)nextOfMusic{
    //找当前模型的下一个模型
    //获取当前模型的角标
    NSUInteger index = [[CZMusicTool musics] indexOfObject:_musicModel];
    //取出下一个
    if (index < [CZMusicTool musics].count-1 ) {
        index++;
    }else{
        index = 0;
    }
    MusicModel *nextMusic = [CZMusicTool musics][index];
    _musicModel = nextMusic;
}

+ (void)preOfMusic{
    //找当前模型的上一个模型
    //获取当前模型的角标
    NSUInteger index = [[CZMusicTool musics] indexOfObject:_musicModel];
    //取出下一个
    if (index > 0 ) {
        index--;
    }else{
        index = [CZMusicTool musics].count - 1;
    }
    MusicModel *nextMusic = [CZMusicTool musics][index];
    _musicModel = nextMusic;
}

+ (void)setMusicModel:(MusicModel *)musicModel{
    _musicModel = musicModel;
}

+ (MusicModel *)playingMusic{
    return _musicModel;
}
@end
