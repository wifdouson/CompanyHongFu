//
//  MobileData+Original.h
//  HongFuTong
//
//  Created by apple on 16/3/4.
//  Copyright © 2016年 hp. All rights reserved.
//

#import "MobileData.h"

@interface MobileData (Original)

#pragma mark --判断是original login 是否有数据
- (BOOL)isExistOriginalLoginStatus;
#pragma  mark --得到original login 数据
- (BOOL)getOriginalStatus;
#pragma mark --第一次需要插入 0 数据
- (BOOL)insertOriginalLoginStatus;
#pragma mark --更改original login 数据
- (BOOL)updateOriginalLoginStatus;
@end
