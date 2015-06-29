//
//  CarType.m
//  MyCar
//
//  Created by lanou3g on 15/6/26.
//  Copyright (c) 2015年 李智慧. All rights reserved.
//

#import "CarType.h"

@implementation CarType

// 找到
- (void)setValue:(id)value forKey:(NSString *)key {
    [super setValue:value forKey:key];
    if ([key isEqualToString:@"brandid"]) {
        self.brandid = [value stringValue];
    }
    
}

// 找不到
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"name:%@, imgurl:%@, brandid:%@, firstletter:%@",_name,_imgurl,_brandid,_firstletter];
}
@end
