//
//  MainTabBarController.m
//  MyCar
//
//  Created by lanou3g on 15-6-25.
//  Copyright (c) 2015年 李智慧. All rights reserved.
//

#import "MainTabBarController.h"
#import "CarTypeListViewController.h"
#import "FindCarListTableViewController.h"
#import "InformationListViewController.h"
#import "MoreListTableViewController.h"
@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //配置
    [self layoutControllers];
}

- (void)layoutControllers{
    //四个页面  车型 找车 资讯  更多
    //车型
    CarTypeListViewController *CarTypeVC = [[CarTypeListViewController alloc]init];
    UINavigationController *CAVC=[[UINavigationController alloc]initWithRootViewController:CarTypeVC];
    CarTypeVC.title =@"车型";
    //车型小图标
    CAVC.tabBarItem.image=[UIImage imageNamed:@""];
    //找车
    FindCarListTableViewController *FindVC =[[FindCarListTableViewController alloc]init];
    UINavigationController *FIVC =[[UINavigationController alloc]initWithRootViewController:FindVC];
    FindVC.title =@"找车";
    FIVC.tabBarItem.image=[UIImage imageNamed:@""];
    //资讯
    InformationListViewController *informationVC =[[InformationListViewController alloc]init];
    UINavigationController *InforVC=[[UINavigationController alloc]initWithRootViewController:informationVC];
    informationVC.title=@"资讯";
    InforVC.tabBarItem.image =[UIImage imageNamed:@""];
    //更多
    MoreListTableViewController *MoreVC =[[MoreListTableViewController alloc]init];
    UINavigationController *MOVC =[[UINavigationController alloc]initWithRootViewController:MoreVC];
    MoreVC.title =@"更多";
    MOVC.tabBarItem.image =[UIImage imageNamed:@""];
    //设置管理
    self.viewControllers =@[CAVC,FIVC,InforVC,MOVC];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
