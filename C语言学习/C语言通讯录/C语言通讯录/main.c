//
//  main.c
//  C语言通讯录
//
//  Created by 黄启明 on 16/3/12.
//  Copyright © 2016年 黄启明. All rights reserved.
//
/*
    1.引入头文件
    2.进行必要的宏定义
    3.定义文件名称变量，联系人数组，联系人结构体
    4.定义函数，并进行函数声明
    5.编写循环控制程序
    6.显示操作界面
    7.根据编号执行不同的函数
 */

//    1.引入头文件
//    2.进行必要的宏定义
#include <stdio.h>
#include <string.h>
#define  N 100      //定义通讯录容量
#define NAMELEN 21  //定义名字长度
#define NUMLEN 12   //定义号码长度
//*********定义部分**********//
//定义联系人结构体
typedef struct {
    //联系人
    char name[NAMELEN];
    //联系人号码
    char telNum[NUMLEN];
}Person;
//存储所有联系人的数组
Person contacts[N];
//定义联系人的个数
int totalContactCount = 0;
//接收用户输入的编号
int fno;
//定义数据文件保存的位置
char *filePath = "telbook.data";

//*********函数声明部分**********//
int validateInput(int num,int min,int max);
void doAdd();
void doDelete();
void doUpdate();
void doList();
void doSearchByName();
void init();
void writeFile();


int main(int argc, const char * argv[])
{
//    3.定义文件名称变量，联系人数组，联系人结构体
//    4.定义函数，并进行函数声明
//    5.编写循环控制程序
    //通讯录初始化
    init();
    printf("通讯录初始化完成！\n\n");
    //显示软件的界面
    printf("**************************\n");
    printf("****** 欢迎使用通讯录 ******\n");
    printf("****** 1.添加联系人 *******\n");
    printf("****** 2.删除联系人 *******\n");
    printf("****** 3.修改联系人 *******\n");
    printf("****** 4.查看所有联系人 ****\n");
    printf("****** 5.搜索联系人 *******\n");
    printf("****** 6.退出系统   *******\n");
    printf("**************************\n\n");

    while (1) {
        printf("请选择功能:输入编号1~6\n");
//        scanf("%d",&fno);
        //判断编号是否合法，写函数
        while (1) {
            scanf("%d",&fno);
            if (validateInput(fno, 1, 6)) {
                break;
            }
            else{
                printf("非法输入！请重新输入！\n");
            }
        }
        
        switch (fno) {
            case 1:
                //添加联系人
                doAdd();
                break;
            case 2:
                //删除联系人
                doDelete();
                break;
            case 3:
                //修改联系人
                doUpdate();
                break;
            case 4:
                //查看所有联系人
                doList();
                break;
            case 5:
                //查找联系人
                doSearchByName();
                break;
            case 6:
                //退出系统
                printf("系统正在退出...\n");
                printf("系统已经退出！\n");
                return 0;
                break;
                
            default:
                break;
        }
        
    }
    
//    6.显示操作界面
//    7.根据编号执行不同的函数
    return 0;
}

/**
 *  验证输入是否合法
 *
 *  @param num 待验证的数
 *  @param min 最小值
 *  @param max 最大值
 *
 *  @return 1非法，0合法
 */
int validateInput(int num,int min,int max)
{
    if (num < min ||num > max) {
//        printf("非法输入！请重新输入！\n");
//        printf("系统正在退出...\n");
//        printf("系统已经退出！\n");
        return 0;
    }
    return 1;
}

/**
 *  添加联系人
 */
void doAdd()
{
    printf("您选择的是添加联系人，请按提示操作:\n");
    printf("请输入联系人姓名:(*联系人姓名中间不能有空格)\n");
    scanf("%s",contacts[totalContactCount].name);
    printf("请输入联系人电话:(*联系人电话中间不能有空格)\n");
    scanf("%s",contacts[totalContactCount].telNum);
    int flag;
    printf("确定要添加该联系人吗？1.确认 0.取消\n");
    scanf("%d",&flag);
    if (flag == 1) {
        totalContactCount++;//联系人个数加1
        writeFile();//使用函数
        
    }
}

/**
 *  删除联系人
 */
void doDelete()
{
    doList();
    printf("您选择的是删除联系人，请按提示操作:\n");
    printf("请输入要删除的联系人的编号:\n");//提示用户输入要删除的联系人编号
    int no1;
    //判断编号是否合法，编号不能大于联系人个数
    while (1) {
        scanf("%d",&no1);
        if (validateInput(no1, 1, totalContactCount)) {
            int flag;
            printf("删除联系人后,数据将无法恢复，您确定要删除吗？1.确定 0.取消\n");
            scanf("%d",&flag);
            if (flag == 1) {
                //判断编号是不是最后一个元素
                if (no1 != totalContactCount) {
                    for (int i = no1; i < totalContactCount; i++) {
                        //元素的移动和覆盖
                        contacts[i-1] = contacts[i];
                    }
                }
                totalContactCount--;
                writeFile();
                break;
            }
            else{
                printf("请再次输入要删除的联系人编号:\n");
            }
        }
        else{
            printf("不存在该编号，请重新输入！\n");
        }
    }
}

/**
 *  修改联系人
 */
void doUpdate()
{
    doList();
    printf("您选择的是修改联系人，请按提示操作:\n");
    //提示用户输入要修改的用户编号
    printf("请输入要修改的联系人的编号:\n");
    int no1;
    //判断编号是否合法，编号不能大于联系人个数
    while (1) {
        scanf("%d",&no1);
        if (validateInput(no1, 1, totalContactCount)) {
            char name1[NAMELEN];
            printf("请输入新的联系人姓名:(*联系人姓名中间不能有空格)\n");
            scanf("%s",name1);
            char telNum1[NUMLEN];
            printf("请输入新的联系人电话:(*联系人电话中间不能有空格)\n");
            scanf("%s",telNum1);
            //让用户再次确认修改
            int flag;
            printf("修改联系人后,数据发生改变，您确定要修改吗？1.确定 0.取消\n");
            scanf("%d",&flag);
            if (flag == 1) {
                strcpy(contacts[no1-1].name, name1);
                strcpy(contacts[no1-1].telNum, telNum1);
                writeFile();//更新文件
                break;
            }
            else{
                printf("请再次输入要修改的联系人编号:\n");
            }
        }
        else{
            printf("不存在该编号，请重新输入！\n");
        }
    }
}

/**
 *  显示所有联系人
    思路：
    前提：系统已经完成了初始化工作（如果文件存在，则读取文件中的所有的数据）
    首先：1.做一个判断，
         totalContactCount = 0;//表示没有联系人
        2.若果不等于0，开始遍历，并且输出联系人信息
 */
void doList()
{
    printf("联系人信息如下:\n");
    if (totalContactCount ==0) {
        printf("您的通讯录还没有小伙伴，请添加联系人！\n");
    }
    else{
        printf("编号\t 姓名\t 电话\t \n");
        for (int i = 0; i < totalContactCount; i++) {
            printf("%d\t %s\t %s\t \n",i+1,contacts[i].name,contacts[i].telNum);
        }
    }
}

/**
 *  查找联系人
 */
void doSearchByName()
{
    printf("您选择的是查找联系人，请按提示操作:\n");
    //提示用户输入要查找的人的姓名
    printf("请输入要查找的人的姓名:\n");
    char name2[NAMELEN];
    scanf("%s",name2);
    int i;
    for (i = 0; i < totalContactCount; i++) {
        if (strcmp(name2, contacts[i].name) == 0) {
            printf("您所查找的联系人信息如下:\n");
            printf("姓名%s\t 电话%s\t \n",name2,contacts[i].name);
        }
    }
    if (i == totalContactCount) {
        printf("对不起，查无此人！\n");
    }
}

/**
 通讯录的初始化
 1.尝试读取数据文件
 2.如果读取成功，说明文件存在
    如果存在，读取联系人数据，保存到联系人数组中
 3.如果读取失败，说明我们是第一次使用通讯录
    如果是第一次使用
    1）创建联系人数据文件
    2）把当前联系人的个数写入到文件中
 - returns:
 */
void init()
{
    FILE * fp = fopen(filePath, "r");
    if (fp != NULL) {
        //第一步，读取联系人个数
        fread(&totalContactCount, sizeof(totalContactCount), 1, fp);
        //第二步，读取每一个联系人
        for (int i = 0; i < totalContactCount; i++) {
            //读取联系人数据到联系人数组中
            fread(&contacts[i], sizeof(Person), 1, fp);
        }
    }
    else{
        //第一步，创建文件
        fp = fopen(filePath, "wb");
        //第二步，写入联系人个数
        fwrite(&totalContactCount, sizeof(totalContactCount), 1, fp);
        printf("通讯录文件创建成功~\n");
    }
    fclose(fp);
}

/**
 *  写入联系人
 */
void writeFile()
{
    FILE *fp = fopen(filePath, "wb");
    if (fp != NULL) {
        //先写入联系人个数
        fwrite(&totalContactCount, sizeof(totalContactCount), 1, fp);
        //写每个联系人数据
        for (int i =0; i < totalContactCount; i++) {
            fwrite(&contacts[i], sizeof(Person), 1, fp);
        }
        printf("数据更新成功！\n");
    }
    fclose(fp);
}

