//
//  ChatViewController.h
//  娶老婆
//
//  Created by 736376103@qq.com on 16/3/30.
//  Copyright © 2016年 736376103@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChatViewController : UIViewController
@property (strong, nonatomic) UITextField *textField;
@property (strong, nonatomic) UIButton    *voiceBtn;
@property (strong, nonatomic) UIButton    *faceBtn;
@property (strong, nonatomic) UITableView *tableView;
@property (copy,   nonatomic) NSString    *titleString;
@end
