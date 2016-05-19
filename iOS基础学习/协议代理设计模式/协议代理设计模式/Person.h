//
//  Person.h
//  协议代理设计模式
//
//  Created by 黄启明 on 16/3/7.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
#import "DogBark.h"

@interface Person : NSObject <DogBark>
{
    Dog *_dog;
}
@property (retain) Dog *dog;

@end

