//
//  InformationDetailCell.h
//  MyCar
//
//  Created by lanou3g on 15-6-25.
//  Copyright (c) 2015年 李智慧. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "News.h"
@interface InformationDetailCell : UITableViewCell
@property (nonatomic,retain)UIImageView *news_pic; // 图片
@property (nonatomic,retain)UILabel *timeLable; // 时间
@property (nonatomic,retain)UILabel *titleLable; // 标题
@property (nonatomic,retain)News *news;
// 通过字符串获取显示当前字符串需要的高度
+ (CGFloat)getHeightWithString:(NSString *)string;
@end
