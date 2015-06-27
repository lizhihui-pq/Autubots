//
//  RequestHandle.h
//  RequestHandle_demo
//
//  Created by lanou3g on 15/6/12.
//  Copyright (c) 2015年 com.lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RequestHandle;
@protocol RequestHandleDelegate <NSObject>
//成功
-(void)requestHandle:(RequestHandle *)request didSuceedWithData:(NSData *)data;
//失败
-(void)requestHandle:(RequestHandle *)request didDidFailWithError:(NSError *)error;
@end
@interface RequestHandle : NSObject<NSURLConnectionDataDelegate>
//连接对象
@property(nonatomic,retain)NSURLConnection *connetction;
//data
@property(nonatomic,retain)NSMutableData *data;
@property(nonatomic,assign)id<RequestHandleDelegate>delegate;

//初始化方法
-(id)initWithURL:(NSString *)URL method:(NSString *)method parameter:(NSString *)parameter delegate:(id<RequestHandleDelegate>)delegate;
-(void)cancel;//取消
@end
