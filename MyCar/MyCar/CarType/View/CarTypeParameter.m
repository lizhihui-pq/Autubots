//
//  CarTypeParameter.m
//  MyCar
//
//  Created by lanou3g on 15/6/26.
//  Copyright (c) 2015年 李智慧. All rights reserved.
//

#import "CarTypeParameter.h"




@class CarTypeParameterController;
@interface CarTypeParameter ()

@end

@implementation CarTypeParameter

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:@[@"在售车辆",@"停售车辆"]];
        
        [segment addTarget:self action:@selector(segementAction:) forControlEvents:UIControlEventValueChanged];
        segment.frame = CGRectMake(50, 50, 200, 35);
        segment.center = CGPointMake(375-(375+80)/2, 40);
        // 设置选中分段 即首次显示的分段
        segment.selectedSegmentIndex = 0;
        [self addSubview:segment];
        // 布局在售和停售界面
        [self layoutViews];
        
    }
    return self;
}



// 布局在售和停售界面
- (void)layoutViews {
    self.sellCarTypeTV = [[SellCarTypeTableView alloc] initWithFrame:CGRectMake(5, 70, (375-80-10), 667-64-49-70) style:UITableViewStylePlain];
    [self addSubview:_sellCarTypeTV];
    
    self.stopSellCarTypeTV = [[StopSellCarTypeTableView alloc] initWithFrame:CGRectMake(5, 70, (375-80-10), 667-64-49-70) style:UITableViewStylePlain];
    [self addSubview:_stopSellCarTypeTV];
    
    [self bringSubviewToFront:_sellCarTypeTV];
}

// segemented的点击事件
- (void)segementAction:(UISegmentedControl *)segemented {
    if (segemented.selectedSegmentIndex == 0) {
        [self bringSubviewToFront:_sellCarTypeTV];
    } else if (segemented.selectedSegmentIndex == 1) {
        [self bringSubviewToFront:_stopSellCarTypeTV];
    }
}



@end
