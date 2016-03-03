//
//  CH_BBPos_BlueTooth.m
//  CHBBPosDemo
//
//  Created by 陈汉青 on 16/2/24.
//  Copyright © 2016年 hqchendev.com.cn. All rights reserved.
//

#import "CH_BBPos_BlueTooth.h"
@interface CH_BBPos_BlueTooth()<WisePadControllerDelegate,UIAlertViewDelegate>

@property (nonatomic,strong)NSMutableArray * posNumArr;

@end

#define SCAN_TIME  120
#define CONNECTION_TIME 120

@implementation CH_BBPos_BlueTooth


#pragma mark --chenhanqingdev self recreate methods

+ (CH_BBPos_BlueTooth *)sharedBBPosBlueTooth{
    static CH_BBPos_BlueTooth * pos=nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        pos=[[CH_BBPos_BlueTooth alloc]init];
        
        //初始化
        pos.posNumArr=[NSMutableArray new];
        
    });
    return pos;
}

- (void)handleDeal{
    self.wisePadController=[WisePadController sharedController];
    self.wisePadController.delegate=self;
    [self scanBTv4Device];
}

- (void)scanBTv4Device{
    NSMutableArray * deviceNameArray=[NSMutableArray new];
    [deviceNameArray addObject:@"HDSY"];
    [deviceNameArray addObject:@"HONGFU"];
    [deviceNameArray addObject:@"M188"];
    
    [[WisePadController sharedController]scanBTv4:deviceNameArray scanTimeout:SCAN_TIME];
    
}
- (void)disScanPos{
    [self.posNumArr removeAllObjects];
    [[WisePadController sharedController]stopScanBTv4];
    
}
- (void)cancelConnection{
    [self.posNumArr removeAllObjects];
    [[WisePadController sharedController]disconnectBTv4];

}
- (void)connectBTv4:(CBPeripheral *)cbperipheral{
    [[WisePadController sharedController]connectBTv4:cbperipheral connectTimeout:CONNECTION_TIME];
}

#pragma mark WisePadControllerDelegate
- (void)onWisePadBatteryLow:(WisePadBatteryStatus)batteryStatus{
    NSLog(@"电池电量低");
}
- (void)onWisePadWaitingForCard:(WisePadCheckCardMode)checkCardMode{
    
}

//如果搜索超时，则调回这里
- (void)onWisePadBTv4ScanTimeout{
    NSLog(@"scan timeout");
}
//本机蓝牙未打开时会调用此方法
- (void)onWisePadRequestEnableBluetoothInSettings{
    NSLog(@"蓝牙未打开");
}
//得到设备列表  error pos设备会叠加
- (void)onWisePadBTv4DeviceListRefresh:(NSArray *)foundDevices{
//    NSLog(@"1   %@",foundDevices);
    //此时的到蓝牙信息 然后选择连接此蓝牙 [[WisePadController sharedController] connectBTv4:(CBPeripheral *)[self.devices objectAtIndex:buttonIndex ] connectTimeout:kConnectBTv4Timeout];进行蓝牙连接，蓝牙连接成功之后会调用2，同时记得关闭蓝牙扫描stopScanBTv4
    
    //foundDevices 是一个数组，元素是一个dictionary ,当前的设备数目可能是两个或者多个，都需要将其显示出来，所以此处只进行显示pos机，并不进行存储
   
    for (int i=0;i<foundDevices.count;i++){
         CBPeripheral * cbperipheral=(CBPeripheral *)[foundDevices objectAtIndex:i];
        NSString * name=cbperipheral.name;
        if (name.length!=0) {
            NSArray * arr=[name componentsSeparatedByString:@"-"];
            [self.posNumArr addObject:[arr objectAtIndex:1]];
        }else{
            NSLog(@"onWisePadBTv4DeviceListRefresh 得到的设备并没有name");
            return;
        }
    }
    
    [self.getdeviceDelegate getDeviceNameArray:self.posNumArr withArrays:foundDevices];
    //注意清空 posNumArr;
    
}
- (void)onWisePadBTv4Disconnected{
     //注意清空 posNumArr;
    //断开连接disconnectBTv4   会反回此代理方法
    [self.posNumArr removeAllObjects];
}

- (void)onWisePadBTv4Connected{
    //2 点击选择到蓝牙时  连接成功会调用此
}
- (void)onWisePadBTv4Connected:(CBPeripheral *)connectedPeripheral //Added in 2.1.0
{
    //3 连接成功后 会反回设备信息，只能用此处信息，因为扫描可能会有多个信息，而连接只会产生一个
    //此处得到信息后  需要向服务器请求认证是否正确
    NSString * name=connectedPeripheral.name;
    NSArray * arr=[name componentsSeparatedByString:@"-"];
    NSString * posNumber=[arr objectAtIndex:1];
    //这里需要向服务器请求pos编号是否和注册用户匹配  即pos终端签到 如果成功则会调用setamount 的方法，来确定要刷多少钱
    
    
    
    
}

- (void)onWisePadBTv4ConnectTimeout{
    // 连接超时
}




#pragma mark --CH_BBPos_BlueTooth_GetDeviceNameDelegate 获取设备名字代理
- (NSArray *)getDeviceNameArray{
    return [NSArray arrayWithArray:self.posNumArr];
}



@end
