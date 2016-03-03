//
//  UtilsHelper.h
//  HongFuTong
//
//  Created by apple on 16/3/3.
//  Copyright © 2016年 hp. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UtilsHelper : NSObject

/*
 
 一些基础的方法都存在这里
 
 */

#pragma  mark --隐藏最初导航条
+ (void)setAppNavigationBarHiden;
#pragma mark --显示最初导航条
+ (void)setAppNavigationBarShow;
#pragma mark --得到最初导航条
+ (UINavigationController *)getAppNavigationController;


@end
