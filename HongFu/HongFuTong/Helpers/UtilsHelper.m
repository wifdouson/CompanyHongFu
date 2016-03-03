//
//  UtilsHelper.m
//  HongFuTong
//
//  Created by apple on 16/3/3.
//  Copyright © 2016年 hp. All rights reserved.
//

#import "UtilsHelper.h"

@implementation UtilsHelper

#pragma  mark --隐藏最初导航条
+ (void)setAppNavigationBarHiden{
    AppDelegate * delegate=APPDELEGATE;
    [delegate.baseNV setNavigationBarHidden:YES];
}
#pragma mark --显示最初导航条
+ (void)setAppNavigationBarShow{
    AppDelegate * delegate=APPDELEGATE;
    [delegate.baseNV setNavigationBarHidden:NO];
}
#pragma mark --得到最初导航条
+ (UINavigationController *)getAppNavigationController{
    AppDelegate * delegate=APPDELEGATE;
    return delegate.baseNV;
}
#pragma mark --得到最初vc
+ (UIViewController *)getAppViewController{
    AppDelegate * delegate=APPDELEGATE;
    UINavigationController * nv=delegate.baseNV;
    return nv.topViewController;
}

@end
