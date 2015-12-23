package com.etco.dao;

import java.util.List;

import org.slim3.datastore.DaoBase;
import org.slim3.datastore.Datastore;
import org.slim3.datastore.ModelQuery;

import com.etco.enums.ListItemType;
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
    public List<ListItem> getListByType(User user, ListItemType listItemType) {
        ModelQuery<ListItem> query = Datastore.query(meta)
                .filter(
                    meta.userRef.equal(user.getKey()),
                    meta.listItemType.equal(listItemType)
                        );

        query.sort(listItemType.getSortCriterion());

        return query.asList();
    }

}
