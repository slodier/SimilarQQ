//
//  PhotoView.m
//  娶老婆
//
//  Created by asamu on 16/3/29.
//  Copyright © 2016年 736376103@qq.com. All rights reserved.
//

#import "PhotoView.h"
#import <AVFoundation/AVFoundation.h>
#import "TableViewController.h"
@interface PhotoView ()

@end

@implementation PhotoView

- (void)drawRect:(CGRect)rect {
    [self creatScrollView];
}

- (void)creatScrollView {
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    
    UIImage *image1 = [UIImage imageNamed:@"590.jpg"];
    UIImage *image2 = [UIImage imageNamed:@"CDL.jpeg"];
    UIImage *image3 = [UIImage imageNamed:@"3.png"];
    
    NSArray *imageArray = [NSArray arrayWithObjects:image1,image2,image3, nil];
    
    UIScrollView *scro = [[UIScrollView alloc]initWithFrame:self.frame];
    scro.backgroundColor = [UIColor whiteColor];
    scro.pagingEnabled = YES;
    scro.contentSize = CGSizeMake(width *3, height-64);
    
    
    for (int i = 0; i < imageArray.count; i++) {
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.frame = CGRectMake(width *i, 0, width, height);
        imageView.image = imageArray[i];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(width/2 - 30, height - 50, 60, 30)];
        label.text = [NSString stringWithFormat:@"---%d---",i+1];
        
        UILabel *textLabel = [[UILabel alloc]initWithFrame:CGRectMake(0 , height/2+30, width, 100)];
        textLabel.textColor = [UIColor cyanColor];
        textLabel.numberOfLines = 0;
        textLabel.textAlignment = NSTextAlignmentCenter;
        [imageView addSubview:textLabel];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        switch (i) {
            case 0:
                textLabel.text = @"有没有那么一首歌会让你想起我";
                break;
                
            case 1:
                textLabel.text = @"如果再见不能红着眼，是否还能红着脸";
                break;
                
            case 2:
                textLabel.text = @"我唯一庆幸的是，在最好的年纪遇见你";
                
                button.frame = CGRectMake(width/2-85, height-150, 170, 50);
                button.layer.borderWidth = 1;
                button.layer.cornerRadius = 10;
                [button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
                
                CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
                CGColorRef borderColorRef = CGColorCreate(colorSpace,(CGFloat[]){ 13, 240, 5, 1 });
                [button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];

                [button.layer setBorderColor:borderColorRef];
                [button setTitle:@"Touch me 嘿-嘿-嘿" forState:UIControlStateNormal];
                imageView.userInteractionEnabled = YES;
                [imageView addSubview:button];
                break;
            default:
                break;
        }

        [imageView addSubview:label];
        [scro addSubview:imageView];
    }
    [self addSubview:scro];
}

- (void)click {
    NSString *path = [[NSBundle mainBundle]pathForResource:@"3.mp3" ofType:nil];
    NSURL *url = [NSURL fileURLWithPath:path];
    
    SystemSoundID soundID = 0;
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &soundID);
    AudioServicesPlayAlertSound(soundID);
    
    UIAlertView *view = [[UIAlertView alloc]initWithTitle:nil message:@"跳过" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [view show];
}
@end
