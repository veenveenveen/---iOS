//
//  main.c
//  scanf缓冲区
//
//  Created by 黄启明 on 16/2/28.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{
    char ch1 = 'a';
    char ch2 = 'b';
    printf("请输入一个字符:\n");
    scanf("%c",&ch1);
    rewind(stdin);//这句话执行，就会将缓冲区的数据清空
    printf("请输入第二个字符:\n");
    scanf("%c",&ch2);
    printf("ch1 = %c,ch2 = %c\n",ch1,ch2);

//    int ch1 = 'a';
//    int ch2 = 'b';
//    printf("请输入一个字符:\n");
//    scanf("%d",&ch1);
//    printf("请输入第二个字符:\n");
//    scanf("%d",&ch2);
//    printf("ch1 = %d,ch2 = %d\n",ch1,ch2);

//    printf("请输入一个数据:\n");
//    int a = 0;
//    scanf("%d",&a);
////    printf("a=%d\n",a);
//    printf("请输入第二个数据:\n");
//    int ch = 0;
//    scanf("%d",&ch);
//    printf("a=%d ch=%d\n",a,ch);
//    return 0;
}
