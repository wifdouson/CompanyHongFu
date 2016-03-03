//
//  CH_BBPos_BlueTooth.h
//  CHBBPosDemo
//
//  Created by 陈汉青 on 16/2/24.
//  Copyright © 2016年 hqchendev.com.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WisePadController_new.h"
#import <CoreBluetooth/CoreBluetooth.h>

@protocol CH_BBPos_BlueTooth_GetDeviceNameDelegate <NSObject>
@optional
//返回蓝牙连接设备的名字，若为nil则提示 并无蓝牙连接
- (void)getDeviceNameArray:(NSArray *)arr withArrays:(NSArray *)arr;


@end



@interface CH_BBPos_BlueTooth : NSObject

@property (nonatomic,strong)WisePadController * wisePadController;
@property (nonatomic,assign)id <CH_BBPos_BlueTooth_GetDeviceNameDelegate>getdeviceDelegate;

+ (CH_BBPos_BlueTooth *)sharedBBPosBlueTooth;
- (void)handleDeal;
- (void)disScanPos;
- (void)cancelConnection;
- (void)connectBTv4:(CBPeripheral *)cbperipheral;


@end
