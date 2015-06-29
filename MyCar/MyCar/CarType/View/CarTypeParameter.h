//
//  CarTypeParameter.h
//  MyCar
//
//  Created by lanou3g on 15/6/26.
//  Copyright (c) 2015年 李智慧. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SellCarTypeTableView.h"
#import "StopSellCarTypeTableView.h"

@interface CarTypeParameter : UIView
@property(nonatomic,retain)SellCarTypeTableView *sellCarTypeTV;
@property(nonatomic,retain)StopSellCarTypeTableView *stopSellCarTypeTV;
@end
