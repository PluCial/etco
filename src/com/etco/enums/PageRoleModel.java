package com.etco.enums;

import java.util.List;

public class PageRoleModel {
    
    private String key;
    
    private String name;
    
    private List<String> listTypes;
    
    public PageRoleModel(String key, String name, List<String> listTypes) {
        this.setKey(key);
        this.setName(name);
        this.setListTypes(listTypes);
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
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
