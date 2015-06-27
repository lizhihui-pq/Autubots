//
//  ImageDownLoader.h
//  Lesson-18-ImageDownloadAndKVO
//
//  Created by lanou3g on 15/6/11.
//  Copyright (c) 2015年 ZhangHl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class ImageDownLoader;

@protocol ImageDownLoaderDelegate <NSObject>

//请求成功
- (void)imageDownLoader:(ImageDownLoader *)imageDownLoader didSucceedWithImage:(UIImage *)image;
//- (void)succeedWithImage:(UIImage *)image;

@end

@interface ImageDownLoader : NSObject

@property (nonatomic,assign)id<ImageDownLoaderDelegate> delegate;

- (id)initWithImageURL:(NSString *)imageURL delegate:(id<ImageDownLoaderDelegate>) delegate;

- (void)cancel;

@end
