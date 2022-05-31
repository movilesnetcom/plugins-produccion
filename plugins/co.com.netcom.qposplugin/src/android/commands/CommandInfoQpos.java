package co.com.netcom.qposplugin.android.commands;


import org.json.JSONException;
import org.json.JSONObject;

import java.util.Hashtable;

import co.com.netcom.qposplugin.android.constants.ConstantsCodeResponse;
import co.com.netcom.qposplugin.android.constants.ConstantsInfoQpos;
import co.com.netcom.qposplugin.android.dto.ResponseDTO;

/**
 * Created by david.ordaz on 16/03/2018.
 */
public class CommandInfoQpos {

  public CommandInfoQpos(){

  }

  public ResponseDTO getBatteryStatus(Hashtable<String, String> posInfoData) throws JSONException {

    ResponseDTO res = new ResponseDTO(ConstantsCodeResponse.SUCCESFUL,"exitoso","llego hasta el obtener status bateria");
    JSONObject obj = new JSONObject();

    String isSupportedTrack1 = posInfoData.get(ConstantsInfoQpos.IS_SUPPORTED_TRACK_1) == null? "" : posInfoData.get(ConstantsInfoQpos.IS_SUPPORTED_TRACK_1);
    obj.put(ConstantsInfoQpos.IS_SUPPORTED_TRACK_1,isSupportedTrack1);

    String isSupportedTrack2 = posInfoData.get(ConstantsInfoQpos.IS_SUPPORTED_TRACK_2) == null? "" : posInfoData.get(ConstantsInfoQpos.IS_SUPPORTED_TRACK_2);
    obj.put(ConstantsInfoQpos.IS_SUPPORTED_TRACK_2,isSupportedTrack2);

    String isSupportedTrack3 = posInfoData.get(ConstantsInfoQpos.IS_SUPPORTED_TRACK_3) == null? "" : posInfoData.get(ConstantsInfoQpos.IS_SUPPORTED_TRACK_3);
    obj.put(ConstantsInfoQpos.IS_SUPPORTED_TRACK_3,isSupportedTrack3);

    String bootloaderVersion = posInfoData.get(ConstantsInfoQpos.BOOTLOADER_VERSION)   == null? "" : posInfoData.get(ConstantsInfoQpos.BOOTLOADER_VERSION);
    obj.put(ConstantsInfoQpos.BOOTLOADER_VERSION,bootloaderVersion);

    String firmwareVersion   = posInfoData.get(ConstantsInfoQpos.FIRMWARE_VERSION)     == null? "" : posInfoData.get(ConstantsInfoQpos.FIRMWARE_VERSION);
    obj.put(ConstantsInfoQpos.FIRMWARE_VERSION,firmwareVersion);

    String isUsbConnected    = posInfoData.get(ConstantsInfoQpos.IS_USB_CONNECTED)     == null? "" : posInfoData.get(ConstantsInfoQpos.IS_USB_CONNECTED);
    obj.put(ConstantsInfoQpos.IS_USB_CONNECTED,isUsbConnected);

    String isCharging        = posInfoData.get(ConstantsInfoQpos.IS_CHARGING)          == null? "" : posInfoData.get(ConstantsInfoQpos.IS_CHARGING);
    obj.put(ConstantsInfoQpos.IS_CHARGING,isCharging);

    String batteryLevel      = posInfoData.get(ConstantsInfoQpos.BATTERY_LEVEL)        == null? "" : posInfoData.get(ConstantsInfoQpos.BATTERY_LEVEL);
    obj.put(ConstantsInfoQpos.BATTERY_LEVEL,batteryLevel);

    String hardwareVersion   = posInfoData.get(ConstantsInfoQpos.HARDWARE_VERSION)     == null? "" : posInfoData.get(ConstantsInfoQpos.HARDWARE_VERSION);
    obj.put(ConstantsInfoQpos.HARDWARE_VERSION,hardwareVersion);

    String batteryPercentage = posInfoData.get(ConstantsInfoQpos.BATTERY_PERCENTAGE)   == null? "" : posInfoData.get(ConstantsInfoQpos.BATTERY_PERCENTAGE);
    obj.put(ConstantsInfoQpos.BATTERY_PERCENTAGE,batteryPercentage);

    String checkValueUpdate = posInfoData.get(ConstantsInfoQpos.CHECK_VALUE_UPDATE)   == null? "" : posInfoData.get(ConstantsInfoQpos.CHECK_VALUE_UPDATE);
    obj.put(ConstantsInfoQpos.CHECK_VALUE_UPDATE,checkValueUpdate);

    res.setData(obj.toString());
    return res;
  }

}
