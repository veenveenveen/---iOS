//
//  ViewController.m
//  04-图片浏览器
//
//  Created by 黄启明 on 16/4/6.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "ViewController.h"
#import "imageModel.h"

@interface ViewController ()
- (IBAction)left;
- (IBAction)right;
//用一个索引值记录当前图片
@property(nonatomic,assign)int index;
@property (weak, nonatomic) IBOutlet UILabel *numLable;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *descLable;
@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;
@property (nonatomic,strong) NSArray *images;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //懒加载  核心思想：当数据不存在的时候加载，重写get方法
/*
//    NSMutableDictionary *dict1 = [NSMutableDictionary dictionary];
//    dict1[@"icon"] = @"1_1";
//    dict1[@"desc"] = @"狗";
//    NSMutableDictionary *dict2 = [NSMutableDictionary dictionary];
//    dict2[@"icon"] = @"1_2";
//    dict2[@"desc"] = @"不知道什么东西";
//    NSMutableDictionary *dict3 = [NSMutableDictionary dictionary];
//    dict3[@"icon"] = @"1_3";
//    dict3[@"desc"] = @"老鼠";
//    NSMutableDictionary *dict4 = [NSMutableDictionary dictionary];
//    dict4[@"icon"] = @"1_4";
//    dict4[@"desc"] = @"羊";
//    NSMutableDictionary *dict5 = [NSMutableDictionary dictionary];
//    dict5[@"icon"] = @"1_5";
//    dict5[@"desc"] = @"猫头鹰";
//    _images = @[dict1,dict2,dict3,dict4,dict5];
 */
    //    self.numLable.text = @"1/5";
    //    self.imgView.image = [UIImage imageNamed:@"1_1"];
    //    self.descLable.text = @"狗";
    //    self.leftBtn.enabled = NO;
    [self changeImg];
}
//为了性能问题用懒加载
- (NSArray *)images{
    if (_images == nil) {
/*
        NSMutableDictionary *dict1 = [NSMutableDictionary dictionary];
        dict1[@"icon"] = @"1_1";
        dict1[@"desc"] = @"狗";
        NSMutableDictionary *dict2 = [NSMutableDictionary dictionary];
        dict2[@"icon"] = @"1_2";
        dict2[@"desc"] = @"不知道什么东西";
        NSMutableDictionary *dict3 = [NSMutableDictionary dictionary];
        dict3[@"icon"] = @"1_3";
        dict3[@"desc"] = @"老鼠";
        NSMutableDictionary *dict4 = [NSMutableDictionary dictionary];
        dict4[@"icon"] = @"1_4";
        dict4[@"desc"] = @"羊";
        NSMutableDictionary *dict5 = [NSMutableDictionary dictionary];
        dict5[@"icon"] = @"1_5";
        dict5[@"desc"] = @"猫头鹰";
        _images = @[dict1,dict2,dict3,dict4,dict5];
        [_images writeToFile:@"/Users/huangqiming/Desktop/我的项目--iOS/iOS UI基础/04-图片浏览器/images.plist" atomically:YES];
 */
        //获取plist文件的全路径
        NSString *path = [[NSBundle mainBundle]pathForResource:@"images.plist" ofType:nil];
        //读取plist文件
//        _images = [NSArray arrayWithContentsOfFile:path];
        NSArray *tempArray = [NSArray arrayWithContentsOfFile:path];
        //字典转模型
        NSMutableArray *mutableArray = [NSMutableArray array];
        for (NSDictionary *dict in tempArray) {
            imageModel *imageMod = [[imageModel alloc]init];
            //把字典的value值赋值给属性
            imageMod.desc = dict[@"desc"];
            imageMod.icon = dict[@"icon"];
            [mutableArray addObject:imageMod];
        }
        _images = mutableArray;
    }
    return _images;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)left {
    //索引值减1
    self.index --;
    [self changeImg];
}

- (IBAction)right {
    //索引值加1
    self.index ++;
    [self changeImg];
}
- (void)changeImg{
    //根据对应的索引值设置数据
    self.numLable.text = [NSString stringWithFormat:@"%d/%ld",self.index+1,self.images.count];
//    NSDictionary *dict = self.images[self.index];
    imageModel *mod = self.images[self.index];
    self.imgView.image = [UIImage imageNamed:mod.icon];
    self.descLable.text = mod.desc;
    self.leftBtn.enabled = (self.index != 0);
    self.rightBtn.enabled = (self.index != self.images.count-1);
/*
//    switch (self.index) {
//        case 0:
////            self.numLable.text = @"1/5";
//            self.imgView.image = [UIImage imageNamed:@"1_1"];
//            self.descLable.text = @"狗";
//            break;
//        case 1:
////            self.numLable.text = @"2/5";
//            self.imgView.image = [UIImage imageNamed:@"1_2"];
//            self.descLable.text = @"不知道什么东西";
//            
//            break;
//        case 2:
////            self.numLable.text = @"3/5";
//            self.imgView.image = [UIImage imageNamed:@"1_3"];
//            self.descLable.text = @"老鼠";
//            
//            break;
//        case 3:
////            self.numLable.text = @"4/5";
//            self.imgView.image = [UIImage imageNamed:@"1_4"];
//            self.descLable.text = @"羊";
//            
//            break;
//        case 4:
////            self.numLable.text = @"5/5";
//            self.imgView.image = [UIImage imageNamed:@"1_5"];
//            self.descLable.text = @"猫头鹰";
//            break;
//    }
    //设置按钮的状态
//    if (self.index == 0) {
//        self.leftBtn.enabled = NO;
//    }else{
//        self.leftBtn.enabled = YES;
//    }
//    self.leftBtn.enabled = (self.index == 0)?NO:YES;
//    self.rightBtn.enabled = (self.index == 4)?NO:YES;
*/
}
 
@end
