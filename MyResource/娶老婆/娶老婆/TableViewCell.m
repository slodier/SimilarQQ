
//
//  TableViewCell.m
//  娶老婆
//
//  Created by 736376103@qq.com on 16/3/25.
//  Copyright © 2016年 736376103@qq.com. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

-(void)setListModel:(ListModel *)listModel{
    _listModel = listModel;
    self.imageView.image = [UIImage imageNamed:listModel.icon];
    self.textLabel.text = listModel.name;
    self.detailTextLabel.text = listModel.intro;
    self.textLabel.textColor = listModel.isVip?[UIColor redColor]:[UIColor blackColor];
}

+(instancetype)tableCell:(UITableView *)tableView{
NSString *ID = @"Cell_id";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[TableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}
@end
