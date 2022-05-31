package co.com.netcom.qposplugin.android.dto;

import org.json.JSONException;
import org.json.JSONObject;

import co.com.netcom.qposplugin.android.constants.ConstantsCard;

/**
 * Created by david.ordaz on 20/03/2018.
 */
public class CardDTO {

  /** Indica si la tarjeta se ingreso por banda o por chip **/
  private int tipoEntrada;

  /** Indica si la tarjeta en banda o chip **/
  private boolean isBanda ;
  private boolean isChip ;

  private String track1 ;
  private String track2 ;
  private String track3 ;
  private String track1Cifrado;
  private String track2Cifrado;
  private String ksn;
  private String ksnPinBlock;

  private String pan;
  private String panEnmascarado;

  /** Contendra los ultimos 4 digitos del track **/
  private String ultimosCuatro;

  /** Contendra los tag que el servidor va a enviar al autorizador **/
  private String tagVenta;

  private String pinBlock;

  private String tipoCuentaId;

  private String posEntryMode;

  private boolean fallBack;

  private String ksnTrackII;

  private String franquicia;

  private String tarjetaHabiente;

  private String fechaExpiracion;

  private String aid;

  private String arqc;

  public boolean isFallBack() {
    return fallBack;
  }

  public String getArqc() {
    return arqc;
  }

  public void setArqc(String arqc) {
    this.arqc = arqc;
  }



  public boolean getIsBanda() {
    return isBanda;
  }

  public void setIsBanda(boolean isBanda) {
    this.isBanda = isBanda;
  }

  public int getTipoEntrada() {
    return tipoEntrada;
  }

  public void setTipoEntrada(int tipoEntrada) {
    this.tipoEntrada = tipoEntrada;
  }

  public boolean getIsChip() {
    return isChip;
  }

  public void setIsChip(boolean isChip) {
    this.isChip = isChip;
  }

  public String getFechaExpiracion() {
    return fechaExpiracion;
  }

  public void setFechaExpiracion(String fechaExpiracion) {
    this.fechaExpiracion = fechaExpiracion;
  }

  public String getTrack1() {
    return track1;
  }

  public void setTrack1(String track1) {
    this.track1 = track1;
  }

  public String getTrack2() {
    return track2;
  }

  public void setTrack2(String track2) {
    this.track2 = track2;
  }

  public String getTrack3() {
    return track3;
  }

  public void setTrack3(String track3) {
    this.track3 = track3;
  }

  public String getTrack1Cifrado() {
    return track1Cifrado;
  }

  public void setTrack1Cifrado(String track1Cifrado) {
    this.track1Cifrado = track1Cifrado;
  }

  public String getKsn() {
    return ksn;
  }

  public void setKsn(String ksn) {
    this.ksn = ksn;
  }

  public String getTrack2Cifrado() {
    return track2Cifrado;
  }

  public void setTrack2Cifrado(String track2Cifrado) {
    this.track2Cifrado = track2Cifrado;
  }

  public String getKsnPinBlock() {
    return ksnPinBlock;
  }

  public void setKsnPinBlock(String ksnPinBlock) {
    this.ksnPinBlock = ksnPinBlock;
  }

  public String getPan() {
    return pan;
  }

  public void setPan(String pan) {
    this.pan = pan;
  }

  public String getPanEnmascarado() {
    return panEnmascarado;
  }

  public void setPanEnmascarado(String panEnmascarado) {
    this.panEnmascarado = panEnmascarado;
  }

  public String getUltimosCuatro() {
    return ultimosCuatro;
  }

  public void setUltimosCuatro(String ultimosCuatro) {
    this.ultimosCuatro = ultimosCuatro;
  }

  public String getTagVenta() {
    return tagVenta;
  }

  public void setTagVenta(String tagVenta) {
    this.tagVenta = tagVenta;
  }

  public String getPinBlock() {
    return pinBlock;
  }

  public void setPinBlock(String pinBlock) {
    this.pinBlock = pinBlock;
  }

  public String getTipoCuentaId() {
    return tipoCuentaId;
  }

  public void setTipoCuentaId(String tipoCuentaId) {
    this.tipoCuentaId = tipoCuentaId;
  }

  public String getPosEntryMode() {
    return posEntryMode;
  }

  public void setPosEntryMode(String posEntryMode) {
    this.posEntryMode = posEntryMode;
  }

  public boolean getFallBack() {
    return fallBack;
  }

  public void setFallBack(boolean fallBack) {
    this.fallBack = fallBack;
  }

  public String getKsnTrackII() {
    return ksnTrackII;
  }

  public void setKsnTrackII(String ksnTrackII) {
    this.ksnTrackII = ksnTrackII;
  }

  public String getFranquicia() {
    return franquicia;
  }

  public void setFranquicia(String franquicia) {
    this.franquicia = franquicia;
  }

  public String getTarjetaHabiente() {
    return tarjetaHabiente;
  }

  public void setTarjetaHabiente(String tarjetaHabiente) {
    this.tarjetaHabiente = tarjetaHabiente;
  }

  public boolean isChip() {
    return isChip;
  }

  public void setChip(boolean chip) {
    isChip = chip;
  }

  public boolean isBanda() {
    return isBanda;
  }

  public void setBanda(boolean banda) {
    isBanda = banda;
  }

  public String getAid() {
    return aid;
  }

  public void setAid(String aid) {
    this.aid = aid;
  }

  public String toJsonString() throws JSONException {
    JSONObject obj = new JSONObject();
    obj.put("tarjetaHabiente",tarjetaHabiente);
    obj.put("fechaExp",fechaExpiracion);
    obj.put("ksn",ksn);
    obj.put("ksnPinBlock",ksnPinBlock);
    obj.put("panEnmascarado",panEnmascarado);
    obj.put("pan",panEnmascarado);
    obj.put("track2",track2Cifrado);
    obj.put("isBanda",isBanda);
    obj.put("isChip",isChip);
    obj.put("PosEntryMode",posEntryMode);
    obj.put("pinBlock",pinBlock);
    obj.put("tipoCuentaId",tipoCuentaId);
    obj.put("ultimosCuatro",ultimosCuatro);
    obj.put("franquicia",franquicia);
    obj.put("tipoEntrada",tipoEntrada);
    obj.put("ultimosCuatro",ultimosCuatro);
    obj.put("fallBack",fallBack);
    obj.put("aid",aid);
    obj.put("tagVenta",tagVenta);
    obj.put("arqc",arqc);
    return obj.toString();
  }

  @Override
  public String toString() {
    return "CardDTO{" +
      "tipoEntrada=" + tipoEntrada +
      ", isBanda=" + isBanda +
      ", isChip=" + isChip +
      ", track1='" + track1 + '\'' +
      ", track2='" + track2 + '\'' +
      ", track3='" + track3 + '\'' +
      ", track1Cifrado='" + track1Cifrado + '\'' +
      ", track2Cifrado='" + track2Cifrado + '\'' +
      ", ksn='" + ksn + '\'' +
      ", ksnPinBlock='" + ksnPinBlock + '\'' +
      ", pan='" + pan + '\'' +
      ", panEnmascarado='" + panEnmascarado + '\'' +
      ", ultimosCuatro='" + ultimosCuatro + '\'' +
      ", tagVenta='" + tagVenta + '\'' +
      ", pinBlock='" + pinBlock + '\'' +
      ", tipoCuentaId='" + tipoCuentaId + '\'' +
      ", posEntryMode='" + posEntryMode + '\'' +
      ", fallBack=" + fallBack +
      ", ksnTrackII='" + ksnTrackII + '\'' +
      ", franquicia='" + franquicia + '\'' +
      ", tarjetaHabiente='" + tarjetaHabiente + '\'' +
      ", fechaExpiracion='" + fechaExpiracion + '\'' +
      ", aid='" + aid + '\'' +
      ", arqc='" + arqc + '\'' +
      '}';
  }
}
