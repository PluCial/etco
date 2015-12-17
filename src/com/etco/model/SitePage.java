package com.etco.model;

import java.io.Serializable;
import java.util.Date;

import org.slim3.datastore.Attribute;
import org.slim3.datastore.CreationDate;
import org.slim3.datastore.InverseModelListRef;
import org.slim3.datastore.Model;
import org.slim3.datastore.ModelRef;
import org.slim3.datastore.ModificationDate;

import com.etco.enums.Template;
import com.etco.meta.TextResMeta;
import com.google.appengine.api.datastore.Key;

@Model(schemaVersion = 1)
public class SitePage implements Serializable {

    private static final long serialVersionUID = 1L;

    @Attribute(primaryKey = true)
    private Key key;

    @Attribute(version = true)
    private Long version;
    
    private String name;
    
    /**
     * ページの役割
     */
    private String role;
    
    /**
     * テンプレート
     */
    private Template template;
    
    /**
     * ソート順
     */
    private double sortOrder;
    
    /** Userとの関連 */
    private ModelRef<User> userRef = new ModelRef<User>(User.class);
    
    /**
     * 公開済みフラグ
     */
    private boolean published = false;
    
    /**
     * 作成日時
     */
    @Attribute(listener = CreationDate.class)
    private Date createDate;
    
    /**
     * 更新日時
     */
    @Attribute(listener = ModificationDate.class)
    private Date updateDate;
    
    // ----------------------------------------------------------------------
    // 関連
    // ----------------------------------------------------------------------
    /** TextResとの関連 */
    @Attribute(persistent = false)
    private InverseModelListRef<TextRes, SitePage> textResListRef =
            new InverseModelListRef<TextRes, SitePage>(
                    TextRes.class,
                    TextResMeta.get().sitePageRef.getName(),
                    this);

    /**
     * Returns the key.
     *
     * @return the key
     */
    public Key getKey() {
        return key;
    }

    /**
     * Sets the key.
     *
     * @param key
     *            the key
     */
    public void setKey(Key key) {
        this.key = key;
    }

    /**
     * Returns the version.
     *
     * @return the version
     */
    public Long getVersion() {
        return version;
    }

    /**
     * Sets the version.
     *
     * @param version
     *            the version
     */
    public void setVersion(Long version) {
        this.version = version;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((key == null) ? 0 : key.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        SitePage other = (SitePage) obj;
        if (key == null) {
            if (other.key != null) {
                return false;
            }
        } else if (!key.equals(other.key)) {
            return false;
        }
        return true;
    }

    public ModelRef<User> getUserRef() {
        return userRef;
    }

    public boolean isPublished() {
        return published;
    }

    public void setPublished(boolean published) {
        this.published = published;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public double getSortOrder() {
        return sortOrder;
    }

    public void setSortOrder(double sortOrder) {
        this.sortOrder = sortOrder;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Template getTemplate() {
        return template;
    }

    public void setTemplate(Template template) {
        this.template = template;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public InverseModelListRef<TextRes, SitePage> getTextResListRef() {
        return textResListRef;
    }
}
