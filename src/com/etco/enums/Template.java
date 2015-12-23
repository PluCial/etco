package com.etco.enums;

import java.util.Arrays;
import java.util.HashMap;

/**
 * テキストリソース役割
 * <pre>
 * 追加や変更の場合は必ずTextResourcesService 内のUpdateも合わせて修正
 * </pre>
 * @author takahara
 *
 */
public enum Template {
    T001("trend", 
        new HashMap<String, PageRoleModel>() {
            private static final long serialVersionUID = 1L;
        {
            put("index", new PageRoleModel("index", "ホーム", Arrays.asList(ListItemType.T001_001, ListItemType.T001_002)));
            put("service", new PageRoleModel("service", "サービス", Arrays.asList(ListItemType.T001_001)));
            put("about", new PageRoleModel("about", "会社概要", null));
            put("news", new PageRoleModel("news", "お知らせ", Arrays.asList(ListItemType.T001_002)));
            put("contact", new PageRoleModel("contact", "お問い合わせ", null));
        }}),
        T002("corlate", 
            new HashMap<String, PageRoleModel>() {
                private static final long serialVersionUID = 1L;
            {
                put("index", new PageRoleModel("index", "ホーム", Arrays.asList(ListItemType.T001_001, ListItemType.T001_002)));
                put("service", new PageRoleModel("service", "サービス", Arrays.asList(ListItemType.T001_001)));
                put("about", new PageRoleModel("about", "会社概要", null));
                put("news", new PageRoleModel("news", "お知らせ", Arrays.asList(ListItemType.T001_002)));
                put("contact", new PageRoleModel("contact", "お問い合わせ", null));
            }}
    );

    private String name;
    
    private HashMap<String, PageRoleModel> pageRoleMap;

    private Template(String name, HashMap<String, PageRoleModel> pageRoleMap) {
        this.setName(name);
        this.setPageRoleMap(pageRoleMap);
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public HashMap<String, PageRoleModel> getPageRoleMap() {
        return pageRoleMap;
    }

    public void setPageRoleMap(HashMap<String, PageRoleModel> pageRoleMap) {
        this.pageRoleMap = pageRoleMap;
    }
}
