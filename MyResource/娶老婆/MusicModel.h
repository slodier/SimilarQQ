//
//  MusicModel.h
//  娶老婆
//
//  Created by 736376103@qq.com on 16/3/29.
//  Copyright © 2016年 736376103@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MusicModel;
@interface MusicModel : NSObject
@property(nonatomic,copy)NSString *filename;

+ (BOOL)PlayWithFilename:(NSString *)filename;


+ (void)pauseMusic:(NSString *)filename;
@end
