package co.com.netcom.qposplugin.android.utilities;

import android.util.Log;

import java.security.Key;
import java.security.SecureRandom;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESedeKeySpec;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

/**
 * Created by david.ordaz on 04/04/2018.
 */
public class UtilityCipher {

  public static byte[] GenerateIPEK(byte[] ksn, byte[] bdk)
  {
    byte[] result;
    byte[] temp, temp2, keyTemp;

    result = new byte[16];
    temp = new byte[8];
    keyTemp = new byte[16];

//        Array.Copy(bdk, keyTemp, 16);
    System.arraycopy(bdk, 0, keyTemp, 0, 16);   //Array.Copy(bdk, keyTemp, 16);
//        Array.Copy(ksn, temp, 8);
    System.arraycopy(ksn, 0, temp, 0, 8);    //Array.Copy(ksn, temp, 8);
    temp[7] &= 0xE0;
//        TDES_Enc(temp, keyTemp, out temp2);
    temp2 = TriDesEncryption(keyTemp,temp);    //TDES_Enc(temp, keyTemp, out temp2);temp
//        Array.Copy(temp2, result, 8);
    System.arraycopy(temp2, 0, result, 0, 8);   //Array.Copy(temp2, result, 8);
    keyTemp[0] ^= 0xC0;
    keyTemp[1] ^= 0xC0;
    keyTemp[2] ^= 0xC0;
    keyTemp[3] ^= 0xC0;
    keyTemp[8] ^= 0xC0;
    keyTemp[9] ^= 0xC0;
    keyTemp[10] ^= 0xC0;
    keyTemp[11] ^= 0xC0;
//        TDES_Enc(temp, keyTemp, out temp2);
    temp2 = TriDesEncryption(keyTemp,temp);    //TDES_Enc(temp, keyTemp, out temp2);
//        Array.Copy(temp2, 0, result, 8, 8);
    System.arraycopy(temp2, 0, result, 8, 8);   //Array.Copy(temp2, 0, result, 8, 8);
    return result;
  }

  public static byte[] GetDUKPTKey(byte[] ksn, byte[] ipek)
  {
//    	Log.d("","ksn===" + parseByte2HexStr(ksn));
    byte[] key;
    byte[] cnt;
    byte[] temp;
//    	byte shift;
    int shift;

    key = new byte[16];
//        Array.Copy(ipek, key, 16);
    System.arraycopy(ipek, 0, key, 0, 16);

    temp = new byte[8];
    cnt = new byte[3];
    cnt[0] = (byte)(ksn[7] & 0x1F);
    cnt[1] = ksn[8];
    cnt[2] = ksn[9];
//        Array.Copy(ksn, 2, temp, 0, 6);
    System.arraycopy(ksn, 2, temp, 0, 6);
    temp[5] &= 0xE0;

    shift = 0x10;
    while (shift > 0)
    {
      if ((cnt[0] & shift) > 0)
      {
//            	Log.d("","**********");
        temp[5] |= shift;
        NRKGP(key, temp);
      }
      shift >>= 1;
    }
    shift = 0x80;
    while (shift > 0)
    {
      if ((cnt[1] & shift) > 0)
      {
//            	Log.d("","&&&&&&&&&&");
        temp[6] |= shift;
        NRKGP(key, temp);
      }
      shift >>= 1;
    }
    shift = 0x80;
    while (shift > 0)
    {
      if ((cnt[2] & shift) > 0)
      {
//            	Log.d("","^^^^^^^^^^");
        temp[7] |= shift;
        NRKGP(key, temp);
      }
      shift >>= 1;
    }

    return key;
  }

  /// <summary>
  /// Non Reversible Key Generatino Procedure
  /// private function used by GetDUKPTKey
  /// </summary>
  private static void NRKGP(byte[] key, byte[] ksn)
  {

    byte[] temp, key_l, key_r, key_temp;
    int i;

    temp = new byte[8];
    key_l = new byte[8];
    key_r = new byte[8];
    key_temp = new byte[8];

//        Console.Write("");

//        Array.Copy(key, key_temp, 8);
    System.arraycopy(key, 0, key_temp, 0, 8);
    for (i = 0; i < 8; i++)
      temp[i] = (byte)(ksn[i] ^ key[8 + i]);
//        DES_Enc(temp, key_temp, out key_r);
    key_r = TriDesEncryption(key_temp,temp);
    for (i = 0; i < 8; i++)
      key_r[i] ^= key[8 + i];

    key_temp[0] ^= 0xC0;
    key_temp[1] ^= 0xC0;
    key_temp[2] ^= 0xC0;
    key_temp[3] ^= 0xC0;
    key[8] ^= 0xC0;
    key[9] ^= 0xC0;
    key[10] ^= 0xC0;
    key[11] ^= 0xC0;

    for (i = 0; i < 8; i++)
      temp[i] = (byte)(ksn[i] ^ key[8 + i]);
//        DES_Enc(temp, key_temp, out key_l);
    key_l = TriDesEncryption(key_temp,temp);
    for (i = 0; i < 8; i++)
      key[i] = (byte)(key_l[i] ^ key[8 + i]);
//        Array.Copy(key_r, 0, key, 8, 8);
    System.arraycopy(key_r, 0, key, 8, 8);
  }

  /// <summary>
  /// Get current Data Key variant
  /// Data Key variant is XOR DUKPT Key with 0000 0000 00FF 0000 0000 0000 00FF 0000
  /// </summary>
  /// <param name="ksn">Key serial number(KSN). A 10 bytes data. Which use to determine which BDK will be used and calculate IPEK. With different KSN, the DUKPT system will ensure different IPEK will be generated.
  /// Normally, the first 4 digit of KSN is used to determine which BDK is used. The last 21 bit is a counter which indicate the current key.</param>
  /// <param name="ipek">IPEK (16 byte).</param>
  /// <returns>Data Key variant (16 byte)</returns>
  public static byte[] GetDataKeyVariant(byte[] ksn, byte[] ipek)
  {
    byte[] key;

    key = GetDUKPTKey(ksn, ipek);
    key[5] ^= 0xFF;
    key[13] ^= 0xFF;

    return key;
  }

  /// <summary>
  /// Get current PIN Key variant
  /// PIN Key variant is XOR DUKPT Key with 0000 0000 0000 00FF 0000 0000 0000 00FF
  /// </summary>
  /// <param name="ksn">Key serial number(KSN). A 10 bytes data. Which use to determine which BDK will be used and calculate IPEK. With different KSN, the DUKPT system will ensure different IPEK will be generated.
  /// Normally, the first 4 digit of KSN is used to determine which BDK is used. The last 21 bit is a counter which indicate the current key.</param>
  /// <param name="ipek">IPEK (16 byte).</param>
  /// <returns>PIN Key variant (16 byte)</returns>
  public static byte[] GetPinKeyVariant(byte[] ksn, byte[] ipek)
  {
    byte[] key;

    key = GetDUKPTKey(ksn, ipek);
    key[7] ^= 0xFF;
    key[15] ^= 0xFF;

    return key;
  }

  public static byte[] GetMacKeyVariant(byte[] ksn, byte[] ipek)
  {
    byte[] key;

    key = GetDUKPTKey(ksn, ipek);
    key[6] ^= 0xFF;
    key[14] ^= 0xFF;

    return key;
  }

  public static byte[] GetDataKey(byte[] ksn, byte[] ipek)
  {
    byte[] temp1 = GetDataKeyVariant(ksn, ipek);
    byte[] temp2 = temp1;

    byte[] key = TriDesEncryption(temp2,temp1);

    return key;
  }

  public static byte[] TriDesEncryption(byte[] byteKey, byte[] dec) {

    try {
      byte[] en_key = new byte[24];
      if (byteKey.length == 16) {
        System.arraycopy(byteKey, 0, en_key, 0, 16);
        System.arraycopy(byteKey, 0, en_key, 16, 8);
      } else if (byteKey.length == 8) {
        System.arraycopy(byteKey, 0, en_key, 0, 8);
        System.arraycopy(byteKey, 0, en_key, 8, 8);
        System.arraycopy(byteKey, 0, en_key, 16, 8);
      } else {
        en_key = byteKey;
      }
      SecretKeySpec key = new SecretKeySpec(en_key, "DESede");

      Cipher ecipher = Cipher.getInstance("DESede/ECB/NoPadding");
      ecipher.init(Cipher.ENCRYPT_MODE, key);

      // Encrypt
      byte[] en_b = ecipher.doFinal(dec);

      // String en_txt = parseByte2HexStr(en_b);
      // String en_txt =byte2hex(en_b);
      return en_b;
    } catch (Exception e) {
      e.printStackTrace();
    }
    return null;
  }

  public static byte[] TriDesDecryptionCBC(byte[] byteKey, byte[] dec) {
    byte[] en_key = new byte[24];
    if (byteKey.length == 16) {
      System.arraycopy(byteKey, 0, en_key, 0, 16);
      System.arraycopy(byteKey, 0, en_key, 16, 8);
    } else if (byteKey.length == 8) {
      System.arraycopy(byteKey, 0, en_key, 0, 8);
      System.arraycopy(byteKey, 0, en_key, 8, 8);
      System.arraycopy(byteKey, 0, en_key, 16, 8);
    } else {
      en_key = byteKey;
    }

    try {
      Key deskey = null;
      byte[] keyiv=new byte[8];
      DESedeKeySpec spec = new DESedeKeySpec(en_key);
      SecretKeyFactory keyfactory = SecretKeyFactory.getInstance("desede");
      deskey = keyfactory.generateSecret(spec);

      Cipher cipher = Cipher.getInstance("desede" + "/CBC/NoPadding");
      IvParameterSpec ips = new IvParameterSpec(keyiv);

      cipher.init(Cipher.DECRYPT_MODE, deskey, ips);

      byte[] de_b = cipher.doFinal(dec);

      return de_b;
    } catch (Exception e) {
      e.printStackTrace();
    }
    return null;
  }

  public static byte[] TriDesDecryption(byte[] byteKey, byte[] dec) {
    // private String TriDesDecryption(String dnc_key, byte[] dec){
    // byte[] byteKey = parseHexStr2Byte(dnc_key);
    byte[] en_key = new byte[24];
    if (byteKey.length == 16) {
      System.arraycopy(byteKey, 0, en_key, 0, 16);
      System.arraycopy(byteKey, 0, en_key, 16, 8);
    } else if (byteKey.length == 8) {
      System.arraycopy(byteKey, 0, en_key, 0, 8);
      System.arraycopy(byteKey, 0, en_key, 8, 8);
      System.arraycopy(byteKey, 0, en_key, 16, 8);
    } else {
      en_key = byteKey;
    }
    SecretKey key = null;

    try {
      key = new SecretKeySpec(en_key, "DESede");
    } catch (Exception e) {
      e.printStackTrace();
      return null;
    }

    try {
      Cipher dcipher = Cipher.getInstance("DESede/ECB/NoPadding");
      dcipher.init(Cipher.DECRYPT_MODE, key);

      // byte[] dec = parseHexStr2Byte(en_data);

      // Decrypt
      byte[] de_b = dcipher.doFinal(dec);

      // String de_txt = parseByte2HexStr(removePadding(de_b));
      return de_b;
    } catch (Exception e) {
      e.printStackTrace();
    }
    return null;
  }


  public static byte[] parseHexStr2Byte(String hexStr) {
    if (hexStr.length() < 1)
      return null;
    byte[] result = new byte[hexStr.length() / 2];
    for (int i = 0; i < hexStr.length() / 2; i++) {
      int high = Integer.parseInt(hexStr.substring(i * 2, i * 2 + 1), 16);
      int low = Integer.parseInt(hexStr.substring(i * 2 + 1, i * 2 + 2),
        16);
      result[i] = (byte) (high * 16 + low);
    }
    return result;
  }

  public static String parseByte2HexStr(byte buf[]) {
    StringBuffer sb = new StringBuffer();
    for (int i = 0; i < buf.length; i++) {
      String hex = Integer.toHexString(buf[i] & 0xFF);
      if (hex.length() == 1) {
        hex = '0' + hex;
      }
      sb.append(hex.toUpperCase());
    }
    return sb.toString();
  }

  public static String dataFill(String dataStr) {
    int len = dataStr.length();
    if (len%16 != 0) {
      dataStr += "80";
      len = dataStr.length();
    }
    while (len%16 != 0) {
      dataStr += "0";
      len ++;
      Log.d("",dataStr);
    }
    return dataStr;
  }
}
