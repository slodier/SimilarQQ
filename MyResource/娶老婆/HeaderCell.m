//
//  HeaderCell.m
//  娶老婆
//
//  Created by 736376103@qq.com on 16/3/26.
//  Copyright © 2016年 736376103@qq.com. All rights reserved.
//

#import "HeaderCell.h"

@interface HeaderCell ()

@property(nonatomic,strong)UIButton *button;
@property(nonatomic,strong)UILabel *label;

@end

@implementation HeaderCell

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        UIButton *button  = [[UIButton alloc]init];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        button.imageView.contentMode = UIViewContentModeCenter;
        button.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
        
        button.imageView.clipsToBounds = NO;
        [button addTarget:self action:@selector(ButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        self.button = button;
        [self addSubview:_button];
        
        UILabel *label = [[UILabel alloc]init];
        self.label = label;
        [self addSubview:_label];
    }
    return self;
}

-(void)setGroupModel:(GroupModel *)groupModel{
    _groupModel = groupModel;
    [_button setTitle:groupModel.name forState:UIControlStateNormal];
    _label.text = [NSString stringWithFormat:@"%@/%ld",groupModel.online,groupModel.friends.count];   
    
    if (self.groupModel.StateType) {
        _button.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    }else{
        _button.imageView.transform = CGAffineTransformMakeRotation(0);
    }
}

+(instancetype)tableViewHeader:(UITableView *)tableView{
    NSString *ID = @"ID_header";
    HeaderCell *tableHeader = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (tableHeader == nil) {
        tableHeader = [[HeaderCell alloc]initWithReuseIdentifier:ID];
    }
    return tableHeader;
}

-(void)layoutSubviews{
    _button.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
    _label.frame = CGRectMake(self.bounds.size.width-60, 0, 50, CGRectGetHeight(self.bounds));
}

-(void)ButtonClick:(UIButton *)sender{
    self.groupModel.state = !self.groupModel.state;
    if ([self.delegate respondsToSelector:@selector(tableData:)]) {
        [self.delegate tableData:self];
    }
}
@end
