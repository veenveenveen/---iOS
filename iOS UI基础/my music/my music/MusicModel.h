//
//  MusicModel.h
//  my music
//
//  Created by 黄启明 on 16/5/13.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MusicModel : NSObject
/**
 歌曲名字
 */
@property (nonatomic, copy) NSString *name;
/**
 音乐文件
 */
@property (nonatomic, copy) NSString *filename;
/**
 歌词文件
 */
@property (nonatomic, copy) NSString *lrcname;
/**
 歌手
 */
@property (nonatomic, copy) NSString *singer;
/**
 小图
 */
@property (nonatomic, copy) NSString *singerIcon;
/**
 大图
 */
@property (nonatomic, copy) NSString *icon;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)musicModelWithDict:(NSDictionary *)dict;

@end
