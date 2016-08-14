//
//  ListModel.h
//  娶老婆
//
//  Created by 736376103@qq.com on 16/3/26.
//  Copyright © 2016年 736376103@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListModel : NSObject
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *icon;
@property(nonatomic,strong)NSString *intro;
@property(nonatomic,assign,getter=isVip)BOOL vip;

-(instancetype)initWithList:(NSDictionary *)dict;
+(instancetype)listModel:(NSDictionary *)dict;
@end
