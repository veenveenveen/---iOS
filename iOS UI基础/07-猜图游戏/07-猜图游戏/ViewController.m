//
//  ViewController.m
//  07-猜图游戏
//
//  Created by 黄启明 on 16/4/9.
//  Copyright © 2016年 IOS. All rights reserved.
//下一题，大图，动态生成答案按钮，动态生成待选文字按钮，待选按钮单击事件，答案按钮单击事件，判断答案是否正确，答题完毕以后弹出提示对话框,答对加分，提示

#import "ViewController.h"
#import "questionModel.h"

@interface ViewController ()
//所有问题的数据都在这个数组中
@property (nonatomic, strong) NSArray *questionArr;
//控制题目索引
@property (nonatomic, assign) int index;

@property (weak, nonatomic) IBOutlet UIButton *btnScore;
@property (weak, nonatomic) IBOutlet UILabel *labIndex;
@property (weak, nonatomic) IBOutlet UILabel *labTitle;
@property (weak, nonatomic) IBOutlet UIButton *imgIcon;
@property (weak, nonatomic) IBOutlet UIButton *btnNext;
@property (weak, nonatomic) IBOutlet UIView *answerView;
@property (weak, nonatomic) IBOutlet UIView *optionsView;

//下一题单击事件
- (IBAction)btnNextClick;
//图片放大
- (IBAction)bigImg;
//头像按钮点击事件
- (IBAction)imgClick:(id)sender;
//记录头像的原始的frame
@property(nonatomic,assign)CGRect iconFrame;
//为了引用大图中创建的的阴影按钮
@property (nonatomic, weak) UIButton *cover;
//提示按钮单击事件
- (IBAction)btnTipClick;
//帮助按钮单击事件
- (IBAction)btnHelp;

@end

@implementation ViewController
//懒加载
- (NSArray *)questionArr{
    if (_questionArr == nil) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"questions.plist" ofType:nil];
        NSArray *tempArr = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrModel = [NSMutableArray array];
        for (NSDictionary *dict in tempArr) {
            questionModel *queM = [questionModel questionWithDict:dict];
            [arrModel addObject:queM];
        }
        _questionArr = arrModel;
    }
    return _questionArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.index --;
    [self btnNextClick];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//下一题按钮点击事件
- (IBAction)btnNextClick {
    self.index ++;//让索引++
    //判断当前索引是否越界，如果越界，提示用户问题已经答完
    if (self.index == (self.questionArr.count)) {
        //答题完毕以后弹出提示对话框
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"问题已经答完！" preferredStyle:UIAlertControllerStyleAlert];
        //添加取消按钮
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil]];
//        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//            self.index = -1;
//            [self btnNextClick];
//        }]];
        //提示
        [self presentViewController:alert animated:NO completion:nil];
        
        self.index = -1;
        [self btnNextClick];
    }
    questionModel *tempQueMod = self.questionArr[self.index]; //根据索引获取当前的数据模型
    [self changeDate:tempQueMod];//从模型获取数据
    [self setAnswerBtn:tempQueMod];//动态生成答案按钮
    [self setOptionsBtn:tempQueMod];//动态生成待选项按钮
    self.optionsView.userInteractionEnabled = YES;
}
//从模型获取数据的方法
- (void)changeDate:(questionModel *)mod{
    //把模型上的数据设置到界面对应的控件上
    self.labIndex.text = [NSString stringWithFormat:@"%d/%lu",self.index+1,self.questionArr.count];
    self.labTitle.text = mod.title;
    [self.imgIcon setImage:[UIImage imageNamed:mod.icon] forState:UIControlStateNormal];
    //设置到达最后一题以后禁用下一题按钮
    self.btnNext.enabled = (self.index != self.questionArr.count-1);
}
//动态生成答案按钮的方法
- (void)setAnswerBtn:(questionModel *)mod{
    //******动态创建答案按钮，循环创建答案按钮，有几个文字就创建几个按钮******
    //创建按钮之前，先清除之前所有的答案按钮************************
    //    while (self.answerView.subviews.firstObject) {
    //        [self.answerView.subviews.firstObject removeFromSuperview];
    //    }
    [self.answerView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];//让subviews中的每个成员都调用一下removeFromSuperview方法,内部执行了循环，无需我们自己写循环
    NSUInteger len = mod.answer.length;//获取当前答案的文字个数
    CGFloat answerW = 35;
    CGFloat answerH = 35;
    CGFloat margin = 5;
    CGFloat marginLeft = (self.answerView.frame.size.width - answerW * len -margin * (len-1)) * 0.5;
    CGFloat answerY = 0;
    for (int i = 0; i < len ; i++) {
        UIButton *btnAnswer = [[UIButton alloc]init];
        //设置按钮的一些参数
        [btnAnswer setBackgroundImage:[UIImage imageNamed:@"btn_answer"] forState:UIControlStateNormal];
        [btnAnswer setBackgroundImage:[UIImage imageNamed:@"btn_answer_highlighted"] forState:UIControlStateHighlighted];
        [btnAnswer setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        CGFloat answerX = marginLeft + (answerW + margin) * i;
        btnAnswer.frame = CGRectMake(answerX, answerY, answerW, answerH);
        //把按钮加到answerView中
        [self.answerView addSubview:btnAnswer];
        //给答案按钮添加点击事件
        [btnAnswer addTarget:self action:@selector(answerBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}
//动态生成待选项按钮的方法
- (void)setOptionsBtn:(questionModel *)mod{
    //清除按钮操作
    [self.optionsView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    //获取当前待选文字的数组
    NSArray *optionsArr = mod.options;
    //根据待选文字个数循环创建按钮
    NSInteger len = optionsArr.count;
    NSInteger allCol = 7;
    CGFloat optBtnW = 35;
    CGFloat optBtnH = 35;
    CGFloat spaceMar = 10;
    CGFloat leftMar = (self.optionsView.frame.size.width - optBtnW * allCol - spaceMar * (allCol - 1)) * 0.5;
    CGFloat topMar = (self.optionsView.frame.size.height - optBtnH*(len/allCol) - spaceMar*(len/allCol-1)) * 0.5 -50;
    for (int i = 0; i < len; i++) {
        NSUInteger col = i%7;
        NSUInteger row = i/7;
        UIButton *optBtn = [[UIButton alloc]init];
        optBtn.tag = i;//给每个按钮设置一个唯一的tag值
        [optBtn setBackgroundImage:[UIImage imageNamed:@"btn_option"] forState:UIControlStateNormal];
        [optBtn setBackgroundImage:[UIImage imageNamed: @"btn_option_highlighted"] forState:UIControlStateHighlighted];
        [optBtn setTitle:optionsArr[i] forState:UIControlStateNormal];
        CGFloat optBtnX = leftMar + (optBtnW + spaceMar) * col;
        CGFloat optBtnY = topMar + (optBtnH + spaceMar) * row;
        optBtn.frame = CGRectMake(optBtnX, optBtnY, optBtnW, optBtnH);
        [optBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.optionsView addSubview:optBtn];
    //为待选按钮添加单击事件
        [optBtn addTarget:self action:@selector(optBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}
//待选按钮单击事件方法
- (void)optBtnClick:(UIButton *)btn{
    //隐藏当前被点击的按钮
    btn.hidden = YES;
    //将当前被点击的按钮的文字显示到第一个为“空”的答案按钮上
//    NSString *text = [btn titleForState:UIControlStateNormal];//获取指定状态下的文字
    NSString *text = btn.currentTitle;//获取按钮当前状态下的文字
    for (UIButton *answerBtn in self.answerView.subviews) {
        //判断每个答案按钮上的文字是否为nil
        if (answerBtn.currentTitle == nil) {
            [answerBtn setTitle:text forState:UIControlStateNormal];
            //把当前点击的待选按钮的tag值也设置给对应答案按钮
            answerBtn.tag = btn.tag;
            break;
        }
    }
    //判断答案按钮是否已经填满了
    BOOL isFull = YES;
    //声明一个用来保存用户输入的答案的字符串
    NSMutableString *userInput = [NSMutableString string];
    for (UIButton *answerBtn in self.answerView.subviews) {
        if (answerBtn.currentTitle == nil) {
            isFull = NO;
            break;
        }else{
            [userInput appendString:answerBtn.currentTitle];
        }
    }
    if (isFull) {
        //如果答案按钮填满了，禁用待选按钮
        self.optionsView.userInteractionEnabled = NO;
    //判断如果答案按钮被填满了，就判断用户点击输入的答案是否与我们输入的标准答案一致，如果一致，则设置所有答案按钮的文字颜色为蓝色，同时在0.5秒后跳转至下一题，如果不一致（答案错误），则设置答案按钮的文字颜色为红色
        //获取当前题目的正确答案
        questionModel * quesAnswer = self.questionArr[self.index];
        if ([quesAnswer.answer isEqualToString:userInput]) {
            [self setAnswerColor:[UIColor blueColor]];
            //0.5秒自动跳转到下一题
            [self performSelector:@selector(btnNextClick) withObject:nil afterDelay:0.5];
            //加分
            [self addScore:100];
        }else{
            [self setAnswerColor:[UIColor redColor]];
            //减分
            [self addScore:-100];
        }
        
    }
}
//根据答题情况，进行加分和减分
- (void)addScore:(int)score{
    int sco = [self.btnScore.currentTitle intValue] + score;
    [self.btnScore setTitle:[NSString stringWithFormat:@"%d",sco] forState:UIControlStateNormal];
}
//统一设置答案按钮的文字颜色
- (void)setAnswerColor:(UIColor *)color{
    for (UIButton *btn in self.answerView.subviews) {
        [btn setTitleColor:color forState:UIControlStateNormal];
    }
}
//答案按钮点击方法
- (void)answerBtnClick:(UIButton *)btn{
    //设置所有的答案的按钮颜色为黑色
    [self setAnswerColor:[UIColor blackColor]];
    //在待选按钮中找到找到与当前点击的答案按钮相同tag值的按钮，将找到的按钮显示出来
    for (UIButton *optButton in self.optionsView.subviews) {
        if ((btn.tag == optButton.tag)) {
            optButton.hidden = NO;
            self.optionsView.userInteractionEnabled = YES;
            break;
        }
    }
    //清空当前被点击的答案按钮的文字
    [btn setTitle:nil forState:UIControlStateNormal];
}
//头像按钮点击事件
- (IBAction)imgClick:(id)sender {
    if (self.cover == nil) {
        [self bigImg];
    }
    else{
        [self smallImg];
    }
}
//显示大图的方法（大图按钮点击事件）
- (IBAction)bigImg {
    self.iconFrame = self.imgIcon.frame;//保存原来图片按钮的位置
    //创建一个大小和self.view一样大的按钮，把这个按钮作为一个阴影
    UIButton *btnCover = [[UIButton alloc]init];
    btnCover.frame = self.view.bounds;//设置按钮大小
    btnCover.backgroundColor = [UIColor blackColor]; //设置按钮背景色
    btnCover.alpha = 0.0; //设置按钮透明度
    [self.view addSubview:btnCover]; //把按钮加到self.view中
    //为阴影添加一个单击事件,当单击阴影部分，让图片变小
    [btnCover addTarget:self action:@selector(smallImg) forControlEvents:UIControlEventTouchUpInside];
    //把图片设置到阴影的上面
    [self.view bringSubviewToFront:self.imgIcon]; //把所有控件中图片的那个按钮控件放到最上面
    //通过动画把图片变大
    CGFloat bigImgW = self.view.frame.size.width;
    CGFloat bigImgH = bigImgW;
    CGFloat bigImgX = 0;
    CGFloat bigImgY = (self.view.frame.size.height - bigImgH) * 0.5;
    [UIView animateWithDuration:0.5 animations:^{
        btnCover.alpha = 0.6;
        self.imgIcon.frame = CGRectMake(bigImgX, bigImgY, bigImgW, bigImgH);
    }];
    self.cover = btnCover;
}
//显示小图的方法
- (void)smallImg{
    [UIView animateWithDuration:0.5 animations:^{
        self.cover.alpha = 0.0;
        self.imgIcon.frame = self.iconFrame;
    } completion:^(BOOL finished) {
        if (finished) {
            [self.cover removeFromSuperview];//移除
            self.cover = nil;//当图像变成小图以后，再把self.cover设置成nil，保证在小图状态下self.cover为nil，大图状态下为btnCover，用来做一个判断
        }
    }];
}
//提示按钮单击事件方法
- (IBAction)btnTipClick {
    //分数-200
    [self addScore:-200];
    //把所有答案按钮清空（调用每个答案按钮的点击事件）
    for (UIButton *btn in self.answerView.subviews) {
        [self answerBtnClick:btn];
    }
    //根据当前的索引，从数据数组中找到对应的数据模型，从数据模型中找到对应的正确答案的第一个字符，把待选按钮中和正确答案相同的的那个按钮点击一下
    questionModel *quesMod = self.questionArr[self.index];
    NSString *firstStr = [quesMod.answer substringToIndex:1];//截取第一个字符字符串
    for (UIButton *btn in self.optionsView.subviews) {
        if ([btn.currentTitle isEqualToString:firstStr]) {
            [self optBtnClick:btn];
            break;
        }
    }
}
//帮助按钮单击事件方法
- (IBAction)btnHelp {
    
}
@end
