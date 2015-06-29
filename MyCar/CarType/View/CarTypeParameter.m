//
//  CarTypeParameter.m
//  MyCar
//
//  Created by lanou3g on 15/6/26.
//  Copyright (c) 2015年 李智慧. All rights reserved.
//

#import "CarTypeParameter.h"
#import "SellCarTypeTableView.h"
#import "StopSellCarTypeTableView.h"

@interface CarTypeParameter ()
@property(nonatomic,retain)SellCarTypeTableView *sellCarTypeTV;
@property(nonatomic,retain)StopSellCarTypeTableView *stopSellCarTypeTV;
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
        segment.frame = CGRectMake(50, 100, 150, 35);
        segment.center = CGPointMake(375-(375+80)/2, 60);
        [self addSubview:segment];
        // 布局在售和停售界面
        [self layoutViews];
        
    }
    return self;
}

// segemented的点击事件
- (void)segementAction:(UISegmentedControl *)segemented {
    if (segemented.selectedSegmentIndex == 0) {
        [self bringSubviewToFront:_sellCarTypeTV];
    } else if (segemented.selectedSegmentIndex == 1) {
        [self bringSubviewToFront:_stopSellCarTypeTV];
    }
}

// 布局在售和停售界面
- (void)layoutViews {
    self.sellCarTypeTV = [[SellCarTypeTableView alloc] initWithFrame:CGRectMake(5, 150, (375-80-10), 300) style:(UITableViewStyleGrouped)];
    _sellCarTypeTV.backgroundColor = [UIColor grayColor];
    [self addSubview:_sellCarTypeTV];
    
    self.stopSellCarTypeTV = [[StopSellCarTypeTableView alloc] initWithFrame:CGRectMake(5, 150, (375-80-10), 300) style:(UITableViewStyleGrouped)];
    _stopSellCarTypeTV.backgroundColor = [UIColor greenColor];
    [self addSubview:_stopSellCarTypeTV];
}

@end
