package com.etco.model;

import java.io.Serializable;

import org.slim3.datastore.Model;
import org.slim3.datastore.ModelRef;

import com.etco.enums.PageGcsRole;

@Model(schemaVersion = 1)
public class ItemGcsRes extends GcsResources implements Serializable {

    private static final long serialVersionUID = 1L;
    
    /**
     * 役割
     */
    private PageGcsRole role;
    
    /** Itemとの関連 */
    private ModelRef<Page> pageRef = new ModelRef<Page>(Page.class);

    public PageGcsRole getRole() {
        return role;
    }

    public void setRole(PageGcsRole role) {
        this.role = role;
    }

    public ModelRef<Page> getPageRef() {
        return pageRef;
    }
}
