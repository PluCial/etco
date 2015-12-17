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
    INDEX("ホーム", Arrays.asList("mainSlider", "serviceList", "newsList")),
    SERVICE("サービス",Arrays.asList("serviceList")),
    ABOUT("会社概要", null),
    NEWS("お知らせ",Arrays.asList("newsList")),
    CONTACT("お問い合わせ", null);
    
    private String name;
    private List<String> listTypes;
    
    private PageRole(String name, List<String> listTypes) {
        this.setName(name);
        this.setListTypes(listTypes);
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<String> getListTypes() {
        return listTypes;
    }

    public void setListTypes(List<String> listTypes) {
        this.listTypes = listTypes;
    }
}
