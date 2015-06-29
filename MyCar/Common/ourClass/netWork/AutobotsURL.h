//
//  AutobotsURL.h
//  MyCar
//
//  Created by lanou3g on 15/6/26.
//  Copyright (c) 2015年 李智慧. All rights reserved.
//


#pragma mark -----------------主页面车型---------------------
#define kCarTypeURL @"http://baojia.qichecdn.com/priceapi3.9.2/services/cars/brands?app=2&platform=1&version=3.9.2&ts=0"

#pragma mark -----------------在售车型参数--------------------
#define kSellCarTypeParameterURL @"http://baojia.qichecdn.com/priceapi3.9.2/services/seriesprice/get?brandid=%@&cityid=0&salestate=1"
//salestate=1表示在售汽车 brandid=32车型ID

#pragma mark ----------------在售车型详细参数------------------
#define kSellCarTypeDetailParamenter @"http://baojia.qichecdn.com/priceapi3.9.2/services/seriessummary/get?cityid=0&provinceid=0&salestate=1&seriesid=3103"
//salestate=1 seriesid=3103

#pragma mark -----------------停售车型参数---------------------
#define kStopSellCarTypeParameterURL @"http://baojia.qichecdn.com/priceapi3.9.2/services/seriesprice/get?brandid=%@&cityid=0&salestate=3"
//salestate=3表示停售 brandid=33车型ID

#pragma mark -----------------停售车型详细参数------------------
#define kStopSellCarTypeDetailParamenter @"http://baojia.qichecdn.com/priceapi3.9.2/services/seriessummary/get?cityid=0&provinceid=0&salestate=3&seriesid=19"
//&salestate=3&seriesid=19 拼接

#pragma mark --------------------汽车资讯---------------------
#define kCarInformation @"http://app.api.autohome.com.cn/autov4.7.6/news/newslist-pm1-c0-nt1-p1-s30-l0.json"


#pragma mark -------------------汽车资讯详情-------------------
#define kCarInformationDetail @"http://cont.app.autohome.com.cn/autov4.7.6/content/news/newsinfo-pm1-i875972.json"

