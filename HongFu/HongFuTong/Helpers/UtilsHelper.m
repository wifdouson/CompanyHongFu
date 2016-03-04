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

#pragma mark -- ＃b72221   转换成UIColor
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert
{
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor whiteColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    else if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return [UIColor whiteColor];
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}
#pragma mark --动画效果 水滴效果 (目前只有水滴效果)
+ (CATransition *)transitionWithRippleEffect{
    CATransition * transition=[CATransition animation];
    transition.duration=1;
    transition.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type=@"rippleEffect";
    [transition setSubtype:kCATransitionFromBottom];
    return transition;
}

@end
