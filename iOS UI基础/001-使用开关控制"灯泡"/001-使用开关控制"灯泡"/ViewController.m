//
//  ViewController.m
//  001-使用开关控制"灯泡"
//
//  Created by 黄启明 on 16/4/18.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *img;
- (IBAction)change:(id)sender;

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

- (IBAction)change:(id)sender {
    if ([sender isOn]) {
        self.img.image = [UIImage imageNamed:@"img_02"];
    }else{
        self.img.image = [UIImage imageNamed:@"img_01"];
    }
    
}
@end
