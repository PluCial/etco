package com.etco.service;

import org.slim3.datastore.Datastore;

import com.etco.dao.TextResDao;
import com.etco.exception.ObjectNotExistException;
import com.etco.meta.TextResMeta;
import com.etco.model.ListItem;
import com.etco.model.SitePage;
import com.etco.model.TextRes;
import com.etco.model.User;
import com.google.appengine.api.datastore.Key;


public class TextResService {
    
    /** DAO */
    private static final TextResDao dao = new TextResDao();
    
    /**
     * 取得
     * @param keyString
     * @return
     * @throws ObjectNotExistException
     */
    public static TextRes getByKey(String keyString) throws ObjectNotExistException {
        TextRes res = dao.getOrNull(createKey(keyString));
        if(res == null) throw new ObjectNotExistException();
        
        return res;
    }
    
    /**
     * 取得
     * @param keyString
     * @return
     * @throws ObjectNotExistException
     */
    public static TextRes get(SitePage sitePage, String resType) throws ObjectNotExistException { 
        TextRes res = dao.getOrNull(createKey(sitePage, resType));
        if(res == null) throw new ObjectNotExistException();
        
        return res;
    }
    
    /**
     * 取得
     * @param keyString
     * @return
     * @throws ObjectNotExistException
     */
    public static TextRes get(ListItem listItem, String resType) throws ObjectNotExistException { 
        TextRes res = dao.getOrNull(createKey(listItem, resType));
        if(res == null) throw new ObjectNotExistException();
        
        return res;
    }
    
    /**
     * PUT
     * @param user
     * @param sitePage
     * @param resType
     * @param content
     */
    public static void put(User user, SitePage sitePage, String resId, String content) {
        TextRes res = new TextRes();
        res.setKey(createKey(sitePage, resId));
        res.setResId(resId);
        res.setStringToContent(content);
        res.getUserRef().setModel(user);
        res.getSitePageRef().setModel(sitePage);
        
        Datastore.put(res);
    }
    
    /**
     * PUT
     * @param user
     * @param sitePage
     * @param resType
     * @param content
     */
    public static void put(User user, ListItem listItem, String resId, String content) {
        TextRes res = new TextRes();
        res.setKey(createKey(listItem, resId));
        res.setResId(resId);
        res.setStringToContent(content);
        res.getUserRef().setModel(user);
        res.getListItemRef().setModel(listItem);
        
        Datastore.put(res);
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
        return Datastore.createKey(TextResMeta.get(), keyString);
    }
    
    /**
     * ページリソースキー
     * @param sitePage
     * @param resType
     * @return
     */
    public static Key createKey(SitePage sitePage, String resId) {
        return createKey(sitePage.getKey().getName() + "_" + resId);
    }
    
    /**
     * listItemリソースキー
     * @param listItem
     * @param resType
     * @return
     */
    public static Key createKey(ListItem listItem, String resId) {
        return createKey(listItem.getKey().getName() + "_" + resId);
    }

}
