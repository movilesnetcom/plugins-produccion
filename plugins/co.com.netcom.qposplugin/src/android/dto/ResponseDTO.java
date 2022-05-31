package co.com.netcom.qposplugin.android.dto;

/**
 * Created by david.ordaz on 16/03/2018.
 */
public class ResponseDTO {

  public String code;
  public String message;
  public String data;

  public ResponseDTO(String code, String message, String data) {
    this.code = code;
    this.message = message;
    this.data = data;
  }

  public String getCode() {
    return code;
  }

  public void setCode(String code) {
    this.code = code;
  }

  public String getMessage() {
    return message;
  }

  public void setMessage(String message) {
    this.message = message;
  }

  public String getData() {
    return data;
  }

  public void setData(String data) {
    this.data = data;
  }

  @Override
  public String toString() {
    return "ResponseDTO{" +
      "code='" + code + '\'' +
      ", message='" + message + '\'' +
      ", data='" + data + '\'' +
      '}';
  }
}
