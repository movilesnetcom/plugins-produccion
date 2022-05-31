package co.com.netcom.qposplugin.android.utilities;

import android.util.Log;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.Map;

import co.com.netcom.qposplugin.android.constants.ConstantsCodeResponse;
import co.com.netcom.qposplugin.android.constants.ConstantsTagEMV;
import co.com.netcom.qposplugin.android.dto.TagEmvDTO;

/**
 * Created by david.ordaz on 22/03/2018.
 */
public class UtilityTag {

  private static ArrayList<TagEmvDTO> listTag = new ArrayList<TagEmvDTO>();



  public static ArrayList<TagEmvDTO> getListTagQpos(){
    listTag = new ArrayList<TagEmvDTO>();
    listTag.add(ConstantsTagEMV.TAG_5F20);
    listTag.add(ConstantsTagEMV.TAG_4F);
    listTag.add(ConstantsTagEMV.TAG_5F24);
    listTag.add(ConstantsTagEMV.TAG_9F16);
    listTag.add(ConstantsTagEMV.TAG_9F21);
    listTag.add(ConstantsTagEMV.TAG_9A);
    listTag.add(ConstantsTagEMV.TAG_9F02);
    listTag.add(ConstantsTagEMV.TAG_9F03);
    listTag.add(ConstantsTagEMV.TAG_9F34);
    listTag.add(ConstantsTagEMV.TAG_9F12);
    listTag.add(ConstantsTagEMV.TAG_9F06);
    listTag.add(ConstantsTagEMV.TAG_5F30);
    listTag.add(ConstantsTagEMV.TAG_9F4E);
    listTag.add(ConstantsTagEMV.TAG_C4);
    listTag.add(ConstantsTagEMV.TAG_C1);
    listTag.add(ConstantsTagEMV.TAG_C7);
    listTag.add(ConstantsTagEMV.TAG_C0);
    listTag.add(ConstantsTagEMV.TAG_C2);
    return listTag;
  };
  public static ArrayList<TagEmvDTO> getListTagEMV(){
    listTag = new ArrayList<TagEmvDTO>();
    listTag.add(ConstantsTagEMV.TAG_9F02);
    listTag.add(ConstantsTagEMV.TAG_9F16);
    listTag.add(ConstantsTagEMV.TAG_5F24);
    listTag.add(ConstantsTagEMV.TAG_4F);
    listTag.add(ConstantsTagEMV.TAG_9F34);
    listTag.add(ConstantsTagEMV.TAG_9A);
    listTag.add(ConstantsTagEMV.TAG_9F03);
    listTag.add(ConstantsTagEMV.TAG_9F06);
    listTag.add(ConstantsTagEMV.TAG_9F21);
    listTag.add(ConstantsTagEMV.TAG_9F12);
    listTag.add(ConstantsTagEMV.TAG_5A);
    listTag.add(ConstantsTagEMV.TAG_57);
    listTag.add(ConstantsTagEMV.TAG_9F10);
    listTag.add(ConstantsTagEMV.TAG_9F4E);
    listTag.add(ConstantsTagEMV.TAG_82);
    listTag.add(ConstantsTagEMV.TAG_8E);
    listTag.add(ConstantsTagEMV.TAG_5F25);
    listTag.add(ConstantsTagEMV.TAG_9F07);
    listTag.add(ConstantsTagEMV.TAG_9F0D);
    listTag.add(ConstantsTagEMV.TAG_9F0E);
    listTag.add(ConstantsTagEMV.TAG_9F0F);
    listTag.add(ConstantsTagEMV.TAG_9F26);
    listTag.add(ConstantsTagEMV.TAG_9F27);
    listTag.add(ConstantsTagEMV.TAG_9F36);
    listTag.add(ConstantsTagEMV.TAG_9C);
    listTag.add(ConstantsTagEMV.TAG_9F33);
    listTag.add(ConstantsTagEMV.TAG_9F37);
    listTag.add(ConstantsTagEMV.TAG_9F39);
    listTag.add(ConstantsTagEMV.TAG_9F40);
    listTag.add(ConstantsTagEMV.TAG_95);
    listTag.add(ConstantsTagEMV.TAG_9B);
    listTag.add(ConstantsTagEMV.TAG_84);
    listTag.add(ConstantsTagEMV.TAG_5F2A);
    listTag.add(ConstantsTagEMV.TAG_5F34);
    listTag.add(ConstantsTagEMV.TAG_9F09);
    listTag.add(ConstantsTagEMV.TAG_9F1A);
    listTag.add(ConstantsTagEMV.TAG_9F1E);
    listTag.add(ConstantsTagEMV.TAG_9F35);
    listTag.add(ConstantsTagEMV.TAG_9F41);
    listTag.add(ConstantsTagEMV.TAG_9F53);
    listTag.add(ConstantsTagEMV.TAG_5F20);
    listTag.add(ConstantsTagEMV.TAG_5F30);
    listTag.add(ConstantsTagEMV.TAG_5F28);
    listTag.add(ConstantsTagEMV.TAG_9F4C);
    listTag.add(ConstantsTagEMV.TAG_50);
    listTag.add(ConstantsTagEMV.TAG_9F08);
    listTag.add(ConstantsTagEMV.TAG_9F01);
    listTag.add(ConstantsTagEMV.TAG_9F15);
    listTag.add(ConstantsTagEMV.TAG_9F1C);
    return listTag;
  };

  public static ArrayList<TagEmvDTO> getListTagEMVSale(){
    listTag = new ArrayList<TagEmvDTO>();
    listTag.add(ConstantsTagEMV.TAG_95);
    listTag.add(ConstantsTagEMV.TAG_82);
    listTag.add(ConstantsTagEMV.TAG_84);
    listTag.add(ConstantsTagEMV.TAG_9A);
    listTag.add(ConstantsTagEMV.TAG_9C);
    listTag.add(ConstantsTagEMV.TAG_9F09);
    listTag.add(ConstantsTagEMV.TAG_5F34);
    listTag.add(ConstantsTagEMV.TAG_9F41);
    listTag.add(ConstantsTagEMV.TAG_9F34);
    listTag.add(ConstantsTagEMV.TAG_9F27);
    listTag.add(ConstantsTagEMV.TAG_9F26);
    listTag.add(ConstantsTagEMV.TAG_9F10);
    listTag.add(ConstantsTagEMV.TAG_9F37);
    listTag.add(ConstantsTagEMV.TAG_9F36);
    listTag.add(ConstantsTagEMV.TAG_9F35);
    listTag.add(ConstantsTagEMV.TAG_9F33);
    listTag.add(ConstantsTagEMV.TAG_9F1A);
    listTag.add(ConstantsTagEMV.TAG_9F1E);
    listTag.add(ConstantsTagEMV.TAG_9F02);
    listTag.add(ConstantsTagEMV.TAG_5F2A);
    listTag.add(ConstantsTagEMV.TAG_9F03);
    listTag.add(ConstantsTagEMV.TAG_9F06);
    listTag.add(ConstantsTagEMV.TAG_9F6E);

    return listTag;
  };

  public static ArrayList<TagEmvDTO> getListTagEMVSaleContactless(){
    listTag = new ArrayList<TagEmvDTO>();
    listTag.add(ConstantsTagEMV.TAG_95);
    listTag.add(ConstantsTagEMV.TAG_82);
    listTag.add(ConstantsTagEMV.TAG_84);
    listTag.add(ConstantsTagEMV.TAG_9A);
    listTag.add(ConstantsTagEMV.TAG_9C);
    listTag.add(ConstantsTagEMV.TAG_9F09);
    listTag.add(ConstantsTagEMV.TAG_5F34);
    listTag.add(ConstantsTagEMV.TAG_9F41);
    listTag.add(ConstantsTagEMV.TAG_9F34);
    listTag.add(ConstantsTagEMV.TAG_9F27);
    listTag.add(ConstantsTagEMV.TAG_9F26);
    listTag.add(ConstantsTagEMV.TAG_9F10);
    listTag.add(ConstantsTagEMV.TAG_9F37);
    listTag.add(ConstantsTagEMV.TAG_9F36);
    listTag.add(ConstantsTagEMV.TAG_9F35);
    listTag.add(ConstantsTagEMV.TAG_9F33);
    listTag.add(ConstantsTagEMV.TAG_9F1A);
    listTag.add(ConstantsTagEMV.TAG_9F1E);
    listTag.add(ConstantsTagEMV.TAG_9F02);
    listTag.add(ConstantsTagEMV.TAG_5F2A);
    listTag.add(ConstantsTagEMV.TAG_9F03);
    listTag.add(ConstantsTagEMV.TAG_9F06);
    listTag.add(ConstantsTagEMV.TAG_9F6E);

    return listTag;
  };

  public static ArrayList<TagEmvDTO> getListTagResponseServer(){
    listTag = new ArrayList<TagEmvDTO>();
    listTag.add(ConstantsTagEMV.TAG_91);
    listTag.add(ConstantsTagEMV.TAG_71);
    listTag.add(ConstantsTagEMV.TAG_72);
    return listTag;
  };

  public static TagEmvDTO getTagByName(String name, String tlv){
    TagEmvDTO tag = null;
    if(tlv!=null){
      tlv  = tlv.toUpperCase();
      name = name.toUpperCase();
      int posTag = tlv.indexOf(name);
      if(posTag == 0){
        tag = new TagEmvDTO();
        tag.setName(name);
        tag.setLength(tlv.substring(posTag+name.length(), posTag+name.length()+2));
        tag.setValue(tlv.substring(posTag+name.length()+2, (posTag+name.length()+2)+(Integer.parseInt(tag.getLength(),16)*2)));
        tag.setMinLength(Integer.toString(posTag));
        tag.setMaxLength(Integer.toString((posTag+name.length()+2)+(Integer.parseInt(tag.getLength(),16)*2)));
        Log.d("",tag.toString());
      }
    }else{
      tag = new TagEmvDTO();
      tag.setName(name);
      tag.setLength("00");
      tag.setValue("");
      tag.setMinLength("00");
      tag.setMaxLength("00");
    }
    return tag;
  }

  public static TagEmvDTO getTagC2(String name, String tlv){
    TagEmvDTO tag = null;
    tlv  = tlv.toUpperCase();
    name = (name+"82").toUpperCase();
    int posTag = tlv.indexOf(name);
    if(posTag == 0){
      tag = new TagEmvDTO();
      tag.setName("C2");
      tag.setLength(tlv.substring(posTag+name.length(), posTag+name.length()+4));
      tag.setValue(tlv.substring(posTag+name.length()+4, (posTag+name.length()+4)+(Integer.parseInt(tag.getLength(),16)*2)));
      tag.setMinLength(Integer.toString(posTag));
      tag.setMaxLength(Integer.toString((posTag+name.length()+4)+(Integer.parseInt(tag.getLength(),16)*2)));
      Log.d("",tag.toString());
    }
    return tag;
  }
  public static String getInfoEmvTagC2(String ksn_,String data_){
    // TODO Auto-generated method stub
    String ksn = ksn_;
    String ipek_plain  = "s2fer34rft43f42g5";//"10B43F27BD3588D963D58AB78BF64B0B";

    byte[] ipek = UtilityCipher.parseHexStr2Byte(ipek_plain);
    byte[] byte_ksn = UtilityCipher.parseHexStr2Byte(ksn);
    byte[] dataKey = UtilityCipher.GetDataKeyVariant(byte_ksn,ipek);
    String dataKeyStr = UtilityCipher.parseByte2HexStr(dataKey);
    Log.d("","dataKeyStr=" + dataKeyStr);

    byte[] dataKey__ = UtilityCipher.GetDataKey(byte_ksn,ipek);
    String dataKeyStr__ = UtilityCipher.parseByte2HexStr(dataKey__);
    Log.d("","dataKeyStr__=" + dataKeyStr__);

//		3352DE66 4E684C2C B45873C4 B82F1E35
    String datastr = data_;//"BF8544CAD8E1C8FD8B87483C44C7637E8D885C0806D40254";
    byte[] hexstr_dataKeyStr = UtilityCipher.parseHexStr2Byte(dataKeyStr__);
    byte[] hexstr_datastr    = UtilityCipher.parseHexStr2Byte(datastr);
    byte[] result_decrypt    = UtilityCipher.TriDesDecryptionCBC(hexstr_dataKeyStr, hexstr_datastr);
    String deResultStr = UtilityCipher.parseByte2HexStr(result_decrypt);

    Log.d("","data: "+deResultStr);

    deResultStr = deResultStr.substring(8,deResultStr.length());

    return deResultStr;
  }

  public static Hashtable<String, String> getInfoTrack2Tag57(String hashTrack2){
    // TODO Auto-generated method stub
    Hashtable<String, String> deResultStr = new Hashtable<String, String>();
    TagEmvDTO tag;
    tag = UtilityTag.getTagByName(ConstantsTagEMV.TAG_C0.getName(),hashTrack2);
    deResultStr.put("ksn",tag.getValue());
    hashTrack2 = hashTrack2.substring(0,Integer.parseInt(tag.getMinLength()))+hashTrack2.substring(Integer.parseInt(tag.getMaxLength()),hashTrack2.length());
    tag = UtilityTag.getTagByName(ConstantsTagEMV.TAG_C2.getName(),hashTrack2);
    deResultStr.put("track2",tag.getValue());
    return deResultStr;
  }

  public static Hashtable<String, String> getMapTagEmv(String tagsEmvInfo){
    Hashtable<String, String> mapEmv = new Hashtable<String, String>();
    ArrayList<TagEmvDTO> list = getListTagEMV();
    TagEmvDTO tag = null;
    for (TagEmvDTO tagEmvDto :list) {
      tag = getTagByName(tagEmvDto.getName(),tagsEmvInfo);
      if(tag!=null){
        tagsEmvInfo = tagsEmvInfo.substring(0,Integer.parseInt(tag.getMinLength()))+tagsEmvInfo.substring(Integer.parseInt(tag.getMaxLength()),tagsEmvInfo.length());
        mapEmv.put(tag.getName(),tag.getName()+tag.getLength()+tag.getValue());
      }
    }
    return mapEmv;
  }

  public static String getStringTagSale(Hashtable<String, String> mapTagEmv){
    String name = null;
    String tagSale = "";
    ArrayList<TagEmvDTO> list = getListTagEMVSale();
    for (TagEmvDTO tag :list) {
      if(tag!=null){
        name = tag.getName();
        tag = getTagByName(name,mapTagEmv.get(name));
        tagSale += tag.getTagTLV();
      }
    }
    return tagSale;
  }

  public static String getStringTagAid(Hashtable<String, String> mapTagEmv){
    String tagSale = "";
    TagEmvDTO tag = ConstantsTagEMV.TAG_84;
    tag = getTagByName(tag.getName(),mapTagEmv.get(tag.getName()));
    tagSale =  tag.getValue();
    return tagSale;
  }

}
