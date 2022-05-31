//
//  dspread_pos_plugin.m
//  qpos-ios-demo
//
//  Created by dspread-mac on 2018/2/1.
//  Copyright © 2018年 Robin. All rights reserved.
//

#import "QPOSPlugin.h"
#import "util.h"
#import <AudioToolbox/AudioToolbox.h>

typedef void(^imgBlock)(NSString * data);
@interface QPOSPlugin()

@property(nonatomic,strong) imgBlock MyBlock;
@property (nonatomic,copy)NSString *terminalTime;
@property (nonatomic,copy)NSString *currencyCode;
@end
//CONSTANTES-------------------------------------------------------
//TIPOS TRANSACCION------------------------------------------------
NSString *QPOS_GetCompanions=@"QPOS_GetCompanions";
NSString *QPOS_getConnectDevice=@"QPOS_getConnectDevice";
NSString *QPOS_IsConnectDevice=@"QPOS_IsConnectDevice";
NSString *QPOS_DisconnectDevice=@"QPOS_DisconnectDevice";
NSString *QPOS_GetStatusBattery=@"QPOS_GetStatusBattery";
NSString *QPOS_ConfigurationInitial=@"QPOS_ConfigurationInitial";
NSString *QPOS_StartTransaction=@"QPOS_StartTransaction";
NSString *QPOS_DataTransaction=@"QPOS_DataTransaction";
NSString *QPOS_CompleteTransaction=@"QPOS_CompleteTransaction";
NSString *QPOS_STOP_TRANSACTION=@"QPOS_StopTransaction";
NSString *QPOS_IS_INSERT_CARD=@"QPOS_IsInsertCard";
NSString *QPOS_BANDCARDPIN=@"QPOS_BandCardPin";
//ESTADOS TRANSACCIÓN------------------------------------------------
NSString* APPROVAL               =@"1";
NSString* DECLINE                =@"0";
NSString* GET_PIN_STATE          =@"2";
NSString* PROCESSING_STATE       =@"3";
NSString* PLEASE_WAIT_STATE      =@"4";
NSString* WAITING_USER_STATE     =@"5";
NSString* TERMINATED_TRANSACTION =@"6";
NSString* SELECT_APP             =@"7";
NSString* SELECTED_APP           =@"8";
NSString* FALLBACK               =@"9";
NSString* ERROR_SWIPE_CHIP       =@"10";
//POST ENTRY MODE TRANSACCIÓN------------------------------------------------
NSString* CHIP      =@"051";
NSString* BAND      =@"021";
NSString* FALL_BACK =@"801";
NSString* CONTACTLESS_CHIP =@"071";
NSString* CONTACTLESS_BAND =@"911";
//AID S------------------------------------------------
NSString* AID_MAESTRO        = @"A0000000043060";
NSString* AID_MASTERCARD     = @"A0000000041010";
NSString* AID_VISA_ELECTRON  = @"A0000000032010";
NSString* AID_VISA_CREDITO   = @"A0000000031010";
NSString* AID_DINNER_CREDITO = @"A0000001523010";
NSString* AID_AMEX           = @"A0000000250104";
NSString* AID_LABEL_DEBIT    = @"DEBIT";
//CARD------------------------------------------------
NSString* MASKED_PAN       = @"maskedPAN";
NSString* EXPIRY_DATE      = @"expiryDate";
NSString* CARDHOLDER_NAME  = @"cardholderName";
NSString* KSN              = @"trackksn";
NSString* KSN_PINBLOCK     = @"pinKsn";
NSString* PINBLOCK         = @"pinBlock";
NSString* TRACK1_LENGTH    = @"track1Length";
NSString* TRACK2_LENGTH    = @"track2Length";
NSString* TRACK3_LENGTH    = @"track3Length";
NSString* TRACK1_ENCRYPT   = @"encTrack1";
NSString* TRACK2_ENCRYPT   = @"encTrack2";
NSString* TRACK3_ENCRYPT   = @"encTrack3";
NSString* TRACK2_SEPARADOR = @"D";
//CODE RESPONSE------------------------------------------------
NSString* SUCCESFUL = @"1";
NSString* FAILED    = @"0";
NSString* ERROR     = @"-1";
//CONNECTION------------------------------------------------
BOOL AUTO            = YES;
NSInteger* BOND_TIME = 180000;
//FRANQUISIA------------------------------------------------
NSString* MAESTRO        = @"MAESTRO";
NSString* MASTERCARD     = @"MASTERCARD";
NSString* VISA_ELECTRON  = @"VISA_ELECTRON";
NSString* VISA_CREDITO   = @"VISA_CREDITO";
NSString* DINNER_CREDITO = @"DINNER_CREDITO";
NSString* AMEX           = @"AMEX";
//INFO QPOS------------------------------------------------
NSString* BOOTLOADER_VERSION   = @"bootloaderVersion";
NSString* IS_SUPPORTED_TRACK_1 = @"isSupportedTrack1";
NSString* IS_SUPPORTED_TRACK_2 = @"isSupportedTrack2";
NSString* IS_SUPPORTED_TRACK_3 = @"isSupportedTrack3";
NSString* FIRMWARE_VERSION     = @"firmwareVersion";
NSString* IS_USB_CONNECTED     = @"isUsbConnected";
NSString* IS_CHARGING          = @"isCharging";
NSString* BATTERY_LEVEL        = @"batteryLevel";
NSString* HARDWARE_VERSION     = @"hardwareVersion";
NSString* BATTERY_PERCENTAGE   = @"batteryPercentage";
//MODE ENTRY---
NSInteger* MODE_MAGNETIC_SWIPE = 1;
NSInteger* MODE_EMV            = 2;
NSInteger* MODE_CONTACTLESS    = 3;
//TRANSACCION---
NSString* CURRENCY_TYPE   = @"0170";
NSString* CENTS           = @"00";
NSString* CASHBACK_AMOUNT = @"0";
//TYPE CARD--------------------------
NSString* AHORRO    = @"10";
NSString* CORRIENTE = @"20";
NSString* CREDITO   = @"30";
NSString* DEBITO    = @"00";
//TAGS-------------------------------
NSString* TAG_5F20 = @"5F20";
NSString* TAG_4F   = @"4F";
NSString* TAG_5F24 = @"5F24";
NSString* TAG_9F16 = @"9F16";
NSString* TAG_9F21 = @"9F21";
NSString* TAG_9A   = @"9A";
NSString* TAG_9F02 = @"9F02";
NSString* TAG_9F03 = @"9F03";
NSString* TAG_9F34 = @"9F34";
NSString* TAG_9F12 = @"9F12";
NSString* TAG_9F06 = @"9F06";
NSString* TAG_5F30 = @"5F30";
NSString* TAG_9F4E = @"9F4E";
NSString* TAG_5A   = @"5A";
NSString* TAG_57   = @"57";
NSString* TAG_8E   = @"8E";
NSString* TAG_5F25 = @"5F25";
NSString* TAG_9F07 = @"9F07";
NSString* TAG_9F0D = @"9F0D";
NSString* TAG_9F0E = @"9F0E";
NSString* TAG_9F0F = @"9F0F";
NSString* TAG_9F39 = @"9F39";
NSString* TAG_9F40 = @"9F40";
NSString* TAG_9F53 = @"9F53";
NSString* TAG_5F28 = @"5F28";
NSString* TAG_9F4C = @"9F4C";
NSString* TAG_50   = @"50";
NSString* TAG_9F08 = @"9F08";
NSString* TAG_9F01 = @"9F01";
NSString* TAG_9F15 = @"9F15";
NSString* TAG_9F1C = @"9F1C";
NSString* TAG_95   = @"95";
NSString* TAG_82   = @"82";
NSString* TAG_84   = @"84";
NSString* TAG_9F09 = @"9F09";
NSString* TAG_5F34 = @"5F34";
NSString* TAG_9F41 = @"9F41";
NSString* TAG_9F27 = @"9F27";
NSString* TAG_9F26 = @"9F26";
NSString* TAG_9F10 = @"9F10";
NSString* TAG_9F37 = @"9F37";
NSString* TAG_9F36 = @"9F36";
NSString* TAG_9F35 = @"9F35";
NSString* TAG_9F33 = @"9F33";
NSString* TAG_9F1A = @"9F1A";
NSString* TAG_9F1E = @"9F1E";
NSString* TAG_5F2A = @"5F2A";
NSString* TAG_9C   = @"9C";
NSString* TAG_9B   = @"9B";
//-----------------------------------------------------------------------//
/** Tags propios de QPOS*/
NSString* TAG_C4 = @"C4";
NSString* TAG_C1 = @"C1";
NSString* TAG_C7 = @"C7";
NSString* TAG_C0 = @"C0";
NSString* TAG_C2 = @"C2";
NSString* TAG_70 = @"70";
NSString* TAG_C3 = @"C3";
NSString* TAG_C5 = @"C5";
//-------------------------------------------------------------------------//
/** Tags respuesta Emv*/
NSString* TAG_89 = @"89";
NSString* TAG_8A = @"8A";
NSString* TAG_91 = @"91";
NSString* TAG_71 = @"71";
NSString* TAG_72 = @"72";
//VARIABLES------------------------------------------------
NSInteger scanBluetoothTime = 60;
NSInteger scanBluetoothTrieds = 0;
NSInteger TIMER = 0;
NSInteger TIMER_OUT = 5;
NSInteger indexKeyEMV = 0;
NSInteger indexEMV = 2;

NSString *listApp = nil;
NSString *stateTx = @"-1";
NSString *address=@"";
NSString *typeCardEntry=@"";

BOOL isSelectApp = NO;
BOOL is2ModeBluetooth = YES;
BOOL isTestBluetooth = NO;
BOOL isConnected = NO;

BOOL isBanda = NO;
BOOL isChip = NO;
BOOL isFallback = NO;

NSString* posEntryMode =@"";
NSString* tipoCuentaId=@"";
NSInteger* tipoEntrada=0;
NSString* cardInfo=@"";

NSMutableDictionary* object=nil;

@implementation QPOSPlugin
{
    QPOSService *mQPOSService;
    BTDeviceFinder *bt;
    NSMutableArray *allBluetooth;
    NSString *btAddress;
    TransactionType mTransType;
    NSString *amount;
    UIAlertView *mAlertView;
    UIActionSheet *mActionSheet;
    PosType     mPosType;
    dispatch_queue_t self_queue;
    NSString *msgStr;
    NSString *nameAction;
    NSTimer* appearTimer;
    CDVInvokedUrlCommand* commandLocal;
}
@synthesize bluetoothAddress;
@synthesize amount;
@synthesize cashbackAmount;

//UTILS---------------------------------------------------------------------------------------------------------------------------------------
-(NSString*)convertDictionaryToString:(NSMutableDictionary*) dict
{
    NSError* error;
    NSDictionary* tempDict = [dict copy]; // get Dictionary from mutable Dictionary
    //giving error as it takes dic, array,etc only. not custom object.
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:tempDict
                                                       options:NSJSONReadingMutableLeaves error:&error];
    NSString* nsJson=  [[NSString alloc] initWithData:jsonData
                                             encoding:NSUTF8StringEncoding];
    return nsJson;
}
-(void) sleepMs: (NSInteger)msec {
    NSTimeInterval sec = (msec / 1000.0f);
    [NSThread sleepForTimeInterval:sec];
}
-(NSInteger*) hexaStringToInt:(NSString*)hexa{
    NSInteger* decimalValue=0;
    unsigned result = 0;
    hexa = [@"#" stringByAppendingString:hexa];
    NSScanner *scanner = [NSScanner scannerWithString:hexa];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&result];
    NSLog(@"%d:",result);
    decimalValue = result;
    return result;
}
-(NSMutableDictionary*) getTagByname:(NSString*)name:(NSString*)tlv{
    NSMutableDictionary* tag = nil;
    if(tlv!=nil){
        tlv  = [tlv uppercaseString];
        name = [name uppercaseString];
        NSRange posTag = [tlv rangeOfString:name];
        if(posTag.location == 0){
            NSString* len = [tlv substringToIndex:[name length]+2];
            len = [len substringFromIndex:[name length]];
            NSInteger lenDec = [self hexaStringToInt:len];
            lenDec=lenDec*2;
            NSString* value = [tlv substringToIndex:[name length]+2+lenDec];
            value = [value substringFromIndex:[name length]+2];
            NSLog(@"TAG ENCONTRADO NAME %@:",name);
            NSLog(@"TAG ENCONTRADO LEN %@:",len);
            NSLog(@"TAG ENCONTRADO VALUE %@:",value);
            tag = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                   name, @"name",
                   len, @"length",
                   value, @"value",
                   nil];
        }else{
            tag = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                   name, @"name",
                   @"", @"length",
                   @"", @"value",
                   nil];
        }
    }else{
        tag = [NSMutableDictionary dictionaryWithObjectsAndKeys:
               name, @"name",
               @"", @"length",
               @"", @"value",
               nil];
    }
    return tag;
}
-(NSMutableDictionary*)getTagQposByName: (NSString*)name: (NSString*)tlv{
    NSMutableArray* array = [self getArrayTagQpos];
    NSMutableDictionary* tag = nil;
    
    for(NSInteger i = 0 ; i < [array count] ; i++){
        NSLog(@"TAG QPOS name ---- %@:",[array objectAtIndex:i]);
        NSString *tag_name=[array objectAtIndex:i];
        tag = [self getTagByname:tag_name :tlv];
        NSString* len = tag[@"length"];
        if([tag_name isEqualToString: name]){
            break;
        }
        else if(![len isEqualToString:@""]){
            NSInteger lenDec = [self hexaStringToInt:len];
            lenDec=lenDec*2;
            tlv = [tlv substringFromIndex:[tag_name length]+2+lenDec];
        }
    }
    return tag;
}
-(NSMutableArray*) getArrayTagSales{
    NSMutableArray* array = [[NSMutableArray alloc]init];
    [array addObject:TAG_95];
    [array addObject:TAG_82];
    [array addObject:TAG_84];
    [array addObject:TAG_9A];
    [array addObject:TAG_9C];
    [array addObject:TAG_9F09];
    [array addObject:TAG_5F34];
    [array addObject:TAG_9F41];
    [array addObject:TAG_9F34];
    [array addObject:TAG_9F27];
    [array addObject:TAG_9F26];
    [array addObject:TAG_9F10];
    [array addObject:TAG_9F37];
    [array addObject:TAG_9F36];
    [array addObject:TAG_9F35];
    [array addObject:TAG_9F33];
    [array addObject:TAG_9F1A];
    [array addObject:TAG_9F1E];
    [array addObject:TAG_9F02];
    [array addObject:TAG_5F2A];
    [array addObject:TAG_9F03];
    return array;
}
-(NSMutableArray*)getArrayTagQpos{
    NSMutableArray* array = [[NSMutableArray alloc]init];
    [array addObject:TAG_5F20];
    [array addObject:TAG_4F];
    [array addObject:TAG_5F24];
    [array addObject:TAG_9F16];
    [array addObject:TAG_9F21];
    [array addObject:TAG_9A];
    [array addObject:TAG_9F02];
    [array addObject:TAG_9F03];
    [array addObject:TAG_9F34];
    [array addObject:TAG_9F12];
    [array addObject:TAG_9F06];
    [array addObject:TAG_5F30];
    [array addObject:TAG_9F4E];
    [array addObject:TAG_C4];
    [array addObject:TAG_C1];
    [array addObject:TAG_C7];
    [array addObject:TAG_C0];
    //[array addObject:TAG_C2];
    return array;
}

-(NSString*) hexToString: (NSString*)str{
    NSMutableString * newString = [[NSMutableString alloc] init];
    int i = 0;
    NSLog(@"hexToString str %@:",str);
    if([str length] % 2 != 0){
        return str;
    }
    while (i < [str length])
    {
        NSLog(@"hexToString str %@:",str);
        NSString * hexChar = [str substringWithRange: NSMakeRange(i, 2)];
        int value = 0;
        sscanf([hexChar cStringUsingEncoding:NSASCIIStringEncoding], "%x", &value);
        [newString appendFormat:@"%c", (char)value];
        i+=2;
    }
    return newString;
}
-(NSString*) getTypeCardEmv: (NSString*) aid: (NSString*) label{
    NSString* typecard=DEBITO;
    if ([aid isEqualToString: nil] || [aid isEqualToString: @""]) {
        return @"";
    }
    NSString* hexLabel = [self hexToString:label];
    hexLabel = [hexLabel uppercaseString];
    NSLog(@"hexToString hexLabel %@:",hexLabel);
    NSRange range = [hexLabel rangeOfString:AID_LABEL_DEBIT];
    bool debitLabelFound=(range.location != NSNotFound);
    if([aid isEqualToString:(AID_MAESTRO)] ||
       [aid isEqualToString:(AID_VISA_ELECTRON)] ||
       ([aid isEqualToString:(AID_MASTERCARD)] && (debitLabelFound)) ||
       ([aid isEqualToString:(AID_VISA_CREDITO)] && (debitLabelFound))
       ){
        typecard = DEBITO;
    }else{
        typecard = CREDITO;
    }
    
    return typecard;
}
-(NSString*) getFranquisieCardEmv:(NSString*) aid{
    if ([aid isEqualToString:AID_MAESTRO]) {
        return MAESTRO;
    }
    if([aid isEqualToString:AID_VISA_ELECTRON]) {
        return VISA_ELECTRON;
    }
    if([aid isEqualToString:AID_MASTERCARD]) {
        return MASTERCARD;
    }
    if([aid isEqualToString:AID_VISA_CREDITO]){
        return VISA_CREDITO;
    }
    return @"";
}
-(NSMutableDictionary*) getTrack2Data:(NSString*) data{
    
    NSString* ksn = [data substringWithRange:NSMakeRange(4, 20)];
    NSString* track2_enc = [data substringFromIndex:28];
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:
            ksn, @"ksn",
            track2_enc, @"track2_enc",
            nil];
}
- (NSData*)readLine:(NSString*)name
{
    NSString* binFile = [[NSBundle mainBundle]pathForResource:name ofType:@".bin"];
    NSString* ascFile = [[NSBundle mainBundle]pathForResource:name ofType:@".asc"];
    NSLog(@"[%@]-- [%@]",name,ascFile);
    if (binFile!= nil && ![binFile isEqualToString: @""]) {
        NSFileManager* Manager = [NSFileManager defaultManager];
        NSData* data1 = [[NSData alloc] init];
        data1 = [Manager contentsAtPath:binFile];
        NSLog(@"BIN----------");
        return data1;
    }else if (ascFile!= nil && ![ascFile isEqualToString: @""]){
        NSFileManager* Manager = [NSFileManager defaultManager];
        NSData* data2 = [[NSData alloc] init];
        data2 = [Manager contentsAtPath:ascFile];
        NSLog(@"ASC----------");
        return data2;
    }
    return nil;
}
//--------------------------------------------------------------------------------------------------------------------------------------------
//TRANSACCTIONS-------------------------------------------------------------------------------------------------------------------------------
-(void)startTransaccion: (NSString*) amount_par{
    NSLog(@"+++QPOS PLUGIN startTransaccion+++ amount:%@",amount_par);
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"yyyyMMddHHmmss"];
    _terminalTime = [dateFormatter stringFromDate:[NSDate date]];
    mTransType = TransactionType_GOODS;
    amount_par = [NSString stringWithFormat:@"%@",amount_par];
    amount = [amount_par stringByAppendingString:CENTS];
    _currencyCode = CURRENCY_TYPE;
    typeCardEntry=@"";
    isSelectApp=NO;
    stateTx = DECLINE;
    [mQPOSService setOnlineTime:300];
    [mQPOSService setCardTradeMode:CardTradeMode_SWIPE_TAP_INSERT_CARD];
    [mQPOSService doCheckCard:30];
}
-(void)getDataTransaccion{
    NSString *jsonString= @"";
    object =nil;
    BOOL valid = YES;
    if([stateTx isEqualToString:WAITING_USER_STATE]){
        object = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                  WAITING_USER_STATE, @"code",
                  @"success", @"message",
                  nil, @"data",
                  nil];
        jsonString = [self convertDictionaryToString: object];
    }else if([stateTx isEqualToString:PLEASE_WAIT_STATE]){
        object = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                  PLEASE_WAIT_STATE, @"code",
                  @"success", @"message",
                  nil, @"data",
                  nil];
        jsonString = [self convertDictionaryToString: object];
    }else if([stateTx isEqualToString:PROCESSING_STATE]){
        object = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                  PROCESSING_STATE, @"code",
                  @"success", @"message",
                  nil, @"data",
                  nil];
        jsonString = [self convertDictionaryToString: object];
    }else if([stateTx isEqualToString:GET_PIN_STATE]){
        object = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                  GET_PIN_STATE, @"code",
                  @"success", @"message",
                  nil, @"data",
                  nil];
        jsonString = [self convertDictionaryToString: object];
    }else if([stateTx isEqualToString:APPROVAL]){
        object = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                  APPROVAL, @"code",
                  @"success", @"message",
                  cardInfo, @"data",
                  nil];
        jsonString = [self convertDictionaryToString: object];
    }else if([stateTx isEqualToString:FALLBACK]){
        object = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                  FALLBACK, @"code",
                  @"success", @"message",
                  nil, @"data",
                  nil];
        jsonString = [self convertDictionaryToString: object];
    }else if([stateTx isEqualToString:SELECT_APP]){
        stateTx = SELECTED_APP;
        object = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                  SELECT_APP, @"code",
                  @"success", @"message",
                  listApp, @"data",
                  nil];
        jsonString = [self convertDictionaryToString: object];
    }else if([stateTx isEqualToString:SELECTED_APP]){
        stateTx = PROCESSING_STATE;
        object = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                  stateTx, @"code",
                  @"success", @"message",
                  nil, @"data",
                  nil];
        jsonString = [self convertDictionaryToString: object];
        NSInteger pos = [ [commandLocal.arguments objectAtIndex:0] intValue];
        NSLog(@"+++QPOS PLUGIN app seleccionada+++:%d",pos);
        [mQPOSService selectEmvApp:pos];
    }else if([stateTx isEqualToString:ERROR_SWIPE_CHIP]){
        object = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                  stateTx, @"code",
                  @"success", @"message",
                  nil, @"data",
                  nil];
        jsonString = [self convertDictionaryToString: object];
    }
    else{
        valid = NO;
        jsonString = @"";
    }
    if(valid){
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:[NSString stringWithFormat:jsonString]];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:commandLocal.callbackId];
    }else{
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[NSString stringWithFormat:jsonString]];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:commandLocal.callbackId];
    }
}
-(void)onRequestSetAmount{
    NSLog(@"+++QPOS PLUGIN onRequestSetAmount+++ amount:%@",amount);
    
    [mQPOSService setAmount:amount aAmountDescribe:CASHBACK_AMOUNT currency:CURRENCY_TYPE transactionType:TransactionType_GOODS];
}
-(void)onRequestSelectEmvApp:(NSArray *)appList{
    NSLog(@"+++QPOS PLUGIN onRequestSelectEmvApp+++%@",appList);
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:appList options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    listApp = jsonString;
    stateTx = SELECT_APP;
    isSelectApp = YES;
}
-(void)getSwipePin:(NSString *)maskedPan{
    NSLog(@"+++QPOS PLUGIN getSwipePin+++%@",maskedPan);
    [mQPOSService getPin:@"INGRESE NIP"];
}
-(void)onRequestWaitingUser{
    NSLog(@"+++QPOS PLUGIN onRequestWaitingUser+++");
    object =nil;
    if([typeCardEntry isEqualToString:FALL_BACK]){
        stateTx = FALLBACK;
    }else{
        if(![typeCardEntry isEqualToString: ERROR_SWIPE_CHIP]){
           stateTx = WAITING_USER_STATE;
        }
    }
    object = [NSMutableDictionary dictionaryWithObjectsAndKeys:
              stateTx, @"code",
              @"success", @"message",
              nil, @"data",
              nil];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK
                                                      messageAsString:[NSString stringWithFormat:[self convertDictionaryToString: object]]];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:commandLocal.callbackId];
}
-(NSMutableDictionary*) getDataTransactionSwipeBand: (NSDictionary*)decodeData{
    NSLog(@"decodeData: %@",decodeData);
    NSString *formatID = [NSString stringWithFormat:@"%@",decodeData[@"formatID"]] ;
    NSString *maskedPAN = [NSString stringWithFormat:@"%@",decodeData[@"maskedPAN"]];
    NSString *lastfour = [maskedPAN substringFromIndex:maskedPAN.length-4];
    NSInteger len = [maskedPAN length];
    maskedPAN = [maskedPAN substringWithRange:NSMakeRange(0, 6)];
    maskedPAN = [maskedPAN stringByAppendingString:@"******"];
    maskedPAN = [maskedPAN stringByAppendingString:lastfour];
    NSString *expiryDate = [NSString stringWithFormat:@"%@",decodeData[@"expiryDate"]];
    NSString *cardHolderName = [NSString stringWithFormat:@"%@",decodeData[@"cardholderName"]];
    NSString *serviceCode = [NSString stringWithFormat:@"%@",decodeData[@"serviceCode"]];
    NSString *encTrack1 = [NSString stringWithFormat:@"%@",decodeData[@"encTrack1"]];
    NSString *encTrack2 = [NSString stringWithFormat:@"%@",decodeData[@"encTrack2"]];
    NSString *encTrack3 = [NSString stringWithFormat:@"%@",decodeData[@"encTrack3"]];
    NSString *pinKsn = [NSString stringWithFormat:@"%@",decodeData[@"pinKsn"]];
    NSString *trackksn = [NSString stringWithFormat:@"%@",decodeData[@"trackksn"]];
    NSString *pinBlock = [NSString stringWithFormat:@"%@",decodeData[@"pinblock"]];
    NSString *encPAN = [NSString stringWithFormat:@"%@",decodeData[@"encPAN"]];
    isBanda = YES;
    serviceCode = [serviceCode substringToIndex:0];
    if([serviceCode isEqualToString:@"2"] || [serviceCode isEqualToString:@"6"]){
            isChip = NO;
    }else if([serviceCode isEqualToString:@"1"] || [serviceCode isEqualToString:@"5"]){
            isChip = YES;
    }
    isFallback = NO;
    tipoCuentaId =@"";
    posEntryMode = BAND;
    tipoEntrada = MODE_MAGNETIC_SWIPE;
    
    object=nil;
    object = [NSMutableDictionary dictionaryWithObjectsAndKeys:
              cardHolderName, @"tarjetaHabiente",
              expiryDate, @"fechaExp",
              trackksn, @"ksn",
              pinKsn, @"ksnPinBlock",
              maskedPAN, @"panEnmascarado",
              maskedPAN, @"pan",
              encTrack2, @"track2",
              @(isBanda), @"isBanda",
              @(isChip), @"isChip",
              posEntryMode, @"PosEntryMode",
              pinBlock,@"pinBlock",
              tipoCuentaId,@"tipoCuentaId",
              lastfour,@"ultimosCuatro",
              @"",@"franquicia",
              [NSNumber numberWithInt:tipoEntrada],@"tipoEntrada",
              @(isFallback),@"fallback",
              @"",@"aid",
              @"",@"tagVenta",
              @"",@"arqc",
              nil];
    
    //NSString* jsonString = [self convertDictionaryToString:object];
    NSLog(@"decodeData: %@",object);
    return object;
    
}
-(NSString*) getDataTransactionFallback: (NSDictionary*)decodeData{
    NSLog(@"decodeData: %@",decodeData);
    NSString *formatID = [NSString stringWithFormat:@"%@",decodeData[@"formatID"]] ;
    NSString *maskedPAN = [NSString stringWithFormat:@"%@",decodeData[@"maskedPAN"]];
    NSString *lastfour = [maskedPAN substringFromIndex:maskedPAN.length-4];
    maskedPAN = [maskedPAN substringWithRange:NSMakeRange(0, 6)];
    maskedPAN = [maskedPAN stringByAppendingString:@"******"];
    maskedPAN = [maskedPAN stringByAppendingString:lastfour];
    NSString *expiryDate = [NSString stringWithFormat:@"%@",decodeData[@"expiryDate"]];
    NSString *cardHolderName = [NSString stringWithFormat:@"%@",decodeData[@"cardholderName"]];
    NSString *serviceCode = [NSString stringWithFormat:@"%@",decodeData[@"serviceCode"]];
    NSString *encTrack1 = [NSString stringWithFormat:@"%@",decodeData[@"encTrack1"]];
    NSString *encTrack2 = [NSString stringWithFormat:@"%@",decodeData[@"encTrack2"]];
    NSString *encTrack3 = [NSString stringWithFormat:@"%@",decodeData[@"encTrack3"]];
    NSString *pinKsn = [NSString stringWithFormat:@"%@",decodeData[@"pinKsn"]];
    NSString *trackksn = [NSString stringWithFormat:@"%@",decodeData[@"trackksn"]];
    NSString *pinBlock = [NSString stringWithFormat:@"%@",decodeData[@"pinblock"]];
    NSString *encPAN = [NSString stringWithFormat:@"%@",decodeData[@"encPAN"]];
    isBanda = YES;
    isChip = NO;
    isFallback = YES;
    tipoCuentaId =@"";
    posEntryMode = FALL_BACK;
    tipoEntrada = MODE_MAGNETIC_SWIPE;
    
    object=nil;
    object = [NSMutableDictionary dictionaryWithObjectsAndKeys:
              cardHolderName, @"tarjetaHabiente",
              expiryDate, @"fechaExp",
              trackksn, @"ksn",
              pinKsn, @"ksnPinBlock",
              maskedPAN, @"panEnmascarado",
              maskedPAN, @"pan",
              encTrack2, @"track2",
              @(isBanda), @"isBanda",
              @(isChip), @"isChip",
              posEntryMode, @"PosEntryMode",
              pinBlock,@"pinBlock",
              tipoCuentaId,@"tipoCuentaId",
              lastfour,@"ultimosCuatro",
              @"",@"franquicia",
              [NSNumber numberWithInt:tipoEntrada],@"tipoEntrada",
              @(isFallback),@"fallback",
              @"",@"aid",
              @"",@"tagVenta",
              @"",@"arqc",
              nil];
    return [self convertDictionaryToString:object];
    
}
-(void) onDoTradeResult: (DoTradeResult)result DecodeData:(NSDictionary*)decodeData{
    NSLog(@"+++QPOS PLUGIN onDoTradeResult+++");
    NSLog(@"onDoTradeResult?>> result %ld",(long)result);
    if (result==DoTradeResult_ICC) {
        typeCardEntry = CHIP;
        [mQPOSService doEmvApp:EmvOption_START];
    }else if(result==DoTradeResult_NOT_ICC){
        typeCardEntry = FALL_BACK;
        stateTx = FALLBACK;
        [mQPOSService setCardTradeMode:CardTradeMode_ONLY_SWIPE_CARD];
        [mQPOSService doCheckCard:30];
        //self.textViewLog.text = @"Card Inserted (Not ICC)";
    }else if(result==DoTradeResult_MCR){
        if([typeCardEntry isEqualToString: FALLBACK]){
            stateTx = PROCESSING_STATE;
            cardInfo = [self getDataTransactionFallback:decodeData];
            object = nil;
            object = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                      SUCCESFUL, @"code",
                      @"success", @"message",
                      cardInfo, @"data",
                      nil];
            stateTx = APPROVAL;
            NSString *jsonString = [self convertDictionaryToString:object];
            CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:[NSString stringWithFormat:jsonString]];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:commandLocal.callbackId];
        }else{
            stateTx = PROCESSING_STATE;
            typeCardEntry = BAND;
            NSMutableDictionary* cardInfoObj = [self getDataTransactionSwipeBand:decodeData];
            NSLog(@"decodeData: %@",cardInfoObj);
            if(cardInfoObj[@"isChip"] == YES){
                stateTx = ERROR_SWIPE_CHIP;
                [mQPOSService doCheckCard:30];
            }else{
                stateTx = APPROVAL;
                object = nil;
                cardInfo = [self convertDictionaryToString:cardInfoObj];
                object = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                          SUCCESFUL, @"code",
                          @"success", @"message",
                          cardInfo, @"data",
                          nil];
                NSString *jsonString = [self convertDictionaryToString:object];
                CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:[NSString stringWithFormat:jsonString]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:commandLocal.callbackId];
            }
        }
        
    }else if (result==DoTradeResult_NO_RESPONSE){
        stateTx = DECLINE;
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[NSString stringWithFormat:@"no method found to %@","name"]];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:commandLocal.callbackId];
    }else if(result==DoTradeResult_BAD_SWIPE){
    }
    else if((result==DoTradeResult_NFC_ONLINE) || (result==DoTradeResult_NFC_OFFLINE)){
        NSString *track2 = [mQPOSService getICCTag:EncryptType_encrypted cardType:1 tagCount:1 tagArrStr:TAG_57][@"tlv"];
        NSString *track2_plain = [mQPOSService getICCTag:EncryptType_plaintext cardType:1 tagCount:1 tagArrStr:TAG_57][@"tlv"];
        NSDictionary* tlvTag;
        NSString* jsonString;
        NSString* tagSale=@"";
        NSMutableArray* tagSalesArray = [self getArrayTagSales];
        NSString* tag;
        for(NSInteger i = 0 ; i < [tagSalesArray count] ; i++){
            tag = [tagSalesArray objectAtIndex:i];
            tlvTag = [mQPOSService getICCTag:EncryptType_plaintext cardType:1 tagCount:1 tagArrStr:tag];
            if([tag isEqualToString:TAG_9F03] ){
                tagSale = [tagSale stringByAppendingString:@"9F0306000000000000"];
            }else{
                tagSale = [tagSale stringByAppendingString:tlvTag[@"tlv"]];
            }
        }
        dispatch_async(dispatch_get_main_queue(),  ^{
            NSDictionary *mDic = [mQPOSService getNFCBatchData];
            NSString *tlv;
            if(mDic !=nil){
                tlv= [NSString stringWithFormat:@"NFCBatchData: %@\n",mDic[@"tlv"]];
                NSLog(@"--------nfc:tlv%@",tlv);
            }else{
                tlv = @"";
            }
        });
        
        NSString *formatID = decodeData[@"formatID"] ;
        NSString *maskedPAN = decodeData[@"maskedPAN"];
        NSString *expiryDate = decodeData[@"expiryDate"];
        NSString *cardHolderName = decodeData[@"cardholderName"];
        NSString *serviceCode = decodeData[@"serviceCode"];
        NSString *encTrack1 = decodeData[@"encTrack1"];
        NSString *encTrack2 = decodeData[@"encTrack2"];
        NSString *encTrack3 = decodeData[@"encTrack3"];
        //NSString *partialTrack = [NSString stringWithFormat:@"Partial Track: %@",decodeData[@"partialTrack"]];
        NSString *pinKsn = decodeData[@"pinKsn"];
        NSString *trackksn = decodeData[@"trackksn"];
        NSString *pinBlock = decodeData[@"pinblock"];
        NSString *encPAN = decodeData[@"encPAN"];
        
        NSString *pan = @"";
        pan = maskedPAN;
        NSString *lastfour = [pan substringFromIndex:pan.length-4];
        pan = [pan substringToIndex:6];
        pan = [pan stringByAppendingString:@"******"];
        pan = [pan stringByAppendingString:lastfour];
        
        NSString *tarjetaHabiente = [mQPOSService getICCTag:EncryptType_plaintext cardType:1 tagCount:1 tagArrStr:TAG_5F20][@"tlv"];
        if(![tarjetaHabiente isEqualToString:@""]){
            tarjetaHabiente = [tarjetaHabiente substringFromIndex:6];
            tarjetaHabiente = [self hexToString:tarjetaHabiente];
        }
        NSString *fechaExp = expiryDate;
        
        NSString *label = [mQPOSService getICCTag:EncryptType_plaintext cardType:1 tagCount:1 tagArrStr:TAG_9F12][@"tlv"];
        if(![label isEqualToString:@""]){
            label = [label substringFromIndex:6];
        }
        NSString *arqc = [mQPOSService getICCTag:EncryptType_plaintext cardType:1 tagCount:1 tagArrStr:TAG_9F26][@"tlv"];
        if(![arqc isEqualToString:@""]){
            arqc = [arqc substringFromIndex:6];
        }
        NSString *aid = [mQPOSService getICCTag:EncryptType_plaintext cardType:1 tagCount:1 tagArrStr:TAG_84][@"tlv"];
        if(![aid isEqualToString:@""]){
            aid = [aid substringFromIndex:4];
        }
        tipoCuentaId = DEBITO;//[self getTypeCardEmv:aid :label];
        NSString* franquicia = [self getFranquisieCardEmv:aid];
        NSString* posEntrymode;
        NSString*track2_enc;
        NSString*ksn;
        if(![arqc isEqualToString:@""]){
            track2_enc = [self getTrack2Data:track2][@"track2_enc"];
            ksn = [self getTrack2Data:track2][@"ksn"];
            posEntrymode = CONTACTLESS_CHIP;
        }else{
            track2_enc = encTrack2;
            ksn = trackksn;
            posEntrymode = CONTACTLESS_BAND;
        }
        NSLog(@" pinBLOCK %@:",pinBlock);
        NSLog(@" ksn pinblock %@:",pinKsn);
        NSLog(@" arqc %@:",arqc);
        NSLog(@" track2 %@:",track2);
        NSLog(@" pan %@:",pan);
        NSLog(@" aid %@:",aid);
        NSLog(@" tarjetaHabiente %@:",tarjetaHabiente);
        NSLog(@" fechaExp %@:",fechaExp);
        NSLog(@" label %@:",label);
        NSLog(@" track2_plain %@:",track2_plain);
        NSLog(@" track2 %@:",track2_plain);
        NSLog(@" aid %@:",aid);
        NSMutableDictionary *objectCard =nil;
        objectCard = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                      tarjetaHabiente, @"tarjetaHabiente",
                      fechaExp, @"fechaExp",
                      ksn, @"ksn",
                      pinKsn, @"ksnPinBlock",
                      pan, @"panEnmascarado",
                      pan, @"pan",
                      track2_enc, @"track2",
                      @(NO), @"isBanda",
                      @(NO), @"isChip",
                      CONTACTLESS_CHIP, @"PosEntryMode",
                      pinBlock,@"pinBlock",
                      tipoCuentaId,@"tipoCuentaId",
                      lastfour,@"ultimosCuatro",
                      franquicia,@"franquicia",
                      [NSNumber numberWithInt:MODE_CONTACTLESS],@"tipoEntrada",
                      @(NO),@"fallback",
                      aid,@"aid",
                      tagSale,@"tagVenta",
                      arqc,@"arqc",
                      nil];
        cardInfo = [self convertDictionaryToString: objectCard];
        object = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                  SUCCESFUL, @"code",
                  @"success", @"message",
                  cardInfo, @"data",
                  nil];
        NSLog(@"onRequestOnlineProcess: %@",object);
        stateTx = APPROVAL;
        jsonString = [self convertDictionaryToString: object];
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:[NSString stringWithFormat:jsonString]];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:commandLocal.callbackId];
        
    }
    else if(result==DoTradeResult_NFC_DECLINED){
        stateTx = DECLINE;
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[NSString stringWithFormat:@""]];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:commandLocal.callbackId];
    }
    else if(result==DoTradeResult_NONE){
        stateTx = DECLINE;
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[NSString stringWithFormat:@""]];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:commandLocal.callbackId];
    }else{
        stateTx = DECLINE;
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[NSString stringWithFormat:@""]];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:commandLocal.callbackId];
    }
}
-(void) onRequestTime{
    NSLog(@"+++QPOS PLUGIN onRequestTime+++");
    //    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    //    [dateFormatter setDateFormat:@"yyyyMMddHHmmss"];
    //    NSString *terminalTime = [dateFormatter stringFromDate:[NSDate date]];
    [mQPOSService sendTime:_terminalTime];
    
}
-(void) onRequestDisplay: (Display)displayMsg{
    NSLog(@"+++QPOS PLUGIN onRequestDisplay+++");
    NSString *jsonString= @"";
    object =nil;
    BOOL valid = YES;
    if(displayMsg == Display_PROCESSING){
        stateTx = PROCESSING_STATE;
    }else if(displayMsg == Display_INPUT_PIN_ING){
        stateTx = GET_PIN_STATE;
    }else if(displayMsg == Display_PLEASE_WAIT){
        stateTx = PLEASE_WAIT_STATE;
    }else if(displayMsg == Display_TRANSACTION_TERMINATED){
        valid = NO;
        stateTx = DECLINE;
    }
    object = [NSMutableDictionary dictionaryWithObjectsAndKeys:
              stateTx, @"code",
              @"success", @"message",
              nil, @"data",
              nil];
    jsonString = [self convertDictionaryToString: object];
    if(valid){
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:[NSString stringWithFormat:jsonString]];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:commandLocal.callbackId];
    }else{
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[NSString stringWithFormat:jsonString]];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:commandLocal.callbackId];
    }
}

-(void) onReturnGetPinResult:(NSDictionary*)decodeData{
    NSLog(@"onRequestOnlineProcess decodeData: %@",decodeData);
    NSString *ksnPinBlock = decodeData[@"pinKsn"];
    NSString *pinblock = decodeData[@"pinBlock"];
    NSMutableDictionary *objectCard =nil;
    NSString* jsonString;
    objectCard = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                  @"", @"tarjetaHabiente",
                  @"", @"fechaExp",
                  @"", @"ksn",
                  ksnPinBlock, @"ksnPinBlock",
                  @"", @"panEnmascarado",
                  @"", @"pan",
                  @"", @"track2",
                  @(YES), @"isBanda",
                  @(NO), @"isChip",
                  @"", @"PosEntryMode",
                  pinblock,@"pinBlock",
                  @"",@"tipoCuentaId",
                  @"",@"ultimosCuatro",
                  @"",@"franquicia",
                  @"",@"tipoEntrada",
                  @(NO),@"fallback",
                  @"",@"aid",
                  @"",@"tagVenta",
                  @"",@"arqc",
                  nil];
    cardInfo = [self convertDictionaryToString: objectCard];
    
    object = [NSMutableDictionary dictionaryWithObjectsAndKeys:
              SUCCESFUL, @"code",
              @"success", @"message",
              cardInfo, @"data",
              nil];
    NSLog(@"onRequestOnlineProcess: %@",object);
    stateTx = APPROVAL;
    jsonString = [self convertDictionaryToString: object];
    NSLog(@"onRequestOnlineProcess jsonString: %@",jsonString);
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:[NSString stringWithFormat:jsonString]];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:commandLocal.callbackId];
    
}
-(void) onRequestOnlineProcess: (NSString*) tlv{
    NSLog(@"+++QPOS PLUGIN onRequestOnlineProcess+++ %@:",tlv);
    stateTx = PROCESSING_STATE;
    NSMutableDictionary *objectCard =nil;
    NSString* jsonString;
    NSDictionary* tlvTag;
    NSString* tagSale=@"";
    NSMutableArray* tagSalesArray = [self getArrayTagSales];
    NSString* tag;
    for(NSInteger i = 0 ; i < [tagSalesArray count] ; i++){
        tag = [tagSalesArray objectAtIndex:i];
        tlvTag = [mQPOSService getICCTag:EncryptType_plaintext cardType:0 tagCount:1 tagArrStr:tag];
        tagSale = [tagSale stringByAppendingString:tlvTag[@"tlv"]];
    }
    
    NSLog(@"onRequestOnlineProcess tagSale: %@",tagSale);
    objectCard = nil;
    NSString *track2 = [mQPOSService getICCTag:EncryptType_encrypted cardType:0 tagCount:1 tagArrStr:TAG_57][@"tlv"];
    NSString *track2_plain = [mQPOSService getICCTag:EncryptType_plaintext cardType:0 tagCount:1 tagArrStr:TAG_57][@"tlv"];
    NSString *pan = [[track2_plain componentsSeparatedByString:TRACK2_SEPARADOR] objectAtIndex:0];
    pan = [pan substringFromIndex:4];
    NSString *lastfour = [pan substringFromIndex:pan.length-4];
    pan = [pan substringToIndex:6];
    pan = [pan stringByAppendingString:@"******"];
    pan = [pan stringByAppendingString:lastfour];
    
    NSString *tarjetaHabiente = [mQPOSService getICCTag:EncryptType_plaintext cardType:0 tagCount:1 tagArrStr:TAG_5F20][@"tlv"];
    if(![tarjetaHabiente isEqualToString:@""]){
        tarjetaHabiente = [tarjetaHabiente substringFromIndex:6];
        tarjetaHabiente = [self hexToString:tarjetaHabiente];
    }
    NSString *fechaExp = [mQPOSService getICCTag:EncryptType_plaintext cardType:0 tagCount:1 tagArrStr:TAG_5F24][@"tlv"];
    if(![fechaExp isEqualToString:@""]){
        fechaExp = [fechaExp substringFromIndex:6];
        fechaExp = [fechaExp substringWithRange:NSMakeRange(0, 4)];
    }
    NSString *label = [mQPOSService getICCTag:EncryptType_plaintext cardType:0 tagCount:1 tagArrStr:TAG_9F12][@"tlv"];
    if(![label isEqualToString:@""]){
        label = [label substringFromIndex:6];
    }
    NSString *arqc = [mQPOSService getICCTag:EncryptType_plaintext cardType:0 tagCount:1 tagArrStr:TAG_9F26][@"tlv"];
    if(![arqc isEqualToString:@""]){
        arqc = [arqc substringFromIndex:6];
    }
    NSString *aid = [mQPOSService getICCTag:EncryptType_plaintext cardType:0 tagCount:1 tagArrStr:TAG_84][@"tlv"];
    if(![aid isEqualToString:@""]){
        aid = [aid substringFromIndex:4];
    }
    tipoCuentaId = [self getTypeCardEmv:aid :label];
    NSString* franquicia = [self getFranquisieCardEmv:aid];
    NSString*track2_enc = [self getTrack2Data:track2][@"track2_enc"];
    NSString*ksn = [self getTrack2Data:track2][@"ksn"];
    NSString *pinblock = [self getTagQposByName:TAG_C7:tlv][@"value"];
    NSString *ksnPinblock= [self getTagQposByName:TAG_C1:tlv][@"value"];
    NSLog(@" pinBLOCK %@:",pinblock);
    NSLog(@" ksn pinblock %@:",ksnPinblock);
    NSLog(@" arqc %@:",arqc);
    NSLog(@" track2 %@:",track2);
    NSLog(@" pan %@:",pan);
    NSLog(@" aid %@:",aid);
    NSLog(@" tarjetaHabiente %@:",tarjetaHabiente);
    NSLog(@" fechaExp %@:",fechaExp);
    NSLog(@" label %@:",label);
    NSLog(@" track2_plain %@:",track2_plain);
    NSLog(@" track2 %@:",track2_plain);
    NSLog(@" aid %@:",aid);
    objectCard = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                  tarjetaHabiente, @"tarjetaHabiente",
                  fechaExp, @"fechaExp",
                  ksn, @"ksn",
                  ksnPinblock, @"ksnPinBlock",
                  pan, @"panEnmascarado",
                  pan, @"pan",
                  track2_enc, @"track2",
                  @(NO), @"isBanda",
                  @(YES), @"isChip",
                  CHIP, @"PosEntryMode",
                  pinblock,@"pinBlock",
                  tipoCuentaId,@"tipoCuentaId",
                  lastfour,@"ultimosCuatro",
                  franquicia,@"franquicia",
                  [NSNumber numberWithInt:MODE_EMV],@"tipoEntrada",
                  @(NO),@"fallback",
                  aid,@"aid",
                  tagSale,@"tagVenta",
                  arqc,@"arqc",
                  nil];
    cardInfo = [self convertDictionaryToString: objectCard];
    object = [NSMutableDictionary dictionaryWithObjectsAndKeys:
              SUCCESFUL, @"code",
              @"success", @"message",
              cardInfo, @"data",
              nil];
    NSLog(@"onRequestOnlineProcess: %@",object);
    stateTx = APPROVAL;
    jsonString = [self convertDictionaryToString: object];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:[NSString stringWithFormat:jsonString]];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:commandLocal.callbackId];
}

-(void) onRequestTransactionResult: (TransactionResult)transactionResult{
    NSLog(@"+++QPOS PLUGIN onRequestTransactionResult+++");
    NSString *messageTextView = @"";
    if (transactionResult==TransactionResult_APPROVED) {
        NSLog(@"+++QPOS PLUGIN onRequestTransactionResult APPROVED+++");
        stateTx = APPROVAL;
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:[NSString stringWithFormat:@""]];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:commandLocal.callbackId];
    }else if(transactionResult == TransactionResult_TERMINATED) {
        NSLog(@"+++QPOS PLUGIN onRequestTransactionResult TERMINATED+++");
        stateTx = DECLINE;
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[NSString stringWithFormat:@""]];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:commandLocal.callbackId];
    } else if(transactionResult == TransactionResult_DECLINED) {
        NSLog(@"+++QPOS PLUGIN onRequestTransactionResult DECLINED+++");
        stateTx = DECLINE;
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[NSString stringWithFormat:@""]];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:commandLocal.callbackId];
    } else if(transactionResult == TransactionResult_CANCEL) {
        NSLog(@"+++QPOS PLUGIN onRequestTransactionResult CANCEL+++");
        stateTx = DECLINE;
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[NSString stringWithFormat:@""]];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:commandLocal.callbackId];
    } else if(transactionResult == TransactionResult_CAPK_FAIL) {
        NSLog(@"+++QPOS PLUGIN onRequestTransactionResult CAPK_FAIL+++");
        stateTx = DECLINE;
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[NSString stringWithFormat:@""]];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:commandLocal.callbackId];
    } else if(transactionResult == TransactionResult_NOT_ICC) {
        NSLog(@"+++QPOS PLUGIN onRequestTransactionResult NOT_ICC+++");
        stateTx = DECLINE;
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[NSString stringWithFormat:@""]];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:commandLocal.callbackId];
    } else if(transactionResult == TransactionResult_SELECT_APP_FAIL) {
        NSLog(@"+++QPOS PLUGIN onRequestTransactionResult SELECT_APP_FAIL+++");
        stateTx = DECLINE;
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[NSString stringWithFormat:@""]];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:commandLocal.callbackId];
    } else if(transactionResult == TransactionResult_DEVICE_ERROR) {
        stateTx = DECLINE;
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[NSString stringWithFormat:@""]];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:commandLocal.callbackId];
    } else if(transactionResult == TransactionResult_CARD_NOT_SUPPORTED) {
        stateTx = DECLINE;
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[NSString stringWithFormat:@""]];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:commandLocal.callbackId];
    } else if(transactionResult == TransactionResult_MISSING_MANDATORY_DATA) {
        stateTx = DECLINE;
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[NSString stringWithFormat:@""]];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:commandLocal.callbackId];
    } else if(transactionResult == TransactionResult_CARD_BLOCKED_OR_NO_EMV_APPS) {
        stateTx = DECLINE;
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[NSString stringWithFormat:@""]];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:commandLocal.callbackId];
    } else if(transactionResult == TransactionResult_INVALID_ICC_DATA) {
        stateTx = DECLINE;
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[NSString stringWithFormat:@""]];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:commandLocal.callbackId];
    }else if(transactionResult == TransactionResult_NFC_TERMINATED) {
        stateTx = DECLINE;
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[NSString stringWithFormat:@""]];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:commandLocal.callbackId];
    }else{
        stateTx = DECLINE;
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[NSString stringWithFormat:@""]];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:commandLocal.callbackId];
    }
    
}
-(void)completeTransacction : (NSMutableDictionary*)jsonResponse{
    NSLog(@"+++QPOS PLUGIN completeTransacction+++%@:",[self convertDictionaryToString:jsonResponse]);
    NSString* tlv = jsonResponse[@"tagInfo"]; //@"9100102E4F1B34B0441F690012";//jsonResponse[@"tagInfo"];
    NSString* tlvAux;
    if([tlv isEqualToString: @""]){
        tlvAux = tlv;
        tlvAux = [@"8A023030" stringByAppendingString:tlvAux];
    }else{
        tlvAux=[tlv substringWithRange:NSMakeRange(2,4)];
        NSLog(@"+++QPOS PLUGIN completeTransacction+++%@:",tlvAux);
        NSInteger lenDec = [ tlvAux intValue];
        NSLog(@"+++QPOS PLUGIN completeTransacction+++%d:",lenDec);
        NSString* lhex = [NSString stringWithFormat:@"%X", lenDec];
        NSLog(@"+++QPOS PLUGIN completeTransacction+++%@:",lhex);
        if(lhex.length == 1){
            lhex = [@"0" stringByAppendingString:lhex];
        }
        tlvAux=[tlv substringToIndex:2];
        tlvAux=[tlvAux stringByAppendingString:lhex];
        tlvAux=[tlvAux stringByAppendingString:[tlv substringFromIndex:6]];
        tlvAux = [@"8A023030" stringByAppendingString:tlvAux];
    }
    [mQPOSService sendOnlineProcessResult:tlvAux];
}
-(void) onRequestBatchData: (NSString*)tlv{
    NSLog(@"+++QPOS PLUGIN onRequestBatchData+++");
    NSLog(@"onBatchData %@",tlv);
    tlv = [@"batch data:\n" stringByAppendingString:tlv];
}

-(void) onReturnReversalData: (NSString*)tlv{
    NSLog(@"+++QPOS PLUGIN onReturnReversalData+++");
    NSLog(@"onReversalData %@",tlv);
    tlv = [@"reversal data:\n" stringByAppendingString:tlv];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[NSString stringWithFormat:tlv]];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:commandLocal.callbackId];
}
-(void) resetStatusMode{
    NSLog(@"+++QPOS PLUGIN resetStatusMode+++");
    [mQPOSService resetPosStatus];
}
-(void) isInsertCard{
    NSLog(@"+++QPOS PLUGIN isInsertCard+++");
    /*
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR
                                                      messageAsString:[NSString stringWithFormat:@""]];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:commandLocal.callbackId];
     */
    /*
     [mQPOSService isCardExist:30 withResultBlock:^(BOOL isExist){
     object =nil;
     if(isExist){
     object = [NSMutableDictionary dictionaryWithObjectsAndKeys:
     @"1", @"code",
     @"success", @"message",
     nil, @"data",
     nil];
     CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK
     messageAsString:[NSString stringWithFormat:[self convertDictionaryToString: object]]];
     [self.commandDelegate sendPluginResult:pluginResult callbackId:commandLocal.callbackId];
     }else{
     object = [NSMutableDictionary dictionaryWithObjectsAndKeys:
     @"0", @"code",
     @"error", @"message",
     nil, @"data",
     nil];
     CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR
     messageAsString:[NSString stringWithFormat:[self convertDictionaryToString: object]]];
     [self.commandDelegate sendPluginResult:pluginResult callbackId:commandLocal.callbackId];
     }
     }];
     */
    bool isExist = [mQPOSService syncIsCardExist:30];
    if(isExist){
        object = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                  @"1", @"code",
                  @"success", @"message",
                  nil, @"data",
                  nil];
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK
                                                          messageAsString:[NSString stringWithFormat:[self convertDictionaryToString: object]]];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:commandLocal.callbackId];
    }else{
        object = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                  @"0", @"code",
                  @"error", @"message",
                  nil, @"data",
                  nil];
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR
                                                          messageAsString:[NSString stringWithFormat:[self convertDictionaryToString: object]]];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:commandLocal.callbackId];
    }
}
//--------------------------------------------------------------------------------------------------------------------------------------------
//UPDATE_KEYS---------------------------------------------------------------------------------------------------------------------------------
-(void)updateIPEKKeys{
    NSLog(@"QPOS PLUGIN updateIPEKKeys");
    NSLog(@"--------PRUEBAS-----");
    [mQPOSService doUpdateIPEKOperation:@"00"
                                tracksn:@"FFFF2000000000E00000" trackipek:@"FD46473F2AC4BED4467DB6C4BA1F3405" trackipekCheckValue:@"2E8FA4CFE72C0F54"
                                 emvksn:@"FFFF2000000000E00000" emvipek:@"FD46473F2AC4BED4467DB6C4BA1F3405" emvipekcheckvalue:@"2E8FA4CFE72C0F54"
                                 pinksn:@"FFFF1000000001E00000" pinipek:@"785BB9F6B00AEC5E476F0D40E0423833" pinipekcheckValue:@"99EC3240673A1D2F"
                                  block:^(BOOL isSuccess, NSString *stateStr) {
                                      if (isSuccess) {
                                          /*
                                          object =nil;
                                          object = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                                    @"1", @"code",
                                                    @"success", @"message",
                                                    nil, @"data",
                                                    nil];
                                          CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK
                                                                                            messageAsString:[NSString stringWithFormat:[self convertDictionaryToString: object]]];
                                          [self.commandDelegate sendPluginResult:pluginResult callbackId:commandLocal.callbackId];
                                           */
                                          //NSString *emvAppCfg = [Util byteArray2Hex:[self readLine:@"emv_app"]];
                                          //NSString *emvCapkCfg = [Util byteArray2Hex:[self readLine:@"emv_capk"]];
                                          NSString *emvAppCfg = @"F06004A8000810A80000F06854F8000000000001F40000000000F4F0F0FAAFEE8000010F000000001388000200000100000005210000000005210000B6C0C00000000000012260F8C8E000F0F001A0000000031010000000000000000000070001810012345678901234424354455354313233343536373800616263640000000000000000000000017002017002017038333230314943434E4C2D475037333003009F3704000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000060F8C8E000F0F00100000521000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000009F1A0295059A039C0100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000F06004A8000810A80000F06854F8000000000001F40000000000F4F0F0FAAFFE8000010F000000001388000200000100000005210000000005210000B6C0C00000000000012260F8C8E000F0F001A0000000032010000000000000000000070001050012345678901234424354455354313233343536373800616263640000000000000000000000017002017000017038333230314943434E4C2D475037333003009F3704000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000060F8C8E000F0F00100000521000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000009F1A0295059A039C0100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000F06004A8000810A80000F06854F8000000000001F40000000000F4F0F0FAAFFE8000010F000000001388000200000100000005210000000005210000B6C0C00000000000012260F8C8E000F0F001A0000000033010000000000000000000070001050012345678901234424354455354313233343536373800616263640000000000000000000000017002017000017038333230314943434E4C2D475037333003009F3704000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000060F8C8E000F0F00100000521000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000009F1A0295059A039C0100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000F06004A8000810A80000F06854F8000000000001F40000000000F4F0F0FAAFFE8000010F000000001388000200000100000005210000000005210000B6C0C00000000000012260F8C8E000F0F001A0000000041010000000000000000000070002050012345678901234424354455354313233343536373800616263640000000000000000000000017002017000017038333230314943434E4C2D475037333003009F3704000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000060F8C8E000F0F00100000521000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000009F1A0295059A039C01000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005DF811801400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000F06004A8000810A80000F06854F8000000000001F40000000000F4F0F0FAAFFE8000010F000000001388000200000100000005210000000005210000B6C0C00000000000012260F8C8E000F0F001A0000000042203000000000000000000070002050012345678901234424354455354313233343536373800616263640000000000000000000000017002017000017038333230314943434E4C2D475037333003009F3704000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000060F8C8E000F0F00100000521000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000009F1A0295059A039C01000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005DF811801400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000F06004A8000810A80000F06854F8000000000001F40000000000F4F0F0FAAFFE8000010F000000001388000200000100000005210000000005210000B6C0C00000000000012260F8C8E000F0F001A0000000043060000000000000000000070002050012345678901234424354455354313233343536373800616263640000000000000000000000017002017000017038333230314943434E4C2D475037333003009F3704000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000060F8C8E000F0F00100000521000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000009F1A0295059A039C01000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005DF811801400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000F06004A8000810A80000F06854F8000000000001F40000000000F4F0F0FAAFFE8000010F000000001388000200000100000005210000000005210000B6C0C00000000000012260F8C8E000F0F001A000000025010000000000000000000006008C050012345678901234424354455354313233343536373800616263640000000000000000000000017002017000017038333230314943434E4C2D475037333003009F3704000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000060F8C8E000F0F00100000521000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000009F1A0295059A039C0100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000F06004A8000810A80000F06854F8000000000001F40000000000F4F0F0FAAFFE8000010F000000001388000200000100000005210000000005210000B6C0C00000000000012260F8C8E000F0F001A000000524101000000000000000000007008C050012345678901234424354455354313233343536373800616263640000000000000000000000017002017000017038333230314943434E4C2D475037333003009F3704000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000060F8C8E000F0F00100000521000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000009F1A0295059A039C0100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000F06004A8000810A80000F06854F8000000000001F40000000000F4F0F0FAAFFE8000010F000000001388000200000100000005210000000005210000B6C0C00000000000012260F8C8E000F0F001A000000065101000000000000000000007008C050012345678901234424354455354313233343536373800616263640000000000000000000000017002017000017038333230314943434E4C2D475037333003009F3704000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000060F8C8E000F0F00100000521000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000009F1A0295059A039C0100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000F06004A8000810A80000F06854F8000000000001F40000000000F4F0F0FAAFFE8000010F000000001388000200000100000005210000000005210000B6C0C00000000000012260F8C8E000F0F001A000000152301000000000000000000007008C050012345678901234424354455354313233343536373800616263640000000000000000000000017002017000017038333230314943434E4C2D475037333003009F3704000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000060F8C8E000F0F00100000521000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000009F1A0295059A039C0100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000";
                                          NSString *emvCapkCfg = @"B40C4863DEFF8314F10438E29CCF8017DA2763FDA5C8C6EC6153758F1E306D1BAAAF67D5790F959ACC07EFAD0C0081731E45B694E030262C897517B2C0B25B17E362AC2FD2D00194FDDB3BDC85DC85DE1FDC46F8277E20DEADB9A68C70724076EE589F94AF7B8900F2AC63396C775EED5102AE6AE53375FB4B6654115D130F1EDC0AD8478796E9C485D50C6481238ADD9B0C262D58EE41D86BF656C58E4DA74C9028DCF804C4E45ACD011D48E6FEE6D3000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000B0000003ED7828B72338B382A9C5EE7686C6F4CC6012030520311222AAA000000105010100000000B31FF647CA3D5470E868FFAFF1D7AE98B15973F4303E5209F1B2677C5E214DC3FC38015FE6181387B9D404B0CED88AABC1F9360907F8416CD7D1AFF56E42EA2E60EC7689E25CEFDD1A37ADCBCA9FBDD0AF2CA5F21378DB401E74EA3D8B2D37A7014B78ED08E10F18021FE37F17A1420F0B617A9A94A4336F854075BE3D26EF8D759A3D3BE907340BF7EA9DD5C77F17F89F574ACF7AAF12AE0AA3F8F2E20C349132987410C100C05FA8F2077B14BFFAC5000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000B00000036BE6BA60529B3FB7AFBB1F72D83FAB3EC31AA05D20311222AAA0000001140101000000009F195B12D96931CFEF724283EFA2B564EAC6033A854DAB488B66D0E0EA242FD1E77EFBC5AB9D571025A6B47378FC868C655255C2EDFBAB76FE9EEC0BACA132CC91C4305D5F10F8170660DFDD3E16EBDA280A858590B790615FFC46B46F74D981D50B004A15A504FD50C42FA360CF5C019CAF0CA9A3D6D03EED40F31DF4AA0BEC72CC724EDC41570B94C9766AE3C399136C6DD551151BA079274919ED83F4D2A69942406AF6BBA0EC1E5EECBEA47D6FBD000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000B000000387185F1BB916EBCE72BDC64818F0A48479A9603420311222AAA000000115010100000000B537FC19AF7749FD41F2F601CC9EA0517AB532014AB93058E5DE71744756D7D7EE7CEBC2869276FCDA10538FEA6E1E9FB9E15F3A33411406FC3204BB5831F1F3882F07F72C6D72E98A51860717C0F4E00323D9278D8130A6829D8ED741C5B1F50C561A5C07539286356CFC0313870E1339FE4E4AFBEFA3DBD4FE8C001F20812FE78BAF96D26AF817941CE0D6418F838FD76547CE18AD22E62EF6B4FE0BD9E9E52952907A0641C0C7C6E71F9E3F114C9B000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000B00000033042BBFFE3827BF7EC449D3A489B6B6A27C9C73320311222AAA000000116010100000000BCCCA29AA4E4755BA36B0187D10D90888E1CFAAAA3FCD22078EC9D3E8A0687B101BB5AEBEF0F2E531935C81835B1C70BF3FD3F83EC9C95AAE1D7FDE1A0DEDC2CFDB2388E82C2A19A02ADC45C6833DBC8D6CE40E2DD9EAA44E301B8A5C62214B4906529D4F080D11D12E484C51ECF6FF825240BA1D14ABED8917610CAD68951704E876DDBE289E47A2E3940B74766A9D56E259130E34EBB3BCE6F5A8A520ABF6973716816BC6F135CBBEC51E36562221DEAD7FA163C753C423ADDB7E8BA7A7681F50AF9B0971E99A287C1F64972FEFDA1CFD809682AD6D3EAAC47B7686872F86E51402453F888B7D7AE64B507F16B34E07726312242006C9BF800000332FFDCF67CE0EB1BF6BDCD0168D3D7B0B7FFF3B520311222AAA000000118010100000000E93F3B90109F4646B76B60033551084FB6E0B89AC9A7C94DF324C83361F0CD7A2C68455BAE465A3A9FDBA9D44303545CE165D46A3870EE33CC0CBB320E7B3B674CD9E4CF2E7975DE27A4FAA1D40B850B991E131E9A47913215781F86C4A18C94F1397613156B3152C5EB4E80C1FDF9D17953BDC0A75DD8640ECDD41D703BEDF2D047956EC938F7ED21B250CDE006C920C85226C81F869D4F35B82DF3F358717763C97D845C151C31920D588370A64694E883E45C0943CC92FF26CB98347DEC93964DAFACFCFC4E27F73E51D771340184F38850A3B65F08AA09F2194A40672827A3252B1526BF9E994F094691D5D2D0C96A7749A2AB3BD4E1F8000003E1F40AA93CF91B8235A2D92644463885149B8AC420311222AAA000000119010100000000979151BF880C8FD34ED6510C52544FEE1C42AC6666A1EF362411900F5969EAA032CC3CDF28A3682011D23042D62C6E1E390E8FEBE0402CD2DC82176B01622AD6ACE58E3F3F7EEA5EDB96FC22C5FD3AE65F899FC9683943399F114BAE7B02E3DF2450137A4FF3D934E1098C92A1A7C649B2745A3988699AFE6016EAD2ED3C264E05E0D329B013C82E6A58472C440CA4B3D5CF1A451F369BDBD37087DE9F62AE70156CA975E9B3AA5B19DE59D9E9713B50E3AC0EA16008763249B01F38896D5C2EE5762D81DD6FFA66E6367C389286A02061D1EF3E304CAEA254A9D00AE628FF297DA962ABAF443A25F5EE731B12911E4B6053FA65BD7164D3F8000003BD658FCEA8318D77805489C3134E2C3224878FAB20311222AAA00000011A010100000000A500B6EED90FEA2999862D101C2F29309A24D1FD3E10501EB70DDE3DE403A5451F6B5CDA0748C87A4E8EFE916FC968FBB3808D6C7561ED3A3B4C74E8A158179C6EE8FEA1B6D9877C2C22B453F5A72E23078970FAAEF7D6855BA452865F2D69CDF675A82CC7CF19BEE4167D5E08F14BB2A756BA8F13B2DB4025895037ED5B7502F257AADC50ADE6C0E424DDE8523414013378ADF59E7CAE88EFA62B5E786BED011BBD64BAAD61F4DADC7B15FCF755CBF1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000B00000034E01BDB84A0EEE9D14CA789CFF5160FABBE4766420311222AAA0000001F1010100000000C696034213D7D8546984579D1D0F0EA519CFF8DEFFC429354CF3A871A6F7183F1228DA5C7470C055387100CB935A712C4E2864DF5D64BA93FE7E63E71F25B1E5F5298575EBE1C63AA617706917911DC2A75AC28B251C7EF40F2365912490B939BCA2124A30A28F54402C34AECA331AB67E1E79B285DD5771B5D9FF79EA630B7500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080000003D34A6A776011C7E7CE3AEC5F03AD2F8CFC5503CC20311217A00000000301010100000000B3E5E667506C47CAAFB12A2633819350846697DD65A796E5CE77C57C626A66F70BB630911612AD2832909B8062291BECA46CD33B66A6F9C9D48CED8B4FC8561C8A1D8FB15862C9EB60178DEA2BE1F82236FFCFF4F3843C272179DCDD384D541053DA6A6A0D3CE48FDC2DC4E3E0EEE15F0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070000003FE70AB3B4D5A1B9924228ADF8027C758483A8B7E20311217A00000000303010100000000D0135CE8A4436C7F9D5CC66547E30EA402F98105B71722E24BC08DCC80AB7E71EC23B8CE6A1DC6AC2A8CF55543D74A8AE7B388F9B174B7F0D756C22CBB5974F9016A56B601CCA64C71F04B78E86C501B193A5556D5389ECE4DEA258AB97F52A300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006000000386DF041E7995023552A79E2623E49180C0CD957A20311217A00000000305010100000000F934FC032BE59B609A9A649E04446F1B365D1D23A1E6574E490170527EDF32F398326159B39B63D07E95E6276D7FCBB786925182BC0667FBD8F6566B361CA41A38DDF227091B87FA4F47BAC780AC47E15A6A0FB65393EB3473E8D193A07EB579000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000060000003A0DF5DAA385AE3E0E21BFD34D9D8A30506B19B1220311217A00000000306010100000000A89F25A56FA6DA258C8CA8B40427D927B4A1EB4D7EA326BBB12F97DED70AE5E4480FC9C5E8A972177110A1CC318D06D2F8F5C4844AC5FA79A4DC470BB11ED635699C17081B90F1B984F12E92C1C529276D8AF8EC7F28492097D8CD5BECEA16FE4088F6CFAB4A1B42328A1B996F9278B0B7E3311CA5EF856C2F888474B83612A82E4E00D0CD4069A6783140433D50725F000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000090000003B4BC56CC4E88324932CBC643D6898F6FE593B17220311217A00000000307010100000000D9FD6ED75D51D0E30664BD157023EAA1FFA871E4DA65672B863D255E81E137A51DE4F72BCC9E44ACE12127F87E263D3AF9DD9CF35CA4A7B01E907000BA85D24954C2FCA3074825DDD4C0C8F186CB020F683E02F2DEAD3969133F06F7845166ACEB57CA0FC2603445469811D293BFEFBAFAB57631B3DD91E796BF850A25012F1AE38F05AA5C4D6D03B1DC2E568612785938BBC9B3CD3A910C1DA55A5A9218ACE0F7A21287752682F15832A678D6E1ED0B000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000B000000320D213126955DE205ADC2FD2822BD22DE21CF9A820311223A000000003080101000000009D912248DE0A4E39C1A7DDE3F6D2588992C1A4095AFBD1824D1BA74847F2BC4926D2EFD904B4B54954CD189A54C5D1179654F8F9B0D2AB5F0357EB642FEDA95D3912C6576945FAB897E7062CAA44A4AA06B8FE6E3DBA18AF6AE3738E30429EE9BE03427C9D64F695FA8CAB4BFE376853EA34AD1D76BFCAD15908C077FFE6DC5521ECEF5D278A96E26F57359FFAEDA19434B937F1AD999DC5C41EB11935B44C18100E857F431A4A5A6BB65114F174C2D7B59FDF237D6BB1DD0916E644D709DED56481477C75D95CDD68254615F7740EC07F330AC5D67BCD75BF23D28A140826C026DBDE971A37CD3EF9B8DF644AC385010501EFC6509D7A41F80000031FF80A40173F52D7D27E0F26A146A1C8CCB2904620311222A000000003090101000000009F2701C0909CCBD8C3ED3E071C69F776160022FF3299807ED7A035ED5752770E232D56CC3BE159BD8F0CA8B59435688922F406F55C75639457BBABEFE9A86B2269EF223E34B91AA6DF2CCAD03B4AD4B443D61575CA960845E6C69040101E231D9EF811AD99B0715065A0E661449C41B4B023B7716D1E4AFF1C90704E55AE122500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080000003833B1947778036B6D759FCE3F618DDEB2749372C20311222A00000000310010100000000998D2AD946A60FC597D93807DB54B2B0A550871E43F1779F073AF08D9B04ABD17C8A7DAA3E66EE443F30F92648FC53DA57A78364B062FEDB50F7235B937E16E5F6D9E6BA8F106FB325ECA25125111CE04B43098CDEA8A41426FC6D94F8A47619EDB12789581808692CFBA1F38E8008CC5E02066A1889D52F77B9A121E6597F39000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000800000037AC3D80EF01E9A998F0A77181E64B36747DC51EB20311222A00000000320010100000000D11197590057B84196C2F4D11A8F3C05408F422A35D702F90106EA5B019BB28AE607AA9CDEBCD0D81A38D48C7EBB0062D287369EC0C42124246AC30D80CD602AB7238D51084DED4698162C59D25EAC1E66255B4DB2352526EF0982C3B8AD3D1CCE85B01DB5788E75E09F44BE7361366DEF9D1E1317B05E5D0FF5290F88A0DB4700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080010001B769775668CACB5D22A647D1D993141EDAB7237B20311222A00000000350010100000000DB5FA29D1FDA8C1634B04DCCFF148ABEE63C772035C79851D3512107586E02A917F7C7E885E7C4A7D529710A145334CE67DC412CB1597B77AA2543B98D19CF2CB80C522BDBEA0F1B113FA2C86216C8C610A2D58F29CF3355CEB1BD3EF410D1EDD1F7AE0F16897979DE28C6EF293E0A19282BD1D793F1331523FC71A228800468C01A3653D14C6B4851A5C029478E757F000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000090000003B9D248075A3F23B522FE45573E04374DC4995D7120311222A00000000351010100000000AFF740F8DBE763F333A1013A43722055C8E22F41779E219B0E1C409D60AFD45C8789C57EECD71EA4A269A675916CC1C5E1A05A35BD745A79F94555CE29612AC9338769665B87C3CA8E1AC4957F9F61FA7BFFE4E17631E937837CABF43DD6183D6360A228A3EBC73A1D1CDC72BF09953C81203AB7E492148E4CB774CDDFAAC3544D0DD4F8C8A0E9C70B877EA79F2C22E4CE52C69F3EF376F61B0F43A540FE96C63F586310C3B6E39C78C4D647CADB5933000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000B0000003D6F78FB14CB58B0E0B67BFA7870FB8DFBEE2AD0120311222A00000000352010100000000BCD83721BE52CCCC4B6457321F22A7DC769F54EB8025913BE804D9EABBFA19B3D7C5D3CA658D768CAF57067EEC83C7E6E9F81D0586703ED9DDDADD20675D63424980B10EB364E81EB37DB40ED100344C928886FF4CCC37203EE6106D5B59D1AC102E2CD2D7AC17F4D96C398E5FD993ECB4FFDF79B17547FF9FA2AA8EEFD6CBDA124CBB17A0F8528146387135E226B005A474B9062FF264D2FF8EFA36814AA2950065B1B04C0A1AE9B2F69D4A4AA979D6CE95FEE9485ED0A03AEE9BD953E81CFD1EF6E814DFD3C2CE37AEFA38C1F9877371E91D6A5EB59FDEDF75D3325FA3CA66CDFBA0E57146CC789818FF06BE5FCC50ABD362AE4B80996DF8000003AC213A2E0D2C0CA35AD0201323536D58097E4E5720311222A0000000035301010000000099552C4A1ECD68A0260157FC4151B5992837445D3FC57365CA5692C87BE358CDCDF2C92FB6837522842A48EB11CDFFE2FD91770C7221E4AF6207C2DE4004C7DEE1B6276DC62D52A87D2CD01FBF2DC4065DB52824D2A2167A06D19E6A0F781071CDB2DD314CB94441D8DC0E936317B77BF06F5177F6C5ABA3A3BC6AA30209C97260B7A1AD3A192C9B8CD1D153570AFCC87C3CD681D13E997FE33B3963A0A1C79772ACF991033E1B8397AD0341500E48A24770BC4CBE19D2CCF419504FDBF0389BC2F2FDCD4D44E61F000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000C8010001E6D302EBE7DC6F267E4D00F7D488F0AB6235F10520311222A00000000358010100000000C26B3CB3833E42D8270DC10C8999B2DA18106838650DA0DBF154EFD51100AD144741B2A87D6881F8630E3348DEA3F78038E9B21A697EB2A6716D32CBF26086F10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040010001B3AE2BC3CAFC05EEEFAA46A2A47ED51DE679F82320311222A00000000390010100000000B74586D19A207BE6627C5B0AAFBC44A2ECF5A2942D3A26CE19C4FFAEEE920521868922E893E7838225A3947A2614796FB2C0628CE8C11E3825A56D3B1BBAEF783A5C6A81F36F8625395126FA983C5216D3166D48ACDE8A431212FF763A7F79D9EDB7FED76B485DE45BEB829A3D4730848A366D3324C3027032FF8D16A1E44D8D000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000800000037616E9AC8BE014AF88CA11A8FB17967B7394030E20311222A00000000396010100000000AF0754EAED977043AB6F41D6312AB1E22A6809175BEB28E70D5F99B2DF18CAE73519341BBBD327D0B8BE9D4D0E15F07D36EA3E3A05C892F5B19A3E9D3413B0D97E7AD10A5F5DE8E38860C0AD004B1E06F4040C295ACB457A788551B6127C0B290000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000600000038001CA76C1203955E2C62841CD6F201087E564BF20311222A00000000397010100000000CA026E52A695E72BD30AF928196EEDC9FAF4A619F2492E3FB31169789C276FFBB7D43116647BA9E0D106A3542E3965292CF77823DD34CA8EEC7DE367E08070895077C7EFAD939924CB187067DBF92CB1E785917BD38BACE0C194CA12DF0CE5B7A50275AC61BE7C3B436887CA98C9FD390000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070000003E7AC9AA8EED1B5FF1BD532CF1489A3E5557572C120311222A0000000039801010000000098F0C770F23864C2E766DF02D1E833DFF4FFE92D696E1642F0A88C5694C6479D16DB1537BFE29E4FDC6E6E8AFD1B0EB7EA0124723C333179BF19E93F10658B2F776E829E87DAEDA9C94A8B3382199A350C077977C97AFF08FD11310AC950A72C3CA5002EF513FCCC286E646E3C5387535D509514B3B326E1234F9CB48C36DDD44B416D23654034A66F403BA511C5EFA3000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000090000003128EB33128E63E38C9A83A2B1A9349E178F8219620311222A000000003F30101000000009E15214212F6308ACA78B80BD986AC287516846C8D548A9ED0A42E7D997C902C3E122D1B9DC30995F4E25C75DD7EE0A0CE293B8CC02B977278EF256D761194924764942FE714FA02E4D57F282BA3B2B62C9E38EF6517823F2CA831BDDF6D363D0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000600000038BB99ADDF7B560110955014505FB6B5F8308CE2720311222A00000000400010100000000D2010716C9FB5264D8C91A14F4F32F8981EE954F20087ED77CDC5868431728D3637C632CCF2718A4F5D92EA8AB166AB992D2DE24E9FBDC7CAB9729401E91C502D72B39F6866F5C098B1243B132AFEE65F5036E168323116338F8040834B98725000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000060000003EA950DD4234FEB7C900C0BE817F64DE66EEEF7C420311222A00000000401010100000000CF4264E1702D34CA897D1F9B66C5D63691EACC612C8F147116BB22D0C463495BD5BA70FB153848895220B8ADEEC3E7BAB31EA22C1DC9972FA027D54265BEBF0AE3A23A8A09187F21C856607B98BDA6FC908116816C502B3E58A145254EEFEE2A3335110224028B67809DCB8058E248950000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070000003AF1CC1FD1C1BC9BCA07E78DA6CBA2163F169CBB720311222A00000000402010100000000C2490747FE17EB0584C88D47B1602704150ADC88C5B998BD59CE043EDEBF0FFEE3093AC7956AD3B6AD4554C6DE19A178D6DA295BE15D5220645E3C8131666FA4BE5B84FE131EA44B039307638B9E74A8C42564F892A64DF1CB15712B736E3374F1BBB6819371602D8970E97B900793C7C2A89A4A1649A59BE680574DD0B60145000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000800000035ADDF21D09278661141179CBEFF272EA384B13BB20311222A00000000403010100000000C2490747FE17EB0584C88D47B1602704150ADC88C5B998BD59CE043EDEBF0FFEE3093AC7956AD3B6AD4554C6DE19A178D6DA295BE15D5220645E3C8131666FA4BE5B84FE131EA44B039307638B9E74A8C42564F892A64DF1CB15712B736E3374F1BBB6819371602D8970E97B900793C7C2A89A4A1649A59BE680574DD0B60145000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000800000035ADDF21D09278661141179CBEFF272EA384B13BB20311217A00000000404010100000000B8048ABC30C90D976336543E3FD7091C8FE4800DF820ED55E7E94813ED00555B573FECA3D84AF6131A651D66CFF4284FB13B635EDD0EE40176D8BF04B7FD1C7BACF9AC7327DFAA8AA72D10DB3B8E70B2DDD811CB4196525EA386ACC33C0D9D4575916469C4E4F53E8E1C912CC618CB22DDE7C3568E90022E6BBA770202E4522A2DD623D180E215BD1D1507FE3DC90CA310D27B3EFCCD8F83DE3052CAD1E48938C68D095AAC91B5F37E28BB49EC7ED597000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000B0000003EBFA0D5D06D8CE702DA3EAE890701D45E274C84520311223A00000000405010100000000CB26FC830B43785B2BCE37C81ED334622F9622F4C89AAE641046B2353433883F307FB7C974162DA72F7A4EC75D9D657336865B8D3023D3D645667625C9A07A6B7A137CF0C64198AE38FC238006FB2603F41F4F3BB9DA1347270F2F5D8C606E420958C5F7D50A71DE30142F70DE468889B5E3A08695B938A50FC980393A9CBCE44AD2D64F630BB33AD3F5F5FD495D31F37818C1D94071342E07F1BEC2194F6035BA5DED3936500EB82DFDA6E8AFB655B1EF3D0D7EBF86B66DD9F29F6B1D324FE8B26CE38AB2013DD13F611E7A594D675C4432350EA244CC34F3873CBA06592987A1D7E852ADC22EF5A2EE28132031E48F74037E3B34AB747FF8000003F910A1504D5FFB793D94F3B500765E1ABCAD72D920311223A00000000406010100000000967B6264436C96AA9305776A5919C70DA796340F9997A6C6EF7BEF1D4DBF9CB4289FB7990ABFF1F3AE692F12844B2452A50AE075FB327976A40E8028F279B1E3CCB623957D696FC1225CA2EC950E2D415E9AA931FF18B13168D661FBD06F0ABB0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000600000031D90595C2EF9FC6E71B0C721118333DF8A71FE2120311223A00000000409010100000000BBE43877CC28C0CE1E14BC14E8477317E218364531D155BB8AC5B63C0D6E284DD24259193899F9C04C30BAF167D57929451F67AEBD3BBD0D41444501847D8F02F2C2A2D14817D97AE2625DC163BF8B484C40FFB51749CEDDE9434FB2A0A41099000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000060000003008C39B1D119498268B07843349427AC6E98F80720311223A00000000422010100000000B831414E0B4613922BD35B4B36802BC1E1E81C95A27C958F5382003DF646154CA92FC1CE02C3BE047A45E9B02A9089B4B90278237C965192A0FCC86BB49BC82AE6FDC2DE709006B86C7676EFDF597626FAD633A4F7DC48C445D37EB55FCB3B1ABB95BAAA826D5390E15FD14ED403FA2D0CB841C650609524EC555E3BC56CA95700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080010001DEB81EDB2626A4BB6AE23B77D19A77539D0E671620311223A000000004520101000000007563C51B5276AA6370AB8405522414645832B6BEF2A989C771475B2E8DC654DC8A5BFF9E28E31FF1A370A40DC3FFEB06BC85487D5F1CB61C2441FD71CBCD05D883F8DE413B243AFC9DCA768B061E35B884B5D21B6B016AA36BA12DABCFE49F8E528C893C34C7D4793977E4CC99AB09640D9C7AAB7EC5FF3F40E3D4D18DF7E3A700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080000003AE667445F8DE6F82C38800E5EBABA322F03F58F220311222A000000004F0010100000000A90FCD55AA2D5D9963E35ED0F440177699832F49C6BAB15CDAE5794BE93F934D4462D5D12762E48C38BA83D8445DEAA74195A301A102B2F114EADA0D180EE5E7A5C73E0C4E11F67A43DDAB5D55683B1474CC0627F44B8D3088A492FFAADAD4F42422D0E7013536C3C49AD3D0FAE96459B0F6B1B6056538A3D6D44640F94467B108867DEC40FAAECD740C00E2B7A8852D0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000900000035BED4068D96EA16D2D77E03D6036FC7A160EA99C20311222A000000004FA010100000000A9548DFB398B48123FAF41E6CFA4AE1E2352B518AB4BCEFECDB0B3EDEC090287D88B12259F361C1CC088E5F066494417E8EE8BBF8991E2B32FF16F994697842B3D6CB37A2BB5742A440B6356C62AA33DB3C455E59EDDF7864701D03A5B83EE9E9BD83AB93302AC2DFE63E66120B051CF081F56326A71303D952BB336FF12610D00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080000002A54CB4AEC9BD9D4F579756A2B9E09CDB49E477E820311222A000000004FB010100000000B37BFD2A9674AD6221C1A001081C62653DC280B0A9BD052C677C913CE7A0D902E77B12F4D4D79037B1E9B923A8BB3FAC3C612045BB3914F8DF41E9A1B61BFA5B41705A691D09CE6F530FE48B30240D98F4E692FFD6AADB87243BA8597AB237586ECF258F4148751BE5DA5A3BE6CC34BD000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007000000274755521F60CACF9D20E759957D241E12BE0C95720311222A000000004FC010100000000B3572BA49AE4C7B7A0019E5189E142CFCDED9498DDB5F0470567AB0BA713B8DA226424622955B54B937ABFEFAAD97919E377621E22196ABC1419D5ADC123484209EA7CB7029E66A0D54C5B45C8AD615AEDB6AE9E0A2F75310EA8961287241245000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000060000002623189465E3148DD2AC28E1934915803AD9A60E420311222A000000004FD010100000000B855CC64313AF99C453D181642EE7DD21A67D0FF50C61FE213BCDC18AFBCD07722EFDD2594EFDC227DA3DA23ADCC90E3FA907453ACC954C47323BEDCF8D4862C457D25F47B16D7C3502BE081913E5B0482D838484065DA5F6659E00A9E5D570ADA1EC6AF8C57960075119581FC81468D0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070000003B4E769CECF7AAC4783F305E0B110602A07A6355B20311222A000000004FF010100000000AF4B8D230FDFCB1538E975795A1DB40C396A5359FAA31AE095CB522A5C82E7FFFB252860EC2833EC3D4A665F133DD934EE1148D81E2B7E03F92995DDF7EB7C90A75AB98E69C92EC91A533B21E1C4918B43AFED5780DE13A32BBD37EBC384FA3DD1A453E327C56024DACAEA74AA052C4D000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007000000333F5B0344943048237EC89B275A95569718AEE2020311216A00000002502010100000000B0C2C6E2A6386933CD17C239496BF48C57E389164F2A96BFF133439AE8A77B20498BD4DC6959AB0C2D05D0723AF3668901937B674E5A2FA92DDD5E78EA9D75D79620173CC269B35F463B3D4AAFF2794F92E6C7A3FB95325D8AB95960C3066BE548087BCB6CE12688144A8B4A66228AE4659C634C99E36011584C095082A3A3E3000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000800000038708A3E3BBC1BB0BE73EBD8D19D4E5D20166BF6C20311216A00000002503010100000000AA94A8C6DAD24F9BA56A27C09B01020819568B81A026BE9FD0A3416CA9A71166ED5084ED91CED47DD457DB7E6CBCD53E560BC5DF48ABC380993B6D549F5196CFA77DFB20A0296188E969A2772E8C4141665F8BB2516BA2C7B5FC91F8DA04E8D512EB0F6411516FB86FC021CE7E969DA94D33937909A53A57F907C40C22009DA7532CB3BE509AE173B39AD6A01BA5BB85000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000090000003FDD7139EC7E0C33167FD61AD3CADBD68D66E91C520311217A0000000250E010100000000C8D5AC27A5E1FB89978C7C6479AF993AB3800EB243996FBB2AE26B67B23AC482C4B746005A51AFA7D2D83E894F591A2357B30F85B85627FF15DA12290F70F05766552BA11AD34B7109FA49DE29DCB0109670875A17EA95549E92347B948AA1F045756DE56B707E3863E59A6CBE99C1272EF65FB66CBB4CFF070F36029DD76218B21242645B51CA752AF37E70BE1A84FF31079DC0048E928883EC4FADD497A719385C2BBBEBC5A66AA5E5655D18034EC5000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000B0000003A73472B3AB557493A9BC2179CC8014053B12BAB420311217A0000000250F010100000000CF98DFEDB3D3727965EE7797723355E0751C81D2D3DF4D18EBAB9FB9D49F38C8C4A826B99DC9DEA3F01043D4BF22AC3550E2962A59639B1332156422F788B9C16D40135EFD1BA94147750575E636B6EBC618734C91C1D1BF3EDC2A46A43901668E0FFC136774080E888044F6A1E65DC9AAA8928DACBEB0DB55EA3514686C6A732CEF55EE27CF877F110652694A0E3484C855D882AE191674E25C296205BBB599455176FDD7BBC549F27BA5FE35336F7E29E68D783973199436633C67EE5A680F05160ED12D1665EC83D1997F10FD05BBDBF9433E8F797AEE3E9F02A34228ACE927ABE62B8B9281AD08D3DF5C7379685045D7BA5FCDE58637F8000003C729CF2FD262394ABC4CC173506502446AA9B9FD20311218A00000002510010100000000B831414E0B4613922BD35B4B36802BC1E1E81C95A27C958F5382003DF646154CA92FC1CE02C3BE047A45E9B02A9089B4B90278237C965192A0FCC86BB49BC82AE6FDC2DE709006B86C7676EFDF597626FAD633A4F7DC48C445D37EB55FCB3B1ABB95BAAA826D5390E15FD14ED403FA2D0CB841C650609524EC555E3BC56CA957000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000800100019D93DA5E86FDF16318D268CA6AC57031EDFCA3CB20311218A00000002552010100000000D0F543F03F2517133EF2BA4A1104486758630DCFE3A883C77B4E4844E39A9BD6360D23E6644E1E071F196DDF2E4A68B4A3D93D14268D7240F6A14F0D714C17827D279D192E88931AF7300727AE9DA80A3F0E366AEBA61778171737989E1EE309000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000060000003C08E256F276ED814021B11CAF6EC3701EC7553A120311218A00000002560010100000000B0DD551047DAFCD10D9A5E33CF47A9333E3B24EC57E8F066A72DED60E881A8AD42777C67ADDF0708042AB943601EE60248540B67E0637018EEB3911AE9C873DAD66CB40BC8F4DC77EB2595252B61C21518F79B706AAC29E7D3FD4D259DB72B6E6D446DD60386DB40F5FDB076D80374C993B4BB2D1DB977C3870897F9DFA454F500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080000003792B121D86D0F3A99582DB06974481F3B2E1845420311218A00000002564010100000000E53EB41F839DDFB474F272CD0CBE373D5468EB3F50F39C95BDF4D39FA82B98DABC9476B6EA350C0DCE1CD92075D8C44D1E57283190F96B3537D9E632C461815EBD2BAF36891DF6BFB1D30FA0B752C43DCA0257D35DFF4CCFC98F84198D5152EC61D7B5F74BD09383BD0E2AA42298FFB02F0D79ADB70D72243EE537F75536A8A8DF962582E9E6812F3A0BE02A4365400D000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000090000003894C5D08D4EA28BB79DC46CEAD998B877322F41620311216A00000002565010100000000BD1478877B9333612D257D9E3C9C23503E28336B723C71F47C25836670395360F53C106FD74DEEEA291259C001AFBE7B4A83654F6E2D9E8148E2CB1D9223AC5903DA18B433F8E3529227505DE84748F241F7BFCD2146E5E9A8C5D2A06D19097087A069F9AE3D610C7C8E1214481A4F27025A1A2EDB8A9CDAFA445690511DB80500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080000003F367CB70F9C9B67B580F533819E302BAC033009020311216A00000002566010100000000C687ADCCF3D57D3360B174E471EDA693AA555DFDC6C8CD394C74BA25CCDF8EABFD1F1CEADFBE2280C9E81F7A058998DC22B7F22576FE84713D0BDD3D34CFCD12FCD0D26901BA74103D075C664DABCCAF57BF789494051C5EC303A2E1D784306D3DB3EB665CD360A558F40B7C05C919B2F0282FE1ED9BF6261AA814648FBC263B14214491DE426D242D65CD1FFF0FBE4D4DAFF5CFACB2ADC7131C9B147EE791956551076270696B75FD97373F1FD7804F000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000B000000352A2907300C8445BF54B970C894691FEADF2D28E20311216A00000002567010100000000F4D198F2F0CF140E4D2D81B765EB4E24CED4C0834822769854D0E97E8066CBE465029B3F410E350F6296381A253BE71A4BBABBD516625DAE67D073D00113AAB9EA4DCECA29F3BB7A5D46C0D8B983E2482C2AD759735A5AB9AAAEFB31D3E718B8CA66C019ECA0A8BE312E243EB47A62300620BD51CF169A9194C17A42E51B34D83775A98E80B2D66F4F98084A448FE0507EA27C905AEE72B62A8A29438B6A4480FFF72F93280432A55FDD648AD93D82B9ECF01275C0914BAD8EB3AAF46B129F8749FEA425A2DCDD7E813A08FC0CA7841EDD49985CD8BC6D5D56F17AB9C67CEC50BA422440563ECCE21699E435C8682B6266393672C693D8B7F8000003415E5FE9EC966C835FBB3E6F766A9B1A4B8674C320311216A00000002568010100000000BC9AA294B1FDD263176E3243D8F448BBFFCB6ABD02C31811289F5085A9262B8B1B7C6477EB58055D9EF32A83D1B72D4A1471ECA30CE76585C3FD05372B686F92B795B1640959201523230149118D52D2425BD11C863D9B2A7C4AD0A2BFDBCA67B2713B290F493CD5521E5DDF05EF1040FC238D0A851C8E3E3B2B1F0D5D9D4AED00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080000003E7433E5CFC6001151D8ECD252EBC6E61F7AB221720311216A00000002596010100000000E178FFE834B4B767AF3C9A511F973D8E8505C5FCB2D3768075AB7CC946A955789955879AAF737407151521996DFA43C58E6B130EB1D863B85DC9FFB4050947A2676AA6A061A4A7AE1EDB0E36A697E87E037517EB8923136875BA2CA1087CBA7EC7653E5E28A0C261A033AF27E3A67B64BBA26956307EC47E674E3F8B722B3AE0498DB16C7985310D9F3D117300D32B09000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000090000003EBDA522B631B3EB4F4CBFC0679C450139D2B69CD20311216A00000002597010100000000D31A7094FB221CBA6660FB975AAFEA80DB7BB7EAFD7351E748827AB62D4AEECCFC1787FD47A04699A02DB00D7C382E80E804B35C59434C602389D691B9CCD51ED06BE67A276119C4C10E2E40FC4EDDF9DF39B9B0BDEE8D076E2A012E8A292AF8EFE18553470639C1A032252E0E5748B25A3F9BA4CFCEE073038B061837F2AC1B04C279640F5BD110A9DC665ED2FA6828BD5D0FE810A892DEE6B0E74CE8863BDE08FD5FD61A0F11FA0D14978D8CED7DD3000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000B0000003D4DBA428CF11D45BAEB0A35CAEA8007AD8BA8D7120311216A00000002598010100000000E1740074229FA0D228A9623581D7A322903FB89BA7686712E601FA8AB24A9789186F15B70CCBBE7421B1CB110D45361688135FFD0DB15A3F516BB291D4A123EBF5A06FBF7E1EE6311B737DABB289570A7959D532B25F1DA6758C84DDCCADC049BC764C05391ABD2CADEFFA7E242D5DD06E56001F0E68151E3388074BD9330D6AFA57CBF33946F531E51E0D4902EE235C756A905FB733940E6EC897B4944A5EDC765705E2ACF76C78EAD78DD9B066DF0B2C88750B8AEE00C9B4D4091FA7338449DA92DBFC908FA0781C0128C492DB993C88BA8BB7CADFE238D477F2517E0E7E3D2B11796A0318CE2AD4DA1DB8E54AB0D94F109DB9CAEEFBEFF8000003F0885777642C96BB24441FA057AD9A3490763BD220311216A0000000259901010000000099D17396421EE3F919BA549D9554BE0D4F92CB8B53B4878ED60CC5B2DEEDC79B85C8BD6FD2F23C22E68B381AEEB74153AFB3C96E6C96AD018E73C2025D1EE77622A72BEE973C1AF7B908468D74FDB53DCE8380523E38C30D0A8A226529726824E209E668F49F43B0E8CD2FE527CE7CC41F33F434F95D6E2FE2F589372032F2D6504340F8C542D298B499A53D95AF4083000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000090010001BBB9ABE889611198C387B5B0AB374934BC2B2EA920311216A000000025A1010100000000B8DAB883EF1B5763E4F861F9EA3044B276635D402F3AE5E6B6C0547E368E79A36366DAC5609B6EC486DA1A8D2002CA4F4EFC2CB0EC1573A0B0917969EB60645BAEDF11C050C5D07FED817D11E84A174859A0DAE7F7935F109229C0AC4EE5BFB3D65533A679F0486C5AEFCC937379833BEC45D79DCF97B5228B1910FA03765331000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000800100014896DD5A9EB5B11B9DCCA6DFE336C009F69F509A20311222A00000006507010100000000B72A8FEF5B27F2B550398FDCC256F714BAD497FF56094B7408328CB626AA6F0E6A9DF8388EB9887BC930170BCC1213E90FC070D52C8DCD0FF9E10FAD36801FE93FC998A721705091F18BC7C98241CADC15A2B9DA7FB963142C0AB640D5D0135E77EBAE95AF1B4FEFADCF9C012366BDDA0455C1564A68810D7127676D493890BD000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000800000034410C6D51C2F83ADFD92528FA6E38A32DF048D0A20311222A0000000650901010000000099B63464EE0B4957E4FD23BF923D12B61469B8FFF8814346B2ED6A780F8988EA9CF0433BC1E655F05EFA66D0C98098F25B659D7A25B8478A36E489760D071F54CDF7416948ED733D816349DA2AADDA227EE45936203CBF628CD033AABA5E5A6E4AE37FBACB4611B4113ED427529C636F6C3304F8ABDD6D9AD660516AE87F7F2DDF1D2FA44C164727E56BBC9BA23C0285000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000090000003B8A17CEDC3DFD3958D87AA7D87B6048CA557B78720311222A0000000650A010100000000ADF05CD4C5B490B087C3467B0F3043750438848461288BFEFD6198DD576DC3AD7A7CFA07DBA128C247A8EAB30DC3A30B02FCD7F1C8167965463626FEFF8AB1AA61A4B9AEF09EE12B009842A1ABA01ADB4A2B170668781EC92B60F605FD12B2B2A6F1FE734BE510F60DC5D189E401451B62B4E06851EC20EBFF4522AACC2E9CDC89BC5D8CDE5D633CFD77220FF6BBD4A9B441473CC3C6FEFC8D13E57C3DE97E1269FA19F655215B23563ED1D1860D8681000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000B0000003CD82812F9E844048F48ED56ED84EFB3267E870F820311222A0000000650C010100000000AEED55B9EE00E1ECEB045F61D2DA9A66AB637B43FB5CDBDB22A2FBB25BE061E937E38244EE5132F530144A3F268907D8FD648863F5A96FED7E42089E93457ADC0E1BC89C58A0DB72675FBC47FEE9FF33C16ADE6D341936B06B6A6F5EF6F66A4EDD981DF75DA8399C3053F430ECA342437C23AF423A211AC9F58EAF09B0F837DE9D86C7109DB1646561AA5AF0289AF5514AC64BC2D9D36A179BB8A7971E2BFA03A9E4B847FD3D63524D43A0E8003547B94A8A75E519DF3177D0A60BC0B4BAB1EA59A2CBB4D2D62354E926E9C7D3BE4181E81BA60F8285A896D17DA8C3242481B6C405769A39D547C74ED9FF95A70A796046B5EFF36682DC29F8000003A163724B2CB923376367BBE06B09C03F136F439320311222A0000000650E01010000000099B63464EE0B4957E4FD23BF923D12B61469B8FFF8814346B2ED6A780F8988EA9CF0433BC1E655F05EFA66D0C98098F25B659D7A25B8478A36E489760D071F54CDF7416948ED733D816349DA2AADDA227EE45936203CBF628CD033AABA5E5A6E4AE37FBACB4611B4113ED427529C636F6C3304F8ABDD6D9AD660516AE87F7F2DDF1D2FA44C164727E56BBC9BA23C0285000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000090000003C75E5210CBE6E8F0594A0F1911B07418CADB5BAB20311217A00000006510010100000000ADF05CD4C5B490B087C3467B0F3043750438848461288BFEFD6198DD576DC3AD7A7CFA07DBA128C247A8EAB30DC3A30B02FCD7F1C8167965463626FEFF8AB1AA61A4B9AEF09EE12B009842A1ABA01ADB4A2B170668781EC92B60F605FD12B2B2A6F1FE734BE510F60DC5D189E401451B62B4E06851EC20EBFF4522AACC2E9CDC89BC5D8CDE5D633CFD77220FF6BBD4A9B441473CC3C6FEFC8D13E57C3DE97E1269FA19F655215B23563ED1D1860D8681000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000B0000003874B379B7F607DC1CAF87A19E400B6A9E25163E820311222A00000006512010100000000AEED55B9EE00E1ECEB045F61D2DA9A66AB637B43FB5CDBDB22A2FBB25BE061E937E38244EE5132F530144A3F268907D8FD648863F5A96FED7E42089E93457ADC0E1BC89C58A0DB72675FBC47FEE9FF33C16ADE6D341936B06B6A6F5EF6F66A4EDD981DF75DA8399C3053F430ECA342437C23AF423A211AC9F58EAF09B0F837DE9D86C7109DB1646561AA5AF0289AF5514AC64BC2D9D36A179BB8A7971E2BFA03A9E4B847FD3D63524D43A0E8003547B94A8A75E519DF3177D0A60BC0B4BAB1EA59A2CBB4D2D62354E926E9C7D3BE4181E81BA60F8285A896D17DA8C3242481B6C405769A39D547C74ED9FF95A70A796046B5EFF36682DC29F8000003C0D15F6CD957E491DB56DCDD1CA87A03EBE06B7B20311222A000000065140101000000008D1727AB9DC852453193EA0810B110F2A3FD304BE258338AC2650FA2A040FA10301EA53DF18FD9F40F55C44FE0EE7C7223BC649B8F9328925707776CB86F3AC37D1B22300D0083B49350E09ABB4B62A96363B01E4180E158EADDD6878E85A6C9D56509BF68F0400AFFBC441DDCCDAF9163C4AACEB2C3E1EC13699D23CDA9D3AD00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080000003E0C2C1EA411DB24EC3E76A9403F0B7B6F406F39820311222A00000015201010100000000BF321241BDBF3585FFF2ACB89772EBD18F2C872159EAA4BC179FB03A1B850A1A758FA2C6849F48D4C4FF47E02A575FC13E8EB77AC37135030C5600369B5567D3A7AAF02015115E987E6BE566B4B4CC03A4E2B16CD9051667C2CD0EEF4D76D27A6F745E8BBEB45498ED8C30E2616DB4DBDA4BAF8D71990CDC22A8A387ACB21DD88E2CC27962B31FBD786BBB55F9E0B041000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000090000003CA1E9099327F0B786D8583EC2F27E57189503A5720311222A000000152030101000000008EEEC0D6D3857FD558285E49B623B109E6774E06E9476FE1B2FB273685B5A235E955810ADDB5CDCC2CB6E1A97A07089D7FDE0A548BDC622145CA2DE3C73D6B14F284B3DC1FA056FC0FB2818BCD7C852F0C97963169F01483CE1A63F0BF899D412AB67C5BBDC8B4F6FB9ABB57E95125363DBD8F5EBAA9B74ADB93202050341833DEE8E38D28BD175C83A6EA720C262682BEABEA8E955FE67BD9C2EFF7CB9A9F45DD5BDA4A1EEFB148BC44FFF68D9329FD000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000B000000317F971CAF6B708E5B9165331FBA91593D0C0BF6620311222A00000015204010100000000E1200E9F4428EB71A526D6BB44C957F18F27B20BACE978061CCEF23532DBEBFAF654A149701C14E6A2A7C2ECAC4C92135BE3E9258331DDB0967C3D1D375B996F25B77811CCCC06A153B4CE6990A51A0258EA8437EDBEB701CB1F335993E3F48458BC1194BAD29BF683D5F3ECB984E31B7B9D2F6D947B39DEDE0279EE45B47F2F3D4EEEF93F9261F8F5A571AFBFB569C150370A78F6683D687CB677777B2E7ABEFCFC8F5F93501736997E8310EE0FD87AFAC5DA772BA277F88B44459FCA563555017CD0D66771437F8B6608AA1A665F88D846403E4C41AFEEDB9729C2B2511CFE228B50C1B152B2A60BBF61D8913E086210023A3AA499E423F800000312BCD407B6E627A750FDF629EE8C2C9CC7BA636A20311222A00000015205010100000000EDD8252468A705614B4D07DE3211B30031AEDB6D33A4315F2CFF7C97DB918993C2DC02E79E2FF8A2683D5BBD0F614BC9AB360A448283EF8B9CF6731D71D6BE939B7C5D0B0452D660CF24C21C47CAC8E26948C8EED8E3D00C016828D642816E658DC2CFC61E7E7D7740633BEFE34107C1FB55DEA7FAAEA2B25E85BED948893D0700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080000003000000000000000000000000000000000000000020311222A0000001525A010100000000D3F45D065D4D900F68B2129AFA38F549AB9AE4619E5545814E468F382049A0B9776620DA60D62537F0705A2C926DBEAD4CA7CB43F0F0DD809584E9F7EFBDA3778747BC9E25C5606526FAB5E491646D4DD28278691C25956C8FED5E452F2442E25EDC6B0C1AA4B2E9EC4AD9B25A1B836295B823EDDC5EB6E1E0A3F41B28DB8C3B7E3E9B5979CD7E079EF024095A1D19DD000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000090000003000000000000000000000000000000000000000020311222A0000001525B010100000000833F275FCF5CA4CB6F1BF880E54DCFEB721A316692CAFEB28B698CAECAFA2B2D2AD8517B1EFB59DDEFC39F9C3B33DDEE40E7A63C03E90A4DD261BC0F28B42EA6E7A1F307178E2D63FA1649155C3A5F926B4C7D7C258BCA98EF90C7F4117C205E8E32C45D10E3D494059D2F2933891B979CE4A831B301B0550CDAE9B67064B31D8B481B85A5B046BE8FFA7BDB58DC0D7032525297F26FF619AF7F15BCEC0C92BCDCBC4FB207D115AA65CD04C1CF982191000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000B0000003000000000000000000000000000000000000000020311222A0000001525C010100000000";
                                          if (emvAppCfg != nil && ![emvAppCfg  isEqual: @""] && ![emvCapkCfg isEqualToString:@""] && emvCapkCfg != nil) {
                                              NSLog(@"[%@]",emvAppCfg);
                                              NSLog(@"[%@]",emvCapkCfg);
                                              [mQPOSService updateEmvConfig:emvAppCfg emvCapk:emvCapkCfg];
                                          } else {
                                              object =nil;
                                              object = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                                        @"0", @"code",
                                                        @"error", @"message",
                                                        nil, @"data",
                                                        nil];
                                              CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR
                                                                                                messageAsString:[NSString stringWithFormat:[self convertDictionaryToString: object]]];
                                              [self.commandDelegate sendPluginResult:pluginResult callbackId:commandLocal.callbackId];
                                          }
                                          

                                      }else{
                                          object =nil;
                                          object = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                                    @"0", @"code",
                                                    @"error", @"message",
                                                    nil, @"data",
                                                    nil];
                                          CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR
                                                                                            messageAsString:[NSString stringWithFormat:[self convertDictionaryToString: object]]];
                                          [self.commandDelegate sendPluginResult:pluginResult callbackId:commandLocal.callbackId];
                                      }
                                  }];
}
-(void)onReturnCustomConfigResult:(BOOL)isSuccess config:(NSString*)resutl{
    NSLog(@"result: %@",resutl);
    if(isSuccess){
        object =nil;
        object = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                  @"1", @"code",
                  @"success", @"message",
                  nil, @"data",
                  nil];
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK
                                                          messageAsString:[NSString stringWithFormat:[self convertDictionaryToString: object]]];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:commandLocal.callbackId];
    }else{
        object =nil;
        object = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                  @"0", @"code",
                  @"error", @"message",
                  nil, @"data",
                  nil];
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR
                                                          messageAsString:[NSString stringWithFormat:[self convertDictionaryToString: object]]];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:commandLocal.callbackId];
    }
}
//--------------------------------------------------------------------------------------------------------------------------------------------
//INFO DEVICES--------------------------------------------------------------------------------------------------------------------------------
-(void)getQposId {
    NSLog(@"QPOS PLUGIN getQposId");
    [self initPos];
    [mQPOSService getQPosId];
}
- (void)getInfoPOS{
    NSLog(@"QPOS PLUGIN getInfoPOS");
    [self initPos];
    [mQPOSService getQPosInfo];
    NSLog(@"---------------------");
}
-(void) onQposIdResult: (NSDictionary*)posId{
    NSLog(@"QPOS PLUGIN onQposIdResult");
    NSString *aStr = [@"posId:" stringByAppendingString:posId[@"posId"]];
    
    NSString *temp = [@"psamId:" stringByAppendingString:posId[@"psamId"]];
    aStr = [aStr stringByAppendingString:@"\n"];
    aStr = [aStr stringByAppendingString:temp];
    
    temp = [@"merchantId:" stringByAppendingString:posId[@"merchantId"]];
    aStr = [aStr stringByAppendingString:@"\n"];
    aStr = [aStr stringByAppendingString:temp];
    
    temp = [@"vendorCode:" stringByAppendingString:posId[@"vendorCode"]];
    aStr = [aStr stringByAppendingString:@"\n"];
    aStr = [aStr stringByAppendingString:temp];
    
    temp = [@"deviceNumber:" stringByAppendingString:posId[@"deviceNumber"]];
    aStr = [aStr stringByAppendingString:@"\n"];
    aStr = [aStr stringByAppendingString:temp];
    
    temp = [@"psamNo:" stringByAppendingString:posId[@"psamNo"]];
    aStr = [aStr stringByAppendingString:@"\n"];
    aStr = [aStr stringByAppendingString:temp];
    
    NSLog(@"QPOS PLUGIN onQposIdResult",aStr);
    [self getInfoPOS];
}
-(void) onQposInfoResult: (NSDictionary*)posInfoData{
    NSLog(@"QPOS PLUGIN onQposInfoResult");
    NSLog(@"onQposInfoResult: %@",posInfoData);
    object =nil;
    NSString* jsonString;
    object = [NSMutableDictionary dictionaryWithObjectsAndKeys:
              posInfoData[@"bootloaderVersion"], @"BootloaderVersion",
              posInfoData[@"firmwareVersion"], @"FirmwareVersion",
              posInfoData[@"hardwareVersion"], @"HardwareVersion",
              posInfoData[@"batteryPercentage"], @"batteryPercentage",
              posInfoData[@"batteryLevel"], @"batteryLevel",
              posInfoData[@"isCharging"], @"isCharging",
              posInfoData[@"isUsbConnected"], @"isUsbConnected",
              posInfoData[@"isSupportedTrack1"], @"isSupportedTrack1",
              posInfoData[@"isSupportedTrack2"], @"isSupportedTrack2",
              posInfoData[@"isSupportedTrack3"], @"isSupportedTrack3",
              posInfoData[@"updateWorkKeyFlag"], @"updateWorkKeyFlag",
              nil];
    jsonString = [self convertDictionaryToString: object];
    object = [NSMutableDictionary dictionaryWithObjectsAndKeys:
              @"1", @"code",
              @"success", @"message",
              jsonString, @"data",
              nil];
    NSLog(@"onQposInfoResult: %@",object);
    jsonString = [self convertDictionaryToString: object];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:[NSString stringWithFormat:jsonString]];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:commandLocal.callbackId];
}
//--------------------------------------------------------------------------------------------------------------------------------------------
//CONNECTION DEVICES--------------------------------------------------------------------------------------------------------------------------
- (void)connectionPOS:(NSString *)bluetoothAddress{
    NSLog(@"QPOS PLUGIN connectionPOS");
    [self initPos];
    address = bluetoothAddress;
    [mQPOSService connectBT:bluetoothAddress];
}
- (void)disconnectPOS:(NSString *)bluetoothAddress{
    NSLog(@"QPOS PLUGIN connectionPOS");
    [self initPos];
    [mQPOSService disconnectBT];
}
- (void)isConnectedPos{
    NSLog(@"QPOS PLUGIN isConnectedPos");
    [self initPos];
    if([mQPOSService isQposPresent]){
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:[NSString stringWithFormat:@""]];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:commandLocal.callbackId];
    }else{
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[NSString stringWithFormat:@""]];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:commandLocal.callbackId];
    };
}
-(void) onRequestQposConnected{
    NSLog(@"QPOS PLUGIN onRequestQposConnected");
    NSLog(@">>>>>>>>>>>>>>>>>>>>>>>>>onRequestQposConnected");
    //[mQPOSService resetPosStatus];
    NSString *jsonString= @"";
    stateTx = DECLINE;
    object =nil;
    object = [NSMutableDictionary dictionaryWithObjectsAndKeys:
              @"1", @"code",
              @"success", @"message",
              nil, @"data",
              nil];
    isConnected = TRUE;
    jsonString = [self convertDictionaryToString: object];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:[NSString stringWithFormat:jsonString]];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:commandLocal.callbackId];
}
-(void) onRequestQposDisconnected{
    NSLog(@"QPOS PLUGIN onRequestQposDisconnected");
    NSLog(@">>>>>>>>>>>>>>>>>>>>>>>>>onRequestQposDisconnected");
    NSString *jsonString= @"";
    stateTx = DECLINE;
    object =nil;
    object = [NSMutableDictionary dictionaryWithObjectsAndKeys:
              @"0", @"code",
              @"error", @"message",
              nil, @"data",
              nil];
    isConnected = FALSE;
    address = nil;
    jsonString = [self convertDictionaryToString: object];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[NSString stringWithFormat:jsonString]];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:commandLocal.callbackId];
}
-(void) onRequestNoQposDetected{
    NSLog(@"QPOS PLUGIN onRequestNoQposDetected");
    NSLog(@">>>>>>>>>>>>>>>>>>>>>>>>>onRequestNoQposDetected");
    NSString *jsonString= @"";
    stateTx = DECLINE;
    object =nil;
    object = [NSMutableDictionary dictionaryWithObjectsAndKeys:
              @"0", @"code",
              @"error", @"message",
              nil, @"data",
              nil];
    isConnected = FALSE;
    address = nil;
    jsonString = [self convertDictionaryToString: object];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[NSString stringWithFormat:jsonString]];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:commandLocal.callbackId];
}
//--------------------------------------------------------------------------------------------------------------------------------------
//LIST DEVICES--------------------------------------------------------------------------------------------------------------------------
-(void)scanBluetooth{
    NSLog(@"QPOS PLUGIN scanBluetooth");
    if (bt == nil) {
        bt = [BTDeviceFinder new];
    }
    NSInteger delay = 0;
    NSLog(@"蓝牙状态:%ld",(long)[bt getCBCentralManagerState]);
    [bt setBluetoothDelegate2Mode:self];
    if ([bt getCBCentralManagerState] == CBCentralManagerStateUnknown) {
        while ([bt getCBCentralManagerState]!= CBCentralManagerStatePoweredOn) {
            NSLog(@"Bluetooth state is not power on");
            [self sleepMs:10];
            if(delay++==10){
                return;
            }
        }
    }
    [bt scanQPos2Mode:scanBluetoothTime];
}
-(void) actionTimer{
    if(TIMER==TIMER_OUT){
        NSLog(@"----------------ACTION TIMER STOP-------------------------%d",TIMER);
        if([nameAction isEqualToString:QPOS_GetCompanions]){
            if([allBluetooth count] != 0){
                [bt stopQPos2Mode];
                NSMutableArray *array = [[NSMutableArray alloc]init];
                object =nil;
                for(NSInteger i = 0 ; i < [allBluetooth count] ; i++){
                    object = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                              [allBluetooth objectAtIndex:i], @"id",
                              [allBluetooth objectAtIndex:i], @"name",
                              [allBluetooth objectAtIndex:i], @"address",
                              nil];
                    [object setObject:[NSNumber numberWithInt:1060]
                               forKey:[NSString stringWithFormat: @"class"]];
                    [array addObject:object];
                }
                NSError *error;
                NSData *jsonData = [NSJSONSerialization dataWithJSONObject:array options:NSJSONWritingPrettyPrinted error:&error];
                NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
                CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:[NSString stringWithFormat:jsonString]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:commandLocal.callbackId];
            }else{
                CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[NSString stringWithFormat:@"ERROR"]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:commandLocal.callbackId];
            }
            [self stopTimer];
        }
        [self stopTimer];
    }else{
        NSLog(@"----------------ACTION TIMER ON-------------------------");
        TIMER++;
    }
}
-(void)stopTimer{
    [appearTimer invalidate];
    appearTimer = nil;
}
-(void)stopBluetooth{
    NSLog(@"+++stopBluetooth+++");
    if(is2ModeBluetooth && bt){
        [bt stopQPos2Mode];
    }
}
-(void)onBluetoothName2Mode:(NSString *)bluetoothName{
    NSLog(@"+++onBluetoothName2Mode %@",bluetoothName);
    dispatch_async(dispatch_get_main_queue(),  ^{
        if(isTestBluetooth){
            if ([bluetoothName hasPrefix:@"MPOS8012400002"]) {
                [self stopBluetooth];
                [self connectionPOS:bluetoothName];
            }
        }else{
            if(bluetoothName != nil){
                if ([bluetoothName hasPrefix:@"MPOS"]) {
                    [allBluetooth addObject:bluetoothName];
                    NSLog(@"%tu",[allBluetooth count]);
                    NSLog(@"%@",allBluetooth);
                }
            }
            
        }
    });
}
//--------------------------------------------------------------------------------------------------------------------------------------
//COMMANDS------------------------------------------------------------------------------------------------------------------------------
-(void)QPOS_GetCompanions:(CDVInvokedUrlCommand *)command{
    
    [self executeMyMethodWithCommand:command withActionName:QPOS_GetCompanions];
    
}
-(void)QPOS_getConnectDevice:(CDVInvokedUrlCommand *)command{
    
    [self executeMyMethodWithCommand:command withActionName:QPOS_getConnectDevice];
    
}
-(void)QPOS_DisconnectDevice:(CDVInvokedUrlCommand *)command{
    
    [self executeMyMethodWithCommand:command withActionName:QPOS_DisconnectDevice];
    
}
-(void)QPOS_GetStatusBattery:(CDVInvokedUrlCommand *)command{
    
    [self executeMyMethodWithCommand:command withActionName:QPOS_GetStatusBattery];
    
}
-(void)QPOS_IsConnectDevice:(CDVInvokedUrlCommand *)command{
    
    [self executeMyMethodWithCommand:command withActionName:QPOS_IsConnectDevice];
    
}
-(void)QPOS_ConfigurationInitial:(CDVInvokedUrlCommand *)command{
    
    [self executeMyMethodWithCommand:command withActionName:QPOS_ConfigurationInitial];
    
}
-(void)QPOS_StartTransaction:(CDVInvokedUrlCommand *)command{
    
    [self executeMyMethodWithCommand:command withActionName:QPOS_StartTransaction];
    
}
-(void) QPOS_DataTransaction:(CDVInvokedUrlCommand *)command{
    
    [self executeMyMethodWithCommand:command withActionName:QPOS_DataTransaction];
    
}
-(void) QPOS_CompleteTransaction:(CDVInvokedUrlCommand *)command{
    
    [self executeMyMethodWithCommand:command withActionName:QPOS_CompleteTransaction];
    
}
-(void) QPOS_StopTransaction:(CDVInvokedUrlCommand *)command{
    
    [self executeMyMethodWithCommand:command withActionName:QPOS_STOP_TRANSACTION];
    
}
-(void) QPOS_IsInsertCard:(CDVInvokedUrlCommand *)command{
    
    [self executeMyMethodWithCommand:command withActionName:QPOS_IS_INSERT_CARD];
    
}
-(void) QPOS_BandCardPin:(CDVInvokedUrlCommand *)command{
    
    [self executeMyMethodWithCommand:command withActionName:QPOS_BANDCARDPIN];
    
}



-(id)init:(CDVInvokedUrlCommand*)command{
    self = [super init];
    if(self != nil){
        [self initPos];
    }
    commandLocal = command;
    return self;
}
-(void)initPos{
    if (mQPOSService == nil) {
        mQPOSService = [QPOSService sharedInstance];
    }
    [mQPOSService setDelegate:self];
    [mQPOSService setQueue:nil];
    [mQPOSService setPosType:PosType_BLUETOOTH_2mode];
    if (bt== nil) {
        bt = [[BTDeviceFinder alloc]init];
    }
    allBluetooth = [[NSMutableArray alloc]init];
}
-(void)executeMyMethodWithCommand:(CDVInvokedUrlCommand*)command withActionName:(NSString *)name{
    [self init: command];
    nameAction = name;
    TIMER = 0;
    if ([name isEqualToString:QPOS_GetCompanions]) {
        appearTimer = [NSTimer scheduledTimerWithTimeInterval:0.5  target:self selector:@selector(actionTimer) userInfo:nil repeats:YES];
    }
    [self.commandDelegate runInBackground:^{
        NSLog(@"QPOS PLUGIN executeMyMethodWithCommand %@",name);
        if (name != nil) {
            if ([name isEqualToString:QPOS_GetCompanions]) {
                scanBluetoothTrieds = 0;
                [self scanBluetooth];
            }else if([name isEqualToString:QPOS_getConnectDevice]){
                [self connectionPOS:[commandLocal.arguments objectAtIndex:0]];
            }else if([name isEqualToString:QPOS_IsConnectDevice]){
                [self isConnectedPos];
            }else if([name isEqualToString:QPOS_DisconnectDevice]){
                [self disconnectPOS:address];
            }else if([name isEqualToString:QPOS_GetStatusBattery]){
                [self getQposId];
            }else if([name isEqualToString:QPOS_ConfigurationInitial]){
                [self updateIPEKKeys];
            }else if([name isEqualToString:QPOS_StartTransaction]){
                [self startTransaccion:[commandLocal.arguments objectAtIndex:0]];
            }else if([name isEqualToString:QPOS_DataTransaction]){
                [self getDataTransaccion];
            }else if([name isEqualToString:QPOS_CompleteTransaction]){
                NSMutableDictionary* json = [commandLocal.arguments objectAtIndex:0];
                [self completeTransacction:json];
            }else if([name isEqualToString:QPOS_STOP_TRANSACTION]){
                [self resetStatusMode];
            }else if([name isEqualToString:QPOS_IS_INSERT_CARD]){
                [self isInsertCard];
            }else if([name isEqualToString:QPOS_BANDCARDPIN]){
                [self getSwipePin: [commandLocal.arguments objectAtIndex:0]];
            }
            else{
                CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[NSString stringWithFormat:@"no method found to %@",name]];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }else{
            //callback
            CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[NSString stringWithFormat:@"no method found to %@",name]];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        }
    }];
}
//------------------------------------------------------------------------------------------------------------------------------------------------------
@end




