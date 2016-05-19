//
//  Dog.h
//  O-C点语法
//
//  Created by 黄启明 on 16/3/6.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dog : NSObject
{
    int age;
}
- (void) setAge:(int)newAge;
- (int) age;
@end
