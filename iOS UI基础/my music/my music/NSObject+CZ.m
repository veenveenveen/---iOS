//
//  NSObject+CZ.m
//  02-字典转模型
//
//  Created by 刘超 on 15/8/26.
//  Copyright (c) 2015年 itcast.cn. All rights reserved.
//

#import "NSObject+CZ.h"
#import <objc/runtime.h>


@implementation NSObject (CZ)

//+ (void)load
//{
//    //获取两个方法，并进行交换
//   Method  m1 = class_getInstanceMethod(self, @selector(setValuesForKeysWithDictionary:));
//        Method  m2 = class_getInstanceMethod(self, @selector(dictChangeModelWithDict:));
//    method_exchangeImplementations(m1, m2);
//}


//传入一个字典
- (void)dictChangeModelWithDict:(NSDictionary *)dict
{
    
//    NSLog(@"%@",self);
//    
//    if ( [self  isKindOfClass:[NSDictionary  class]]) {
//        return;
//    }
    
    //获取这个对象的类名
    Class class = [self class];
    
    
    unsigned int  outCount = 0;
    
    Ivar *ivars =  class_copyIvarList(class, &outCount);
    
    for (int i = 0; i < outCount; i ++) {
        
        Ivar ivar  = ivars[i];
        //获取模型的每一个属性，是带有_的属性
        NSString *key = [NSString  stringWithUTF8String:ivar_getName(ivar)];
        //截取字符串
        key = [key  substringFromIndex:1];
        
        if (dict[key] == nil) {
            continue;
        }
        
        //特别提示
        //与上份代码不一样的地方
        
        NSString  *type = [NSString  stringWithUTF8String:ivar_getTypeEncoding(ivar)];
        id value = dict[key];
        //判断属性的类型  带“@” 表示为是OC类型，不带“@” 则为基本数据类型
        if ([type hasPrefix:@"@"]) {
            //截取字符串  @“Dog” @"NSString"
            //截取中间部分
            type = [type  substringWithRange:NSMakeRange(2, type.length - 3)];
    
            
            //判断是否以 NS 开头  不是的为自定义类，最想拿到的模型
            if (![type hasPrefix:@"NS"] ) {
                //根据字符串得到类
                Class class = NSClassFromString(type);
                
             
                //创建对象
                NSObject *obj = [[class alloc]init];
                //再次调用这个方法  把value值传入  obj为新的对象
                //交换方法的时候，这个地方必须得改
                [obj  dictChangeModelWithDict:value ];
                //把value 值换为一个对象
                value = obj;
            }
        }
        
        //根据key去字典里面找对应的value
        [self setValue:value forKey:key];
        
    }
    
    
}



//用模型的类去调用，传入plist文件的名字  返回盛放模型的数组
+ (NSArray *)objcWithFileName:(NSString *)name
{
    
    
    NSString *path = [[NSBundle mainBundle]pathForResource:name ofType:nil];
    
    NSArray *temp  = [NSArray  arrayWithContentsOfFile:path];
    
    NSMutableArray  *dataArr  = [NSMutableArray  arrayWithCapacity:temp.count];
    for (int i = 0; i < temp.count; i++) {
        
        NSDictionary *dict  = temp[i];
        
        NSObject *objc  = [[self alloc]init];
    
        
        [objc  dictChangeModelWithDict:dict];
        
        [dataArr addObject:objc];
        
    }
    
    return dataArr;
}


@end
