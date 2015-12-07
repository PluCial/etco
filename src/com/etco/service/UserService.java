package com.etco.service;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import org.slim3.datastore.Datastore;
import org.slim3.util.StringUtil;

import com.etco.dao.UserDao;
import com.etco.exception.ObjectNotExistException;
import com.etco.exception.TooManyException;
import com.etco.meta.UserMeta;
import com.etco.model.User;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.Transaction;


public class UserService {
    
    /** DAO */
    private static final UserDao dao = new UserDao();
    
    /**
     * Get
     * @return
     */
    public static User getByEmail(String email) {
        
        return dao.getByEmail(email);
    }
    
    /**
     * ログイン承認
     * @param email
     * @param password
     * @return
     * @throws Exception
     */
    public static User login(String email, String password) throws Exception {
        User user = getByEmail(email);
        
        // メールもしくはパスワードが違っている場合
        if(user == null || !user.getPassword().equals(getCipherPassword(user.getUserId(), password))) {
            return null;
        }
        
        return user;
    }
    
    /**
     * ユーザー情報を取得
     * @param keyString
     * @return
     */
    public static User getUser(String userId) {
        User model = null;
        
        try {
            model = MemcacheService.getUser(userId);

        }catch(ObjectNotExistException e) {
            // DBから取得
            model = dao.getByUserId(userId);
            if(model == null) return null;
            
            // キャッシュを追加
            MemcacheService.addUser(model);
        }
        
        return model;
    }
    
    /**
     * 新しいユーザーリストの取得
     * @param num
     * @return
     */
    public static List<User> getList(int num) {
        
        List<User> userList = dao.getList(num);
        
        return userList;
    }
    
    /**
     * ユーザーの追加
     * @param userId
     * @param email
     * @param password
     * @param lang
     * @param name
     * @param catchCopy
     * @param detail
     * @return
     * @throws NullPointerException
     * @throws TooManyException
     * @throws NoSuchAlgorithmException 
     */
    public static User add(
            User user) throws NullPointerException, TooManyException, NoSuchAlgorithmException {
        
        if(StringUtil.isEmpty(user.getUserId())
                || user.getEmail() == null
                || StringUtil.isEmpty(user.getPassword())
                || user.getTemplate() == null
                ) {
            throw new NullPointerException("登録情報が不十分です");
        }
        
        // 既に存在しているかチェック
        if(dao.getByUserId(user.getUserId()) != null) {
            throw new TooManyException("このUserIdは既に利用されています。");
        }
        
        // 既に存在しているかチェック
        if(getByEmail(user.getEmail().getEmail()) != null) {
            throw new TooManyException("このメールアドレスは既に登録されています。");
        }
        
        // ユーザーモデルの設定
        // パスワードの暗号化
        user.setPassword(getCipherPassword(user.getUserId(), user.getPassword()));
        
        // ---------------------------------------------------
        // 保存処理
        // ---------------------------------------------------
        Transaction tx = Datastore.beginTransaction();
        try {
            // スポットキーの作成
            Key userKey = createKey();
            user.setKey(userKey);
            
            // ユーザー情報の登録
            Datastore.put(tx, user);

            //TODO: pageの生成

            tx.commit();

        }finally {
            if(tx.isActive()) {
                tx.rollback();
            }
        }
        
        return user;
    }
    
    /**
     * キーの作成
     * @param keyString
     * @return
     */
    private static Key createKey() {
        return Datastore.allocateId(UserMeta.get());
    }
    
    /**
     * パスワード暗号化
     * @return
     * @throws NoSuchAlgorithmException 
     */
    private static String getCipherPassword(String userId, String password) throws NoSuchAlgorithmException {
        StringBuilder buff = new StringBuilder();
        if (password != null && !password.isEmpty()) {
            MessageDigest md = MessageDigest.getInstance("SHA-1");
            md.update(userId.getBytes());
            md.update(password.getBytes());
            byte[] digest = md.digest();
            for (byte d : digest) {
                buff.append((int)d&0xFF);
            }
        }
        return buff.toString();
    }

}
