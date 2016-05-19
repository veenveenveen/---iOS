//
//  MyArray.h
//  MyArray
//
//  Created by 黄启明 on 16/3/6.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyArray : NSObject
{
    NSUInteger _count;//数组当前一共有几项元素
    id _objs[512];//创建一个512项的数组， 4×512
}
@property (assign,readonly) NSUInteger count;
- (void) addObject:(id)object;//往MyArray中增加一项元素
- (id) objectAtIndex:(NSUInteger)index;//取得第index项元素
- (void) removeObjectAtIndex:(NSUInteger)index;//删除第index项元素
- (void) removeAll;//删除所有元素

@end
