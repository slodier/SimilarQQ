//
//  ChatTableViewCell.m
//  娶老婆
//
//  Created by 736376103@qq.com on 16/3/30.
//  Copyright © 2016年 736376103@qq.com. All rights reserved.
//

#import "ChatTableViewCell.h"

@implementation ChatTableViewCell

- (void)awakeFromNib {
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.frame = _OtherLabel.frame;
    UIImage *image = [UIImage imageNamed:@"SenderTextNodeBkg.png"];
    image = [image stretchableImageWithLeftCapWidth:image.size.width *0.5 topCapHeight:image.size.height *0.5];
    [_OtherLabel addSubview:imageView];
}

- (UIView *)bubbleView:(NSString *)text {
    UIView *returnView = [[UIView alloc]initWithFrame:CGRectZero];
    //returnView.backgroundColor = [UIColor redColor];
    returnView.backgroundColor = [UIColor clearColor];
    
    UIImage *bubble = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"ReceiverTextNodeBkg.png" ofType:nil]];
    UIImageView *bubbleView = [[UIImageView alloc]initWithImage:[bubble stretchableImageWithLeftCapWidth:19 topCapHeight:10]];
    
    UIFont *font = [UIFont systemFontOfSize:13];
    CGSize size = [text sizeWithFont:font constrainedToSize:CGSizeMake(150, 1000) lineBreakMode:NSLineBreakByWordWrapping];
    NSLog(@"font size:%f,%f",size.width,size.height);
    
    UILabel *bubbleLabel = [[UILabel alloc]initWithFrame:CGRectMake(21.0f, 14.0f, size.width+10, size.height+10)];
    bubbleLabel.backgroundColor = [UIColor clearColor];
    bubbleLabel.font = font;
    bubbleLabel.numberOfLines = 0;
    bubbleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    bubbleLabel.text = text;
    
    bubbleView.frame = CGRectMake(0.0f, 0.0f, size.width+40, size.height+30);
    returnView.frame = CGRectMake(0.0f, 0.0f, size.width+40, size.height+50.0f);
    
    [self addSubview:returnView];
    [returnView addSubview:bubbleView];
    [returnView addSubview:bubbleLabel];
    
    return returnView;
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        
        _OtherLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 40, width-40, 30)];
        _OtherLabel.font = [UIFont systemFontOfSize:16];
        _OtherLabel.numberOfLines = 0;
        _OtherLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _OtherLabel.textAlignment = NSTextAlignmentRight;
          [self.contentView addSubview:_OtherLabel];
        
        _timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(width/2-20, 0, 40, 20)];
        _timeLabel.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_timeLabel];
        
        _meImageView = [[UIImageView alloc]initWithFrame:CGRectMake(width-40, 10, 30, 30)];
        _meImageView.image = [UIImage imageNamed:@"003"];
        [self.contentView addSubview:_meImageView];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

+ (instancetype)tableView:(UITableView *)tableView {
    ChatTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChatTableViewCell"];
    if (cell == nil) {
        cell = [[ChatTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ChatTableViewCell"];
    }
    return cell;
}


@end
