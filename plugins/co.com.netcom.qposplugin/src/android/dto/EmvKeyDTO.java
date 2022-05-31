package co.com.netcom.qposplugin.android.dto;

/**
 * Created by movilesequipo1 on 13/04/18.
 */
public class EmvKeyDTO {

    private String RID,publicKeyIndex,publicKeyModule,publicKeyCheckValue,pkExponent;

    public EmvKeyDTO(String RID, String publicKeyIndex, String publicKeyModule, String publicKeyCheckValue, String pkExponent) {
        this.RID                 = RID.replaceAll(" ","");
        this.publicKeyIndex      = publicKeyIndex.replaceAll(" ","");
        this.publicKeyModule     = publicKeyModule.replaceAll(" ","");;
        this.publicKeyCheckValue = publicKeyCheckValue.replaceAll(" ","");;
        this.pkExponent          = pkExponent.replaceAll(" ","");
    }

    public String getRID() {
        return RID;
    }

    public void setRID(String RID) {
        this.RID = RID;
    }

    public String getPublicKeyIndex() {
        return publicKeyIndex;
    }

    public void setPublicKeyIndex(String publicKeyIndex) {
        this.publicKeyIndex = publicKeyIndex;
    }

    public String getPublicKeyModule() {
        return publicKeyModule;
    }

    public void setPublicKeyModule(String publicKeyModule) {
        this.publicKeyModule = publicKeyModule;
    }

    public String getPublicKeyCheckValue() {
        return publicKeyCheckValue;
    }

    public void setPublicKeyCheckValue(String publicKeyCheckValue) {
        this.publicKeyCheckValue = publicKeyCheckValue;
    }

    public String getPk_exponent() {
        return pkExponent;
    }

    public void setPk_exponent(String pk_exponent) {
        this.pkExponent = pk_exponent;
    }

    @Override
    public String toString() {
        return "EmvKeyDTO{" +
                "RID='" + RID + '\'' +
                ", Public_Key_Index='" + publicKeyIndex + '\'' +
                ", Public_Key_Module='" + publicKeyModule + '\'' +
                ", Public_Key_CheckValue='" + publicKeyCheckValue + '\'' +
                ", Pk_Exponent='" + pkExponent + '\'' +
                '}';
    }
}
