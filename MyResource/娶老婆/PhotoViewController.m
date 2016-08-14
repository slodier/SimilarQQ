//
//  PhotoViewController.m
//  娶老婆
//
//  Created by 736376103@qq.com on 16/3/29.
//  Copyright © 2016年 736376103@qq.com. All rights reserved.
//

#import "PhotoViewController.h"
#import "PhotoView.h"
#import <AVFoundation/AVFoundation.h>
@interface PhotoViewController ()

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    PhotoView *photoView = [[PhotoView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:photoView];
}



- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"21270111.jpg"] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:9/255.0 green:75/255.0 blue:48/255.0 alpha:1];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
