//
//  AppView.m
//  06-应用管理
//
//  Created by 黄启明 on 16/4/9.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "AppView.h"
#import "AppModel.h"
@interface AppView()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *lab;
- (IBAction)btn:(UIButton *)btn;

@end

@implementation AppView
+ (instancetype)loadView{
   return [[[NSBundle mainBundle]loadNibNamed:@"appView" owner:nil options:nil]lastObject];//将来需求改变，方便修改，代码扩展性好
    
}
//重写模型的set方法
- (void)setAppModel:(AppModel *)appModel{
    _appModel = appModel;//固定写法，如果不写，会影响get方法
    self.imgView.image = [UIImage imageNamed:appModel.icon];
    self.lab.text = appModel.name;
}

- (IBAction)btn:(UIButton *)btn {
    //1.让btn不能点击
    btn.enabled = NO;
    //2.创建一个用来显示信息的label
    UILabel *messageLabel = [[UILabel alloc]init];
    CGFloat superViewW = self.superview.frame.size.width;
    CGFloat superViewH = self.superview.frame.size.height;
    CGFloat messageLabelW = 180;
    CGFloat messageLabelX = (superViewW - messageLabelW) * 0.5;
    CGFloat messageLabelH = 40;
    CGFloat messageLabelY = (superViewH - messageLabelH) * 0.5;
    messageLabel.frame = CGRectMake(messageLabelX, messageLabelY, messageLabelW, messageLabelH);
    [self.superview addSubview:messageLabel];
    messageLabel.backgroundColor = [UIColor blackColor];//设置背景颜色
    messageLabel.alpha = 0.0;//设置透明度
    messageLabel.text = @"正在下载";//设置文字
    [messageLabel setTextColor:[UIColor redColor]];//设置文字颜色
    messageLabel.textAlignment = NSTextAlignmentCenter;//设置文字居中
    //设置圆角
    messageLabel.layer.cornerRadius = 10; //设置圆角半径
    messageLabel.layer.masksToBounds = YES; //将多余部分切掉
    //设置动画
    //animateWithDuration:动画执行的时间，animations：执行动画的代码，completion：动画完成之后要做的事情
    [UIView animateWithDuration:3.0 animations:^{
        messageLabel.alpha = 0.6;
    } completion:^(BOOL finished) {
        if (finished) {
            //delay:动画延迟多长时间后执行
            [UIView animateWithDuration:2.0 delay:0.5 options:UIViewAnimationOptionCurveLinear animations:^{
                messageLabel.alpha = 0.0;
//                [self performSelector:@selector(after) withObject:nil afterDelay:5.0];
                [btn setTitle:@"已下载" forState:UIControlStateNormal];
            } completion:^(BOOL finished) {
                if (finished) {
                    //为了性能，执行完动画中，从父控件中删除
                    [messageLabel removeFromSuperview];
                }
            }];
        }
    }];
}
//- (void)after{
//    self.btnLab.text = @"已下载";
//}
@end
