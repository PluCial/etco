package com.etco.service;

import java.util.List;
import java.util.UUID;

import org.slim3.datastore.Datastore;

import com.etco.dao.PageDao;
import com.etco.enums.PageRole;
import com.etco.exception.ObjectNotExistException;
import com.etco.exception.TooManyException;
import com.etco.meta.SitePageMeta;
import com.etco.model.SitePage;
import com.etco.model.User;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.Transaction;

public class PageService {

    /** DAO */
    private static final PageDao dao = new PageDao();


    /**
     * リストの取得
     * @param user
     * @return
     * @throws ObjectNotExistException 
     */
    public static List<SitePage> getList(User user) throws ObjectNotExistException {
        List<SitePage> list = dao.getList(user);
        if(list == null || list.size() <= 0) throw new ObjectNotExistException();

        return list;
    }
    
    /**
     * ページキーからページを取得
     * @param user
     * @param name
     * @return
     * @throws ObjectNotExistException
     */
    public static SitePage getByKey(User user, String keyString) throws ObjectNotExistException {
        SitePage sitePage = dao.get(createKey(keyString));
        if(sitePage == null) throw new ObjectNotExistException();
        
        return sitePage;
    }
    
    
    
    /**
     * ページ名からページを取得
     * @param user
     * @param name
     * @return
     * @throws ObjectNotExistException
     */
    public static SitePage getByName(User user, String name) throws ObjectNotExistException {
        SitePage sitePage = dao.getByName(user, name);
        if(sitePage == null) throw new ObjectNotExistException();
        
        return sitePage;
    }
    
    public static SitePage getIndexPage(User user) throws ObjectNotExistException {
        SitePage indexPage = dao.getIndexPage(user);
        if(indexPage == null) throw new ObjectNotExistException();
        
        return indexPage;
    }

    /**
     * ページの追加
     * @param tx
     * @param user
     * @param name
     * @param role
     * @return
     * @throws TooManyException 
     */
    protected static SitePage add(Transaction tx, User user, String name, PageRole role) throws TooManyException {
        
        // index Pageの重複チェック
        if(role == PageRole.INDEX) {
            SitePage indexPage = dao.getIndexPage(user);
            if(indexPage != null) throw new TooManyException();
        }
        
        // ページ名の重複チェック
        try {
            getByName(user, name);
            throw new TooManyException();
        }catch(ObjectNotExistException e) {}
        
        SitePage sitePage = new SitePage();
        sitePage.setKey(createKey());
        sitePage.setName(name);
        sitePage.setRole(role);
        sitePage.getUserRef().setModel(user);
        sitePage.setSortOrder(dao.getList(user).size() + 1);
        sitePage.setPublished(true);
        
        Datastore.put(tx, sitePage);
        
        return sitePage;
    }

    /**
     * ページの追加
     * @param user
     * @param name
     * @param role
     * @return
     * @throws TooManyException 
     */
    public static SitePage add(User user, String name, PageRole role) throws TooManyException {

        // ---------------------------------------------------
        // 保存処理
        // ---------------------------------------------------
        SitePage sitePage = null;
        Transaction tx = Datastore.beginTransaction();
        try {

            sitePage = add(tx, user, name, role);

            tx.commit();

        }finally {
            if(tx.isActive()) {
                tx.rollback();
            }
        }

        return sitePage;

    }
    
    /**
     * ソート順の変更
     * @param sitePage
     * @param newOrder
     */
    public static void changeSortOrder(SitePage sitePage, double newOrder) {
        sitePage.setSortOrder(newOrder);
        dao.put(sitePage);
    }

    // ----------------------------------------------------------------------
    // キーの作成
    // ----------------------------------------------------------------------
    /**
     * キーの作成
     * @param keyString
     * @return
     */
    public static Key createKey(String keyString) {
        return Datastore.createKey(SitePageMeta.get(), keyString);
    }

    /**
     * キーの作成
     * @return
     */
    public static Key createKey() {
        // キーを乱数にする
        UUID uniqueKey = UUID.randomUUID();
        return createKey(uniqueKey.toString());
    }

}
