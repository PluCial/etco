package com.etco.enums;

/**
 * テキストリソース役割
 * <pre>
 * 追加や変更の場合は必ずTextResourcesService 内のUpdateも合わせて修正
 * </pre>
 * @author takahara
 *
 */
public enum GcsResIds {
    T001_INDEX_001("/template/T001/images/slider/bg1.jpg")
    ,T001_ABOUT_001("/template/T001/images/bg/p_header.jpg")
    ,T001_ABOUT_002("/template/T001/images/other/1.jpg")
    ,T001_SERVICE_001("/template/T001/images/bg/p_header.jpg")
    ,T001_SERVICE_002("/template/T001/images/other/2.jpg")
    ,T001_NEWS_001("/template/T001/images/bg/p_header.jpg")
    ,T001_CONTACT_001("/template/T001/images/bg/p_header.jpg")
    
    // テンプレート２
    ,T002_INDEX_001("/template/T002/images/slider/bg1.jpg")
    ,T002_ABOUT_001("/template/T002/images/slider_one.jpg");
    
    private String defaultValue;
    
    private GcsResIds(String defaultValue) {
        this.setDefaultValue(defaultValue);
    }

    public String getDefaultValue() {
        return defaultValue;
    }

    public void setDefaultValue(String defaultValue) {
        this.defaultValue = defaultValue;
    }
}
