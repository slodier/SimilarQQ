//
//  MyToolbar.m
//  娶老婆
//
//  Created by 736376103@qq.com on 16/4/11.
//  Copyright © 2016年 736376103@qq.com. All rights reserved.
//

#import "MyToolbar.h"
#import "UIImage+UIImageExtras.h"
@implementation MyToolbar

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];

        button1.frame = CGRectMake(20, 5, 80, 40);
        _noteBtn = button1;
        [button1 setTitle:@"消息" forState:UIControlStateNormal];
        [button1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        button1.titleLabel.font = [UIFont systemFontOfSize:10];
        UIImage *image1 = [UIImage imageNamed:@"btn_talk@2x"];
        [button1 setImageEdgeInsets:UIEdgeInsetsMake(-5, 20, 0, 0)];
        [button1 setTitleEdgeInsets:UIEdgeInsetsMake(30, -30, 0, 0)];
        CGSize size = CGSizeMake(30, 30);
        [button1 setImage:[image1 imageByScalingToSize:size] forState:UIControlStateNormal];
        UIBarButtonItem *item1 = [[UIBarButtonItem alloc]initWithCustomView:button1];
        
        UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
        _friendsBtn = button2;

        button2.frame = CGRectMake(375/2-40, 5, 80, 40);
        [button2 setTitle:@"联系人" forState:UIControlStateNormal];
        [button2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        button2.titleLabel.font = [UIFont systemFontOfSize:10];
        UIImage *image2 = [UIImage imageNamed:@"mod_user"];
        [button2 setImage:[image2 imageByScalingToSize:size] forState:UIControlStateNormal];
        [button2 setImageEdgeInsets:UIEdgeInsetsMake(-10, 20, 0, 0)];
        [button2 setTitleEdgeInsets:UIEdgeInsetsMake(30, -40, 0, 0)];
        
        UIBarButtonItem *item2 = [[UIBarButtonItem alloc]initWithCustomView:button2];
        UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
        _actionBtn = button3;

        button3.frame = CGRectMake(275, 5, 80, 40);
        [button3 setTitle:@"动态" forState:UIControlStateNormal];
        [button3 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        button3.titleLabel.font = [UIFont systemFontOfSize:10];
        UIImage *image3 = [UIImage imageNamed:@"bookmark@2x"];
        [button3 setImage:[image3 imageByScalingToSize:size] forState:UIControlStateNormal];
        [button3 setImageEdgeInsets:UIEdgeInsetsMake(-5, 0, 0, 0)];
        [button3 setTitleEdgeInsets:UIEdgeInsetsMake(30, -50, 0, 0)];
        UIBarButtonItem *item3 = [[UIBarButtonItem alloc]initWithCustomView:button3];
        UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
        NSArray *items = [NSArray arrayWithObjects:spaceItem,item1,spaceItem,item2,spaceItem,item3,spaceItem, nil];
        self.items = items;
    }
    return self;
}

@end
