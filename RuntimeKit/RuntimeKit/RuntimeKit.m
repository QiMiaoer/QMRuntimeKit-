//
//  RuntimeKit.m
//  RuntimeKit
//
//  Created by zyx on 17/4/21.
//  Copyright © 2017年 其妙. All rights reserved.
//

#import "RuntimeKit.h"
#import <objc/runtime.h>

@implementation RuntimeKit

+ (NSString *)getClassName:(Class)cls {
    const char *clsName = class_getName(cls);
    return [NSString stringWithUTF8String:clsName];
}

+ (NSArray *)getIvarList:(Class)cls {
    unsigned int count = 0;
    Ivar *ivarList = class_copyIvarList(cls, &count);
    NSMutableArray *listArray = [NSMutableArray arrayWithCapacity:count];
    for (unsigned int i = 0; i < count; i++) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:2];
        const char *ivarName = ivar_getName(ivarList[i]);
        const char *ivarType = ivar_getTypeEncoding(ivarList[i]);
        dic[@"ivarName"] = [NSString stringWithUTF8String:ivarName];
        dic[@"ivarType"] = [NSString stringWithUTF8String:ivarType];
        [listArray addObject:dic];
    }
    free(ivarList);
    
    return listArray;
}

+ (NSArray *)getPropertyList:(Class)cls {
    unsigned int count = 0;
    objc_property_t *propertyList = class_copyPropertyList(cls, &count);
    NSMutableArray *listArray = [NSMutableArray arrayWithCapacity:count];
    for (unsigned int i = 0; i < count; i++) {
        const char *propertyName = property_getName(propertyList[i]);
        [listArray addObject:[NSString stringWithUTF8String:propertyName]];
    }
    free(propertyList);
    
    return listArray;
}

+ (NSArray *)getMethodList:(Class)cls {
    unsigned int count = 0;
    Method *methodList = class_copyMethodList(cls, &count);
    NSMutableArray *listArray = [NSMutableArray arrayWithCapacity:count];
    for (unsigned int i = 0; i < count; i++) {
        Method method = methodList[i];
        SEL methodName = method_getName(method);
        [listArray addObject:NSStringFromSelector(methodName)];
    }
    free(methodList);
    
    return listArray;
}

+ (NSArray *)getProtocolList:(Class)cls {
    unsigned int count = 0;
    __unsafe_unretained Protocol **protocolList = class_copyProtocolList(cls, &count);
    NSMutableArray *listArray = [NSMutableArray arrayWithCapacity:count];
    for (unsigned int i = 0; i < count; i++) {
        Protocol *protocol = protocolList[i];
        const char *protocolName = protocol_getName(protocol);
        [listArray addObject:[NSString stringWithUTF8String:protocolName]];
    }
    return listArray;
}

@end
