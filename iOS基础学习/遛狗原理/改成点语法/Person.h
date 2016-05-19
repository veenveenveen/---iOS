//
//  Person.h
//  遛狗原理
//
//  Created by 黄启明 on 16/3/6.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
@interface Person : NSObject
{
    Dog *_dog;
}
//- (void) setDog:(Dog *)aDog;
//- (Dog *) dog;
@property(retain) Dog *dog;
@end
