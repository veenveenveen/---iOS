//
//  main.c
//  字符串排序
//
//  Created by 黄启明 on 16/3/9.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#include <stdio.h>
#include <string.h>

void sortString(char *arr[],int len)
{
    //冒泡排序
    for (int i = 0; i < len-1; i++) {
        for (int j = 0; j < len-i-1; j++) {
            //比较字符串大小
            if (strcmp(arr[j],arr[j+1]) > 0){
                char *temp = arr[j];
                arr[j] = arr[j+1];
                arr[j+1] = temp;
            }
        }
    }
}
int main(int argc, const char * argv[])
{
    //输入5个国名，并按字母排序后输出
    char *name[] = {"CHINA","AMERICA","AUSTRALIA","FRANCE","GERMAN"};
    sortString(name, 5);
    for (int i = 0; i < 5; i++) {
        printf("%s\n",name[i]);

    }
    return 0;
}
