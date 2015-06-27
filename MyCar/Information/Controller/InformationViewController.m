//
//  InformationViewController.m
//  MyCar
//
//  Created by lanou3g on 15-6-27.
//  Copyright (c) 2015年 李智慧. All rights reserved.
//

#import "InformationViewController.h"

@interface InformationViewController ()
@property (nonatomic,retain)UIWebView *webView;
@property (nonatomic,retain)NSString *URL;
@end

@implementation InformationViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.view reloadInputViews];
   
}
- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"%@",self.Str);
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 375 , 667)];
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:self.Str]];
    [self.view addSubview: _webView];
    [_webView loadRequest:request];
    
    
    
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
