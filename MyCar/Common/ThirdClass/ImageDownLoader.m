//
//  ImageDownLoader.m
//  Lesson-18-ImageDownloadAndKVO
//
//  Created by lanou3g on 15/6/11.
//  Copyright (c) 2015年 ZhangHl. All rights reserved.
//

#import "ImageDownLoader.h"

@interface ImageDownLoader ()<NSURLConnectionDataDelegate>

@property (nonatomic,retain)NSURLConnection *connection;//连接对象
@property (nonatomic,retain)NSMutableData *data;//拼接数据

@end

@implementation ImageDownLoader

- (id)initWithImageURL:(NSString *)imageURL delegate:(id<ImageDownLoaderDelegate>)delegate {
    self = [super init];
    if (self) {
        self.delegate = delegate;
        
        //请求
        [self requestImageWithImageURL:imageURL];
    }
    return self;
}

//请求方法
- (void)requestImageWithImageURL:(NSString *)imageURL {
    //1.url
    NSString *newStr = [imageURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:newStr];
    //2.请求对象
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //3.链接 请求
    self.connection = [NSURLConnection connectionWithRequest:request delegate:self];
}

//连接成功
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    self.data = [NSMutableData data];
}
//读取数据
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self.data appendData:data];
}
//请求结束
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    //获取image
    UIImage *image = [UIImage imageWithData:_data];
    //通知代理执行协议中的方法,并请image拿走
    if ([_delegate respondsToSelector:@selector(imageDownLoader:didSucceedWithImage:)]) {
        [_delegate imageDownLoader:self didSucceedWithImage:image];
    }
    
}
//请求失败
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"%@",error);
}

//取消
- (void)cancel {
    [self.connection cancel];
}

@end
