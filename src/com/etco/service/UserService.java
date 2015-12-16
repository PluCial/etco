package com.etco.service;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import org.slim3.datastore.Datastore;
import org.slim3.util.StringUtil;

import com.etco.dao.UserDao;
import com.etco.enums.PageRole;
import com.etco.enums.Template;
import com.etco.exception.ObjectNotExistException;
import com.etco.exception.TooManyException;
import com.etco.meta.UserMeta;
import com.etco.model.User;
import com.etco.search.SearchApi;
import com.etco.validator.ArgumentException;
import com.google.appengine.api.datastore.Email;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.Transaction;


public class UserService {
    
    /** DAO */
    private static final UserDao dao = new UserDao();
    
    /**
     * Get
     * @return
     * @throws ObjectNotExistException 
     */
    public static User getByEmail(String email) throws ObjectNotExistException {
        
        User model =  dao.getByEmail(email);
        if(model == null) throw new ObjectNotExistException();
        
        return model;
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
        if(user == null || !user.getPassword().equals(getCipherPassword(user.getKey().getId(), password))) {
            throw new ObjectNotExistException();
        }
        
        return user;
    }
    
    /**
     * ユーザー情報を取得
     * @param keyString
     * @return
     * @throws ObjectNotExistException 
     */
    public static User getBySiteId(String siteId) throws ObjectNotExistException {
        User model = null;
        
        // DBから取得
        model = dao.getBySiteId(siteId);
        if(model == null) throw new ObjectNotExistException();
        
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
            String name, String email, String password) throws NullPointerException, TooManyException, NoSuchAlgorithmException {
        
        if(StringUtil.isEmpty(name)
                || StringUtil.isEmpty(email)
                || StringUtil.isEmpty(password)
                ) {
            throw new NullPointerException("登録情報が不十分です");
        }
        
        // 既に存在しているかチェック
        try {
            getByEmail(email);
                throw new TooManyException("このメールアドレスは既に登録されています。");
        } catch (ObjectNotExistException e) {}
      
        // ユーザーモデルの設定
        // パスワードの暗号化
        User user = new User();
        Key key = createKey();
        user.setKey(key);
        user.setName(name);
        user.setEmail(new Email(email));
        user.setPassword(getCipherPassword(key.getId(), password));
        
        // ---------------------------------------------------
        // 保存処理
        // ---------------------------------------------------
        Transaction tx = Datastore.beginTransaction();
        try {
            
            // ユーザー情報の登録
            Datastore.put(tx, user);
            
            // 検索APIの登録
            SearchApi.putDocument(user);

            tx.commit();

        }finally {
            if(tx.isActive()) {
                tx.rollback();
            }
        }
        
        return user;
    }
    
    /**
     * サイトinfoの設定
     * @param user
     * @param siteId
     * @param siteName
     */
    public static void settingSiteInfo(User user, String siteId, String siteName) {
        user.setSiteId(siteId);
        user.setSiteName(siteName);
        
        // ---------------------------------------------------
        // 保存処理
        // ---------------------------------------------------
        Transaction tx = Datastore.beginTransaction();
        try {
            
            // ユーザー情報の登録
            Datastore.put(tx, user);
            
            // 検索APIの登録
            SearchApi.putDocument(user);

            tx.commit();

        }finally {
            if(tx.isActive()) {
                tx.rollback();
            }
        }
    }
    
    /**
     * サイトテンプレートの設定
     * @param user
     * @param siteId
     * @param siteName
     * @throws TooManyException 
     */
    public static void settingTemplate(User user, Template template) throws TooManyException {
        user.setTemplate(template);
        
        // ---------------------------------------------------
        // 保存処理
        // ---------------------------------------------------
        Transaction tx = Datastore.beginTransaction();
        try {
            
            // ユーザー情報の登録
            Datastore.put(tx, user);
            
            // index pageの作成
            PageService.add(tx, user, "ホーム", PageRole.INDEX);
            
            // 検索APIの登録
            SearchApi.putDocument(user);

            tx.commit();

        }finally {
            if(tx.isActive()) {
                tx.rollback();
            }
        }
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
     * パスワードの変更
     * @param model
     * @param password
     * @return
     * @throws NoSuchAlgorithmException 
     * @throws ArgumentException 
     */
    public static void updatePassword(User model, String password) throws NoSuchAlgorithmException, ArgumentException {
        
        if(model == null || StringUtil.isEmpty(password)) throw new ArgumentException();
        
        model.setPassword(getCipherPassword(model.getKey().getId(), password));
        
        dao.put(model);
    }
    
    /**
     * パスワード暗号化
     * @return
     * @throws NoSuchAlgorithmException 
     */
    private static String getCipherPassword(long userId, String password) throws NoSuchAlgorithmException {
        StringBuilder buff = new StringBuilder();
        if (password != null && !password.isEmpty()) {
            MessageDigest md = MessageDigest.getInstance("SHA-1");
            md.update(String.valueOf(userId).getBytes());
            md.update(password.getBytes());
            byte[] digest = md.digest();
            for (byte d : digest) {
                buff.append((int)d&0xFF);
            }
        }
        return buff.toString();
    }

}
