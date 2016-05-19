//
//  ViewController.m
//  13-QQ聊天界面布局
//
//  Created by 黄启明 on 16/4/21.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "ViewController.h"
#import "MessageFrame.h"
#import "Message.h"
#import "MessageCell.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>

@property (nonatomic, strong) NSMutableArray *messageFrames;//用来保存所有的消息的frame对象
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *textInput;

@end

@implementation ViewController

- (BOOL)prefersStatusBarHidden{
    return YES;
}

#pragma mark - 懒加载数据

- (NSMutableArray *)messageFrames{
    if (_messageFrames == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"messages.plist" ofType:nil];
        NSArray *tempArr = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *messageArr = [NSMutableArray array];
        for (NSDictionary *dict in tempArr) {
            Message *model = [Message messageWithDict:dict];
            MessageFrame *modelFrame = [[MessageFrame alloc] init];
            //获取上一个数据模型
            Message *lastModel = (Message *)[[messageArr lastObject] message];
            //判断当前模型的消息发送时间是否和上一个模型的一致，如果一致，做个标记
            if ([model.time isEqualToString:lastModel.time]) {
                model.hideTime = YES;
            }
            modelFrame.message = model;
            [messageArr addObject:modelFrame];
        }
        _messageFrames = messageArr;
    }
    return _messageFrames;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //取消分割线
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    //设置背景色
    self.tableView.backgroundColor = [UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1];
    //设置行不允许被选中
    self.tableView.allowsSelection = NO;
    //设置文本框最左侧有一段间距
    UIView *leftVw = [[UIView alloc] init];
    leftVw.frame = CGRectMake(0, 0, 5, 1);
    self.textInput.leftView = leftVw;
    self.textInput.leftViewMode = UITextFieldViewModeAlways;
    //监听键盘的弹出事件
    //1.创建一个NSNotification对象
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(keyBoardWIllChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
}

- (void)keyBoardWIllChangeFrame:(NSNotification *)noteInfo{
    //获取键盘的Y值
    CGRect rectEnd = [noteInfo.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyBoardY = rectEnd.origin.y;
    CGFloat transformValue = keyBoardY - self.view.frame.size.height;
    //让控制器的view执行一次平移（用动画）
    [UIView animateWithDuration:0.25 animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(0, transformValue);
    }];
    //让tableView的最后一行滚动到最上面
    NSIndexPath *lastIndexPath = [NSIndexPath indexPathForRow:self.messageFrames.count - 1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:lastIndexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 数据源方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.messageFrames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //获取模型数据
    MessageFrame *modelFrame = self.messageFrames[indexPath.row];
    //创建单元格
    MessageCell *cell = [MessageCell messageCellWithTableView:tableView];
    //将模型数据赋值给单元格
    cell.messageFame = modelFrame;
    //返回单元格
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    MessageFrame *messageFrame = self.messageFrames[indexPath.row];
    return messageFrame.rowHeight;//返回每一行的行高
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - tableView代理方法

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    //把键盘叫回去，让控制器所管理的UIView结束编辑状态
    [self.view endEditing:YES];
}

#pragma mark - 通过通知监听事件

#pragma mark - UITextFiled代理方法
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    //1.获取用户输入的文本
    NSString *text = textField.text;
    //发送用户的消息
    [self sendMessage:text withType:MessageTypeMe];
    [self sendMessage:text withType:MessageTypeOther];
    //清空文本框
    textField.text = nil;

    return YES;
}
- (void)sendMessage:(NSString *)msg withType:(MessageType)type{
    //2.创建一个数据模型和frame模型
    Message *model = [[Message alloc] init];
    //获取当前系统时间
    NSDate *nowDate = [NSDate date];
    //创建一个时间格式化器
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //设置格式
    formatter.dateFormat = @"今天 HH:mm";
    model.time = [formatter stringFromDate:nowDate];
    model.type = type;
    model.text = msg;
    //创建一个frame模型
    MessageFrame *modelFrame = [[MessageFrame alloc] init];
    modelFrame.message = model;
    //根据当前消息的时间和上一条消息的时间，判断是否隐藏时间
    MessageFrame *lastMessageFrame = [self.messageFrames lastObject];
    NSString *lastTime = lastMessageFrame.message.time;
    if ([model.time isEqualToString:lastTime]) {
        model.hideTime = YES;
    }
    //3.把frame模型加到集合中
    [self.messageFrames addObject:modelFrame];
    //4.刷新UITableview的数据
    [self.tableView reloadData];
    //5.把最后一行滚到上面
    NSIndexPath *lastIndexPath = [NSIndexPath indexPathForRow:self.messageFrames.count - 1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:lastIndexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

@end
