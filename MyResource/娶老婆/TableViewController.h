//
//  TableViewController.h
//  娶老婆
//
//  Created by 736376103@qq.com on 16/3/26.
//  Copyright © 2016年 736376103@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UISearchBar *searchBar;
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UILabel *introLabel;
@property(nonatomic,strong)UIImageView *friendImage;
@end
