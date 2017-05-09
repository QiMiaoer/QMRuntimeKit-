//
//  RuntimeKit.h
//  RuntimeKit
//
//  Created by zyx on 17/4/21.
//  Copyright © 2017年 其妙. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RuntimeKit : NSObject

/// 获取类名
+ (NSString *)getClassName:(Class)cls;

/// 获取成员变量
+ (NSArray *)getIvarList:(Class)cls;

/// 获取成员属性
+ (NSArray *)getPropertyList:(Class)cls;

/// 获取类的实例方法
+ (NSArray *)getMethodList:(Class)cls;

/// 获取协议列表
+ (NSArray *)getProtocolList:(Class)cls;

@end
