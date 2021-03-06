//
//  QPOSService.h
//  qpos-ios-demo
//
//  Created by Robin on 11/19/13.
//  Copyright (c) 2013 Robin. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CBPeripheral;

typedef NS_ENUM(NSInteger, PosType) {
    PosType_AUDIO,
    PosType_BLUETOOTH,
    PosType_BLUETOOTH_new, //new bluetooth mode
    PosType_BLUETOOTH_2mode //bluetooth 2 mode
};

typedef NS_ENUM(NSInteger, UpdateInformationResult) {
    UpdateInformationResult_UPDATE_SUCCESS,
    UpdateInformationResult_UPDATE_FAIL,
    UpdateInformationResult_UPDATE_PACKET_VEFIRY_ERROR,
    UpdateInformationResult_UPDATE_PACKET_LEN_ERROR,
    UpdateInformationResult_UPDATE_LOWPOWER,
    UpdateInformationResult_UPDATING
};

typedef NS_ENUM(NSInteger, DoTradeResult)
{
    DoTradeResult_NONE,
    DoTradeResult_MCR,
    DoTradeResult_ICC,
    DoTradeResult_BAD_SWIPE,
    DoTradeResult_NO_RESPONSE,
    DoTradeResult_NOT_ICC,
    DoTradeResult_NO_UPDATE_WORK_KEY,
    DoTradeResult_NFC_ONLINE,   // add 20150715
    DoTradeResult_NFC_OFFLINE,
    DoTradeResult_NFC_DECLINED,
};

typedef NS_ENUM(NSInteger, EmvOption)
{
    EmvOption_START, EmvOption_START_WITH_FORCE_ONLINE
};

typedef NS_ENUM(NSInteger, Error)
{
    Error_TIMEOUT,
    Error_MAC_ERROR,
    Error_CMD_NOT_AVAILABLE,
    Error_DEVICE_RESET,
    Error_UNKNOWN,
    Error_DEVICE_BUSY,
    Error_INPUT_OUT_OF_RANGE,
    Error_INPUT_INVALID_FORMAT,
    Error_INPUT_ZERO_VALUES,
    Error_INPUT_INVALID,
    Error_CASHBACK_NOT_SUPPORTED,
    Error_CRC_ERROR,
    Error_COMM_ERROR,
    Error_CMD_TIMEOUT,
    Error_WR_DATA_ERROR,
    Error_EMV_APP_CFG_ERROR,
    Error_EMV_CAPK_CFG_ERROR,
    Error_APDU_ERROR,
    Error_ICC_ONLINE_TIMEOUT,
    Error_AMOUNT_OUT_OF_LIMIT,
    Error_DIGITS_UNAVAILABLE,
    Error_QPOS_MEMORY_OVERFLOW
};

typedef NS_ENUM(NSInteger, DHError)
{
    DHError_TIMEOUT,
    DHError_MAC_ERROR,
    DHError_CMD_NOT_AVAILABLE,
    DHError_DEVICE_RESET,
    DHError_UNKNOWN,
    DHError_DEVICE_BUSY,
    DHError_INPUT_OUT_OF_RANGE,
    DHError_INPUT_INVALID_FORMAT,
    DHError_INPUT_ZERO_VALUES,
    DHError_INPUT_INVALID,
    DHError_CASHBACK_NOT_SUPPORTED,
    DHError_CRC_ERROR,
    DHError_COMM_ERROR,
    DHError_CMD_TIMEOUT,
    DHError_WR_DATA_ERROR,
    DHError_EMV_APP_CFG_ERROR,
    DHError_EMV_CAPK_CFG_ERROR,
    DHError_APDU_ERROR,
    DHError_ICC_ONLINE_TIMEOUT,
    DHError_AMOUNT_OUT_OF_LIMIT,
    DHError_DIGITS_UNAVAILABLE,
    DHError_QPOS_MEMORY_OVERFLOW
};


typedef NS_ENUM(NSInteger, Display)
{
    Display_TRY_ANOTHER_INTERFACE,
    Display_PLEASE_WAIT,
    Display_REMOVE_CARD,
    Display_CLEAR_DISPLAY_MSG,
    Display_PROCESSING,
    Display_TRANSACTION_TERMINATED,
    Display_PIN_OK,
    Display_INPUT_PIN_ING,
    Display_MAG_TO_ICC_TRADE,
    Display_INPUT_OFFLINE_PIN_ONLY,
    Display_CARD_REMOVED,
    Display_MSR_DATA_READY
    
};

typedef NS_ENUM(NSInteger, TransactionResult) {
    TransactionResult_APPROVED,
    TransactionResult_TERMINATED,
    TransactionResult_DECLINED,
    TransactionResult_CANCEL,
    TransactionResult_CAPK_FAIL,
    TransactionResult_NOT_ICC,
    TransactionResult_SELECT_APP_FAIL,
    TransactionResult_DEVICE_ERROR,
    TransactionResult_CARD_NOT_SUPPORTED,
    TransactionResult_MISSING_MANDATORY_DATA,
    TransactionResult_CARD_BLOCKED_OR_NO_EMV_APPS,
    TransactionResult_INVALID_ICC_DATA,
    TransactionResult_FALLBACK,
    TransactionResult_NFC_TERMINATED,
    TransactionResult_TRADE_LOG_FULL
    
};

typedef NS_ENUM(NSInteger, TransactionType) {
    TransactionType_GOODS, // ??????
    TransactionType_SERVICES, // ??????
    TransactionType_CASH,//??????
    TransactionType_CASHBACK, // ?????? ??????
    TransactionType_INQUIRY, // ??????
    TransactionType_TRANSFER, // ??????
    TransactionType_ADMIN,//??????
    TransactionType_CASHDEPOSIT,//??????
    TransactionType_PAYMENT,// ?????? ??????
    
    //add 2014-04-02
    TransactionType_PBOCLOG,//        0x0A			/*PBOC??????(??????????????????)*/
    TransactionType_SALE,//           0x0B			/*??????*/
    TransactionType_PREAUTH,//        0x0C			/*?????????*/
    TransactionType_ECQ_DESIGNATED_LOAD,//		0x10				/*????????????Q??????????????????*/
    TransactionType_ECQ_UNDESIGNATED_LOAD,//	0x11				/*????????????????????????????????????*/
    TransactionType_ECQ_CASH_LOAD,//	0x12	/*???????????????????????????*/
    TransactionType_ECQ_CASH_LOAD_VOID,//			0x13				/*????????????????????????*/
    TransactionType_ECQ_INQUIRE_LOG,//	0x0A	/*??????????????????(???PBOC????????????)*/
    TransactionType_REFUND,
    TransactionType_UPDATE_PIN
};

typedef NS_ENUM(NSInteger, LcdModeAlign) {
    LCD_MODE_ALIGNLEFT,
    LCD_MODE_ALIGNRIGHT,
    LCD_MODE_ALIGNCENTER
};

typedef NS_ENUM(NSInteger, AmountType) {
    AmountType_NONE,
    AmountType_RMB,
    AmountType_DOLLAR,
    AmountType_CUSTOM_STR
};

typedef NS_ENUM(NSInteger, CardTradeMode) {
    CardTradeMode_ONLY_INSERT_CARD,
    CardTradeMode_ONLY_SWIPE_CARD,
    CardTradeMode_SWIPE_INSERT_CARD,
    CardTradeMode_UNALLOWED_LOW_TRADE,
    CardTradeMode_SWIPE_TAP_INSERT_CARD,// add 20150715
    CardTradeMode_SWIPE_TAP_INSERT_CARD_UNALLOWED_LOW_TRADE,
    CardTradeMode_ONLY_TAP_CARD,
    CardTradeMode_SWIPE_TAP_INSERT_CARD_NOTUP
};


typedef NS_ENUM(NSInteger, DoTradeMode) {//?????????????????????
    DoTradeMode_COMMON,
    DoTradeMode_CHECK_CARD_NO_IPNUT_PIN,//???????????????
    DoTradeMode_IS_DEBIT_OR_CREDIT//
};

typedef NS_ENUM(NSInteger,DoTradeLog) {
    DoTradeLog_clear = 0,
    DoTradeLog_getAllCount = 1,
    DoTradeLog_getOneLog = 2
    
};
typedef NS_ENUM(NSInteger,EncryptType) {
    EncryptType_plaintext,
    EncryptType_encrypted
};
typedef NS_ENUM(NSInteger,EMVOperation) {
    EMVOperation_clear,
    EMVOperation_add,
    EMVOperation_delete,
    EMVOperation_getList,
    EMVOperation_update,
    EMVOperation_quickemv
    
};


@protocol QPOSServiceListener<NSObject>

@optional


-(void) onRequestWaitingUser;
-(void) onQposIdResult: (NSDictionary*)posId;
-(void) onQposInfoResult: (NSDictionary*)posInfoData;
-(void) onDoTradeResult: (DoTradeResult)result DecodeData:(NSDictionary*)decodeData;
-(void) onRequestSetAmount;
-(void) onRequestSelectEmvApp: (NSArray*)appList;
-(void) onRequestIsServerConnected;
-(void) onRequestFinalConfirm;
-(void) onRequestOnlineProcess: (NSString*) tlv;
-(void) onRequestTime;
-(void) onRequestTransactionResult: (TransactionResult)transactionResult;
-(void) onRequestTransactionLog: (NSString*)tlv;
-(void) onRequestBatchData: (NSString*)tlv;
-(void) onRequestQposConnected;
-(void) onRequestQposDisconnected;
-(void) onRequestNoQposDetected;
-(void) onError: (Error)errorState;//pls del this Delegate
-(void) onDHError: (DHError)errorState;//replace function onError
-(void) onRequestDisplay: (Display)displayMsg;
-(void) onRequestUpdateWorkKeyResult:(UpdateInformationResult)updateInformationResult;
-(void) onRequestGetCardNoResult:(NSString *)result;
-(void) onRequestSignatureResult:(NSData *)result;
-(void) onReturnReversalData: (NSString*)tlv;
-(void) onReturnGetPinResult:(NSDictionary*)decodeData;

//add icc apdu 2014-03-11
-(void) onReturnPowerOnIccResult:(BOOL) isSuccess  KSN:(NSString *) ksn ATR:(NSString *)atr ATRLen:(NSInteger)atrLen;
-(void) onReturnPowerOffIccResult:(BOOL) isSuccess;
-(void) onReturnApduResult:(BOOL)isSuccess APDU:(NSString *)apdu APDU_Len:(NSInteger) apduLen;

//add set the sleep time 2014-03-25
-(void)onReturnSetSleepTimeResult:(BOOL)isSuccess;
//add  2014-04-02
-(void)onRequestCalculateMac:(NSString *)calMacString;
//add 2014-04-11
-(void)onReturnCustomConfigResult:(BOOL)isSuccess config:(NSString*)resutl;

-(void) onRequestPinEntry;
-(void) onReturnSetMasterKeyResult: (BOOL)isSuccess;

-(void) onReturnBatchSendAPDUResult:(NSDictionary *)apduResponses;
-(void) onReturniccCashBack: (NSDictionary*)result;
-(void) onLcdShowCustomDisplay: (BOOL)isSuccess;

-(void) onUpdatePosFirmwareResult:(UpdateInformationResult)result;

-(void) onDownloadRsaPublicKeyResult:(NSDictionary *)result;
-(void) onPinKeyTDESResult:(NSString *)encPin;
-(void) onGetPosComm:(NSInteger)mode amount:(NSString *)amt posId:(NSString*)aPosId;

-(void) onUpdateMasterKeyResult:(BOOL)isSuccess aDic:(NSDictionary *)resultDic;
-(void) onEmvICCExceptionData: (NSString*)tlv;

@end

@class CommandUplink;
@class Vpos;
@class VPosBluetoot;
@class Trace;
@class DoEmvApp;
@class DoTrade;
@class GetPosInfo;
@class WaitSetAmount;
@class Util;
@class CommandDownlink;
@class CommandUplink;
@class CmdId;
@class Signature;
@class VPosAudio;
@class VPosBluetoothNew;
@class IccApdu;
@class SaveCustomParam;
@class VPosBluetooth2Mode;
@class CBPeripheral;

@interface QPOSService : NSObject


@property (nonatomic,assign)NSInteger emvL2KernelStatus;
@property (nonatomic,strong)Vpos *pos;
@property (nonatomic,strong)DoEmvApp *dea;
@property (nonatomic, assign) DoTradeMode doTradeMode;//?????????????????????
@property (nonatomic, assign) EmvOption emvOption;
@property (nonatomic, assign) BOOL isPosExistFlag;
@property (nonatomic, assign) BOOL isTradeFlag;
@property (nonatomic, assign) NSInteger SelectEmvAppIndex;
@property (nonatomic,assign) BOOL automaticDisconnectFlag;
@property (nonatomic, readonly) id <QPOSServiceListener> CallBackDelegate;
@property (nonatomic, assign) BOOL posInputAmountFlag;
@property (nonatomic, assign) BOOL posDisplayAmountFlag;
@property (nonatomic, assign) BOOL isDebitOrCredit;
@property (nonatomic, assign) NSInteger onLineTime;
@property (nonatomic, assign) BOOL isQuickEMV;
@property (nonatomic, copy) NSString *batchID;
@property (nonatomic, copy) NSString *formatID;
@property (nonatomic, assign) NSInteger encryptType;
@property (nonatomic, assign) NSInteger keyIndex;
@property (nonatomic, assign) NSInteger maxLen;
@property (nonatomic, copy) NSString * typeFace;
@property (nonatomic, copy) NSString * cardNo;
@property (nonatomic, copy) NSString * date;

+(QPOSService *)sharedInstance;
-(void)setDelegate:(id<QPOSServiceListener>)aDelegate;
-(void)setQueue:(dispatch_queue_t)queue;
-(void)setPosType:(PosType) aPosType;
#pragma ??????IPEK
-(void)doUpdateIPEKOperationtracksn:(NSString *)trackksn
                          trackipek:(NSString *)trackipek
                trackipekCheckValue:(NSString *)trackipekCheckValue
                             emvksn:(NSString *)emvksn
                            emvipek:(NSString *)emvipek
                  emvipekcheckvalue:(NSString *)emvipekcheckvalue
                             pinksn:(NSString *)pinksn
                            pinipek:(NSString *)pinipek
                  pinipekcheckValue:(NSString *)pinipekcheckValue
                              block:(void(^)(BOOL isSuccess,NSString *stateStr))EMVBlock;
//?????????
- (void)doSetBuzzerOperation:(NSInteger)timeOut
                       block:(void (^)(BOOL isSuccess, NSString*stateStr))buzzerBlock;
//??????EMV ??????
-(void)updateEMVRID:(NSInteger)operationType
               data:(NSString *)data
              block:(void(^)(BOOL isSuccess,NSString *stateStr))EMVBlock;
//??????AID ??????
-(void)updateAID:(NSInteger)operationType
            data:(NSString *)data
           block:(void(^)(BOOL isSuccess,NSString *stateStr))EMVBlock;
//?????? AID
-(void)setAIDwithBool:(BOOL)isTrue
                 data:(NSString *)data
                block:(void(^)(BOOL isSuccess,NSString *stateStr))EMVBlock;

//????????????????????????????????????,??????pinBlock
-(void)pinKey_TDES_all:(NSInteger)flag Pan:(NSString *)pan Pin:(NSString *)pin TimeOut:(NSInteger)timeOut;
//????????????
-(void) setOnlineTime:(NSInteger)aTime;
//??????????????????
-(void)getUpdateCheckValueBlock:(void(^)(BOOL isSuccess,NSString *stateStr))updateCheckValueBlock;
//??????????????????
-(void)doSetShutDownTime:(NSString *)timeOut;
//??????????????????
-(void)doSetSleepModeTime:(NSString *)timeOut  block:(void(^)(BOOL isSuccess,NSString *stateStr))sleepModeBlock;

-(BOOL)getBluetoothState;
-(void)doSetSleepModeTime:(NSString *)timeOut
                    block:(void(^)(BOOL isSuccess,NSString *stateStr))sleepModeBlock;
-(NSInteger) getOnLineTime;
-(BOOL) connectBT: (NSString *)bluetoothName;
-(void) disconnectBT;

-(void) doTradeNoPinpad:(NSInteger)timeout;
-(void) doTrade;
-(void) doTrade:(NSInteger) timeout;
-(void) doCheckCard;
-(void) doCheckCard:(NSInteger) timeout;
-(void) doTrade_QF:(NSInteger)tradeMode TradeRandomString:(NSString *)randomString TradeExtraString:(NSString *)extraString;
-(void) doTrade_QF:(NSInteger)tradeMode TradeRandomString:(NSString *)randomString TradeExtraString:(NSString *)extraString timeout:(NSInteger) delay;
-(void) doEmvApp: (EmvOption)aemvOption;
-(void) cancelSetAmount;
-(void) setAmount: (NSString *)aAmount aAmountDescribe:(NSString *)aAmountDescribe currency:(NSString *)currency transactionType:(TransactionType)transactionType;
-(void) selectEmvApp: (NSInteger)index;
-(void) cancelSelectEmvApp;
-(void) finalConfirm: (BOOL)isConfirmed;
-(void) sendOnlineProcessResult: (NSString *)tlv delay:(NSInteger)delay;
-(void) sendOnlineProcessResult: (NSString *)tlv;
-(void) isServerConnected: (BOOL)isConnected;
-(void) sendTime: (NSString *)aterminalTime;
-(NSString *) getSdkVersion;
-(void) getQPosInfo;
-(void) getQPosId;
-(void)setAmountIcon:(NSString *)aAmountIcon;
-(void)setAmountIcon:(AmountType) amtType amtIcon:(NSString *)aAmountIcon;
-(void)getPin:(NSString *)aTransactionData;


//add icc apdu 2014-03-11
-(void)powerOffIcc;
-(void)powerOnIcc;
-(void)sendApdu:(NSString *)apduStr;

//add set the sleep time 2014-03-25
-(void)setPosSleepTime:(NSInteger)sleepTime;

//add 2014-04-11
-(void)updateEmvConfig:(NSString *)emvAppCfg emvCapk:(NSString*)emvCapkCfg;
-(void)readEmvAppConfig;
-(void)readEmvCapkConfig;

////////////////////////////////////////////
-(void)udpateWorkKey:(NSString *)pik pinKeyCheck:(NSString *)pikCheck trackKey:(NSString *)trk trackKeyCheck:(NSString *)trkCheck macKey:(NSString *)mak macKeyCheck:(NSString *)makCheck;
-(void)MacKeyEncrypt:(NSString *)macStr;

/////////////////////////////////////////////
-(void)udpateWorkKey:(NSString *)workKey workKeyCheckValue:(NSString *)workKeyCheck;

///////////////////////////////////////////
///// qf??????????????????????????????????????????//////////////
-(void)udpateWorkKey:(NSString *)updateKey;
- (void) setDesKey:(NSString *)key;
-(void)signature;
///////////////////////////////////////////

-(NSDictionary *)anlysEmvIccData_lp:(NSString *)tlv;

-(void) getCardNo;
-(void) lcdShowCustomDisplay:(LcdModeAlign) alcdModeAlign lcdFont:(NSString *)alcdFont;

-(void)startAudio;
-(void)stopAudio;
-(BOOL)isQposPresent;
- (NSString *)getApiVersion ;
- (NSString *)getApiBuildNumber;

- (void)sendPinEntryResult:(NSString *)pin;
- (void)cancelPinEntry;
- (void)bypassPinEntry;


-(void) getIccCardNo: (NSString *)aterminalTime;
-(void) inquireECQAmount: (NSString *)aterminalTime;

-(void) setMasterKey:(NSString *)key  checkValue:(NSString *)chkValue;

//add 2014-04-30
-(void)calcMacSingle:(NSString *)macStr;
-(void)calcMacDouble:(NSString *)macStr;
-(BOOL)isIdle;

//add 2014-05-20
-(void)doTrade:(NSString *)subTime delay:(NSInteger) timeout;
-(NSDictionary *)anlysEmvIccData:(NSString *)tlv;
-(void)VIPOSBatchSendAPDU:(NSDictionary *) batchAPDU;
-(NSDictionary *)synVIPOSBatchSendAPDU:(NSDictionary *) batchAPDU;

-(void)saveUserData:(NSInteger)offset userData:(NSString *)aStr;
-(void)readUserData:(NSInteger)offset userDataSize:(NSInteger) size;

-(NSDictionary *)anlysEmvIccData_qf:(NSString *)tlv;
-(BOOL)isIsIssScriptRes;
-(void)iccCashBack:(NSString *)transactionTime random:(NSString *)aRandom;
-(void)lcdShowCustomDisplay:(LcdModeAlign) alcdModeAlign lcdFont:(NSString *)alcdFont delay:(NSInteger)timeout;

-(void) doTrade:(NSString *)random TradeExtraString:(NSString *)extraStr delay:(NSInteger) timeout;
-(void) setPosPresent:(BOOL) flag;

-(void) doTrade:(NSInteger)keyIndex delays:(NSInteger)timeout;
-(void) doTrade:(NSString *)subTime randomStr:(NSString *)random TradeExtraString:(NSString *)extraStr keyIndex:(NSInteger)mKeyIndex delay:(NSInteger) timeout;

-(void)udpateWorkKey:(NSString *)pik pinKeyCheck:(NSString *)pikCheck trackKey:(NSString *)trk trackKeyCheck:(NSString *)trkCheck macKey:(NSString *)mak macKeyCheck:(NSString *)makCheck keyIndex:(NSInteger) mKeyIndex;

-(void) setMasterKey:(NSString *)key  checkValue:(NSString *)chkValue keyIndex:(NSInteger) mKeyIndex;


-(void)setCardTradeMode:(CardTradeMode) aCardTMode;
-(NSDictionary *)synVIPOSBatchSendAPDU:(BOOL)isOpen  batchAPDUData:(NSDictionary *) batchAPDU;
-(BOOL)qposStatus;
//??????POS????????????
- (void)qposStatusTimeOut:(NSInteger)timeOut qposStatus:(void (^)(BOOL isSuccess, NSString *amountStr))qposStatusBlock;
-(void)setPinPadFlag:(BOOL)flag;

-(void)closeDevice;

-(void)calcMacDouble:(NSString *)macStr keyIndex:(NSInteger) mKeyIndex;

-(void)calcMacSingleNoCheck:(NSString *)macStr delay:(NSInteger)timeout;
-(void)MacKeyEncryptNoCheck:(NSString *)macStr delay:(NSInteger)timeout;

-(void) getQPosId:(NSInteger)timeout;
-(void) setMasterKey:(NSString *)key  checkValue:(NSString *)chkValue keyIndex:(NSInteger) mKeyIndex delay:(NSInteger)timeout;

-(void)udpateWorkKey:(NSString *)pik pinKeyCheck:(NSString *)pikCheck trackKey:(NSString *)trk trackKeyCheck:(NSString *)trkCheck macKey:(NSString *)mak macKeyCheck:(NSString *)makCheck keyIndex:(NSInteger) mKeyIndex delay:(NSInteger)timeout;

-(void)calcMacDouble:(NSString *)macStr keyIndex:(NSInteger) mKeyIndex delay:(NSInteger)timeout;

-(void)calcMacDoubleNoCheck:(NSString *)macStr keyIndex:(NSInteger) mKeyIndex delay:(NSInteger)timeout;

-(void)downloadRsaPublicKey:(NSString*)rid keyIndex:(NSString *)index keyModule:(NSString *)module keyExponent:(NSString *)exponent delay:(NSInteger)timeout;
-(void)downloadRsaPublicKey:(NSInteger)useType RID:(NSString*)rid keyIndex:(NSString *)index keyModule:(NSString *)module keyExponent:(NSString *)exponent delay:(NSInteger)timeout;

-(void)pinKey_TDES:(NSInteger) keyIndex  pin:(NSString *)inStr delay:(NSInteger)timeout;


-(void)updateMasterKey:(NSInteger)step RN1:(NSString *)RN1Str RN2:(NSString *)RN2Str masterKey:(NSString *)mKey masterKeyCheck:(NSString *)mKeyCheck delay:(NSInteger)timeout;
-(void)udpateWorkKey:(NSString *)pik pinKeyCheck:(NSString *)pikCheck trackKey:(NSString *)trk trackKeyCheck:(NSString *)trkCheck macKey:(NSString *)mak macKeyCheck:(NSString *)makCheck transKey:(NSString *)tnsk transKeyCheck:(NSString *)tnskCheck keyIndex:(NSInteger) mKeyIndex delay:(NSInteger)timeout;
-(void)updateMasterKeyRandom:(NSInteger)step keyIndex:(NSString *)index masterKey:(NSString *)mKey masterKeyCheck:(NSString *)mKeyCheck delay:(NSInteger)timeout;

-(void)pinKey_TDESNoCheck:(NSInteger) keyIndex  pin:(NSString *)inStr delay:(NSInteger)timeout;

-(NSInteger)getUpdateProgress;
-(void)updatePosFirmware:(NSData*)aData address:(NSString*)devAddress;

/////////////////////////////////////////////
/////////?????????????????????????????????????????????????????????///////////
-(void)open;
-(void)write:(NSData *)aData;
-(void)close;

-(NSString *)changeCmd:(NSData *)aData;
-(void)showMyDialog:(NSString *)displayS;
-(NSDictionary *)sycnDoGetPosId:(Vpos *)pos delay:(NSInteger)timeout;
-(NSString*)readUserData;
-(BOOL)saveUserData:(NSString *)posId;
///////////////////////////////////////////
///////////////////////////////////////////
///// ??????????????????????????????????????? //////////////
-(BOOL) checkCmdId: (CommandUplink *)uc;
-(BOOL) exit_pos_trade:(Vpos *)p;
-(CommandUplink *) inquireResult:(Vpos *)pos;

-(void) onRequestWaitingUser;
-(void) onQposIdResult: (NSDictionary*)posId;
-(void) onQposInfoResult: (NSDictionary*)posInfoData;
-(void) onDoTradeResult: (DoTradeResult)result DecodeData:(NSDictionary*)decodeData;
-(void) onRequestSetAmount;
-(void) onRequestSelectEmvApp: (NSArray*)appList;
-(void) onRequestIsServerConnected;
-(void) onRequestFinalConfirm;
-(void) onRequestOnlineProcess: (NSString*) tlv;
-(void) onRequestTime;
-(void) onRequestTransactionResult: (TransactionResult)transactionResult;
-(void) onRequestTransactionLog: (NSString*)tlv;
-(void) onRequestBatchData: (NSString*)tlv;
-(void) onRequestQposConnected;
-(void) onRequestQposDisconnected;
-(void) onRequestNoQposDetected;
-(void) onError: (Error)errorState;
-(void) onRequestDisplay: (Display)displayMsg;

-(void) onRequestUpdateWorkKeyResult: (UpdateInformationResult)updateInformationResult;
-(void) onGetCardNoResult:(NSString *)result;
-(void) onRequestSignatureResult:(NSData *)result;
-(void) onReturnReversalData: (NSString*)tlv;
-(void) onReturnGetPinResult:(NSDictionary*)decodeData;

//add icc apdu 2014-03-11
-(void) onReturnPowerOnIccResult:(BOOL) isSuccess  KSN:(NSString *) ksn ATR:(NSString *)atr ATRLen:(NSInteger)atrLen;
-(void) onReturnPowerOffIccResult:(BOOL) isSuccess;
-(void) onReturnApduResult:(BOOL)isSuccess APDU:(NSString *)apdu APDU_Len:(NSInteger) apduLen;

//add set the sleep time 2014-03-25
-(void)onReturnSetSleepTimeResult:(BOOL)isSuccess;
//add  2014-04-02
-(void)onRequestCalculateMac:(NSString *)calMacString;

//add 2014-04-11
-(void)onReturnCustomConfigResult:(BOOL)isSuccess config:(NSString*)resutl;


-(void) onRequestPinEntry;

-(void) onReturnSetMasterKeyResult: (BOOL)isSuccess;
-(void) onReturnBatchSendAPDUResult:(NSDictionary *)apduResponses;
-(void) onReturniccCashBack: (NSDictionary*)result;
-(void) onLcdShowCustomDisplay: (BOOL)isSuccess;
-(void) onUpdatePosFirmwareResult:(UpdateInformationResult)result;

-(void) onDownloadRsaPublicKeyResult:(NSDictionary *)result;
-(void) onPinKeyTDESResult:(NSString *)encPin;
-(void) onGetPosComm:(NSInteger)mode amount:(NSString *)amt posId:(NSString*)aPosId;

-(void) onUpdateMasterKeyResult:(BOOL)isSuccess aDic:(NSDictionary *)resultDic;

-(void) onEmvICCExceptionData: (NSString*)tlv;
///////////////////////////////////////////

- (void)onReturnNFCApduResult:(BOOL)isSuccess
                         apdu:(NSString *)apdu
                  apduMaskLen:(NSInteger) apduMaskLen;
- (void)onReturnPowerOnNFCResult:(BOOL) isSuccess
                             ksn:(NSString *)ksn
                             atr:(NSString *)atr
                      atrMaskLen:(NSInteger)atrMaskLen;
- (void)onReturnPowerOffNFCResult:(BOOL) isSuccess;

- (void)onCbcMacResult:(NSString *)resultStr;
///////////////////////////////////////////

//??????????????????
- (void)getInputAmountWithSymbol:(NSString *)currencySymbol
                             len: (NSInteger) amountMaxLen
                 customerDisplay:(NSString *)customerStr
                           delay:(NSInteger)timeout
                           block:(void (^)(BOOL isSuccess, NSString *amountStr))inputAmountBlock;
//??????????????????
- (void)setSystemDateTime:(NSString *)dateTimeStr
                    delay:(NSInteger)timeout
                    block:(void (^)(BOOL isSuccess, NSDictionary *resultDic))dateTimeBlock;

- (void)powerOffNFC:(NSInteger) timeout withBlock:(void (^)(BOOL isSuccess))onPowerOffNFCResultBlock;
- (void)sendApduByNFC:(NSString *)apduString delay:(NSInteger)timeout withBlock:(void (^)(BOOL isSuccess, NSString *apdu, NSInteger apduLen))onNFCApduResultBlock;
- (void)powerOnNFC:(NSInteger) isEncrypt delay:(NSInteger) timeout withBlock:(void (^)(BOOL isSuccess, NSString *ksn, NSString *atr, NSInteger atrLen))onPowerOnNFCResultBlock;

//???????????????
- (void)setMerchantID:(NSString *)merchantID
                delay:(NSInteger)timeout
                block:(void (^)(BOOL isSuccess, NSDictionary *resultDic))merchantIDBlock;
//???????????????
- (void)setTerminalID:(NSString *)TerminalID
                delay:(NSInteger)timeout
                block:(void (^)(BOOL isSuccess, NSDictionary *resultDic))terminalIDBlock;

//????????????????????????
- (void)getMagneticTrackPlaintext:(NSInteger)timeout;

//??????????????????
- (void)updateBluetoothConfig:(NSString *)paras delay:(NSInteger) timeout;

//cbc-mac
- (void)cbc_mac:(NSInteger)keyLen atype:(NSInteger)algorithmType otype:(NSInteger)operatorType data:(NSString *)dataStr delay:(NSInteger)timeout withResultBlock:(void (^)(NSString *))cbcmacBlock;
//cbc-mac-NoCheck
- (void)cbc_macNoCheck:(NSInteger)keyLen atype:(NSInteger)algorithmType otype:(NSInteger)operatorType data:(NSString *)dataStr delay:(NSInteger)timeout withResultBlock:(void (^)(NSString *))cbcmacBlock;

- (void)readBusinessCard:(NSString *)cardType businessID:(NSInteger)businessID pin:(NSString *)pinStr address:(NSString *)addr readLen:(NSInteger)len delay:(NSInteger)timeout withResultBlock:(void (^)(BOOL isSuccess, NSString * result))readBusinessCardResultBlock;

//
- (void)writeBusinessCard:(NSString *)cardType businessID:(NSInteger)businessID address:(NSString *)addr writeData:(NSString *)data cardPin:(NSString *)pin isUpdatePin:(BOOL)updateFlag delay:(NSInteger)timeout withResultBlock:(void (^)(BOOL isSuccess, NSString * result))writeBusinessCardResultBlock;

- (NSData *)syncReadBusinessCard:(NSString *)cardType businessID:(NSInteger)businessID pin:(NSString *)pinStr address:(NSString *)addr readLen:(NSInteger)len delay:(NSInteger)timeout;

//
- (NSInteger)syncWriteBusinessCard:(NSString *)cardType businessID:(NSInteger)businessID address:(NSString *)addr writeData:(NSString *)data cardPin:(NSString *)pin isUpdatePin:(BOOL)updateFlag delay:(NSInteger)timeout;

- (void)getPin:(NSInteger)encryptType keyIndex:(NSInteger)keyIndex maxLen:(NSInteger)maxLen typeFace:(NSString *)typeFace cardNo:(NSString *)cardNo data:(NSString *)data delay:(NSInteger)timeout withResultBlock:(void (^)(BOOL isSuccess, NSDictionary * result))getPinBlock;

- (void)confirmAmount:(NSString *)wKey delay:(NSInteger)timeout withResultBlock:(void (^)(BOOL isSuccess))confirmAmountBlock;

-(void) setAmount: (NSString *)aAmount aAmountDescribe:(NSString *)aAmountDescribe currency:(NSString *)currency transactionType:(TransactionType)transactionType posDisplayAmount:(BOOL)flag;

- (NSDictionary *)syncReadZRCPUCardDelay:(NSInteger)timeout ;
- (NSString *)syncBuyGasInitializeGasV:(NSInteger)gasV terminalNO:(NSString *)terminalNO Delay:(NSInteger)timeout ;
- (BOOL)syncBuyGasToWriteOrdersCPUResult:(NSString *) toWriteOrdersCPUResult
                                  mackey:(NSString *)mackey
                               gasRandom:(NSString *)randomCode
                                   Delay:(NSInteger)timeout ;
//????????????int???  0??????????????????-1???????????????
- (NSInteger)syncResetCard:(NSInteger)vender withType:(NSInteger)cardType Delay:(NSInteger)timeout;
- (NSInteger)syncStartPowerWithVender:(NSInteger)vender withCardType:(NSInteger)cardType Delay:(NSInteger)timeout;

-(BOOL) resetPosStatus;
-(BOOL) syncGenerateQRCode:(NSString *)data amount:(NSString *)amt delay:(NSInteger)timeout;

//cbc-mac
- (void)cbc_mac_cn:(NSInteger)keyLen atype:(NSInteger)algorithmType otype:(NSInteger)operatorType data:(NSString *)dataStr delay:(NSInteger)timeout withResultBlock:(void (^)(NSString *))cbcmacBlock;
//cbc-mac-NoCheck
- (void)cbc_macNoCheck_cn:(NSInteger)keyLen atype:(NSInteger)algorithmType otype:(NSInteger)operatorType data:(NSString *)dataStr delay:(NSInteger)timeout withResultBlock:(void (^)(NSString *))cbcmacBlock;

-(void)calcMacSingle_all:(NSString *)macStr delay:(NSInteger)timeout;
-(void)MacKeyEncrypt_all:(NSString *)macStr delay:(NSInteger)timeout;
-(void)calcMacDouble_all:(NSString *)macStr keyIndex:(NSInteger) mKeyIndex delay:(NSInteger)timeout;
-(void)pinKey_TDES_all:(NSInteger) keyIndex  pin:(NSString *)inStr delay:(NSInteger)timeout;
- (void)cbc_mac_all:(NSInteger)keyLen atype:(NSInteger)algorithmType otype:(NSInteger)operatorType data:(NSString *)dataStr delay:(NSInteger)timeout withResultBlock:(void (^)(NSString *))cbcmacBlock;
//cbc-mac-NoCheck
- (void)cbc_mac_cn_all:(NSInteger)keyLen atype:(NSInteger)algorithmType otype:(NSInteger)operatorType data:(NSString *)dataStr delay:(NSInteger)timeout withResultBlock:(void (^)(NSString *))cbcmacBlock;

-(NSDictionary *)getICCTag:(NSInteger) cardType tagCount:(NSInteger) mTagCount tagArrStr:(NSString*) mTagArrStr;
-(NSDictionary *)getICCTag:(EncryptType)encryTypeStr cardType:(NSInteger)cardType tagCount:(NSInteger) mTagCount tagArrStr:(NSString*)mTagArrStr;
-(NSDictionary *)getNFCBatchData;
-(void)doTradeAll:(NSDictionary *)mDic;
-(void)doCheckCardAll:(NSDictionary*)mDic;
- (void)customInputDisplay:(NSInteger)operationType displayType:(NSInteger)dispType maxLen:(NSInteger)maxLen DisplayString:(NSString *)displayStr delay:(NSInteger)timeout withResultBlock:(void (^)(BOOL isSuccess, NSString * result))customInputDisplayResult;
-(void)setJudgeDebitOrCreditFlag:(BOOL)flag;

-(BOOL) connectBluetoothByCBPeripheral: ( CBPeripheral*)myCBPeripheral;
-(void) doCheckCard:(NSInteger) timeout keyIndex:(NSInteger) mKeyIndex;
-(NSData*) dataInterchange:(NSData*)indata delay:(NSInteger)timeout;
-(void)isCardExist:(NSInteger)timeout withResultBlock:(void (^)(BOOL))isCardExistBlock;
-(void)setBTAutoDetecting: (BOOL)flag;
-(BOOL) connectBluetoothNoScan: (NSString*)bluetoothName;
-(void)doTradeLogOperation:(NSInteger)operationType
                      data:(NSInteger)data
                     block:(void(^)(BOOL isSuccess,NSInteger markType, NSDictionary *stateStr))doTradeLogBlock;
-(NSArray *)getConnectedDevices;
-(void)setIsQuickEMV:(BOOL)isQuickEMV
               block:(void(^)(BOOL isSuccess,NSString *stateStr))setIsQuickEmvBlock;
-(NSData*)sycnSendApdu:(NSString *)apduStr;
-(NSDictionary *)syncDoTradeLogOperation:(NSInteger)type
                                    data:(NSInteger)data;
-(void)doTrade:(NSInteger) timeout batchID:(NSString *)batchID;
-(void)setFormatID:(NSString *)formatID;

- (NSDictionary*)syncGetPin:(NSInteger)encryptType keyIndex:(NSInteger)keyIndex maxLen:(NSInteger)maxLen typeFace:(NSString *)typeFace cardNo:(NSString *)cardNo date:(NSString *)data delay:(NSInteger)timeout;
- (void)sendApdu:(NSString *)apdu
           block:(void (^)(BOOL isSuccess, NSData *result))sendApduBlock;
-(BOOL)syncIsCardExist:(NSInteger)timeout;
- (void)getInputAmountWithSymbolAmountMaxLen:(NSInteger)amountMaxLen
                             customerDisplay:(NSString *)customerStr
                                       delay:(NSInteger)timeout
                                       block:(void (^)(BOOL isSuccess, NSString *amountStr))inputAmountBlock;

-(void)updateEmvCAPK:(NSInteger )operationType data:(NSArray *)data  block:(void (^)(BOOL isSuccess, NSString *stateStr))updateCAPKBlock;
-(void)asynResetPosStatusBlock:(void(^)(BOOL isSuccess,NSString *stateStr))resetPosStatusBlock;
-(void)buildPinBlock:(NSString *)workKey workKeyCheck:(NSString *)workKeyCheck encryptType:(NSInteger)encryptType keyIndex:(NSInteger)keyIndex maxLen:(NSInteger)maxLen typeFace:(NSString *)typeFace cardNo:(NSString *)cardNo date:(NSString *)date delay:(NSInteger)timeout;
-(void)doUpdateIPEKOperation:(NSString *)groupKey
                     tracksn:(NSString *)trackksn
                   trackipek:(NSString *)trackipek
         trackipekCheckValue:(NSString *)trackipekCheckValue
                      emvksn:(NSString *)emvksn
                     emvipek:(NSString *)emvipek
           emvipekcheckvalue:(NSString *)emvipekcheckvalue
                      pinksn:(NSString *)pinksn
                     pinipek:(NSString *)pinipek
           pinipekcheckValue:(NSString *)pinipekcheckValue
                       block:(void(^)(BOOL isSuccess,NSString *stateStr))EMVBlock;
-(void)asynresetPosStatus;
-(void)updateEmvAPP:(NSInteger )operationType data:(NSArray*)data  block:(void (^)(BOOL isSuccess, NSString *stateStr))updateEMVAPPBlock;
#pragma mark -- updateQuickEMVStatus
-(void)getQuickEMVStatus:(NSInteger )operationType data:(NSMutableDictionary*)data  block:(void (^)(BOOL isSuccess, NSString *stateStr))updateEMVAPPBlock;
#pragma mark init emv app

-(NSMutableDictionary *)getEMVAPPDict;
#pragma mark init emv capk
-(NSMutableDictionary *)getEMVCAPK;
-(void)setDoTradeMode:(DoTradeMode)doTradeMode;
-(void)setIsSaveLog:(BOOL)IsSaveLog
              block:(void(^)(BOOL isSuccess,NSString *stateStr))IsSaveLogBlock;
@end

