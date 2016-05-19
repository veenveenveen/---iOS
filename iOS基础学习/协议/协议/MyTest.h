//
//  MyTest.h
//  协议
//
//  Created by 黄启明 on 16/3/7.
//  Copyright © 2016年 黄启明. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyProtocol.h"

@interface MyTest : NSObject <MyProtocol>

- (void) showInfo;

@end
