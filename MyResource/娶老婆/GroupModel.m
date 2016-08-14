//
//  GroupModel.m
//  娶老婆
//
//  Created by 736376103@qq.com on 16/3/26.
//  Copyright © 2016年 736376103@qq.com. All rights reserved.
//

#import "GroupModel.h"
#import "ListModel.h"
@implementation GroupModel

-(instancetype)initWithViewModel:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
        NSMutableArray *mutableArray = [NSMutableArray array];
        for(NSDictionary *dict in self.friends){
            ListModel *listModel = [ListModel listModel:dict];
            [mutableArray addObject:listModel];
        }
        self.friends = mutableArray;
    }
    return self;
}

+(instancetype)GroupModel:(NSDictionary *)dict{
    return [[self alloc]initWithViewModel:dict];
}

@end
