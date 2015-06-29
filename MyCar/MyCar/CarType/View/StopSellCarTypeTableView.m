//
//  StopSellCarTypeTableView.m
//  MyCar
//
//  Created by lanou3g on 15/6/27.
//  Copyright (c) 2015年 李智慧. All rights reserved.
//

#import "StopSellCarTypeTableView.h"
#import "CellCarType.h"
#import "AutobotsURL.h"
#import "UIImageView+WebCache.h"
@interface StopSellCarTypeTableView ()<UITableViewDataSource,UITableViewDelegate>
@end

@implementation StopSellCarTypeTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:UITableViewStylePlain];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}

#pragma mark - Delegate DataSoure
- (NSInteger)numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *indentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}


@end
