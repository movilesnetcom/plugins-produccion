package co.com.netcom.qposplugin.android.utilities;

/**
 * Created by david.ordaz on 03/04/2018.
 */
public class UtilityHexa {

  static final String HEXES = "0123456789ABCDEF";

  public static String byteArray2Hex(byte[] raw) {
    if (raw == null) {
      return null;
    }
    final StringBuilder hex = new StringBuilder(2 * raw.length);
    for (final byte b : raw) {
      hex.append(HEXES.charAt((b & 0xF0) >> 4)).append(HEXES.charAt((b & 0x0F)));
    }
    return hex.toString();
  }

  public static String hexToString(String arg) {
    String str = "";
    String s = "";
    for(int i=0;i<arg.length();i+=2)
    {
      s=arg.substring(i, (i + 2));
      int decimal = Integer.parseInt(s, 16);
      str = str + (char) decimal;
    }
    return str;
  }

  public static String stringTohex(String str) {
    String result = "";
    for (int i = 0, l = str.length(); i < l; i ++) {
      result=result + Integer.toString(str.charAt(i),16);
    }
    return result;
  }

  public static String hexToBinary(String str) {
    return Integer.toBinaryString(Integer.parseInt(str,16));
  }

}
