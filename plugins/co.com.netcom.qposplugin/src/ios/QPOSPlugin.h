//
//  QposPlugin.h
//  qpos-ios-demo
//
//  Created by dspread-mac on 2018/2/1.
//  Copyright © 2018年 Robin. All rights reserved.
//

#import <Cordova/CDVPlugin.h>
#import "QPOSService.h"
#import "BTDeviceFinder.h"
@interface QPOSPlugin : CDVPlugin<UIImagePickerControllerDelegate, UINavigationControllerDelegate,QPOSServiceListener,UIActionSheetDelegate,BluetoothDelegate2Mode>

@property (nonatomic)NSString *bluetoothAddress;
@property (nonatomic)NSString *amount;
@property (nonatomic)NSString *cashbackAmount;

-(void)QPOS_GetCompanions:(CDVInvokedUrlCommand *)command;
-(void)QPOS_getConnectDevice:(CDVInvokedUrlCommand *)command;
-(void)QPOS_DisconnectDevice:(CDVInvokedUrlCommand *)command;
-(void)QPOS_GetStatusBattery:(CDVInvokedUrlCommand *)command;
-(void)QPOS_IsConnectDevice:(CDVInvokedUrlCommand *)command;
-(void)QPOS_ConfigurationInitial:(CDVInvokedUrlCommand *)command;
-(void)QPOS_StartTransaction:(CDVInvokedUrlCommand *)command;
-(void)QPOS_DataTransaction:(CDVInvokedUrlCommand *)command;
-(void)QPOS_CompleteTransaction:(CDVInvokedUrlCommand *)command;
-(void)QPOS_STOP_TRANSACTION:(CDVInvokedUrlCommand *)command;
-(void)QPOS_IsInsertCard:(CDVInvokedUrlCommand *)command;
-(void)QPOS_BandCardPin:(CDVInvokedUrlCommand *)command;
@end


