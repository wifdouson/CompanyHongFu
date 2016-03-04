//
//  MobileData+Original.m
//  HongFuTong
//
//  Created by apple on 16/3/4.
//  Copyright © 2016年 hp. All rights reserved.
//

#import "MobileData+Original.h"

@implementation MobileData (Original)


- (BOOL)isExistOriginalLoginStatus{
    if ([self.fmDatabase  open]) {
        FMResultSet * rs=[self.fmDatabase executeQuery:@"select statusData from StatusTable where statusType = ?",OriginalLogin];
        if (rs!=nil) {
            if ([rs next]) {
                [rs close];
                return YES ;
            }else{
                return NO;
            }
        }else{
            DLog(@"FMResultSet 初始化失败");
        }
    }
    DLog(@"数据库未打开");
    return NO;
}

//OriginalLogin 为 true时，说明是第一次登陆，如为false。说明之前已经登陆过了
- (BOOL)getOriginalStatus{
    if ([self.fmDatabase open]) {
        FMResultSet * rs=[self.fmDatabase executeQuery:@"select statusData from StatusTable where statusType = ?",OriginalLogin];
        if (rs!=nil) {
            if ([rs next]) {
                NSString * status=[rs stringForColumn:@"statusData"];
                return [status boolValue];
            }
        }else{
            DLog(@"未获取到数据");
        }
    }
    return NO;
}

#pragma mark --第一次需要插入 1 数据 表示还没有登陆过启动页
- (BOOL)insertOriginalLoginStatus{
    
    if ([self.fmDatabase open]) {
        
        if ([self isExistOriginalLoginStatus]) {
                DLog(@"已经存在数据")
        }else{
            [self.fmDatabase beginTransaction];
            BOOL status=[self.fmDatabase executeUpdate:@"insert into StatusTable (statusType,statusData) values (?,?)",OriginalLogin,StatusTrue];
            if (status) {
                DLog(@"fmdb success");
            }else{
                [self.fmDatabase rollback];
                DLog(@"fmdb rollback");
            }
            
            [self.fmDatabase commit];
            return status;
        }
    }
        
    DLog(@"数据库未打开");
    return NO;
}
#pragma mark --更改original login 数据
//  [self.fmDatabase executeUpdate:@"UPDATE TK_QUESTION_OPTION SET quesOption = ?,sequence = ? WHERE questionID = ? and quesValue = ?",quesOption,sequence,questionID,quesValue];
//1 表示未登录，0 表示已经登陆过了
- (BOOL)updateOriginalLoginStatus{
    if ([self.fmDatabase open]) {
        [self.fmDatabase beginTransaction];
        BOOL status=[self.fmDatabase executeUpdate:@"update StatusTable set statusData = ? where statusType = ?",StatusFalse,OriginalLogin];
        if (status) {
            DLog(@"fmdb success");
        }else{
            [self.fmDatabase rollback];
            DLog(@"fmdb rollback");
        }
        
        [self.fmDatabase commit];
        return status;
}
    DLog(@"数据库未打开");
    return NO;
}
@end
