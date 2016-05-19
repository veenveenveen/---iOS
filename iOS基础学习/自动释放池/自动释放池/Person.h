//
//  Person.h
//  自动释放池
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
@property (retain) Dog *dog;
@end
