//
//  ChatViewController.m
//  娶老婆
//
//  Created by 736376103@qq.com on 16/3/30.
//  Copyright © 2016年 736376103@qq.com. All rights reserved.
//

#import "ChatViewController.h"
#import "ChatTableViewCell.h"
#import "Text.h"
#import "TextModel.h"
@interface ChatViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>

@property (nonatomic,strong) UITextField    *field;
@property (nonatomic,strong) NSMutableArray *dataSource;
@property (nonatomic,strong) TextModel      *textModel;

@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self reloadDataSource];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.field];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationItem.title = _titleString;
    //添加通知
    [self addNotification];
}

- (void)addNotification{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardFrame:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardFrame:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)reloadDataSource{
    if (_textModel == nil) {
    _textModel  = [[TextModel alloc]init];
    }
    _dataSource = [_textModel getList];
}

- (void)keyboardFrame:(NSNotification *)notification{
    NSDictionary *userinfo = [notification userInfo];
    NSValue *value         = [userinfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGFloat keyboardEndY   = value.CGRectValue.origin.y;
    
    NSNumber *duration = [userinfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curve = [userinfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
    
    [UIView animateWithDuration:duration.doubleValue animations:^{
        [UIView setAnimationBeginsFromCurrentState:YES];
        [UIView setAnimationCurve:[curve intValue]];
        self.view.center = CGPointMake(self.view.center.x, keyboardEndY - Kheight/2);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

- (void)viewWillDisappear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (void)sendMessageContent:(NSString *)text{
    NSDate *date = [NSDate date];
    NSDateFormatter *dateForMatter = [[NSDateFormatter alloc]init];
    dateForMatter.dateFormat = @"hh:mm";
    NSString *timeString = [dateForMatter stringFromDate:date];
    
    Text *t       = [[Text alloc]init];
    t.currentTime = timeString;
    t.userText    = text;
    [_textModel insertList:t];

}
#pragma mark -- UIScrollView代理
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [_field resignFirstResponder];
    self.view.frame = CGRectMake(0, 0, Kwidth, Kheight);
}
#pragma mark -- UITextField代理
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    self.view.frame = CGRectMake(0, 0, Kwidth, Kheight);
    [self sendMessageContent:textField.text];
    [textField resignFirstResponder];

    textField.text = @"";
    [self reloadDataSource];
    [_tableView reloadData];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    self.view.frame = CGRectMake(0, -257, Kwidth, Kheight);
}
#pragma mark -- TableView数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    Text *p = _dataSource[indexPath.row];
    
    ChatTableViewCell *cell = [ChatTableViewCell tableView:tableView];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.timeLabel.text = p.currentTime;
    //[cell bubbleView:p.userText];
    cell.OtherLabel.text = p.userText;
    //滚动到最新消息,引掉的原因是,始终都在最下层，无法向上滚动，可以试一下
    
//    NSIndexPath *lastPath = [NSIndexPath indexPathForRow:_dataSource.count-1 inSection:0];
//        [_tableView scrollToRowAtIndexPath:lastPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
//    
        return cell;
}

#pragma mark -- TableView 代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}
#pragma mark -- getter
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Kwidth, Kheight-60) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (UITextField *)field{
    if (!_field) {
        _field = [[UITextField alloc]init];
        _field.frame = CGRectMake(20, Kheight-60, Kwidth-40, 44);
        _field.layer.cornerRadius = 20;
        _field.layer.borderWidth = 0.5f;
        _field.delegate = self;
        _field.returnKeyType = UIReturnKeyDone;
    }
    return _field;
}
@end
