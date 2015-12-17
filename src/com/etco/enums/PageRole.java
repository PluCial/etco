package com.etco.enums;

import java.util.Arrays;
import java.util.List;

/**
 * テキストリソース役割
 * <pre>
 * 追加や変更の場合は必ずTextResourcesService 内のUpdateも合わせて修正
 * </pre>
 * @author takahara
 *
 */
public enum PageRole {
    INDEX("ホーム", Arrays.asList("main-slider", "service-list", "news-list")),
    SERVICE("サービス",Arrays.asList("service-list")),
    ABOUT("会社概要", null),
    NEWS("お知らせ",Arrays.asList("news-list")),
    CONTACT("お問い合わせ", null);
    
    private String name;
    private List<String> listItemTypes;
    
    private PageRole(String name, List<String> listItemTypes) {
        this.name = name;
        this.listItemTypes = listItemTypes;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<String> getListItemTypes() {
        return listItemTypes;
    }

    public void setListItemTypes(List<String> listItemTypes) {
        this.listItemTypes = listItemTypes;
    }
}
