package com.etco.model;

import java.io.Serializable;

import org.slim3.datastore.Model;
import org.slim3.datastore.ModelRef;

import com.etco.enums.GcsResIds;

@Model(schemaVersion = 1)
public class ItemGcsRes extends GcsRes implements Serializable {

    private static final long serialVersionUID = 1L;
    
    /**
     * 役割
     */
    private GcsResIds role;
    
    /** Itemとの関連 */
    private ModelRef<SitePage> pageRef = new ModelRef<SitePage>(SitePage.class);

    public GcsResIds getRole() {
        return role;
    }

    public void setRole(GcsResIds role) {
        this.role = role;
    }

    public ModelRef<SitePage> getPageRef() {
        return pageRef;
    }
}
