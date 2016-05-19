//
//  main.m
//  MyArray
//
//  Created by 黄启明 on 16/3/6.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
#import "MyArray.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
    
#if 0
        NSMutableArray *array = [[NSMutableArray alloc]init];
        for (int i = 1; i <= 4; i++) {
            Dog *dog = [[Dog alloc]init];//1
            NSLog(@"dog retainCount is %lu",[dog retainCount]);
            dog.ID = i;
            [array addObject:dog];//2
            NSLog(@"dog retainCount is %lu",[dog retainCount]);
            [dog release];//1
        }
        [array release];
#endif
        MyArray *array = [[MyArray alloc]init];
        for (int i = 0; i < 4; i++) {
            Dog *dog = [[Dog alloc]init];
            NSLog(@"dog retainCount is %lu",[dog retainCount]);
            dog.ID = i;
            [array addObject:dog];
            NSLog(@"dog retainCount1 is %lu",[dog retainCount]);
            [dog release];
        }
        [array release];
        
    }
    return 0;
}
