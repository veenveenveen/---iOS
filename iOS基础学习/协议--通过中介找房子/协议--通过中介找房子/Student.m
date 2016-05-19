//
//  Student.m
//  协议--通过中介找房子
//
//  Created by 黄启明 on 16/3/30.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#import "Student.h"

@implementation Student
- (void) needHouse{
    NSLog(@"学生需要一个温暖的家");
    [self.delegate findHouse];
}
@end
