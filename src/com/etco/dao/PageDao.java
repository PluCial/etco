package com.etco.dao;

import java.util.List;

import org.slim3.datastore.DaoBase;
import org.slim3.datastore.Datastore;

import com.etco.meta.SitePageMeta;
import com.etco.model.SitePage;
import com.etco.model.User;

public class PageDao extends DaoBase<SitePage>{
    
    /** META */
    private static final SitePageMeta meta = SitePageMeta.get();
    
    /**
     * ユーザーリスト
     * @return
     */
    public List<SitePage> getList(User user) {
        return  Datastore.query(meta)
                .filter(
                    meta.userRef.equal(user.getKey()),
                    meta.template.equal(user.getTemplate()),
                    meta.published.equal(true)
                    )
                    .sort(meta.sortOrder.asc, meta.createDate.asc)
                    .asList();
    }
    
    /**
     * インデックスページの取得
     * @return
     */
    public SitePage getIndexPage(User user) {
        return  Datastore.query(meta)
                .filter(
                    meta.userRef.equal(user.getKey()),
                    meta.template.equal(user.getTemplate()),
                    meta.role.equal("index")
                    )
                    .asSingle();
    }
    
    /**
     * ユーザーリスト
     * @return
     */
    public SitePage getByName(User user, String name) {
        return  Datastore.query(meta)
                .filter(
                    meta.userRef.equal(user.getKey()),
                    meta.name.equal(name),
                    meta.template.equal(user.getTemplate())
                    )
                    .asSingle();
    }

}
