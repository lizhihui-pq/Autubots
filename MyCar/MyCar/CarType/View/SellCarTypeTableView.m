//
//  SellCarTypeTableView.m
//  MyCar
//
//  Created by lanou3g on 15/6/27.
//  Copyright (c) 2015年 李智慧. All rights reserved.
//

#import "SellCarTypeTableView.h"
#import "CellCarType.h"
#import "AutobotsURL.h"
#import "UIImageView+WebCache.h"


@interface SellCarTypeTableView ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,retain)NSMutableArray *nameArr;
@property(nonatomic,retain)NSMutableDictionary *serieslistDic;

@end

@implementation SellCarTypeTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:UITableViewStylePlain];
    if (self) {
       
        self.delegate = self;
        self.dataSource = self;
        // 注册cell
//        [self registerClass:[UITableViewCell class] forCellReuseIdentifier:@"sellCarType"];
        [self reloadData];
    }
    return self;
}

// 请求数据 在售汽车
- (void)requestData:(NSString *)str {
    NSURL *url = [NSURL URLWithString:str];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSDictionary *resultDic = [dic valueForKey:@"result"];
        NSArray *fctlistArr = [resultDic valueForKey:@"fctlist"];
        self.nameArr = [NSMutableArray array];
        self.serieslistDic = [NSMutableDictionary dictionary];
        for (NSDictionary *fctlistDic in fctlistArr) {
            NSString *fctlistName = [fctlistDic valueForKey:@"name"];
            [_nameArr addObject:fctlistName];
            NSArray *serieslistArr = [fctlistDic valueForKey:@"serieslist"];
            NSMutableArray *arr = [NSMutableArray array];
            for (NSDictionary *serieslistDic in serieslistArr) {
                CellCarType *cellCar = [[CellCarType alloc] init];
                [cellCar setValuesForKeysWithDictionary:serieslistDic];
                [arr addObject:cellCar];
            }
            [_serieslistDic setValue:arr forKey:fctlistName];
        }
    }];
    [self reloadData];


}


#pragma mark - Delegate DataSoure
- (NSInteger)numberOfRowsInSection:(NSInteger)section {
    NSLog(@"-----%@",_nameArr);
    return _nameArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *arr = [_serieslistDic valueForKey:_nameArr[section]];
    return arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *identifier = @"sellCartype";
    
//    UITableViewCell *cell = [self dequeueReusableCellWithIdentifier:@"sellCarType"];
    UITableViewCell *cell = [self dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    NSString *key = _nameArr[indexPath.section];
    
    CellCarType *cellCartype = [[CellCarType alloc] init];
    cellCartype = [_serieslistDic valueForKey:key][indexPath.row];
    
    cell.textLabel.text = cellCartype.name;
    NSURL *imageURL = [NSURL URLWithString:cellCartype.imgurl];
    [cell.imageView sd_setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:@"1.png"]];
    cell.detailTextLabel.text = cellCartype.price;
    cell.detailTextLabel.textColor = [UIColor redColor];
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return _nameArr[section];
}


@end
