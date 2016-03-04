//
//  AppDelegate.m
//  HongFuTong
//
//  Created by apple on 16/2/29.
//  Copyright © 2016年 hp. All rights reserved.
//

#import "AppDelegate.h"



@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
     self.window.backgroundColor=[UIColor whiteColor];
#pragma mark --创建数据库存储路径
    NSFileManager * fileManager=[NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:HOME_FILE]) {
        [fileManager createDirectoryAtPath:HOME_FILE withIntermediateDirectories:YES attributes:nil error:nil];
        
        //跳过icloud备份
        [self addSkipBackupAttributeToItemAtURL:[NSURL URLWithString:HOME_FILE]];
        
    }
    
#pragma mark --判断是否启动页
    DataController * dataController=[[DataController alloc]init];
    [dataController isOriginalLogin];
    
#pragma mark --得到最基础的导航条
    self.baseNV=(UINavigationController *)self.window.rootViewController;
    
#pragma  mark --是否是第一次登陆  数据均存在本地数据库中
    
    

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

//跳过云备份
- (BOOL)addSkipBackupAttributeToItemAtURL:(NSURL *)URL
{
    assert([[NSFileManager defaultManager] fileExistsAtPath: [URL path]]);
    NSError *error = nil;
    BOOL success = [URL setResourceValue: [NSNumber numberWithBool: YES]
                                  forKey: NSURLIsExcludedFromBackupKey error: &error];
    if(!success){
        NSLog(@"Error excluding %@ from backup %@", [URL lastPathComponent], error);
    }
    return success;
}


@end
