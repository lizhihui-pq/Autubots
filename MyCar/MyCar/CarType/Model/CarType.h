//
//  CarType.h
//  MyCar
//
//  Created by lanou3g on 15/6/26.
//  Copyright (c) 2015年 李智慧. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CarType : NSObject
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *imgurl;
@property(nonatomic,copy)NSString *brandid;
@property(nonatomic,copy)NSString *firstletter;

-(NSString *)description;

@end
