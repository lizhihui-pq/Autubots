//
//  CarTypeParameterController.m
//  MyCar
//
//  Created by lanou3g on 15/6/26.
//  Copyright (c) 2015年 李智慧. All rights reserved.
//

#import "CarTypeParameterController.h"
#import "CarTypeParameter.h"
#import "AutobotsURL.h"
#import "CarType.h"
#import "UIImageView+WebCache.h"

@interface CarTypeParameterController () <UITableViewDataSource, UITableViewDelegate>
@property(nonatomic,strong)CarTypeParameter *carTypePC;
@property(nonatomic,strong)NSMutableArray *letterArr;
@property(nonatomic,strong)NSMutableDictionary *brandListDic;
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation CarTypeParameterController

// 页面创建的时候刷新数据
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 请求数据
    [self requesData];
    
    // 布局
    [self layoutTableView];
    
    
    // 将自定义的cell的分割线左边设置到头
//    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
//        
//        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
//    }

    
}

// 布局
- (void)layoutTableView {
    // 创建
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 375, 554) style:UITableViewStyleGrouped];
    _tableView.backgroundColor = [UIColor whiteColor];
    // 设置代理和数据源
    _tableView.delegate = self;
    _tableView.dataSource = self;
    // 添加父视图
    [self.view addSubview: _tableView];
    // 注册cell
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CarType"];
    
    //创建View
    self.carTypePC = [[CarTypeParameter alloc] initWithFrame:CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _carTypePC.backgroundColor = [UIColor lightGrayColor];
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

// 请求数据
- (void)requesData {
    // 创建url
    NSURL *url = [NSURL URLWithString:kCarTypeURL];
    // 创建NSMutableURLRequest
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    //请求
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        // 数据解析
        NSDictionary *dataDic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSDictionary *resulte_dic = [dataDic valueForKey:@"result"];
        NSArray *brandlist_arr = [resulte_dic valueForKey:@"brandlist"];
        
        self.brandListDic = [NSMutableDictionary dictionary];
        self.letterArr = [NSMutableArray array];
        
        for (NSDictionary *brandlist_arr_Dic in brandlist_arr) {
            
            NSString *letter = [brandlist_arr_Dic valueForKey:@"letter"];
            [_letterArr addObject:letter];// 字母数组
            
            NSArray *list_Arr = [brandlist_arr_Dic valueForKey:@"list"];
            NSMutableArray *carArr = [NSMutableArray array];
            for (NSDictionary *list_Arr_Dic in list_Arr) {
                
                // 封装对象
                CarType *car = [[CarType alloc] init];
                if (carArr == nil) {
                    carArr = [NSMutableArray array];
                }
                [car setValuesForKeysWithDictionary:list_Arr_Dic];
                [carArr addObject:car];// 将car对象放入数组
                
            }
            [_brandListDic  setValue:carArr forKey:letter];
        }
        // 为数组排序
        [_letterArr sortedArrayUsingSelector:@selector(compare:)];
        // 刷新数据
        [self.tableView reloadData];
        
    }];
}

#pragma mark - TableViewDataSoure  TableViewDelegate

// 设置层数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _letterArr.count;
}

// 每一层的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *arr = [_brandListDic valueForKey:_letterArr[section]];
    return arr.count;
}

// cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CarType"];
    
    NSString *key = _letterArr[indexPath.section];
    NSArray *arr = [_brandListDic valueForKey:key];
    CarType *car = arr[indexPath.row];
    //创建对应的URL
    NSURL *imageURL = [NSURL URLWithString:car.imgurl];
    [cell.imageView sd_setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:@"1.png"]];
    cell.textLabel.text = car.name;
    
    return cell;
}

// 设置侧边栏
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return _letterArr;
}

// 为区头赋值
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return _letterArr[section];
}

// 点击cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [UIView animateWithDuration:0.4 animations:^{
        _carTypePC.frame = CGRectMake(50, 0, self.view.frame.size.width, self.view.frame.size.height);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            _carTypePC.frame = CGRectMake(70, 0, self.view.frame.size.width, self.view.frame.size.height);
            [self.carTypePC.sellCarTypeTV reloadData];
        } ];
    }];
    NSString *key = _letterArr[indexPath.section];
    NSArray *arr = [_brandListDic valueForKey:key];
    CarType *car = arr[indexPath.row];
    
    // 在售
    NSString *sellStr = [NSString stringWithFormat:kSellCarTypeParameterURL,car.brandid];
    _carTypePC.sellCarTypeTV.sellCarStr = sellStr;
    // 停售
    NSString *stopSellStr = [NSString stringWithFormat:kStopSellCarTypeParameterURL,car.brandid];
    _carTypePC.stopSellCarTypeTV.stopSellCarStr = stopSellStr;
    self.carDelegate = self.carTypePC.sellCarTypeTV;
    [self.carTypePC.sellCarTypeTV requestData:sellStr];
    
}

// 区头的设置
// 区头的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20;
}

// 开始拖拽时触发的代理事件 回收
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
