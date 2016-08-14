//
//  FriendActionTableViewController.m
//  娶老婆
//
//  Created by 736376103@qq.com on 16/3/26.
//  Copyright © 2016年 736376103@qq.com. All rights reserved.
//

#import "FriendActionTableViewController.h"
#import "FriendsActionTableViewCell.h"
@interface FriendActionTableViewController ()
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)NSArray *dataSource;
@property(nonatomic,strong)NSArray *imageArray;
@property(nonatomic,strong)NSArray *timeArray;
@property(nonatomic,strong)NSArray *nameArray;
@end

@implementation FriendActionTableViewController
static NSString *ID = @"FriendsActionTableViewCell";

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _dataSource = [[NSMutableArray alloc]init];
    }
    return self;
}

#pragma mark -- 设置navgation
- (void)creatNavgationbar {
    self.navigationItem.title = @"好友动态";
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatNavgationbar];
    
    UINib *nib = [UINib nibWithNibName:ID bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:ID];
    
    _dataSource = @[@"他不辞辛苦的活跃在各种应用题、作文中，是小学课本甚至是题海中当之无愧的头号男主角。且常常与小芳，小强，小丽，小红，小刚，小军、小华、小敏合作学习，并称数学界九大金刚。",@"大家好，我叫老王，住在你们隔壁，有困难请找我，不要问我问题，爱过，我没钱，救我妈，不约！谢谢"];
    
    UIImage *image1 = [UIImage imageNamed:@"004"];
    UIImage *image2 = [UIImage imageNamed:@"003"];
    _imageArray = [NSArray arrayWithObjects:image1,image2, nil];
    _timeArray = @[@"19：12",@"12：34"];
    _nameArray = @[@"小明",@"老王"];
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
static NSString *ID = @"FriendsActionTableViewCell";
    FriendsActionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[FriendsActionTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.nameLabel.text = _nameArray[indexPath.row];
    cell.timeLabel.text = _timeArray[indexPath.row];
    cell.friendImage.image = _imageArray[indexPath.row];
    cell.introductionLabel.text = _dataSource[indexPath.row];
    cell.introductionLabel.numberOfLines = 0;
    

    return cell;
}
#pragma mark -- TableView Delegate
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *view = [[UIView alloc]init];
    self.tableView.tableHeaderView = view;
    UIImage *image = [UIImage imageNamed:@"1149955_1407987640810179.jpg"];
    _imageView = [[UIImageView alloc]initWithImage:image];
    _imageView.frame = CGRectMake(0, 0, self.view.bounds.size.width, 200);
    _imageView.backgroundColor = [UIColor redColor];
    UIButton *userButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [userButton setImage:[UIImage imageNamed:@"原型头像"] forState:UIControlStateNormal];
    userButton.frame = CGRectMake(10, 100, 80, 80);
    
    UILabel *todayVisitorLable = [[UILabel alloc]initWithFrame:CGRectMake(200, 120, 100, 20)];
    todayVisitorLable.text = @"今日访客";
    todayVisitorLable.textColor = [UIColor blackColor];
    UILabel *todayNumber = [[UILabel alloc]initWithFrame:CGRectMake(280, 120, 50, 20)];
    todayNumber.text = @"0";
    todayNumber.textColor = [UIColor colorWithRed:250/255.0 green:188/255.0 blue:46/255.0 alpha:1];
    
    UILabel *totoalVisitorLable = [[UILabel alloc]initWithFrame:CGRectMake(200, 150, 100, 20)];
    UILabel *totalNUmber = [[UILabel alloc]initWithFrame:CGRectMake(280, 150, 50, 20)];
    totoalVisitorLable.text = @"总浏览量";
    totoalVisitorLable.textColor = [UIColor blackColor];
    totalNUmber.text = @"2667";
    totalNUmber.textColor = [UIColor colorWithRed:250/255.0 green:188/255.0 blue:46/255.0 alpha:1];
    
    [_imageView addSubview:totalNUmber];
    [_imageView addSubview:todayNumber];
    [_imageView addSubview:totoalVisitorLable];
    [_imageView addSubview:todayVisitorLable];
    [_imageView addSubview:userButton];
    [view addSubview:_imageView];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
 
    return 200;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 200;
}
@end
