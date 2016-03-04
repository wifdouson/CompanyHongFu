//
//  DataController.m
//  HongFuTong
//
//  Created by apple on 16/3/4.
//  Copyright © 2016年 hp. All rights reserved.
//

#import "DataController.h"

@implementation DataController


-(id)init{
    self=[super init];
    if (self) {
        mobileData=[[MobileData alloc]init];
        [mobileData openSqlite];
    }
    return self;
}


@end
