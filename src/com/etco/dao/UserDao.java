package com.etco.dao;

import java.util.List;

import org.slim3.datastore.DaoBase;
import org.slim3.datastore.Datastore;

import com.etco.meta.UserMeta;
import com.etco.model.User;
import com.google.appengine.api.datastore.Email;

public class UserDao extends DaoBase<User>{
    
    /** META */
    private static final UserMeta meta = UserMeta.get();
    
    /**
     * emailから取得(ログイン用)
     * @param email
     * @return
     */
    public User getByEmail(String email) {
        return Datastore.query(meta)
                .filter(
                    meta.email.equal(new Email(email))
                    )
                .asSingle();
    }
    
    /**
     * ユーザーIDから取得
     * @return
     */
    public User getByUserId(String userId) {
        return  Datastore.query(meta)
                .filter(
                    meta.userId.equal(userId),
                    meta.invalid.equal(false)
                    ).asSingle();
    }
    
    /**
     * ユーザーIDから取得
     * @return
     */
    public List<User> getList(int num) {
        return  Datastore.query(meta)
                .filter(
                    meta.invalid.equal(false)
                    )
                    .limit(num)
                    .sort(meta.createDate.desc)
                    .asList();
    }

}
