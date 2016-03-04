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

- (BOOL)isOriginalLogin{
    if ( [mobileData isExistOriginalLoginStatus]) {
        [mobileData getOriginalStatus];
    }else{
        [mobileData insertOriginalLoginStatus];
    }
    return YES;
}

@end
