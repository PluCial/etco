package com.etco.dao;

import java.util.List;

import org.slim3.datastore.DaoBase;
import org.slim3.datastore.Datastore;

import com.etco.meta.ListItemMeta;
import com.etco.model.ListItem;
import com.etco.model.User;

public class ListItemDao extends DaoBase<ListItem>{
    
    /** META */
    private static final ListItemMeta meta = ListItemMeta.get();
    
    /**
     * リスト
     * @return
     */
    public List<ListItem> getListByType(User user, String listType) {
        return  Datastore.query(meta)
                .filter(
                    meta.userRef.equal(user.getKey()),
                    meta.listType.equal(listType)
                    )
                    .sort(meta.sortOrder.asc, meta.createDate.asc)
                    .asList();
    }

}
