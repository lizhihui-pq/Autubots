//
//  CarTypeParameterController.h
//  MyCar
//
//  Created by lanou3g on 15/6/26.
//  Copyright (c) 2015年 李智慧. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol  CarTypeParameterControllerDelegate <NSObject>

- (void)requestData:(NSString *)str;

@end

@interface CarTypeParameterController : UIViewController
@property(nonatomic,assign)id<CarTypeParameterControllerDelegate>carDelegate;
@end
