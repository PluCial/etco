package com.etco.enums;

/**
 * テキストリソース役割
 * <pre>
 * 追加や変更の場合は必ずTextResourcesService 内のUpdateも合わせて修正
 * </pre>
 * @author takahara
 *
 */
public enum TextResIds {
    T001_001("Kaleidoscope Media Service")
    ,T001_002("キャッチ的なテキストが入ります")
    ,T001_003("サービス")
    ,T001_004("インターネット広告や紙媒体、モバイル端末向けの媒体販促ツールなどを含め広告にまつわるデザイン制作も請負い、プロモーションの全てを引き受け案件進行を行っております。 広告については成果検証を行い、クライアント様を必ずや成功に導くお手伝いをさせていただきます。")
    ,T001_005("")
    ,T001_006("")
    ,T001_007("")
    ,T001_008("")
    ,T001_LIST_ITEM_TYPE001_001("サービス詳細")
    ,T001_LIST_ITEM_TYPE001_002("サービスの簡易説明テキスト等入りますサービスの簡易説明テキスト等入ります")
    ,T001_LIST_ITEM_TYPE002_001("お知らせタイトル")
    ,T001_LIST_ITEM_TYPE002_002("お知らせ詳細お知らせ詳細お知らせ詳細");
    
    private String defaultValue;
    
    private TextResIds(String defaultValue) {
        this.setDefaultValue(defaultValue);
    }

    public String getDefaultValue() {
        return defaultValue;
    }

    public void setDefaultValue(String defaultValue) {
        this.defaultValue = defaultValue;
    }
}
