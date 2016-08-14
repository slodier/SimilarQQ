//
//  PoTuViewController.m
//  娶老婆
//
//  Created by 736376103@qq.com on 16/4/7.
//  Copyright © 2016年 736376103@qq.com. All rights reserved.
//

#import "PoTuViewController.h"
#import "CollectionViewCell.h"
#import "UIImage+GIF.h"
@interface PoTuViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic,strong)NSArray *dataSource;
@property(nonatomic,strong)UICollectionView *collect;
@end

@implementation PoTuViewController
static NSString *CELL_ID = @"CollectionViewCell.h";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createCollectionView];
    [self loadData];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationItem.title = @"破图";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark -- 加载数据
- (void)loadData {
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://test.doutu.zen110.com/picTest/picture.php"]];
    NSString *JSONString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSArray *array = [NSJSONSerialization JSONObjectWithData:[JSONString dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:nil];
    _dataSource = array;
    [_collect reloadData];
}

#pragma mark -- 数据源方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CELL_ID forIndexPath:indexPath];
    
     NSDictionary *dic = _dataSource[indexPath.row];
    NSString *thumUrl = dic[@"thumUrl"];
    NSString *imageUrl = [@"http://test.doutu.zen110.com" stringByAppendingString:thumUrl];
    NSString *esaUrl = [imageUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:esaUrl]];
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImage *image = [UIImage sd_animatedGIFWithData:imageData];
            CollectionViewCell *cell1 = (CollectionViewCell *)cell;
            cell1.imageView.image = image;
        });
    });
    return cell;
}
//创建CollectionView
- (void)createCollectionView {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake((self.view.frame.size.width-100)/2, 120);
    _collect = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 10, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:flowLayout];
    _collect.delegate = self;
    _collect.dataSource = self;
    [_collect registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:CELL_ID];
    _collect.backgroundColor = [UIColor colorWithRed:207/255.0 green:92/255.0 blue:146/255.0 alpha:1];
    [self.view addSubview:_collect];
}
@end
