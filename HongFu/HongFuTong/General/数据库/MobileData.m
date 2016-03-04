//
//  MobileData.m
//  CHOneDemo
//
//  Created by 陈汉青 on 16/1/6.
//  Copyright © 2016年 hqchendev.com.cn. All rights reserved.
//

#import "MobileData.h"



@implementation MobileData


//获取数据库
- (FMDatabase *)getDb{
    
  
    FMDatabase * tempfmDatabase=[FMDatabase databaseWithPath:[HOME_FILE stringByAppendingPathComponent:@"MobileData.db"]];
    
    return tempfmDatabase;
    
}

//打开数据库
- (void)openSqlite{
    self.fmDatabase=[self getDb];
    if ([self.fmDatabase open]) {
        [self.fmDatabase setShouldCacheStatements:YES];
        [self.fmDatabase beginTransaction];
        
        [self createStatusTypeTable:self.fmDatabase];
      
        
        [self.fmDatabase commit];
    }
}

#pragma mark --创建app初始数据
/**
 *  创建状态存储表格
 *
 *  @param    statusType  状态表格
    @param    statusData  0代表否定，1代表肯定 
    为方便数据读写，这里所有的类型统一用string
 */
- (void)createStatusTypeTable:(FMDatabase *)database{
    [database executeUpdate:@"create table if not exists StatusTable(_id INTEGER primary key autoincrement,statusType varchar(50),statusData varchar(50))"];
}


@end
