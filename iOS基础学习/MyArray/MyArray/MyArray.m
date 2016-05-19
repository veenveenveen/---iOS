//
//  MyArray.m
//  MyArray
//
//  Created by 黄启明 on 16/3/6.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#import "MyArray.h"

@implementation MyArray
@synthesize count = _count;
- (id) init
{
    self = [super init];
    if (self) {
        _count = 0;
    }
    return self;
}
- (void) addObject:(id)object
{
    if (_count >= 512) {
        return;
    }
    _objs[_count] = [object retain];//这里必须要做[object retain];操作
    _count++;
//    printf("%lu\n",_count);
}
- (id) objectAtIndex:(NSUInteger)index
{
    return _objs[index];
}
- (void) removeObjectAtIndex:(NSUInteger)index
{
    id obj = _objs[index];
    [obj release];
    _objs[index] = nil;
}
- (void) removeAll
{
    for (int i = 0; i < _count; i++) {
        [self removeObjectAtIndex:i];
    }
}
- (void) dealloc
{
    //在数组对象被release到0的时候调用
    NSLog(@"before remove all");
    [self removeAll];
    NSLog(@"after remove all");
    [super dealloc];
}
@end
