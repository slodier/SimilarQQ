//
//  TextModel.m
//  娶老婆
//
//  Created by 736376103@qq.com on 16/4/4.
//  Copyright © 2016年 736376103@qq.com. All rights reserved.
//

#import "TextModel.h"
#import <sqlite3.h>
#import "Text.h"
@implementation TextModel
static sqlite3 *_database;

- (NSString *)filename {
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    NSLog(@"%@",path);
    return [path stringByAppendingPathComponent:@"LOVE.sqlite"];
}

- (BOOL)openDB {
    NSString *path = [self filename];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL find = [fileManager fileExistsAtPath:path];
    if (find) {
        NSLog(@"database存在");
        
        if (sqlite3_open([path UTF8String], &_database)!=SQLITE_OK) {
            sqlite3_close(_database);
            NSLog(@"打开database失败");
            return NO;
        }
        [self createList:_database];
        return YES;
    }
    if (sqlite3_open(path.UTF8String, &_database) == SQLITE_OK) {
        [self createList:_database];
        return YES;
    }else{
        sqlite3_close(_database);
        NSLog(@"打开database失败");
        return NO;
    }
    return NO;
}

- (BOOL)createList:(sqlite3 *)db {
    NSString *sql = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS DRINK(userText TEXT,currentTime TEXT)"];
    sqlite3_stmt *stmt;
    NSInteger sqlReturn = sqlite3_prepare_v2(_database, sql.UTF8String, -1, &stmt, NULL);
    if (sqlReturn != SQLITE_OK) {
        NSLog(@"创建表失败");
        return NO;
    }
    int success = sqlite3_step(stmt);
    sqlite3_finalize(stmt);
    if (success != SQLITE_DONE) {
        NSLog(@"创建表失败");
        return NO;
    }
    NSLog(@"创建表成功");
    return YES;
}

- (BOOL)insertList:(Text *)insertList {
    if ([self openDB]) {
        sqlite3_stmt *stmt;
        NSString *sql = [NSString stringWithFormat:@"INSERT INTO DRINK(userText,currentTime)VALUES(?,?)"];
        //int success = sqlite3_exec(_database, sql.UTF8String, NULL, NULL, &error);
        int success = sqlite3_prepare_v2(_database, sql.UTF8String, -1, &stmt, NULL);
        if (success != SQLITE_OK) {
            NSLog(@"insert failed");
            sqlite3_close(_database);
            return NO;
        }
        sqlite3_bind_text(stmt, 1, [insertList.userText UTF8String], -1, SQLITE_TRANSIENT);
        sqlite3_bind_text(stmt, 2, [insertList.currentTime UTF8String], -1, SQLITE_TRANSIENT);
        success = sqlite3_step(stmt);
        sqlite3_finalize(stmt);
        
        if (success == SQLITE_ERROR) {
            NSLog(@"failed insert into database");
            sqlite3_close(_database);
            return NO;
        }
        sqlite3_close(_database);
        return YES;
    }
    return NO;
}

- (NSMutableArray *)getList {
    NSMutableArray *array = nil;
    if ([self openDB]) {
        sqlite3_stmt *stmt;
        NSString *sql = [NSString stringWithFormat:@"SELECT userText,currentTime FROM DRINK"];
        if (sqlite3_prepare_v2(_database, sql.UTF8String, -1, &stmt, NULL) != SQLITE_OK) {
            NSLog(@"failed to get list");
            //return NO;
        }else{
            array = [NSMutableArray array];
            while (sqlite3_step(stmt) == SQLITE_ROW) {
                Text *p = [[Text alloc]init];
                char *strText = (char *)sqlite3_column_text(stmt, 0);
                if (strText != nil) {
                    p.userText = [NSString stringWithUTF8String:strText];
                }
                
                
                char *strTime = (char *)sqlite3_column_text(stmt, 1);
                if (strTime != nil) {
                    p.currentTime = [NSString stringWithUTF8String:strTime];
                }
                [array addObject:p];
            }
        }
        sqlite3_finalize(stmt);
        sqlite3_close(_database);
    }
    return array;
}

- (BOOL)updateList:(Text *)updateList {
    if ([self openDB]) {
        sqlite3_stmt *stmt;
        char *sql = "UPDATE DRINK set userText = ? and currentTime = ?";
        int success = sqlite3_prepare_v2(_database, sql, -1, &stmt, NULL);
        if (success != SQLITE_OK) {
            NSLog(@"failed to update:DRINK");
            sqlite3_close(_database);
            return NO;
        }
        sqlite3_bind_text(stmt, 1, [updateList.userText UTF8String], -1, SQLITE_TRANSIENT);
        sqlite3_bind_text(stmt, 2, [updateList.currentTime UTF8String], -1, SQLITE_TRANSIENT);
        success = sqlite3_step(stmt);
        sqlite3_finalize(stmt);
    
        if (success == SQLITE_ERROR) {
            NSLog(@"failed to update with message");
            sqlite3_close(_database);
            return NO;
        }
        sqlite3_close(_database);
        return YES;
    }
    return NO;
}
@end
