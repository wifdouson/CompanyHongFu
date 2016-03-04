//
//  DataController+Original.m
//  HongFuTong
//
//  Created by apple on 16/3/4.
//  Copyright © 2016年 hp. All rights reserved.
//

#import "DataController+Original.h"
#import "MobileData+Original.h"

@implementation DataController (Original)

//只显示一次
- (BOOL)isOriginalLogin{
    if ( [mobileData isExistOriginalLoginStatus]) {
         return [mobileData getOriginalStatus];
    }else{
        [mobileData insertOriginalLoginStatus];
        return [mobileData getOriginalStatus];
    }
}
- (BOOL)changeOriginalLoginStatus{
    if ([mobileData isExistOriginalLoginStatus]) {
        return [mobileData updateOriginalLoginStatus];
    }
    DLog(@"不存在数据");
    return false;
}
@end
