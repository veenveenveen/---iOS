//
//  ViewController.m
//  02-按钮的基本操作（图片的移动与缩放）
//
//  Created by 黄启明 on 16/4/6.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (IBAction)bigSmall:(UIButton *)btn;//用于缩放图片的方法
- (IBAction)move:(UIButton *)btn;//代替原来的四个方法，移动
- (IBAction)rotate:(UIButton *)btn;// 用于旋转图片的方法
@property(nonatomic,weak)IBOutlet UIButton *head;//声明属性描述头像

@end


@implementation ViewController
//当用一个方法监听按钮点击的时候，如果传入一个参数，会把点击的按钮当成参数传递
//- (IBAction)up{
//    //不能直接访问对象的 结构体属性的 成员变量
//    //能够访问对象的结构体属性
////    self.head.frame.origin.y -= 10;
//    //1.拿到对象的结构体属性，赋值给临时变量
//    CGRect tempFrame = self.head.frame;
//    //2.修改临时变量的值
//    tempFrame.origin.y -= 10;
//    //3.用临时变量的值覆盖原来的变量
//    self.head.frame = tempFrame;
//}
//用于缩放图片的方法
- (IBAction)bigSmall:(UIButton *)btn{
    CGRect tempBounds = self.head.bounds;
    CGFloat margin = 10;
    switch (btn.tag) {
        case 4:
            tempBounds.size.height += margin;
            tempBounds.size.width += margin;
            break;
        case 5:
            tempBounds.size.height -= margin;
            tempBounds.size.width -= margin;
            break;
    }
    self.head.bounds = tempBounds;
    
}

// 用于移动图片的方法
- (IBAction)move:(UIButton *)btn{
//以下代码执行动画
    [UIView beginAnimations:nil context:nil];    //开始动画
    [UIView setAnimationDuration:0.5];  //设置动画的时间
    CGRect tempFrame = self.head.frame;
    CGFloat margin = 10;
    switch (btn.tag) {
        case 0:
            tempFrame.origin.y -= margin;
            break;
        case 1:
            tempFrame.origin.y += margin;
            break;
        case 2:
            tempFrame.origin.x -= margin;
            break;
        case 3:
            tempFrame.origin.x += margin;
            break;
    }
    self.head.frame = tempFrame;
    [UIView commitAnimations];

}

// 用于旋转图片的方法
- (IBAction)rotate:(UIButton *)btn {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    // 获取图片的transform属性
    CGAffineTransform temtransform=self.head.transform;
    switch (btn.tag) {
        case 6:
//            self.head.transform = CGAffineTransformScale(temtransform, 2, 2);
            self.head.transform=CGAffineTransformRotate(temtransform,M_PI_4 * -1);
            break;
        case 7:
            self.head.transform = CGAffineTransformRotate(temtransform,M_PI_4 * 1);
            break;
    }
    [UIView commitAnimations];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
