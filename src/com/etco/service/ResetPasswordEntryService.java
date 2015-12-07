package com.etco.service;

import java.util.UUID;

import org.slim3.datastore.Datastore;

import com.etco.dao.ResetPasswordEntryDao;
import com.etco.exception.ObjectNotExistException;
import com.etco.meta.ResetPasswordEntryMeta;
import com.etco.model.ResetPasswordEntry;
import com.etco.model.User;
import com.google.appengine.api.datastore.Key;


public class ResetPasswordEntryService {
    
    /** DAO */
    private static final ResetPasswordEntryDao dao = new ResetPasswordEntryDao();
    
    /**
     * PUT
     * @param model
     * @return
     */
    protected static ResetPasswordEntry put(ResetPasswordEntry model) {
        
        dao.put(model);
        
        return model;
    }
    
    /**
     * PUT
     * @param model
     * @return
     */
    public static ResetPasswordEntry put(User user) {
        
        ResetPasswordEntry model = new ResetPasswordEntry();
        model.setKey(createKey());
        model.getUserRef().setModel(user);
        
        return put(model);
    }
    
    /**
     * キーから取得
     * <pre>存在しない場合エラー</pre>
     */
    public static ResetPasswordEntry getByKey(String keyString) throws Exception {
        ResetPasswordEntry model =  dao.get(createKey(keyString));
        
        if(model == null) throw new ObjectNotExistException();
        
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
        return Datastore.createKey(ResetPasswordEntryMeta.get(), keyString);
    }
    
    
    /**
     * キーの作成
     * @return
     */
    private static Key createKey() {
        // キーを乱数にする
        UUID uniqueKey = UUID.randomUUID();
        return createKey(uniqueKey.toString());
    }

}
