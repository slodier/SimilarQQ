//
//  FriendsActionTableViewCell.m
//  娶老婆
//
//  Created by 736376103@qq.com on 16/3/27.
//  Copyright © 2016年 736376103@qq.com. All rights reserved.
//

#import "FriendsActionTableViewCell.h"

@implementation FriendsActionTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubview];
    }
    return self;
}

- (void)initSubview {
    _introductionLabel.numberOfLines = 0;
    _introductionLabel.lineBreakMode = NSLineBreakByWordWrapping;
}

@end
