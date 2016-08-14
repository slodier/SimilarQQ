//
//  TableViewCell.h
//  娶老婆
//
//  Created by 736376103@qq.com on 16/3/25.
//  Copyright © 2016年 736376103@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListModel.h"
#import "GroupModel.h"
@interface TableViewCell : UITableViewCell
@property(nonatomic,strong)ListModel *listModel;
+(instancetype)tableCell:(UITableView *)tableView;
@end
