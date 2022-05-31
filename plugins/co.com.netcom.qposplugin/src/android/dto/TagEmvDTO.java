package co.com.netcom.qposplugin.android.dto;

/**
 * Created by david.ordaz on 22/03/2018.
 */
public class TagEmvDTO {

  private String name;

  private String length;

  @Override
  public String toString() {
    return "TagEmvDTO{" +
      "name='" + name + '\'' +
      ", length='" + length + '\'' +
      ", minLength='" + minLength + '\'' +
      ", maxLength='" + maxLength + '\'' +
      ", value='" + value + '\'' +
      '}';
  }

  private String minLength;

  private String maxLength;

  private String value;

  public TagEmvDTO(String name, String minLength, String maxLength) {
    this.name = name;
    this.minLength = minLength;
    this.maxLength = maxLength;
    this.value  = "";
    this.length = "";
  }

  public TagEmvDTO() {
  }

  public void setInfoTagEmvDTO(String name, String length, String value) {
    this.name = name;
    this.minLength = "";
    this.maxLength = "";
    this.value  = value;
    this.length = length;
  }


  public String getMinLength() {
    return minLength;
  }

  public void setMinLength(String minLength) {
    this.minLength = minLength;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getMaxLength() {
    return maxLength;
  }

  public void setMaxLength(String maxLength) {
    this.maxLength = maxLength;
  }

  public String getLength() {
    return length;
  }

  public void setLength(String length) {
    this.length = length;
  }

  public String getValue() {
    return value;
  }

  public void setValue(String value) {
    this.value = value;
  }

  public String getTagTLV(){
    return this.name+this.length+this.value;
  }
}
