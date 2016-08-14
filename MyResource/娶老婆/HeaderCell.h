//
//  HeaderCell.h
//  娶老婆
//
//  Created by 736376103@qq.com on 16/3/26.
//  Copyright © 2016年 736376103@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GroupModel.h"
@class HeaderCell;

@protocol HeaderCellDelegate <NSObject>

-(void)tableData:(HeaderCell *)headerCell;

@end

@interface HeaderCell : UITableViewHeaderFooterView
@property(nonatomic,weak)id<HeaderCellDelegate>delegate;
@property(nonatomic,strong)GroupModel *groupModel;

+(instancetype)tableViewHeader:(UITableView *)tableView;


@end
