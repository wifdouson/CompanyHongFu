//
//  UtilsMacro.h
//  HongFuTong
//
//  Created by apple on 16/2/29.
//  Copyright © 2016年 hp. All rights reserved.
//
/**
 *  一些方便使用的宏定义，如颜色或者文件
 */
#ifndef UtilsMacro_h
#define UtilsMacro_h


#define HOME_FILE [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"home"]

#ifdef DEBUG
#define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define DLog(...)
#endif



#endif /* UtilsMacro_h */
