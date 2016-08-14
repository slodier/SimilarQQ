//
//  GroupModel.h
//  娶老婆
//
//  Created by 736376103@qq.com on 16/3/26.
//  Copyright © 2016年 736376103@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GroupModel : NSObject
@property(nonatomic,strong)NSArray *friends;
@property(nonatomic,strong)NSString *online;
@property(nonatomic,strong)NSString *name;

@property(nonatomic,assign,getter=StateType)BOOL state;

-(instancetype)initWithViewModel:(NSDictionary *)dict;
+(instancetype)GroupModel:(NSDictionary *)dict;
@end
