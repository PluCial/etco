package com.etco.service;

import java.util.List;
import java.util.UUID;

import org.slim3.datastore.Datastore;

import com.etco.dao.ListItemDao;
import com.etco.enums.ListItemType;
import com.etco.exception.ObjectNotExistException;
import com.etco.exception.TooManyException;
import com.etco.meta.ListItemMeta;
import com.etco.model.ListItem;
import com.etco.model.User;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.Transaction;

public class ListItemService {

    /** DAO */
    private static final ListItemDao dao = new ListItemDao();


    /**
     * リストの取得
     * @param user
     * @return
     * @throws ObjectNotExistException 
     */
    public static List<ListItem> getListByType(User user, ListItemType listItemType) throws ObjectNotExistException {
        List<ListItem> list = dao.getListByType(user, listItemType);
        if(list == null || list.size() <= 0) throw new ObjectNotExistException();

        return list;
    }
    
    /**
     * itemの取得
     * @param user
     * @param name
     * @return
     * @throws ObjectNotExistException
     */
    public static ListItem getByKey(String keyString) throws ObjectNotExistException {
        ListItem item = dao.getOrNull(createKey(keyString));
        if(item == null) throw new ObjectNotExistException();
        
        return item;
    }

    /**
     * PUT
     * @param tx
     * @param user
     * @param name
     * @param role
     * @return
     * @throws TooManyException 
     */
    protected static ListItem put(Transaction tx, User user, ListItemType listItemType) throws TooManyException {
        
        ListItem model = new ListItem();
        model.setKey(createKey(user, listItemType));
        model.getUserRef().setModel(user);
        model.setListItemType(listItemType);
        
        Datastore.put(tx, model);
        
        return model;
    }

    /**
     * PUT
     * @param user
     * @param name
     * @param role
     * @return
     * @throws TooManyException 
     */
    public static ListItem put(User user, ListItemType listItemType) throws TooManyException {

        // ---------------------------------------------------
        // 保存処理
        // ---------------------------------------------------
        ListItem model = null;
        Transaction tx = Datastore.beginTransaction();
        try {

            model = put(tx, user, listItemType);

            tx.commit();

        }finally {
            if(tx.isActive()) {
                tx.rollback();
            }
        }

        return model;
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
        return Datastore.createKey(ListItemMeta.get(), keyString);
    }

    /**
     * キーの作成
     * @return
     */
    public static Key createKey(User user, ListItemType listItemType) {
        // キーを乱数にする
        UUID uniqueKey = UUID.randomUUID();
        return createKey(user.getSiteId() + "_" + listItemType.toString() + "_" + uniqueKey.toString());
    }

}
