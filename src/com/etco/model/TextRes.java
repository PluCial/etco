package com.etco.model;

import java.io.Serializable;
import java.util.Date;

import org.slim3.datastore.Attribute;
import org.slim3.datastore.CreationDate;
import org.slim3.datastore.Model;
import org.slim3.datastore.ModelRef;
import org.slim3.datastore.ModificationDate;
import org.slim3.util.StringUtil;

import com.etco.Utils;
import com.etco.enums.TextResIds;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.Text;

@Model(schemaVersion = 1)
public class TextRes implements Serializable {

    private static final long serialVersionUID = 1L;

    @Attribute(primaryKey = true)
    private Key key;

    @Attribute(version = true)
    private Long version;
    
    /**
     * リソースタイプ
     */
    private TextResIds resId;
    
    /**
     * コンテンツ
     */
    @Attribute(unindexed = true)
    private Text content;

    /** Userとの関連 */
    private ModelRef<User> userRef = new ModelRef<User>(User.class);
    
    /** SitePageとの関連 */
    private ModelRef<SitePage> sitePageRef = new ModelRef<SitePage>(SitePage.class);
    
    /** ListItemとの関連 */
    private ModelRef<ListItem> listItemRef = new ModelRef<ListItem>(ListItem.class);

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
    
    public String getContentString() {
        return content == null ? null : content.getValue();
    }
    
    /**
     * 文字列を適切に変換してコンテンツにセットする
     * @param str
     */
    public void setStringToContent(String content) {
        if(StringUtil.isEmpty(content.trim())) throw new NullPointerException();
        
        // 前後の空白を削除
        content = content.trim();

        // 改行をすべて統一
        this.content = new Text(Utils.unityIndention(content));
    }

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
        TextRes other = (TextRes) obj;
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

    public Text getContent() {
        return content;
    }

    public void setContent(Text content) {
        this.content = content;
    }

    public ModelRef<SitePage> getSitePageRef() {
        return sitePageRef;
    }

    public ModelRef<ListItem> getListItemRef() {
        return listItemRef;
    }

    public TextResIds getResId() {
        return resId;
    }

    public void setResId(TextResIds resId) {
        this.resId = resId;
    }
}
