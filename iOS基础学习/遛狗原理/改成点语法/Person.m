//
//  Person.m
//  遛狗原理
//
//  Created by 黄启明 on 16/3/6.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#import "Person.h"

@implementation Person
@synthesize dog = _dog;
//- (void) setDog:(Dog *)aDog
//{
//    if (_dog != aDog) {
//        [_dog release];
//        _dog = [aDog retain];
//        // [_dog retain];//让_dog计数器 +1
//    }
//}
//- (Dog *) dog
//{
//    return _dog;
//}
- (void) dealloc
{
    NSLog(@"person is dealloc.");
//    [_dog release];//注意,把人拥有的dog  release
    self.dog = nil;//注意！！！若要用retain关键字 此处要release
    [super dealloc];
}
@end
