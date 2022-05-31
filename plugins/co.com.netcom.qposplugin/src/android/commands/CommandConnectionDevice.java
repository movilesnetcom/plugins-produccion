package co.com.netcom.qposplugin.android.commands;

import co.com.netcom.qposplugin.android.constants.ConstantsCodeResponse;
import co.com.netcom.qposplugin.android.dto.ResponseDTO;

/**
 * Created by david.ordaz on 20/03/2018.
 */
public class CommandConnectionDevice {

  public CommandConnectionDevice(){
  }

  public ResponseDTO getConnectDevice(){
    return new ResponseDTO(ConstantsCodeResponse.SUCCESFUL,"Dispositivo Conectado","");
  }

  public ResponseDTO getDisconnectDevice(){
    return new ResponseDTO(ConstantsCodeResponse.SUCCESFUL,"Dispositivo desconectado","");
  }

  public ResponseDTO getIsConnectDevice(boolean isDevicePresent){
    if(isDevicePresent){
      return  new ResponseDTO(ConstantsCodeResponse.SUCCESFUL,"Dispositivo Conectado","");
    }else{
      return new ResponseDTO(ConstantsCodeResponse.FAILED,"Dispositivo No Conectado","");
    }
  }

}
