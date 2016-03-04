//
//  MobileData.h
//  CHOneDemo
//
//  Created by 陈汉青 on 16/1/6.
//  Copyright © 2016年 hqchendev.com.cn. All rights reserved.
//
/**

*  建立数据库 和相关的表格

*

*
**/
#import <Foundation/Foundation.h>
#import <FMDB/FMDatabase.h>

@interface MobileData : NSObject
{
    FMDatabase * fmDatabase;
}

@property (nonatomic,retain)FMDatabase * fmDatabase;



- (FMDatabase *)getDb;//得到数据库

- (void)openSqlite;


@end
