//
//  FriendsActionTableViewCell.h
//  娶老婆
//
//  Created by 736376103@qq.com on 16/3/27.
//  Copyright © 2016年 736376103@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZoneModel;

@interface FriendsActionTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *friendImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *introductionLabel;

@property(nonatomic,strong)ZoneModel *zoneModel;

@property(nonatomic,assign)CGFloat height;

@end
