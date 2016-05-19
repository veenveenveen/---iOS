//
//  main.c
//  文件操作--保存键盘输入的字符串
//
//  Created by 黄启明 on 16/3/12.
//  Copyright © 2016年 黄启明. All rights reserved.
//
//  键盘输入一行字符，写入一个文件，再把该文件内容读出显示在屏幕上

#include <stdio.h>
#include <string.h>

int main(int argc, const char * argv[])
{
    //定义变量
    char ch;
    //定义文件指针
    //打开文件
    FILE *fp = fopen("inputString.txt", "w+");
    //判断文件是否打开成功
    if (fp != NULL) {
    //如果打开成功，写入文件
    //提示用户输入一个字符串
        printf("请输入要保存的字符串:\n");
    //接收，循环写入到文件中
        ch = getchar();
        int count = 0;
        //判断是否输入了\n,如果输入了\n,输入结束
        while ((ch != '\n')) {
            fputc(ch, fp);//把字符保存到文件中
            ch = getchar();//获取下一个字符
            count++;//计数器
        }
        printf("本次一共输入 %d 个字符\n",count);
        printf("\n");
    //读取显示文件
        rewind(fp);//作用 ：把文件指针重新指向文件开始
        ch = fgetc(fp);
        while (ch != EOF) {
            putchar(ch);//显示ch到控制台
            ch = fgetc(fp);
        }
        printf("\n");
    }
//    fgets(<#char *restrict#>, <#int#>, <#FILE *#>)
//    fputs(<#const char *restrict#>, <#FILE *restrict#>)
    //关闭文件指针
    fclose(fp);
    return 0;
}
