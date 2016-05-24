//
//  ViewController.m
//  socket网络编程
//
//  Created by 黄启明 on 16/5/24.
//  Copyright © 2016年 huateng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <NSStreamDelegate,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
{
    NSInputStream *_inputStrem;//对应输入流
    NSOutputStream *_outputStrem;//对应输出流
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@property (nonatomic, strong) NSMutableArray *chatMsgs;//聊天数组消息


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

#pragma mark - 懒加载这个消息数组
- (NSMutableArray *)chatMsgs{
    if (!_chatMsgs) {
        _chatMsgs = [NSMutableArray array];
    }
    return _chatMsgs;
}

#pragma mark - 实现输入输出流的监听
- (void)stream:(NSStream *)aStream handleEvent:(NSStreamEvent)eventCode{
    NSLog(@"%@",[NSThread currentThread]);
//    NSStreamEventNone = 0,
//    NSStreamEventOpenCompleted = 1UL << 0,//输入输出流打开完成
//    NSStreamEventHasBytesAvailable = 1UL << 1,//有字节可读
//    NSStreamEventHasSpaceAvailable = 1UL << 2,//可以发放字节
//    NSStreamEventErrorOccurred = 1UL << 3,//连接出现错误
//    NSStreamEventEndEncountered = 1UL << 4,//连接结束
    switch (eventCode) {
        case NSStreamEventOpenCompleted:
            NSLog(@"输入输出流打开完成");
            break;
            
        case NSStreamEventHasBytesAvailable:
            NSLog(@"有字节可读");
            break;
            
        case NSStreamEventHasSpaceAvailable:
            NSLog(@"可以发放字节");
            break;
            
        case NSStreamEventErrorOccurred:
            NSLog(@"连接出现错误");
            break;
            
        case NSStreamEventEndEncountered:
            NSLog(@"连接结束");
            
            //关闭输入输出流
            [_inputStrem close];
            [_outputStrem close];
            
            //从主运行循环移除
            [_inputStrem removeFromRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
            [_outputStrem removeFromRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
            
            break;
            
        default:
            break;
    }
}

#pragma mark - 链接服务器


#pragma mark - tableview数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell =[[UITableViewCell alloc] init];
    return cell;
}
@end
