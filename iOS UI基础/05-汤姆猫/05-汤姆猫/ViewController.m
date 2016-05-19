//
//  ViewController.m
//  05-汤姆猫
//
//  Created by 黄启明 on 16/4/7.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>//音频要导入此头文件

@interface ViewController ()
- (IBAction)drink;
- (IBAction)knock;
@property (weak, nonatomic) IBOutlet UIImageView *tomCat;
@property(nonatomic,strong)AVAudioPlayer *player;

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

- (IBAction)drink {
    [self runAnmmationWithName:@"drink" andCount:81];
    [self performSelector:@selector(playSound:) withObject:@"p_drink_milk" afterDelay:1.0];
}

- (IBAction)knock {
    [self runAnmmationWithName:@"knockout" andCount:81];
    
}

- (void)runAnmmationWithName:(NSString *)name andCount:(int)count{
    //0.判断是否在执行动画
    if (self.tomCat.isAnimating) {
        return;
    }
    //1.获取图片
    NSMutableArray *imgsArray = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        NSString *imgName = [NSString stringWithFormat:@"%@_%02d.jpg",name,i];
//        UIImage *img = [UIImage imageNamed:imgName];
        //imageNamed:加载完图片后，图片不会释放，图片会驻留内存
        //使用imageWithContentsOfFile:图片不会驻留
        NSString *imgPath = [[NSBundle mainBundle]pathForResource:imgName ofType:nil];
        UIImage *img = [UIImage imageWithContentsOfFile:imgPath];
        [imgsArray addObject:img];
    }
    //2.告诉tomCat要播放哪些图片
    self.tomCat.animationImages = imgsArray;
    //3.设置播放次数
    self.tomCat.animationRepeatCount = 1;
    //4.设置播放时间
    self.tomCat.animationDuration = imgsArray.count * 0.06;
    //5.开始播放
    [self.tomCat startAnimating];
    //6.清空内存（必须在动画执行完以后再清空）
    //performSelector:表示要执行的方法
    //withObject：表示方法的参数
    //afterDelay：表示一段时间以后再执行
//    [self performSelector:@selector(clearCache) withObject:nil afterDelay:self.tomCat.animationDuration];//第一种方法
//    self.tomCat.animationImages = nil;//会重写set方法，会进行一次release操作
    [self.tomCat performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:self.tomCat.animationDuration];//第二种方法
}
//清空缓存
//- (void)clearCache{
//    self.tomCat.animationImages = nil;//会重写set方法，会进行一次release操作
//}//第一种方法
- (void)playSound:(NSString *)fileName{
    //1.获取音效资源的路径
    NSString *soundPath = [[NSBundle mainBundle]pathForResource:fileName ofType:@"wav"];
    //2.转换path为URL
    NSURL *url = [NSURL fileURLWithPath:soundPath];
    //3.建一个播放器播放
    NSError *error = nil;
    AVAudioPlayer *splayer = [[AVAudioPlayer alloc]initWithContentsOfURL:url fileTypeHint:nil error:&error];
    //4.开始播放
//    [splayer play];//不行，要用下面的,需要用一个强指针引用一下
    self.player = splayer;
    [self.player play];
    
}
@end
