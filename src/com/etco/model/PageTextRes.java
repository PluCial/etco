package com.etco.model;

import java.io.Serializable;

import org.slim3.datastore.Model;
import org.slim3.datastore.ModelRef;

import com.etco.enums.PageTextRole;

@Model(schemaVersion = 1)
public class PageTextRes extends TextRes implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 役割
     */
    private PageTextRole role;

    /** Itemとの関連 */
    private ModelRef<SitePage> pageRef = new ModelRef<SitePage>(SitePage.class);

    public PageTextRole getRole() {
        return role;
    }

    public void setRole(PageTextRole role) {
        this.role = role;
    }

    public ModelRef<SitePage> getPageRef() {
        return pageRef;
    }

}
