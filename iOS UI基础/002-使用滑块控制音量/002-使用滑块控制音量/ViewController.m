//
//  ViewController.m
//  002-使用滑块控制音量
//
//  Created by 黄启明 on 16/4/18.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *voice;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.slider addTarget:self action:@selector(ValueChange:) forControlEvents:UIControlEventValueChanged];
//    [self.slider setMinimumTrackImage:[UIImage imageNamed:@"nonFinish"] forState:UIControlStateNormal];
//    [self.slider setMaximumTrackImage:[UIImage imageNamed:@"finish"] forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)ValueChange:(UISlider *)slid{
    //设置图片数量
    int count = 4;
    //获取滑块的值
    float level = slid.value;
    //根据滑块的值适时切换图片
    if (level >= 0 && level < 1.0/(count-1)) {
        self.voice.image = [UIImage imageNamed:@"voice0.jpg"];
    }else if (level >= 1.0/(count-1) && level < 2.0/(count-1)){
        self.voice.image = [UIImage imageNamed:@"voice1.jpg"];
    }else if (level >= 2.0/(count-1) && level < 3.0/(count-1)){
        self.voice.image = [UIImage imageNamed:@"voice2.jpg"];
    }else if (level == 1.0){
        self.voice.image = [UIImage imageNamed:@"voice3.jpg"];
    }
}
@end
