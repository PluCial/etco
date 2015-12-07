package com.etco.service;

import org.slim3.memcache.Memcache;

import com.etco.exception.ObjectNotExistException;
import com.etco.model.User;



public class MemcacheService {
    
    /** ユーザーキー */
    private static final String USER_INFO_MEMCACHE_KEY = "user_info";
    
    /** アイテムキー */
//    private static final String PAGE_INFO_MEMCACHE_KEY = "page_info";
    
    /**
     * キャッシュにユーザー情報を追加
     * @param user
     */
    public static void addUser(User model) {
        Memcache.put(USER_INFO_MEMCACHE_KEY + "_" + model.getUserId(), model);
    }
    
    /**
     * キャッシュからユーザー情報を取得
     * @param userId
     * @return
     * @throws ObjectNotExistException 
     */
    public static User getUser(String userId) throws ObjectNotExistException {
        
        User user = Memcache.get(USER_INFO_MEMCACHE_KEY + "_" + userId);
        if(user == null) throw new ObjectNotExistException();
        
        return user;
    }
    
    
    /**
     * ユーザーキャッシュ削除
     * @param userId
     */
    public static void deleteUser(String userId) {
        Memcache.delete(USER_INFO_MEMCACHE_KEY + "_" + userId);
    }

}
