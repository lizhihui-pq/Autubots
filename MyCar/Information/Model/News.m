//
//  News.m
//  MyCar
//
//  Created by lanou3g on 15-6-27.
//  Copyright (c) 2015年 李智慧. All rights reserved.
//

#import "News.h"

@implementation News
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
- (void)setValue:(id)value forKey:(NSString *)key
{
    [super setValue:value forKey:key];
    if ([key isEqualToString:@"id"]) {
        self.Car_id =[value stringValue];
        
    }
}
@end
