//
//  ZoneModel.h
//  娶老婆
//
//  Created by 736376103@qq.com on 16/3/27.
//  Copyright © 2016年 736376103@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZoneModel : NSObject

@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *text;
@property(nonatomic,copy)NSString *time;
@property(nonatomic,copy)NSString *imageUrl;

- (ZoneModel *)initWithDictory:(NSDictionary *)dict;

+ (ZoneModel *)zoneModel:(NSDictionary *)dict;

@end
