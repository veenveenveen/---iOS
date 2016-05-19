//
//  main.c
//  读取和写入一个二维数组
//
//  Created by 黄启明 on 16/3/12.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    //定义数组
    int a[3][2] = {1,2,3,4,5,6};
    //定义文件指针，打开文件
    FILE *fp = fopen("arr.txt", "w+");
    //判断是否打开成功
    if (fp != NULL) {
    //开始写入文件
        for (int i = 0; i < 3; i++) {
            fprintf(fp, "%d,%d#",a[i][0],a[i][1]);
        }
        printf("写入成功!\n");
        //读取文件
        rewind(fp);
        int arr[3][2];
        for (int i = 0; i < 3; i++) {
            //格式化读取
            fscanf(fp, "%d,%d#",&arr[i][0],&arr[i][1]);
        }
    //显示出来
        for (int i = 0; i < 3; i++) {
            printf("%d,%d\n",arr[i][0],arr[i][1]);
        }
    }
    //关闭指针
    fclose(fp);
    return 0;
}
