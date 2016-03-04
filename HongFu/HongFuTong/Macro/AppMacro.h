//
//  AppMacro.h
//  HongFuTong
//
//  Created by apple on 16/2/29.
//  Copyright © 2016年 hp. All rights reserved.
//
/**
 *  app 程序代码的宏
 */
#ifndef AppMacro_h
#define AppMacro_h



#pragma  mark --得到appdelegate
#define APPDELEGATE      [[UIApplication sharedApplication] delegate]


#pragma mark --得到base navigationcontroller
#define APPNV    [UtilsHelper getAppNavigationController]
#define APPVC  [UtilsHelper getAppViewController]
#define APPOrignalNavigationBarHiden     [UtilsHelper setAppNavigationBarHiden];
#define APPOrignalNavigationBarShow    [UtilsHelper setAppNavigationBarShow];




#endif /* AppMacro_h */
