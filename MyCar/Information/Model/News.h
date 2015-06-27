//
//  News.h
//  MyCar
//
//  Created by lanou3g on 15-6-27.
//  Copyright (c) 2015年 李智慧. All rights reserved.
//
/**
 *  dbid: 0,
 id: 876084,
 title: "路特斯Exige S自动挡车型将于7月上市",
 mediatype: 0,
 type: "新闻中心",
 time: "2015-06-27",
 intacttime: "2015/6/27 9:23:00",
 indexdetail: "",
 smallpic: "http://www0.autoimg.cn/zx/newspic/2015/6/27/160x120_0_2015062700320508463.jpg",
 replycount: 0,
 pagecount: 1,
 jumppage: 1,
 lasttime: "20150627092300876084",
 newstype: 0,
 updatetime: "20150627004024"
 */
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ImageDownLoader.h"
@interface News : NSObject
@property (nonatomic,copy)NSString *time;// 时间
@property (nonatomic,copy)NSString *title;// cell的标题；
@property (nonatomic,retain)UIImage *news_pic;// 图片
@property (nonatomic,copy)NSString *smallpic;// 图片的URL；
@property (nonatomic,copy)NSString *Car_id;// 汽车ID；
@property (nonatomic)BOOL isLoading;// 是否下载


// 请求图片
//- (void)loadImage;
@end
