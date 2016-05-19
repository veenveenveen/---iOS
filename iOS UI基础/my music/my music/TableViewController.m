//
//  TableViewController.m
//  my music
//
//  Created by 黄启明 on 16/5/13.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "TableViewController.h"
#import "MusicModel.h"
#import "MusicCell.h"
#import "PlayMusicController.h"
#import "CZPlayMusicTool.h"
#import <AVFoundation/AVFoundation.h>
#import "CZMusicTool.h"

@interface TableViewController ()

@property (nonatomic, strong) NSArray *musics;
@property (nonatomic, strong) PlayMusicController *playMusicController;

@end

@implementation TableViewController

#pragma mark - 懒加载
//- (NSArray *)musics{
//    if (_musics == nil) {
//        NSString *path = [[NSBundle mainBundle] pathForResource:@"Musics.plist" ofType:nil];
//        NSArray *arrMusics = [NSArray arrayWithContentsOfFile:path];
//        NSMutableArray *mutMusics = [NSMutableArray array];
//        for (NSDictionary *dict in arrMusics) {
//            MusicModel *musicMod = [MusicModel musicModelWithDict:dict];
//            [mutMusics addObject:musicMod];
//        }
//        _musics = mutMusics;
//    }
//    return _musics;
//}

#pragma mark - PlayMusicController控制器懒加载
- (PlayMusicController *)playMusicController{
    if (_playMusicController == nil) {
        _playMusicController = [[PlayMusicController alloc] init];
    }
    return _playMusicController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 60;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [CZMusicTool musics].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //创建cell
    MusicCell *cell = [MusicCell musicCellWithTableView:tableView];
    //获取模型
    MusicModel *musicMod = [CZMusicTool musics][indexPath.row];
    //设置数据
    cell.musicModel = musicMod;
    //返回cell
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    self.playMusicController.view.frame = self.view.bounds;
//    [self.navigationController.view addSubview:self.playMusicController.view];
    //获取当前歌曲模型
    MusicModel *music = [CZMusicTool musics][indexPath.row];
    [CZMusicTool setMusicModel:music];//把当前模型进行保存
    //展示播放界面
    [self.playMusicController show];
}

@end
