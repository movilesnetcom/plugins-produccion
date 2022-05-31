package co.com.netcom.qposplugin.android.commands;

import android.nfc.Tag;
import android.util.Log;

import com.dspread.xpos.QPOSService;

import java.util.ArrayList;
import java.util.Hashtable;

import co.com.netcom.qposplugin.android.constants.ConstantsAID;
import co.com.netcom.qposplugin.android.constants.ConstantsCard;
import co.com.netcom.qposplugin.android.constants.ConstantsFranchise;
import co.com.netcom.qposplugin.android.constants.ConstantsModeEntry;
import co.com.netcom.qposplugin.android.constants.ConstantsPosEntryMode;
import co.com.netcom.qposplugin.android.constants.ConstantsTagEMV;
import co.com.netcom.qposplugin.android.constants.ConstantsTypeCard;
import co.com.netcom.qposplugin.android.dto.CardDTO;
import co.com.netcom.qposplugin.android.dto.ResponseServerDTO;
import co.com.netcom.qposplugin.android.dto.TagEmvDTO;
import co.com.netcom.qposplugin.android.utilities.UtilityHexa;
import co.com.netcom.qposplugin.android.utilities.UtilityTag;

import com.dspread.xpos.QPOSService.DoTradeResult;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * Created by david.ordaz on 22/03/2018.
 */
public class CommandTransaction {

  CardDTO card;
  /**
   * EMV CARD
   * */
  public String getTypeCardEmv(String aid,String label){
    String typecard=ConstantsTypeCard.DEBITO;
    if (aid == null || aid.equals("")) {
      return "";
    }
    Log.d(""," getTypeCardEmv "+UtilityHexa.hexToString(label).toUpperCase());
    if(
            (aid.equals(ConstantsAID.MAESTRO)) ||
                    (aid.equals(ConstantsAID.VISA_ELECTRON)) ||
                    (aid.equals(ConstantsAID.MASTERCARD)   && (UtilityHexa.hexToString(label).toUpperCase().indexOf(ConstantsAID.LABEL_DEBIT) > -1)) ||
                    (aid.equals(ConstantsAID.VISA_CREDITO) && (UtilityHexa.hexToString(label).toUpperCase().indexOf(ConstantsAID.LABEL_DEBIT) > -1)) ||
                    (aid.equals(ConstantsAID.MASTERCARD)   && (UtilityHexa.hexToString(label).toUpperCase().indexOf(ConstantsAID.LABEL_DEBIT) > -1))
            )
    {
      typecard= ConstantsTypeCard.DEBITO;
    }else{
      typecard= ConstantsTypeCard.CREDITO;
    }
    return typecard;
  }
  public String getFranquisieCardEmv(String aid){
    if (aid.equals(ConstantsAID.MAESTRO)) {
      return ConstantsFranchise.MAESTRO;
    }
    if(aid.equals(ConstantsAID.VISA_ELECTRON)) {
      return ConstantsFranchise.VISA_ELECTRON;
    }
    if(aid.equals(ConstantsAID.MASTERCARD)) {
      return ConstantsFranchise.MASTERCARD;
    }
    if(aid.equals(ConstantsAID.VISA_CREDITO)){
      return ConstantsFranchise.VISA_CREDITO;
    }
    return "";
  }
  public CardDTO getDataTransactionEmv(String tlv,String hashtableTrack2, String hashtableAid, String hashtableARQC,String hashtableTrack2Plain,String tagSale){
    card = new CardDTO();
    String label = null;
    card.setPosEntryMode(ConstantsPosEntryMode.CHIP);
    card.setIsBanda(false);
    card.setIsChip(true);
    card.setFallBack(false);
    card.setTipoEntrada(ConstantsModeEntry.EMV);
    card.setPinBlock("");
    card.setKsnPinBlock("");
    card.setArqc("");
    ArrayList<TagEmvDTO> list = UtilityTag.getListTagQpos();
    for (TagEmvDTO iterator:list) {
      TagEmvDTO tag;
      if(ConstantsTagEMV.TAG_C2.getName().equals(iterator.getName())){
        tag = UtilityTag.getTagC2(iterator.getName(),tlv);
      }else{
        tag = UtilityTag.getTagByName(iterator.getName(),tlv);
      }
      if(tag!=null){
        tlv = tlv.substring(0,Integer.parseInt(tag.getMinLength()))+tlv.substring(Integer.parseInt(tag.getMaxLength()),tlv.length());
        Log.d("","TAG EMV "+tag.toString());
        if(ConstantsTagEMV.TAG_5F20.getName().equals(tag.getName())){
          card.setTarjetaHabiente(UtilityHexa.hexToString(tag.getValue()));
        }
        if(ConstantsTagEMV.TAG_5F24.getName().equals(tag.getName())){
          card.setFechaExpiracion(tag.getValue().substring(0,4));
        }
        else if(ConstantsTagEMV.TAG_9F12.getName().equals(tag.getName())){
          label = tag.getValue();
        }
        else if(ConstantsTagEMV.TAG_C0.getName().equals(tag.getName())){

          if(!tag.getValue().equals("") && tag.getValue() != null){
            card.setKsn(tag.getValue());
          }else{
            return null;
          }
        }
        else if(ConstantsTagEMV.TAG_C1.getName().equals(tag.getName())){
          card.setKsnPinBlock(tag.getValue());
        }
//        else if(ConstantsTagEMV.TAG_C4.getName().equals(tag.getName())){
//          card.setPanEnmascarado(tag.getValue().substring(0,6)+"******"+tag.getValue().substring(tag.getValue().length()-4,tag.getValue().length()));
//          card.setUltimosCuatro(tag.getValue().substring(tag.getValue().length()-4,tag.getValue().length()));
//        }
        else if(ConstantsTagEMV.TAG_C7.getName().equals(tag.getName())){
          card.setPinBlock(tag.getValue());
        }
        else if(ConstantsTagEMV.TAG_C2.getName().equals(tag.getName())){
          //String tagsEmvInfo = UtilityTag.getInfoEmvTagC2(card.getKsn(),tag.getValue());
          //Hashtable<String, String> mapTagEmv = UtilityTag.getMapTagEmv(tagsEmvInfo);
          //if(mapTagEmv!=null){
          //card.setAid(UtilityTag.getStringTagAid(mapTagEmv));

          String name = ConstantsTagEMV.TAG_84.getName();
          tag = UtilityTag.getTagByName(name,hashtableAid);
          if(!tag.getValue().equals("") && tag.getValue() != null){
            card.setAid(tag.getValue());
          }else{
            return null;
          }


          name = ConstantsTagEMV.TAG_9F26.getName();
          tag = UtilityTag.getTagByName(name,hashtableARQC);
          if(!tag.getValue().equals("") && tag.getValue() != null){
            card.setArqc(tag.getValue());
          }else{
            return null;
          }

          name = ConstantsTagEMV.TAG_57.getName();
          tag = UtilityTag.getTagByName(name,hashtableTrack2Plain);
          if(!tag.getValue().equals("") && tag.getValue() != null){
            tag.setValue(tag.getValue().split(ConstantsCard.TRACK2_SEPARADOR)[0]);
            card.setPanEnmascarado(tag.getValue().substring(0,6)+"******"+tag.getValue().substring(tag.getValue().length()-4,tag.getValue().length()));
            card.setUltimosCuatro(tag.getValue().substring(tag.getValue().length()-4,tag.getValue().length()));
            card.setTagVenta(tagSale);
          }else{
            return null;
          }


          if(hashtableTrack2 != null){
            Hashtable<String, String> map = UtilityTag.getInfoTrack2Tag57(hashtableTrack2);
            card.setTrack2Cifrado(map.get("track2"));
            card.setKsn(map.get("ksn"));
          }else{
            card.setTrack2Cifrado("");
          }

          //}
        }
      }
    }
    card.setTipoCuentaId(getTypeCardEmv(card.getAid(),label));
    card.setFranquicia(getFranquisieCardEmv(card.getAid()));
    return card;
  }
  /*
   * SwipBand carD
   * */
  public CardDTO getDataTransactionSwipBand(DoTradeResult result, Hashtable<String, String> decodeData) {
    card = new CardDTO();
    String maskedPAN = decodeData.get(ConstantsCard.MASKED_PAN);
    maskedPAN = maskedPAN.substring(0, 6) + "******" + maskedPAN.substring(maskedPAN.length() - 4, maskedPAN.length());
    card.setPanEnmascarado(maskedPAN);
    String lastFourCard = maskedPAN.substring(maskedPAN.length() - 4, maskedPAN.length());
    card.setUltimosCuatro(lastFourCard);
    String expiryDate = decodeData.get(ConstantsCard.EXPIRY_DATE);
    card.setFechaExpiracion(expiryDate);
    String cardHolderName = decodeData.get(ConstantsCard.CARDHOLDER_NAME);
    card.setTarjetaHabiente(cardHolderName);
    String ksn = decodeData.get(ConstantsCard.KSN);
    card.setKsn(ksn);
    String track1Length = decodeData.get(ConstantsCard.TRACK1_LENGTH);
    card.setTrack1(track1Length);
    String track2Length = decodeData.get(ConstantsCard.TRACK2_LENGTH);
    card.setTrack2(track2Length);
    String track3Length = decodeData.get(ConstantsCard.TRACK3_LENGTH);
    card.setTrack3(track3Length);
    String encTrack1 = decodeData.get(ConstantsCard.TRACK1_ENCRYPT);
    card.setTrack1Cifrado(encTrack1);
    String encTrack2 = decodeData.get(ConstantsCard.TRACK2_ENCRYPT);
    card.setTrack2Cifrado(encTrack2);
    String pinKsn = decodeData.get(ConstantsCard.KSN_PINBLOCK);
    card.setKsnPinBlock(pinKsn);
    String pinBlock = decodeData.get(ConstantsCard.PINBLOCK);
    card.setPinBlock(pinBlock);
    card.setPosEntryMode(ConstantsPosEntryMode.MAGNETIC_SWIP);
    card.setIsBanda(true);
    String serviceCode = decodeData.get(ConstantsCard.SERVICE_CODE);
    if (serviceCode.substring(0, 1).equals("2") || serviceCode.substring(0, 1).equals("6")) {
      card.setIsChip(true);
    } else {
      card.setIsChip(false);
    }
    card.setFallBack(false);
    card.setTipoCuentaId("");
    card.setTipoEntrada(ConstantsModeEntry.MAGNETIC_SWIPE);
    return card;
  }
  public CardDTO getDataTransactionContactless(
          Hashtable<String, String> decodeData,
          Hashtable<String, String> nfcBashData,
          String hashtableTrack2,
          String hashtableAid,
          String hashtableARQC,
          String hashtableTrack2Plain,
          String hashtableLabel,
          String tagSale
  ){
    CardDTO card = null;
    String formatID = decodeData.get("formatID");
    String maskedPAN=null;
    String expiryDate=null;
    String cardHolderName=null;
    String serviceCode=null;
    String trackblock=null;
    String psamId=null;
    String posId=null;
    String macblock=null;
    String activateCode=null;
    String trackRandomNumber=null;
    String track1Length=null;
    String track2Length=null;
    String track3Length=null;
    String encTracks=null;
    String encTrack1=null;
    String encTrack2=null;
    String encTrack3=null;
    String partialTrack=null;
    String pinKsn=null;
    String trackksn=null;
    String pinBlock=null;
    String encPAN=null;
    String pinRandomNumber=null;

    if (formatID.equals("31") || formatID.equals("40")
            || formatID.equals("37") || formatID.equals("17")
            || formatID.equals("11") || formatID.equals("10")) {

      maskedPAN = decodeData.get("maskedPAN");
      expiryDate = decodeData.get("expiryDate");
      cardHolderName = decodeData.get("cardholderName");
      serviceCode = decodeData.get("serviceCode");
      trackblock = decodeData.get("trackblock");
      psamId = decodeData.get("psamId");
      posId = decodeData.get("posId");
      pinBlock = decodeData.get("pinblock");
      macblock = decodeData.get("macblock");
      activateCode = decodeData.get("activateCode");
      trackRandomNumber = decodeData
              .get("trackRandomNumber");

    }else {
      maskedPAN = decodeData.get("maskedPAN");
      expiryDate = decodeData.get("expiryDate");
      cardHolderName = decodeData.get("cardholderName");
      serviceCode = decodeData.get("serviceCode");
      track1Length = decodeData.get("track1Length");
      track2Length = decodeData.get("track2Length");
      track3Length = decodeData.get("track3Length");
      encTracks = decodeData.get("encTracks");
      encTrack1 = decodeData.get("encTrack1");
      encTrack2 = decodeData.get("encTrack2");
      encTrack3 = decodeData.get("encTrack3");
      partialTrack = decodeData.get("partialTrack");
      pinKsn = decodeData.get("pinKsn");
      trackksn = decodeData.get("trackksn");
      pinBlock = decodeData.get("pinBlock");
      encPAN = decodeData.get("encPAN");
      trackRandomNumber = decodeData
              .get("trackRandomNumber");
      pinRandomNumber = decodeData.get("pinRandomNumber");
    }

    card = new CardDTO();
    card.setAid("");
    card.setArqc("");
    card.setBanda(false);
    card.setChip(false);
    card.setFallBack(false);
    card.setFechaExpiracion(expiryDate);
    card.setFranquicia("");
    card.setIsBanda(false);
    card.setIsChip(false);
    card.setKsn(trackksn);
    card.setKsnPinBlock(pinKsn);
    card.setKsnTrackII(trackksn);
    card.setPan(maskedPAN);
    card.setPanEnmascarado(maskedPAN);
    card.setPinBlock(pinBlock);
    card.setPosEntryMode(ConstantsPosEntryMode.CONTACTLESS);
    card.setTagVenta("");
    card.setTarjetaHabiente(cardHolderName);
    //card.setTipoCuentaId(getTypeCardEmv(card.getAid(),hashtableLabel));
    //card.setTipoCuentaId(ConstantsTypeCard.DEBITO);
    card.setTipoEntrada(ConstantsModeEntry.CONTACTLESS);
    card.setTrack1("");
    card.setTrack1Cifrado(encTrack1);
    card.setTrack2("");
    card.setTrack2Cifrado(encTrack2);
    card.setTrack3(encTrack3);
    card.setUltimosCuatro("");

    TagEmvDTO tag;

    String name = ConstantsTagEMV.TAG_84.getName();
    tag = UtilityTag.getTagByName(name,hashtableAid);
    if(tag.getValue() != null && !tag.getValue().equals("")){
      card.setAid(tag.getValue());
    }else{
      return null;
    }


    name = ConstantsTagEMV.TAG_9F26.getName();
    tag = UtilityTag.getTagByName(name,hashtableARQC);
    card.setArqc(tag.getValue());

    if(maskedPAN != null && !maskedPAN.equals("")){
      card.setPanEnmascarado(maskedPAN.substring(0,6)+"******"+maskedPAN.substring(maskedPAN.length()-4,maskedPAN.length()));
      card.setPan(maskedPAN.substring(0,6)+"******"+maskedPAN.substring(maskedPAN.length()-4,maskedPAN.length()));
      card.setUltimosCuatro(maskedPAN.substring(maskedPAN.length()-4,maskedPAN.length()));
    }else{
      return null;
    }

    card.setFranquicia(getFranquisieCardEmv(card.getAid()));
    String label = UtilityTag.getTagByName(ConstantsTagEMV.TAG_9F12.getName(),hashtableLabel).getValue();
    card.setTipoCuentaId(getTypeCardEmv(card.getAid(),label));
    if(!card.getArqc().equals("")){
      card.setTagVenta(tagSale);
      if(hashtableTrack2 != null){
        Hashtable<String, String> map = UtilityTag.getInfoTrack2Tag57(hashtableTrack2);
        card.setTrack2Cifrado(map.get("track2"));
        card.setKsn(map.get("ksn"));
      }else{
        card.setTrack2Cifrado("");
      }
    }else{
      card.setPosEntryMode(ConstantsPosEntryMode.CONTACTLESS_BAND);
    }
    return card;
  }

  public CardDTO getDataTransactionFallback(DoTradeResult result, Hashtable<String, String> decodeData){
    card = new CardDTO();
    card = getDataTransactionSwipBand(result,decodeData);
    card.setFallBack(true);
    card.setPosEntryMode(ConstantsPosEntryMode.FALLBACK);
    return card;
  }

  public CardDTO getDataPinSwipeCard(DoTradeResult result, Hashtable<String, String> decodeData){
    card = new CardDTO();
    card.setKsnPinBlock(decodeData.get(ConstantsCard.KSN_PINBLOCK));
    card.setPinBlock(decodeData.get(ConstantsCard.PINBLOCK));
    return card;
  }

  public ResponseServerDTO processResponseServer(JSONArray args){
    ResponseServerDTO response = null;
    try {
      JSONObject obj = new JSONObject(args.getString(0));
      String aprovalCode = obj.getString("codigoAprobacion");
      String responseCode = obj.getString("responseCode");
      responseCode = ConstantsTagEMV.TAG_8A.getName()+ConstantsTagEMV.TAG_8A.getMinLength()+UtilityHexa.stringTohex(obj.getString("responseCode"));
      responseCode = responseCode.toUpperCase();
      aprovalCode = ConstantsTagEMV.TAG_89.getName()+ConstantsTagEMV.TAG_89.getMinLength()+UtilityHexa.stringTohex(obj.getString("codigoAprobacion"));
      responseCode = responseCode.toUpperCase();
      responseCode = responseCode.toUpperCase();
      String rrn = obj.getString("rrn");
      String tlv = obj.getString("tagInfo");
      //TagEmvDTO tag91  = new TagEmvDTO();
      //tag91.setInfoTagEmvDTO(tlv.substring(0,2),tlv.substring(2,6),tlv.substring(6,26));
//      ArrayList<TagEmvDTO> list = UtilityTag.getListTagResponseServer();
      String tlvaux="";
      if(tlv.equals("")){
        tlv="";
      }else{
        int l = Integer.parseInt(tlv.substring(2,6));
        Log.d("","processResponseServer longitud TAG 91 ------- "+l);
        String lhex = Integer.toHexString(l);
        lhex = lhex.toUpperCase();
        if(lhex.length()==1){
          lhex = '0'+lhex;
        }
        tlvaux = tlv.substring(0,2)+lhex+tlv.substring(6,tlv.length());
        tlv = tlvaux;
        Log.d("","TAG QPOS TLV SUBSTRING "+tlv);
      }

      response = new ResponseServerDTO(aprovalCode,responseCode,rrn,tlv,null,null,null);
      Log.d("","processResponseServer ------- "+response.toString());
//      for (TagEmvDTO iterator:list) {
//        TagEmvDTO tag = UtilityTag.getTagByName(iterator.getName(),tlv);
//        if(tag!=null){
//          tlv = tlv.substring(0,Integer.parseInt(tag.getMinLength()))+tlv.substring(Integer.parseInt(tag.getMaxLength()),tlv.length());
//          if(ConstantsTagEMV.TAG_91.getName().equals(tag.getName())){
//            response.setTag91(tag);
//          }
//          else if(ConstantsTagEMV.TAG_71.getName().equals(tag.getName())){
//            response.setTag71(tag);
//          }
//          else if(ConstantsTagEMV.TAG_72.getName().equals(tag.getName())){
//            response.setTag72(tag);
//          }
//        }
//      }
    } catch (Exception e) {
      e.printStackTrace();
    }

    return response;
  }

}
