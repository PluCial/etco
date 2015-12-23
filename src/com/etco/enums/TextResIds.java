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
    T001_INDEX_001("Kaleidoscope Media Service")
    ,T001_INDEX_002("キャッチ的なテキストが入ります")
    ,T001_INDEX_003("サービス")
    ,T001_INDEX_004("インターネット広告や紙媒体、モバイル端末向けの媒体販促ツールなどを含め広告にまつわるデザイン制作も請負い、プロモーションの全てを引き受け案件進行を行っております。 広告については成果検証を行い、クライアント様を必ずや成功に導くお手伝いをさせていただきます。")
    ,T001_INDEX_005("お知らせ")
    ,T001_NEWS_001("お知らせ")
    ,T001_SERVICE_001("サービス")
    ,T001_SERVICE_002("インターネット広告や紙媒体、モバイル端末向けの媒体販促ツールなどを含め広告にまつわるデザイン制作も請負い、プロモーションの全てを引き受け案件進行を行っております。 広告については成果検証を行い、クライアント様を必ずや成功に導くお手伝いをさせていただきます。")
    ,T001_SERVICE_003("タイトル")
    ,T001_SERVICE_004("サービス詳細サービス詳細サービス詳細サービス詳細サービス詳細サービス詳細サービス詳細サービス詳細サービス詳細サービス詳細サービス詳細サービス詳細サービス詳細サービス詳細サービス詳細サービス詳細サービス詳細サービス詳細サービス詳細サービス詳細")
    ,T001_LIST_ITEM_TYPE001_001("サービス詳細")
    ,T001_LIST_ITEM_TYPE001_002("サービスの簡易説明テキスト等入りますサービスの簡易説明テキスト等入ります")
    ,T001_LIST_ITEM_TYPE002_001("お知らせタイトル")
    ,T001_LIST_ITEM_TYPE002_002("お知らせ詳細お知らせ詳細お知らせ詳細")
    ,T001_LIST_ITEM_TYPE003_001("デザイン企画・制作")
    ,T001_LIST_ITEM_TYPE003_002("サービスの簡易説明テキスト等入りますサービスの簡易説明テキスト等入ります");
    
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
