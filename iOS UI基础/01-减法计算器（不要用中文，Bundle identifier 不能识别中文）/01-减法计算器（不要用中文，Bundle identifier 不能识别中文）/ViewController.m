//**********************************************************************//
//  ViewController.m
//  01-减法计算器（不要用中文，Bundle identifier 不能识别中文）
//
//  Created by 黄启明 on 16/4/6.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//用来监听按钮点击
- (IBAction)count;
//第一个文本输入框，凡事UI控件都用weak修饰
@property(nonatomic,weak)IBOutlet UITextField *textField1;
@property(nonatomic,weak)IBOutlet UITextField *textField2;
@property(nonatomic,weak)IBOutlet UILabel *differenceLable;
@end

@implementation ViewController

- (IBAction)count{
//    NSLog(@"你好");
//    1.拿到两个文本输入框的值
    NSString *text1 = self.textField1.text;
    NSString *text2 = self.textField2.text;
//    2.相减
    int num1 = [text1 intValue];
    int num2 = [text2 intValue];
    int difference = 0;
    if (num1 > num2 || num1 == num2) {
        difference = num1 - num2;
    }else{
    
        //2.1创建弹框UIAlertView（iOS7 不推荐）
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"输入的数值不合理" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
        //2.2显示
//        [alert show];
        //2.3将difference显示到右边
     
        //2.1 iOS8 后的弹窗创建（推荐）
        UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"提示" message:@"输入的数值不合理" preferredStyle:UIAlertControllerStyleAlert];
        //2.2 iOS8 添加取消按钮
        [alertC addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
        //2.3 iOS8 显示
        [self presentViewController:alertC animated:NO completion:nil];
    }
//    3.相减的值显示到右边
    self.differenceLable.text = [NSString stringWithFormat:@"%d",difference];
//    4.退出键盘
    //第一响应者：能够叫出键盘的控件叫做第一响应者（可以切换的）
    //4.1释放第一响应者(方式一)
//    [self.textField1 resignFirstResponder];
//    [self.textField2 resignFirstResponder];
    //4.2结束可能成为第一响应者的父控件编辑状态
    [self.view endEditing:YES];
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


