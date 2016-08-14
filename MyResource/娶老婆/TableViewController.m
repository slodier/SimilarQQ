//
//  TableViewController.m
//  娶老婆
//
//  Created by 736376103@qq.com on 16/3/26.
//  Copyright © 2016年 736376103@qq.com. All rights reserved.
//

#import "TableViewController.h"
#import "ListModel.h"
#import "GroupModel.h"
#import "TableViewCell.h"
#import "HeaderCell.h"
#import "ActionTableViewController.h"
#import "ChatViewController.h"
#import "UIImage+UIImageExtras.h"
#import "LabelLayer.h"
#import "MyToolbar.h"
@interface TableViewController ()<HeaderCellDelegate,UISearchBarDelegate,UIAlertViewDelegate>
@property(nonatomic,strong)NSArray *dataSource;
@property(nonatomic,strong)MyToolbar *myToolbar;
@property(nonatomic,strong)UITableView *tableview;
@end

@implementation TableViewController
#pragma mark -- 设置导航栏
-(void)setNavgationBar
{
    //导航栏背景颜色
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:31/255.0 green:183/255.0 blue:242/255.0 alpha:1];
    //导航栏标题和字体颜色
    self.navigationItem.title = @"联系人";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:20]}];
    //左侧按钮
    UIImage *icon = [UIImage imageNamed:@"原型头像"];
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    leftButton.frame = CGRectMake(0, 0, 40, 40);
    [leftButton setImage:icon forState:UIControlStateNormal];
    leftButton.layer.masksToBounds = YES;
    leftButton.layer.cornerRadius = 18;
    //leftButton.layer.borderWidth = 2;
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)viewDidLoad {
    [self.view addSubview:self.myToolbar];
    [self.view addSubview:self.tableview];
    [super viewDidLoad];
    [self setNavgationBar];
    self.view.backgroundColor = [UIColor whiteColor];
    _tableview.separatorStyle = NO;
}

#pragma mark -- headCell代理方法
-(void)tableData:(HeaderCell *)headerCell{
    NSIndexSet *index = [NSIndexSet indexSetWithIndex:headerCell.tag];
    [_tableview reloadSections:index withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    GroupModel *groupModel = _dataSource[section];
    if (groupModel.StateType) {
        return groupModel.friends.count;
    }else{
        return 0;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GroupModel *groupModel = _dataSource[indexPath.section];
    ListModel *listModel = groupModel.friends[indexPath.row];
    TableViewCell *cell = [TableViewCell tableCell:tableView];
    cell.listModel = listModel;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ChatViewController *chatView = [[ChatViewController alloc]init];
    GroupModel *groupModel = _dataSource[indexPath.section];
    ListModel *listModel = groupModel.friends[indexPath.row];
    chatView.titleString = listModel.name;
    [self.navigationController pushViewController:chatView animated:YES];
}
#pragma mark -- 代理方法
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
   
    if (section == 0) {
        
        UIView *view = [[UIView alloc]init];
        view.backgroundColor = [UIColor whiteColor];

        UILabel *nameL = [[UILabel alloc]initWithFrame:CGRectMake(10, 45, 30, 40)];
        [LabelLayer setTextColor:nameL title:@"姓名"];
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 45, (Kwidth-20)/2-30-15, 40)];
        [LabelLayer setLayer:_nameLabel];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        
        UILabel *introL = [[UILabel alloc]initWithFrame:CGRectMake(10, 90, 30, 40)];
        [LabelLayer setTextColor:introL title:@"简介"];
        _introLabel = [[UILabel alloc]initWithFrame:CGRectMake(40,90,Kwidth-10-40,40)];
        _introLabel.layer.cornerRadius = 10;
        _introLabel.layer.borderWidth = 0.5;
        _introLabel.textColor = [UIColor greenColor];
        _introLabel.font = [UIFont systemFontOfSize:12];
        
        UILabel *imageL = [[UILabel alloc]initWithFrame:CGRectMake(Kwidth/2, 45, 30, 40)];
        [LabelLayer setTextColor:imageL title:@"图片"];
        _friendImage = [[UIImageView alloc]initWithFrame:CGRectMake(Kwidth/2+50, 45, Kwidth/2-40-40, 40)];
        _friendImage.layer.cornerRadius = 8;
        _friendImage.layer.borderWidth = 0.5f;

        [view addSubview:imageL];
        [view addSubview:introL];
        [view addSubview:nameL];
        [view addSubview:_nameLabel];
        [view addSubview:_introLabel];
        [view addSubview:_friendImage];
        
         //headerview可操作
        _tableview.tableHeaderView.userInteractionEnabled = YES;
        //headerview去粘性
        _tableview.tableHeaderView = view;
        //搜索框
        UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(10, 10, Kwidth-20, 30)];
        searchBar.placeholder = @"搜索";
        [view addSubview:searchBar];
        searchBar.delegate = self;
        searchBar.showsScopeBar = YES;
        searchBar.layer.cornerRadius = 6;
        searchBar.layer.borderWidth = 0.5;
        searchBar.tintColor = [UIColor clearColor];
        _searchBar = searchBar;
       return view;
    }else{

    GroupModel *groupModel = _dataSource[section];
    HeaderCell *header = [HeaderCell tableViewHeader:tableView];
    header.groupModel = groupModel;
    header.delegate = self;
    header.tag = section;
    return header;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 140;
    }else if (section != 0){
        return 60;
    }
    return 0;
}
#pragma mark -- UISearchBar代理
-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    searchBar.showsCancelButton = YES;
    for(id cc in [searchBar.subviews[0]subviews]){
        if ([cc isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)cc;
            [btn setTitle:@"取消" forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
    }
    return YES;
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
    searchBar.text = @"";
    searchBar.showsCancelButton = NO;
    [LabelLayer imageView:_friendImage nameLabel:_nameLabel introLabel:_introLabel];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [_searchBar resignFirstResponder];
    [self doSearch];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [_searchBar resignFirstResponder];
}

#pragma mark -- searchbar搜索方法
- (void)doSearch{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"friends.plist" ofType:nil];
    NSArray *array = [[NSArray alloc]initWithContentsOfFile:path];
    for(NSDictionary *dict in array){
        NSArray *di = dict[@"friends"];
        
        NSDictionary *dii = nil;
        for(NSDictionary *nameDic in di){
            NSString *name = nameDic[@"name"];
            if ([name isEqualToString:_searchBar.text]) {
                dii = nameDic;
                _nameLabel.text = name;
                break;
            }
        }
        if (dii) {
            _friendImage.image = [UIImage imageNamed:dii[@"icon"]];
            _introLabel.text = dii[@"intro"];
        }
    }
}

#pragma mark -- 按钮点击方法
-(void)actionClick{
    ActionTableViewController *actionView = [[ActionTableViewController alloc]init];
    [self.navigationController pushViewController:actionView animated:NO];
}

-(void)chatClick{
    ChatViewController *chatView = [[ChatViewController alloc]init];
    [self.navigationController pushViewController:chatView animated:NO];
}

#pragma mark -- getter
#pragma mark -- 加载数据
- (NSArray *)dataSource{
    if (!_dataSource) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"friends.plist" ofType:nil];
        NSArray *array = [[NSArray alloc]initWithContentsOfFile:path];
        
        NSMutableArray *mutableArray = [NSMutableArray array];
        for(NSDictionary *dict in array){
            GroupModel *groupModel = [GroupModel GroupModel:dict];
            [mutableArray addObject:groupModel];
        }
        _dataSource = mutableArray;
    }
    return _dataSource;
}


- (MyToolbar *)myToolbar{
    if (!_myToolbar) {
        _myToolbar = [[MyToolbar alloc]initWithFrame:CGRectMake(0, Kheight-44, Kwidth, 44)];
        [_myToolbar.noteBtn addTarget:self action:@selector(chatClick) forControlEvents:UIControlEventTouchUpInside];
        [_myToolbar.actionBtn addTarget:self action:@selector(actionClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _myToolbar;
}

- (UITableView *)tableview{
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Kwidth, Kheight-108) style:UITableViewStylePlain];
        _tableview.delegate = self;
        _tableview.dataSource = self;
    }
    return _tableview;
}
@end
