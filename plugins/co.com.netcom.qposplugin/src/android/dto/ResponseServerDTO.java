package co.com.netcom.qposplugin.android.dto;

import co.com.netcom.qposplugin.android.constants.ConstantsTagEMV;
import co.com.netcom.qposplugin.android.utilities.UtilityHexa;

/**
 * Created by movilesequipo1 on 9/04/18.
 */
public class ResponseServerDTO {

    private String respondeCode;
    private String aprovalCode;
    private String rrn;
    private String tlv;
    private TagEmvDTO tag91,tag71,tag72;

    public ResponseServerDTO(String aprovalCode, String respondeCode,String rrn,String tlv, TagEmvDTO tag91, TagEmvDTO tag71, TagEmvDTO tag72) {
        this.respondeCode = respondeCode;
        this.aprovalCode  = aprovalCode;
        this.rrn          = rrn;
        this.tlv          = tlv;
        this.tag91        = tag91;
        this.tag71        = tag71;
        this.tag72        = tag72;
    }

    public String getRespondeCode() {
        return respondeCode;
    }

    public void setRespondeCode(String respondeCode) {
        this.respondeCode = respondeCode;
    }

    public String getAprovalCode() {
        return aprovalCode;
    }

    public void setAprovalCode(String aprovalCode) {
        this.aprovalCode = aprovalCode;
    }

    public String getRrn() {
        return rrn;
    }

    public void setRrn(String rrn) {
        this.rrn = rrn;
    }

    public TagEmvDTO getTag91() {
        return tag91;
    }

    public void setTag91(TagEmvDTO tag91) {
        this.tag91 = tag91;
    }

    public TagEmvDTO getTag71() {
        return tag71;
    }

    public void setTag71(TagEmvDTO tag71) {
        this.tag71 = tag71;
    }

    public TagEmvDTO getTag72() {
        return tag72;
    }

    public void setTag72(TagEmvDTO tag72) {
        this.tag72 = tag72;
    }

    public String getTlv() {

        return tlv;
    }

    @Override
    public String toString() {
        return "ResponseServerDTO{" +
                "aprovalCode='" + aprovalCode + '\'' +
                "respondeCode='" + respondeCode + '\'' +
                ", rrn='" + rrn + '\'' +
                ", tlv=" + tlv +
                ", tag91=" + tag91 +
                ", tag71=" + tag71 +
                ", tag72=" + tag72 +
                '}';
    }
}
