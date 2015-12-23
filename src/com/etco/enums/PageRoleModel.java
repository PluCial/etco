package com.etco.enums;

import java.util.List;

public class PageRoleModel {
    
    private String key;
    
    private String name;
    
    private List<ListItemType> listTypes;
    
    public PageRoleModel(String key, String name, List<ListItemType> listTypes) {
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

    public List<ListItemType> getListTypes() {
        return listTypes;
    }

    public void setListTypes(List<ListItemType> listTypes) {
        this.listTypes = listTypes;
    }

}
