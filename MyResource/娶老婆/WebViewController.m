//
//  WebViewController.m
//  娶老婆
//
//  Created by 736376103@qq.com on 16/3/31.
//  Copyright © 2016年 736376103@qq.com. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIWebView *view = [[UIWebView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:view];
    NSString *str = @"http://www.baidu.com";
    NSURL *url = [NSURL URLWithString:str];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [view loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
