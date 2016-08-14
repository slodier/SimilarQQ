//
//  LabelLayer.m
//  娶老婆
//
//  Created by 736376103@qq.com on 16/4/6.
//  Copyright © 2016年 736376103@qq.com. All rights reserved.
//

#import "LabelLayer.h"

@implementation LabelLayer

+(void)imageView:(UIImageView *)imageView nameLabel:(UILabel *)nameLabel introLabel:(UILabel *)introLabel{
    imageView.image = nil;
    nameLabel.text = nil;
    introLabel.text = nil;
}

+(void)setTextColor:(UILabel *)label title:(NSString *)title{
    label.textColor = [UIColor purpleColor];
    label.font = [UIFont systemFontOfSize:14];
    label.text = title;
}

+(void)setLayer:(UILabel *)label
{
    label.layer.cornerRadius = 10;
    label.layer.borderWidth = 0.5f;
    label.textColor = [UIColor greenColor];
}
@end
