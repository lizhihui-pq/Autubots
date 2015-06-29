//
//  CarTypeParameterController.m
//  MyCar
//
//  Created by lanou3g on 15/6/26.
//  Copyright (c) 2015年 李智慧. All rights reserved.
//

#import "CarTypeParameterController.h"
#import "CarTypeParameter.h"

@interface CarTypeParameterController () <UITableViewDataSource, UITableViewDelegate>
@property(nonatomic,strong)CarTypeParameter *carTypePC;
@end

@implementation CarTypeParameterController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 布局
    [self layoutTableView];
    
    // 数据解析
//    []
}

// 布局
- (void)layoutTableView {
    // 创建
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    tableView.backgroundColor = [UIColor cyanColor];
    // 设置代理和数据源
    tableView.delegate = self;
    tableView.dataSource = self;
    // 添加父视图
    [self.view addSubview: tableView];
    // 注册cell
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CarType"];
    
    //创建View
    self.carTypePC = [[CarTypeParameter alloc] initWithFrame:CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _carTypePC.backgroundColor = [UIColor redColor];
    // 添加父视图
    [self.view addSubview:_carTypePC];
    
    // 创建轻扫手势
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(dismissSemi:)];
    // 为轻扫手势添加轻扫方向
    swipe.direction = UISwipeGestureRecognizerDirectionRight;
    // 将轻扫手势添加到页面上
    [_carTypePC addGestureRecognizer:swipe];

}

// 轻扫手势
- (void)dismissSemi:(id)sender{
    // 移除所有动画
    [self.carTypePC.layer removeAllAnimations];
    // 添加动画
    [UIView animateWithDuration:0.5 animations:^{
        self.carTypePC.frame = CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height);
    }];
}

#pragma mark - TableViewDataSoure  TableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// 每一层的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

// cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CarType"];
    cell.textLabel.text = @"hhhhhhhhhhhhhhhhhhhhhhhh";
    return cell;
}

// 点击cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [UIView animateWithDuration:0.5 animations:^{
        _carTypePC.frame = CGRectMake(80, 0, self.view.frame.size.width, self.view.frame.size.height);
    }];
}

// 开始拖拽时触发的代理事件
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    // 移除所有动画
    [self.carTypePC.layer removeAllAnimations];
    // 添加动画
    [UIView animateWithDuration:0.5 animations:^{
        self.carTypePC.frame = CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height);
    }];
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
