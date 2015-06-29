//
//  SellCarTypeTableView.h
//  MyCar
//
//  Created by lanou3g on 15/6/27.
//  Copyright (c) 2015年 李智慧. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CarTypeParameterController.h"
@interface SellCarTypeTableView : UITableView<CarTypeParameterControllerDelegate>
@property(nonatomic,copy)NSString *sellCarStr;
@end
