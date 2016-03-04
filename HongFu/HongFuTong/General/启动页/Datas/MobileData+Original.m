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
    DLog(@"数据库未打开");
    return NO;
}
#pragma mark --更改original login 数据
//  [self.fmDatabase executeUpdate:@"UPDATE TK_QUESTION_OPTION SET quesOption = ?,sequence = ? WHERE questionID = ? and quesValue = ?",quesOption,sequence,questionID,quesValue];
- (BOOL)updateOriginalLoginStatus{
    if ([self.fmDatabase open]) {
        [self.fmDatabase beginTransaction];
        BOOL status=[self.fmDatabase executeUpdate:@"update StatusTable set statusData = ? where statusType = ?",StatusTrue,OriginalLogin];
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
