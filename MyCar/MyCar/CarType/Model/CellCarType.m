//
//  CellCarType.m
//  MyCar
//
//  Created by lanou3g on 15/6/29.
//  Copyright (c) 2015年 李智慧. All rights reserved.
//

#import "CellCarType.h"

@implementation CellCarType
// 找到
- (void)setValue:(id)value forKey:(NSString *)key {
    [super setValue:value forKey:key];
    if ([key isEqualToString:@"id"]) {
        self.cellCarId = [value stringValue];
    }
    if ([key isEqualToString:@"price"]) {
        self.price = [NSString stringWithFormat:@"%@万",value];
    }
    
}

// 找不到
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}
@end
