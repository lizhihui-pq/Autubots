//
//  InformationListViewController.m
//  MyCar
//
//  Created by lanou3g on 15-6-25.
//  Copyright (c) 2015年 李智慧. All rights reserved.
//

#import "InformationListViewController.h"
#import "RequestHandle.h"
#import "News.h"
#import "InformationDetailCell.h"
#import "UIImageView+WebCache.h"
#import "InformationViewController.h"
#import "SDRefresh.h"
@interface InformationListViewController ()<RequestHandleDelegate>
@property (nonatomic,retain)NSMutableArray *newslistArr;// 存储

@property(nonatomic,retain)SDRefreshFooterView *refreshFooter;
@property(nonatomic,retain)SDRefreshHeaderView *refreshHeader;
@property (nonatomic, assign) NSInteger totalRowCount;// 行的个数
@end

@implementation InformationListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 注册
    [self.tableView registerClass:[InformationDetailCell class] forCellReuseIdentifier:@"cell"];
    //请求数据
    [self requestData];
    
    // 设置刷新
    [self layoutBarItem];
    
    // 上拉刷新
    [self headerView];
    // 下拉加载
    [self foolDView];
}






 // 设置刷新按钮
- (void)layoutBarItem{
    UIButton *bt =[UIButton buttonWithType:UIButtonTypeSystem];
    bt.frame=CGRectMake(0, 0, 32, 32);
    [bt setImage:[UIImage imageNamed:@"Refresh.jpg"] forState:UIControlStateNormal];
    [bt addTarget:self action:@selector(loadingAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *right =[[UIBarButtonItem alloc]initWithCustomView:bt];
    self.navigationItem.rightBarButtonItem=right;
}
// 刷新界面
- (void)loadingAction:(UIBarButtonItem *)Item
{
    
    [self requestData];
    
}
// 请求数据
- (void)requestData
{
    [[RequestHandle alloc]initWithURL:@"http://app.api.autohome.com.cn/autov4.7.6/news/newslist-pm1-c0-nt1-p1-s30-l0.json" method:@"GET" parameter:nil delegate:self];
    
}
// 请求成功
- (void)requestHandle:(RequestHandle *)request didSuceedWithData:(NSData *)data
{
    // 数据解析
    NSDictionary *dataDic =[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSDictionary *resultDic =[dataDic valueForKey:@"result"];
    NSLog(@"%@",resultDic);
    NSArray *dataArr =[resultDic valueForKey:@"newslist"];
    for (NSDictionary *dic in dataArr) {
        // 封装对象
        News *news =[[News alloc]init];
        [news setValuesForKeysWithDictionary:dic];
        // 将对象放到数组中
        if (_newslistArr == nil) {
            self.newslistArr = [NSMutableArray array];
        }
        [_newslistArr addObject:news];
    }
    NSLog(@"%@",_newslistArr);
    // 刷新数据(异步)
    [self.tableView reloadData];
}
// 请求失败
- (void)requestHandle:(RequestHandle *)request didDidFailWithError:(NSError *)error
{
    
    UIAlertView *alert= [[UIAlertView alloc]initWithTitle:nil message:@"网络不给力" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [alert show];
    NSLog(@"请求失败");
}
#pragma mark- 上下拉加载
// 上拉刷新
-(void)headerView
{
    
    //定义字头视频
    SDRefreshHeaderView *refreshHeader = [SDRefreshHeaderView refreshView];
    
    [refreshHeader addToScrollView:self.tableView isEffectedByNavigationController:NO];
    
    //用__block修饰
    __block SDRefreshHeaderView *weakRefreshHeader = refreshHeader;
    
    refreshHeader.beginRefreshingOperation=^{
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.totalRowCount += 5;
            [self.tableView reloadData];
            [weakRefreshHeader endRefreshing];
        });
        
        
    };
    [refreshHeader beginRefreshing];
}


-(void)foolDView
{
    
    SDRefreshFooterView *refreshFooter = [SDRefreshFooterView refreshView];
    [refreshFooter addToScrollView:self.tableView];
    [refreshFooter addTarget:self refreshAction:@selector(footerRefresh)];
    _refreshFooter = refreshFooter;
    
}
// 下拉加载
-(void)footerRefresh
{
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.totalRowCount += 10;
        [self.tableView reloadData];
        [self.refreshFooter endRefreshing];
    });
    
}
#pragma mark -DataSouce Delegate

// 分区数
- (NSInteger )numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

// 行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.newslistArr.count;
}

//cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 从重用队列中去取
    InformationDetailCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    //获取对应的news
    News *news =self.newslistArr[indexPath.row];
    // 赋值
    cell.news =news;
    
    // 创建对应的URL
    NSURL *url =[NSURL URLWithString:news.smallpic];
    // 展位图片
    UIImage *plachderImage =[UIImage imageNamed:@"333.jpg"];
    [cell.news_pic sd_setImageWithURL:url placeholderImage:plachderImage];
    return cell;
}

// cell 的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}
// cell点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    InformationViewController *VC =[[InformationViewController alloc]init];
    //push
    
   
    // 获取对应的News
    News *news =self.newslistArr[indexPath.row];
//    VC.news =news;
    NSString *Sring = [[NSString alloc] initWithFormat:@"http://cont.app.autohome.com.cn/autov4.7.6/content/news/newsinfo-pm1-i%@.json",news.Car_id];
    NSURL *url =[NSURL URLWithString:Sring];
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        // 数据解析
        NSDictionary *dic =[NSDictionary dictionary];
        dic =[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSDictionary *Dic =[dic valueForKey:@"result"];
        NSString *URL =[Dic valueForKey:@"url"];
        VC.Str = URL;
        
        [self.navigationController pushViewController:VC animated:YES];
         VC.view.backgroundColor =[UIColor whiteColor];
        
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
