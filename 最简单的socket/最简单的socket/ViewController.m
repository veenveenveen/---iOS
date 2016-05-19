//
//  ViewController.m
//  最简单的socket
//
//  Created by 黄启明 on 16/5/14.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "ViewController.h"
#import <sys/socket.h>
#import <netinet/in.h>
#import <arpa/inet.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesBegan");
    //socket 代码
    //1.创建客户端 socket
    
    //2.创建服务器 socket
    
    //3.连接两个 socket
    
    //4.客户端socket发送信息给服务器（发送请求的过程）
    
    //5.服务器相应客户端的请求，返回给客户端数据
    
    //6.接受服务器返回的数据
    
    //7.关闭socket
    
    
    //1.创建客户端socket
    //参数1:协议域:遵守的IP协议类型 AF_INET:IPv4
    //参数2:端口类型 ：TCP:SOCK_STREAM  UDP:SOCK_DGRAM
    //参数3:选择的协议类型！一般传0，会根据第二个参数自动选择协议类型
    //如果返回值大于0，表示socket创建成功
    int socketNumber = socket(AF_INET, SOCK_STREAM, 0);
    NSLog(@"%d",socketNumber);
    
    //2.创建服务器端 socket
    struct sockaddr_in serverAddress;
    
    //主机/端口
    //设置服务器socket 遵循的协议类型为 IPv4
    serverAddress.sin_family = AF_INET;
    //服务器 socket 的 IP 地址
    serverAddress.sin_addr.s_addr = inet_addr("172.20.10.5");
    //设置服务器 socket 的端口号，目前端口号是12345
    //端口号的最大值 65535；00～1024是系统默认占用的端口号 不要设置
    //如果需要手动设置端口号：一般1024～65535
    serverAddress.sin_port = htons(12345);
    
    
    //3.连接两个 socket
    //参数1:客户端socket
    //参数2:服务器端socket/结构体
    //参数3:第二个参数的长度
    //如果返回值为0，表示连接成功,如果不为0，连接失败
    //如果想要连接成功，必须实时监测服务器端的端口号
    //监测服务器端端口：nc -lk 12345
    int conn = connect(socketNumber, (const struct sockaddr *)&serverAddress, sizeof(serverAddress));
    NSLog(@"%d",conn);
    
    
    //4.发送信息给服务器
    //参数1:客户端 socket
    //参数2:void * 传递给服务器的数据  msg.UTF8String:直接将OC数据转换成C语言的数据
    //参数3:size_t 传递给服务器数据的长度
    //参数4:传0，等待服务器响应数据
    NSString *msg = @"hello socket";
    send(socketNumber, msg.UTF8String, strlen(msg.UTF8String), 0);
    
    
    //5.服务器相应客户端的请求，返回给客户端数据
    
    //6.接受服务器返回的数据
    //参数1:客户端 socket：服务器确定返回给哪一个客户端socket
    //参数2:void *：接受服务器返回数据的地址
    //参数3:size_t：接受地址的长度
    //参数4:传0，等待服务器返回数据
    //返回值：服务器返回的数据长度
    ssize_t buffer[1024];
    ssize_t length = recv(socketNumber, buffer, sizeof(buffer), 0);
    //获得服务器返回的数据（从 buffer 中取出需要的数据）
    //根据二进制数据拼接字符串
    NSString *returnMsg = [[NSString alloc] initWithBytes:buffer length:length encoding:NSUTF8StringEncoding];
    NSLog(@"returnMsg:@%@",returnMsg);
    
    //7.关闭socket
    //一个请求结束之后（接受响应之后），需要手动关闭socket
    close(socketNumber);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
