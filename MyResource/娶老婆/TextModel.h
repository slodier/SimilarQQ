//
//  TextModel.h
//  娶老婆
//
//  Created by 736376103@qq.com on 16/4/4.
//  Copyright © 2016年 736376103@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
@class Text;
@interface TextModel : NSObject

- (BOOL)createList:(sqlite3 *)db;
- (BOOL)insertList:(Text *)insertList;
- (NSMutableArray *)getList;
- (BOOL)updateList:(Text *)updateList;
@end
