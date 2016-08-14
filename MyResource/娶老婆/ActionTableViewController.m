//
//  ActionTableViewController.m
//  娶老婆
//
//  Created by 736376103@qq.com on 16/3/26.
//  Copyright © 2016年 736376103@qq.com. All rights reserved.
//

#import "ActionTableViewController.h"
#import "TableViewController.h"
#import "FriendActionTableViewController.h"
#import "MusicViewController.h"
#import "PhotoViewController.h"
#import "ChatViewController.h"
#import "MapViewController.h"
#import "WebViewController.h"
#import "UIImage+UIImageExtras.h"
#import "PoTuViewController.h"
#import "MyToolbar.h"
@interface ActionTableViewController ()
@property(nonatomic,strong)NSArray *dataSource;
@property(nonatomic,strong)MyToolbar *myToolbar;
@property(nonatomic,strong)UITableView *tabelView;
@end

@implementation ActionTableViewController

- (void)setNavgationBar
{
    //导航栏背景颜色
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:31/255.0 green:183/255.0 blue:242/255.0 alpha:1];
    //导航栏标题和字体颜色
    self.navigationItem.title = @"动态";
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
    [super viewDidLoad];
    [self setNavgationBar];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tabelView];
    [self.view addSubview:self.myToolbar];
    _dataSource = @[@"音乐",@"照片"];
    //分割线为空
    _tabelView.separatorStyle = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
    }
    cell.font = [UIFont systemFontOfSize:22];
    cell.textLabel.text = _dataSource[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        MusicViewController *view = [[MusicViewController alloc]init];
        [self.navigationController pushViewController:view animated:YES];
    }else if (indexPath.row == 1){
        PhotoViewController *view = [[PhotoViewController alloc]init];
        [self.navigationController pushViewController:view animated:YES];
    }
}
#pragma mark -- 代理方法
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc]init];
    
    UIButton *seacrhButton = [UIButton buttonWithType:UIButtonTypeCustom];
    seacrhButton.frame = CGRectMake(10, 10, self.view.bounds.size.width-20, 30);
    [seacrhButton setTitle:@"" forState:UIControlStateNormal];
    [seacrhButton setBackgroundImage:[UIImage imageNamed:@"２.jpg"] forState:UIControlStateNormal];
    [seacrhButton addTarget:self action:@selector(webView) forControlEvents:UIControlEventTouchUpInside];
  
    [seacrhButton setImageEdgeInsets:UIEdgeInsetsMake(0, -20, 0, 0)];
    [seacrhButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    seacrhButton.backgroundColor = [UIColor colorWithRed:238/255.0 green:239/255.0 blue:242/255.0 alpha:1];
    seacrhButton.layer.cornerRadius = 6.2;
    seacrhButton.layer.borderWidth = 0.1f;
    
    UIButton *friendActionButton = [UIButton buttonWithType:UIButtonTypeCustom];
    friendActionButton.frame = CGRectMake(20, 50, 75, 100);
    [friendActionButton addTarget:self action:@selector(friendActionButton) forControlEvents:UIControlEventTouchUpInside];
    [friendActionButton setImage:[UIImage imageNamed:@"好友动态"] forState:UIControlStateNormal];
    
    UIButton *nearButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [nearButton setImage:[UIImage imageNamed:@"附近"] forState:UIControlStateNormal];
    [nearButton addTarget:self action:@selector(userLocation) forControlEvents:UIControlEventTouchUpInside];
    nearButton.frame = CGRectMake(self.view.frame.size.width/2-37.5, 50, 75, 100);
    
    UIButton *hobbyButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [hobbyButton addTarget:self action:@selector(hobbyClick) forControlEvents:UIControlEventTouchUpInside];
    [hobbyButton setImage:[UIImage imageNamed:@"兴趣部落"] forState:UIControlStateNormal];
    hobbyButton.frame = CGRectMake(self.view.frame.size.width-95, 50, 75, 100);
    
    UIView *contentView = [[UIView alloc]initWithFrame:CGRectMake(0, 160, self.view.bounds.size.width, 20)];
    contentView.backgroundColor = [UIColor colorWithRed:247/255.0 green:247/255.0 blue:249/255.0 alpha:1];
    
    [view addSubview:seacrhButton];
    [view addSubview:contentView];
    [view addSubview:hobbyButton];
    [view addSubview:friendActionButton];
    [view addSubview:nearButton];
    self.tabelView.tableHeaderView = view;
    return view;
}
//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
//头高
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 190;
}

#pragma mark --- 按钮点击方法
- (void)hobbyClick {
    PoTuViewController *potuView = [[PoTuViewController alloc]init];
    [self.navigationController pushViewController:potuView animated:YES];
}

- (void)friendsClick {
    TableViewController *view = [[TableViewController alloc]init];
    [self.navigationController pushViewController:view animated:NO];
}

- (void)friendActionButton {
    FriendActionTableViewController *view = [[FriendActionTableViewController alloc]init];
    [self.navigationController pushViewController:view animated:YES];
}

- (void)moveController
{
    ChatViewController *chatView = [[ChatViewController alloc]init];
    [self.navigationController pushViewController:chatView animated:NO];
}

- (void)userLocation {
    MapViewController *mapView = [[MapViewController alloc]init];
    [self.navigationController pushViewController:mapView animated:YES];
}

- (void)webView {
    WebViewController *webView = [[WebViewController alloc]init];
    [self.navigationController pushViewController:webView animated:YES];
}
#pragma mark -- getter
- (UITableView *)tabelView {
    if (!_tabelView) {
        _tabelView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Kwidth, Kheight-44) style:UITableViewStylePlain];
        _tabelView.delegate = self;
        _tabelView.dataSource = self;
    }
    return _tabelView;
}

- (MyToolbar *)myToolbar {
    if (!_myToolbar) {
        _myToolbar = [[MyToolbar alloc]initWithFrame:CGRectMake(0, Kheight-44, Kwidth, 44)];
        [_myToolbar.noteBtn addTarget:self action:@selector(moveController) forControlEvents:UIControlEventTouchUpInside];
        [_myToolbar.friendsBtn addTarget:self action:@selector(friendsClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _myToolbar;
}
@end
