//
//  RequestHandle.m
//  RequestHandle_demo
//
//  Created by lanou3g on 15/6/12.
//  Copyright (c) 2015年 com.lanou3g. All rights reserved.
//

#import "RequestHandle.h"

@implementation RequestHandle
//初始化
-(id)initWithURL:(NSString *)URL method:(NSString *)method parameter:(NSString *)parameter delegate:(id<RequestHandleDelegate>)delegate
{
    self = [super init];
    
    if (self) {
        //设置代理
        self.delegate =delegate;
        //通过请求方式区分 POST GET
        if ([method isEqualToString:@"POST"]) {
            [self  requestDataByPOSTWith:URL  parameter:(NSString *)parameter];
            
        }else if ([method isEqualToString:@"GET"]){
            
            [self  requestDataByGETWith:URL ];
            
        }
        
    }
    return self;
}
#pragma -mark GET方法
//GET方法
-(void)requestDataByGETWith:(NSString *)URL
{
    //再编码
    NSString *newUrl = [URL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    //创建url
    NSURL *url = [NSURL  URLWithString:newUrl];
    
    
    //创建请求对象
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    //设置代理请求数据
  self.connetction =   [NSURLConnection connectionWithRequest:request delegate:self];


    
}
#pragma -mark  -delegate
//连接
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    //创建data
    self.data = [NSMutableData  data];
    
}
//获取数据
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    // 拼接数据
    [self.data appendData:data];
    
}
//数据完成
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    if ([self.delegate respondsToSelector:@selector(requestHandle:didSuceedWithData:)]) {
        
        [_delegate requestHandle:self didSuceedWithData:self.data];
    }
    
}
//请求失败
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    if ([self.delegate respondsToSelector:@selector(requestHandle:didDidFailWithError:)]) {
        [_delegate requestHandle:self didDidFailWithError:error];
    }
}
#pragma -mark POST方法
//POST方法
-(void)requestDataByPOSTWith:(NSString *)URL parameter:(NSString *)parameter
{
    //转编码
    NSString *newUrl = [URL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    //创建URL
    NSURL *url = [NSURL URLWithString:newUrl];
    //创建请求体
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    //转化data
    NSData  *paraData = [parameter dataUsingEncoding:NSUTF8StringEncoding];
    //设置请求体
    request.HTTPBody =paraData;
    request.HTTPMethod = @"POST";
    //请求
    [NSURLConnection connectionWithRequest:request delegate:self];
    
}
-(void)cancel
{
    [self.connetction cancel];
}
@end
