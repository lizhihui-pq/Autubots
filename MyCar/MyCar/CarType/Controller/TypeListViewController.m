//
//  TypeListViewController.m
//  MyCar
//
//  Created by lanou3g on 15/6/26.
//  Copyright (c) 2015年 李智慧. All rights reserved.
//

#import "TypeListViewController.h"
#import "CarTypeParameter.h"
#import "SellCarTypeTableView.h"
#import "StopSellCarTypeTableView.h"

@interface TypeListViewController ()
@property(nonatomic,retain)SellCarTypeTableView *sellCarTypeTV;
@property(nonatomic,retain)StopSellCarTypeTableView *stopSellCarTypeTV;
@end

@implementation TypeListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    CarTypeListViewController *carTypeVC = [[CarTypeListViewController alloc] initWithStyle:(UITableViewStyleGrouped)];
//    [self.view addSubview:carTypeVC];
    
//    CarTypeParameter *carTP = [CarTypeParameter alloc] initWithFrame:(CGRect)
    
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:@[@"在售车辆",@"停售车辆"]];
    
    [segment addTarget:self action:@selector(segementAction:) forControlEvents:UIControlEventValueChanged];
    segment.frame = CGRectMake(50, 50, 200, 35);
    segment.center = CGPointMake(375-(375+80)/2, 40);
    // 设置选中分段 即首次显示的分段
    segment.selectedSegmentIndex = 0;
    [self.view addSubview:segment];
    // 布局在售和停售界面
    [self layoutViews];

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// segemented的点击事件
- (void)segementAction:(UISegmentedControl *)segemented {
    if (segemented.selectedSegmentIndex == 0) {
        [self.view bringSubviewToFront:_sellCarTypeTV];
    } else if (segemented.selectedSegmentIndex == 1) {
        [self.view bringSubviewToFront:_stopSellCarTypeTV];
    }
}

// 布局在售和停售界面
- (void)layoutViews {
    self.sellCarTypeTV = [[SellCarTypeTableView alloc] initWithFrame:CGRectMake(5, 70, (375-80-10), 667-64-49-70) style:UITableViewStyleGrouped];
    _sellCarTypeTV.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_sellCarTypeTV];
    
    self.stopSellCarTypeTV = [[StopSellCarTypeTableView alloc] initWithFrame:CGRectMake(5, 70, (375-80-10), 667-64-49-70) style:UITableViewStyleGrouped];
    _stopSellCarTypeTV.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_stopSellCarTypeTV];
    
    [self.view bringSubviewToFront:_sellCarTypeTV];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
