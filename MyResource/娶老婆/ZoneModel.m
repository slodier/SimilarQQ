//
//  ZoneModel.m
//  娶老婆
//
//  Created by 736376103@qq.com on 16/3/27.
//  Copyright © 2016年 736376103@qq.com. All rights reserved.
//

#import "ZoneModel.h"

@implementation ZoneModel

- (ZoneModel *)initWithDictory:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        self.name = dict[@"name"];
        self.imageUrl = dict[@"imageUrl"];
        self.time = dict[@"time"];
        self.text = dict[@"text"];
    }
    return self;
}

+ (ZoneModel *)zoneModel:(NSDictionary *)dict {
    ZoneModel *zoneModel = [[ZoneModel alloc]initWithDictory:dict];
    return zoneModel;
}

@end
