//
//  main.m
//  OC--基础语法
//
//  Created by 黄启明 on 16/3/14.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    @public
    int _age;
    float _weight;
}
- (void) eat;
- (void) walk:(int) step;
@end


@implementation Person

- (void) eat{
    _weight += 0.6f;
    NSLog(@"体重：%.2f", _weight);
}
- (void) walk:(int) step{
    _weight -= step/100*0.2f;
    NSLog(@"体重：%.2f", _weight);
}

@end
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *per = [Person new];
        per->_weight = 100.0f;
        [per eat];
        [per walk:120];

    }
    return 0;
}
