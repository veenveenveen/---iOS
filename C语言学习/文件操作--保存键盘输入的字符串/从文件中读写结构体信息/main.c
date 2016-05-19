//
//  main.c
//  从文件中读写结构体信息
//
//  Created by 黄启明 on 16/3/12.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#include <stdio.h>

//学生的结构体
struct Student{
    char name[21];
    int age;
    float score;
};

int main(int argc, const char * argv[]) {
    //定义一个结构体数组
    struct Student stu[3] = {
        {"qwer",26,56.88f},
        {"sad",34,67.46f},
        {"rer",23,100.00f}
    };
    //把学生信息写入文件中
    FILE *fp = fopen("student.txt", "wb+");
    if (fp != NULL) {
        for (int i = 0; i < 3; i++) {
            fwrite(&stu[i], sizeof(struct Student), 1, fp);
        }
        printf("写入成功\n");
    }
    printf("\n");
    //从文件中循环读取
    rewind(fp);
    struct Student stu2[3];
    for (int i = 0; i < 3; i++) {
        fread(&stu2[i], sizeof(struct Student), 1, fp);
        printf("%s,%d,%.2f\n",stu2[i].name,stu2[i].age,stu2[i].score);
    }
    
    return 0;
}
