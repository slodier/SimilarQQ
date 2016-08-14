//
//  MusicViewController.m
//  娶老婆
//
//  Created by 736376103@qq.com on 16/3/27.
//  Copyright © 2016年 736376103@qq.com. All rights reserved.
//

#import "MusicViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "MusicModel.h"

@interface MusicViewController ()<AVAudioPlayerDelegate,UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)AVAudioPlayer *player;
@property(nonatomic,weak)NSTimer *timer;
@property(nonatomic,strong)NSArray *songs;
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,assign)int currentIndex;
@property(nonatomic,strong)MusicModel *playMusic;
@property(nonatomic, nonnull,strong)UIView *toolView;
@property(nonnull,strong,nonatomic)UITableView *tableView;
@end

@implementation MusicViewController
#pragma mark -- 播放器

- (void)play {
    if (![_player isPlaying]) {
        [_player play];
        _timer.fireDate = [NSDate distantPast];
    }
}

- (void)pause {
    if ([_player isPlaying]) {
        [_player pause];
        _timer.fireDate = [NSDate distantFuture];
    }
}

- (void)updateProgress
{
    float progress = _player.currentTime/_player.duration;
    [_progress setProgress:progress animated:YES];
}
#pragma mark -- TableView 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    NSArray *imageArray = @[@"001",@"002",@"003",@"004"];
    NSArray *songName = @[@"小幸运",@"听妈妈的话",@"Glad You Came",@"罂粟花冠"];
    //cell透明
    cell.backgroundColor = [UIColor clearColor];
    //cell点击变色
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    
    cell.imageView.image = [UIImage imageNamed:[imageArray objectAtIndex:indexPath.row]];
    cell.textLabel.text = songName[indexPath.row];
    cell.textLabel.textColor = [UIColor redColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        
        NSString *path = [[NSBundle mainBundle]pathForResource:@"双笙-小幸运.mp3" ofType:nil];
        NSURL *url = [NSURL fileURLWithPath:path];
        _player = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
        [_player prepareToPlay];
        [_player play];
        [self play];
        _player.numberOfLoops = 0;

    }else if (indexPath.row == 1){
        
        NSString *path = [[NSBundle mainBundle]pathForResource:@"听妈妈的话-周杰伦.mp3" ofType:nil];
        NSURL *url = [NSURL fileURLWithPath:path];
        _player = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
        [_player prepareToPlay];
        [_player play];
        _player.numberOfLoops = 0;
        [self play];

    }else if (indexPath.row == 2){
       
        NSString *path = [[NSBundle mainBundle]pathForResource:@"The Wanted-Glad You Came.mp3" ofType:nil];
        NSURL *url = [NSURL fileURLWithPath:path];
        _player = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
        [_player prepareToPlay];
        [_player play];
        _player.numberOfLoops = 0;
        [self play];

    }else if (indexPath.row == 3){
        
        NSString *path = [[NSBundle mainBundle]pathForResource:@"【镜音连·洛天依原创曲】罂粟花冠【JUSF周存】.mp3" ofType:nil];
        NSURL *url = [NSURL fileURLWithPath:path];
        _player = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
        [_player prepareToPlay];
        [_player play];
        _player.numberOfLoops = 0;
        [self play];
    }
}

#pragma mark -- TableView代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}
#pragma mark -- 按钮点击事件
- (void)playSongs
{
    if ([_player isPlaying]) {
        [_playOrPause setTitle:@"Play" forState:UIControlStateNormal];
      
        [self pause];
    }else{
        [_playOrPause setTitle:@"Pause" forState:UIControlStateNormal];
        
        [self play];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"音乐";
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
    _songs = @[@"双笙-小幸运",@"听妈妈的话-周杰伦.mp3",@"The Wanted-Glad You Came.mp3",@"【镜音连·洛天依原创曲】罂粟花冠【JUSF周存】.mp3"];
    _playMusic.filename = [_songs componentsJoinedByString:@""];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.toolView];
    [_toolView addSubview:self.playOrPause];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg_nav@2x"] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -- getter
//tableview的背景图片
- (UIImageView *)imageView {
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc]initWithFrame:self.view.frame];
        _imageView.image = [UIImage imageNamed:@"001JEtmD0jDskl.jpg"];
        //_imageView.userInteractionEnabled = YES;
    }
    return _imageView;
}
//播放器
- (AVAudioPlayer *)player {
    if (!_player) {
        
        NSString *path = [[NSBundle mainBundle]pathForResource:@"双笙-小幸运.mp3" ofType:nil];
        NSURL *url = [NSURL fileURLWithPath:path];
        _player = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
        [_player prepareToPlay];
        [_player play];
        _player.delegate = self;
        _player.numberOfLoops = 0;
    }
    return _player;
}
//定时器
- (NSTimer *)timer {
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateProgress) userInfo:nil repeats:true];
    }
    return _timer;
}
//按钮
- (UIButton *)playOrPause {
    if (!_playOrPause) {
        
        _playOrPause = [UIButton buttonWithType:UIButtonTypeCustom];
        [_playOrPause setTitle:@"Play" forState:UIControlStateNormal];
        [_playOrPause addTarget:self action:@selector(playSongs) forControlEvents:UIControlEventTouchUpInside];
        _playOrPause.frame = CGRectMake(self.view.frame.size.width/2-30, 3, 60, 46);
        self.playOrPause.layer.cornerRadius = 30;
        self.playOrPause.layer.borderWidth = 2;
        _playOrPause.backgroundColor = [UIColor redColor];
    
    }
    return _playOrPause;
}

- (UIView *)toolView {
    if (!_toolView) {
        _toolView = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-50, self.view.frame.size.width, 50)];
        _toolView.backgroundColor = [UIColor whiteColor];
    }
    return _toolView;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,64, self.view.frame.size.width, self.view.frame.size.height-114) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        //分割线不显示
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        _tableView.backgroundView = self.imageView;
    }
    return _tableView;
}

@end
