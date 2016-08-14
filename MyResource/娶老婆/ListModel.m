//
//  ListModel.m
//  娶老婆
//
//  Created by 736376103@qq.com on 16/3/26.
//  Copyright © 2016年 736376103@qq.com. All rights reserved.
//

#import "ListModel.h"

@implementation ListModel

-(instancetype)initWithList:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)listModel:(NSDictionary *)dict{
    return [[self alloc]initWithList:dict];
}
@end
