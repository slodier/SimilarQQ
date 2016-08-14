//
//  ChatTableViewCell.h
//  娶老婆
//
//  Created by 736376103@qq.com on 16/3/30.
//  Copyright © 2016年 736376103@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChatTableViewCell : UITableViewCell

@property (strong, nonatomic) UILabel     *timeLabel;
@property (strong, nonatomic) UIButton    *MeBtn;
@property (strong, nonatomic) UIButton    *OtherBtn;
@property (strong, nonatomic) UILabel     *MeLabel;
@property (strong, nonatomic) UILabel     *OtherLabel;
@property (strong,nonatomic ) UIImageView *meImageView;

- (UIView *)bubbleView:(NSString *)text;
+ (instancetype)tableView:(UITableView *)tableView;
@end
