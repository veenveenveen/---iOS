//
//  Dog.h
//  协议代理设计模式
//
//  Created by 黄启明 on 16/3/7.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DogBark.h"

@interface Dog : NSObject
{
    NSTimer *_timer;
    int barkCount;
    int _ID;
    id <DogBark> delegate;//owner 狗的主人
}
@property int ID;
@property (retain) NSTimer *timer;
@property (assign) id <DogBark> delegate;
@end


