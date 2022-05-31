//
//  BluetoothSerial.m
//  EADemo
//
//  Created by Matěj Kříž on 27.01.15.
//
//

#import "BluetoothSerial.h"
#import <Cordova/CDV.h>

@implementation BluetoothSerial


- (void)connect:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    bool result = NO;
    NSMutableDictionary *deviceDictionary = [[NSMutableDictionary alloc] init];
    NSString *deviceID = [command.arguments objectAtIndex:0];

    if (!_eaSessionController){
        _eaSessionController = [EADSessionController sharedController];
    }

    NSArray *accessories = [[EAAccessoryManager sharedAccessoryManager]
                            connectedAccessories];

    EAAccessory *accessory = nil;
    for (EAAccessory *obj in accessories) {
        if ([obj connectionID] == [deviceID integerValue]){
            accessory = obj;
            break;
        }
    }

    if (accessory != nil){
        result = [_eaSessionController openSession:accessory];

        if (result) {
            deviceDictionary = [[NSMutableDictionary alloc] init];
            [deviceDictionary setObject:accessory.name forKey:@"name"];
            [deviceDictionary setObject:[NSString stringWithFormat:@"%@", @(accessory.connectionID)] forKey:@"id"];

        }
    }

    if(result){
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:deviceDictionary];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Device could not connect!"];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)disconnect:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;

    [self removeSubscription];
    [_eaSessionController closeSession];

    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"Device disconnected!"];

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

-(NSMutableArray*)getList
{
    if (!_eaSessionController){
        _eaSessionController = [EADSessionController sharedController];
    }

    _accessoryList = [[NSMutableArray alloc] initWithArray:[[EAAccessoryManager sharedAccessoryManager] connectedAccessories]];
    NSLog(@"_accessoryList %@", _accessoryList);

    NSMutableArray *accessoryDictionary = [[NSMutableArray alloc] init];
    for (EAAccessory *device in _accessoryList) {
        //if ([[device protocolStrings] containsObject:@"com.miura.shuttle"]) {
            NSMutableDictionary *tmpDic=[[NSMutableDictionary alloc] init];
            [tmpDic setObject:device.name forKey:@"name"];
            [tmpDic setObject:[NSString stringWithFormat:@"%@",  @(device.connectionID)] forKey:@"id"];
            [tmpDic setObject:device.protocolStrings forKey:@"class"];

            [accessoryDictionary addObject:tmpDic];
       // }
    }
    return accessoryDictionary;
}

- (void)list:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSMutableArray *list = nil;

    list = [self getList ] ;

    if([list count] > 0){
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArray:list];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"lista no obtenida"];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}


- (void)connectIOS:(CDVInvokedUrlCommand*)command
{
    if (!_eaSessionController){
        _eaSessionController = [EADSessionController sharedController];
    }

    [[EAAccessoryManager sharedAccessoryManager] showBluetoothAccessoryPickerWithNameFilter:nil completion:^(NSError *error) {
        [self.commandDelegate runInBackground:^{
            CDVPluginResult* pluginResult = nil;
            if(error != nil && [error code] == EABluetoothAccessoryPickerResultCancelled) {
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArray:@[]];
            } else {
                // connectedAccessories need some time to load protocolStrings properly
                usleep(3500000);
                NSMutableArray *accessoryDictionary  = [self getList];
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArray:accessoryDictionary];

            }
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        }];
    }];
}

- (void)isEnabled:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;

    if (!_eaSessionController){
        _eaSessionController = [EADSessionController sharedController];
    }

     _accessoryList = [[NSMutableArray alloc] initWithArray:[[EAAccessoryManager sharedAccessoryManager] connectedAccessories]];


    if ([_accessoryList count] == 0 ) {

        _accessoryList = [[NSMutableArray alloc] initWithArray:[[EAAccessoryManager sharedAccessoryManager] connectedAccessories]];
    }

    bool isEnabled = [_accessoryList count] > 0 ? true:false;

    if(isEnabled){
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:isEnabled];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Device could not connect!"];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)isConnected:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;

    if (!_eaSessionController){
        _eaSessionController = [EADSessionController sharedController];
    }

    bool connected = [_eaSessionController.session.accessory isConnected];
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:connected];

    if(connected){
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:connected];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Device could not connect!"];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)available:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;

    NSString* available = [NSString stringWithFormat: @"%lu", (unsigned long)[_eaSessionController readBytesAvailable]];
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:available];

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)read:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;

    NSData *data = [[NSData alloc] init];
    unsigned long bytesAvailable = 0;
    while ((bytesAvailable = [_eaSessionController readBytesAvailable]) > 0) {
        data = [_eaSessionController readData:bytesAvailable];
    }

    unsigned char *buffer;
    buffer = (unsigned char*)[data bytes];
    [data getBytes:buffer length:[data length]];


    NSString* message = [NSString stringWithFormat: @"%s", (char *)buffer];
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:message];

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)readUntil:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;

    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"ReadUntil not implemented yet!"];

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)write:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString *commadWrite = [command.arguments objectAtIndex:0];

    NSData *data = [self hexToBytes:commadWrite];

    if (data)
    {
        // watch for received data from the accessory
       // [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_sessionDataReceived:) name:EADSessionDataReceivedNotification object:nil];

        [[EADSessionController sharedController] writeData:data];
    }

    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"Write not implemented yet!"];

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)writebinary:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString *commadWrite = [command.arguments objectAtIndex:0];
    NSArray *array = [commadWrite componentsSeparatedByString:@" "];

    NSData *data = [self stringBinaryToBytes:array];

    if (data)
    {
        // watch for received data from the accessory
        // [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_sessionDataReceived:) name:EADSessionDataReceivedNotification object:nil];

        [[EADSessionController sharedController] writeData:data];
    }

    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"Write not implemented yet!"];

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}


- (void)subscribe:(CDVInvokedUrlCommand*)command
{
    //NSString *delimiter = [command.arguments objectAtIndex:0];

    //if (delimiter == nil) {
     //   delimiter = @"\n";
    //}

    _subscribeCallbackId = [command.callbackId copy];
    //_delimiter = [delimiter copy];

    //[_eaSessionController setDelimiter:delimiter];

    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
    _dataReceivedObserver = [center addObserverForName:@"EADSessionDataReceivedNotification" object:nil
                                                     queue:mainQueue usingBlock:^(NSNotification *note) {
                                                         [self sendDataToSubscriber];
                                                     }];
}


- (NSString*)readUntilDelimiter: (NSString*) delimiter {

    NSData *data = [[NSData alloc] init];
    NSString* _buffer;
    Boolean hayDatos = false;
    unsigned long bytesAvailable = 0;
    if ((bytesAvailable = [_eaSessionController readBytesAvailable]) > 0) {
        data = [_eaSessionController readData:bytesAvailable];
        hayDatos = YES;
    }

    if (hayDatos) {

        _buffer = [self stringWithHexFromData:data];

        }else{

       _buffer = NULL;
    }

    return _buffer;
}

- (void) sendDataToSubscriber {

    NSString *message = [self readUntilDelimiter:_delimiter];

    if (([message length] > 0) && (message != NULL)) {
        CDVPluginResult *pluginResult = nil;
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString: message];
        [pluginResult setKeepCallbackAsBool:TRUE];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:_subscribeCallbackId];

        [self sendDataToSubscriber];
    }

}

- (void) removeSubscription {
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center removeObserver:_dataReceivedObserver];
}

- (void)unsubscribe:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;

    [self removeSubscription];

    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"Unsubscribed!"];

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)clear:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;

    [_eaSessionController clearData];

    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"Data cleared!"];

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)_sessionDataReceived:(NSNotification *)notification
{
    NSLog(@"");
    EADSessionController *sessionController = (EADSessionController *)[notification object];
    uint32_t bytesAvailable = 0;
    NSData *data;
    BOOL hayDato = NO;

    while ((bytesAvailable = [sessionController readBytesAvailable]) > 0) {
        data = [sessionController readData:bytesAvailable];

        if (data) {
            hayDato = YES;

        }

    }

}

/**
 *  Metodo que convierte de String a NSData
 *
 *  @param hexaStr <#hexaStr description#>
 *
 *  @return <#return value description#>
 */
- (NSData*)hexToBytes:(NSString *) hexaStr {

    NSMutableData* data = [NSMutableData data];
    int idx;
    for (idx = 0; idx+2 <= hexaStr.length; idx+=2) {
        NSRange range = NSMakeRange(idx, 2);
        NSString * hexStrTmp = [hexaStr substringWithRange:range];
        NSScanner* scanner = [NSScanner scannerWithString:hexStrTmp];
        unsigned int intValue;
        [scanner scanHexInt:&intValue];
        [data appendBytes:&intValue length:1];
    }
    return data;
}

/**
 *  Metodo que convierte de String a NSData
 *
 *  @param hexaStr <#hexaStr description#>
 *
 *  @return <#return value description#>
 */
- (NSData*)stringBinaryToBytes:(NSArray *) stringBinaryArray {

    //const char* utf8String = [stringBinary UTF8String];
    NSMutableData* data = [NSMutableData data];

    for (NSString *string in stringBinaryArray)
    {
        const char* utf8String = [string UTF8String];
        const char* endPtr = NULL;
        long int foo = strtol(utf8String, &endPtr, 2);
        [data appendBytes:&foo length:1];

       /* for (int i=0; i<[string length]; i++) {
            unichar letter = [string characterAtIndex:i];
            NSString* s = [NSString stringWithCharacters:&letter length:1];
            const char* utf8String = [string UTF8String];
            const char* endPtr = NULL;
            short int statusCode = [s intValue];
            long int foo = strtol(utf8String, &endPtr, 2);
            Byte byteTMP = foo;

            NSData data;
            //long int foo = strtol(letter, &endPtr, 2);
            [data appendBytes:&foo length:4];
            [data appendData:&data];


        }*/
        /* const char* utf8String = [string UTF8String];
         const char* endPtr = NULL;
        int index = 0;

        for (index = 0;index <strlen(utf8String);index++){
            long int foo = strtol(utf8String[index], &endPtr, 2);
            [data appendBytes:&foo length:1];
        }
        */


        // do stuff...
    }
    /*int idx;
    for (idx = 0; idx+2 <= hexaStr.length; idx+=2) {
        NSRange range = NSMakeRange(idx, 2);
        NSString * hexStrTmp = [hexaStr substringWithRange:range];
        NSScanner* scanner = [NSScanner scannerWithString:hexStrTmp];
        unsigned int intValue;
        [scanner scanHexInt:&intValue];
        [data appendBytes:&intValue length:1];
    }*/
    return data;
}


/**
 *  Metodo que convierte de NSData a String
 *
 *  @param data NSData a convertir
 *
 *  @return Retorna valor en String
 */
- (NSString *)stringWithHexFromData:(NSData *)data
{
    NSString *result = [[data description] stringByReplacingOccurrencesOfString:@" " withString:@""];
    result = [result substringWithRange:NSMakeRange(1, [result length] - 2)];
    return result;
}
@end
