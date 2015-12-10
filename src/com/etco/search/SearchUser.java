package com.etco.search;

import java.util.ArrayList;
import java.util.List;

import org.slim3.util.StringUtil;

import com.etco.exception.ObjectNotExistException;
import com.etco.model.User;
import com.etco.service.UserService;
import com.google.appengine.api.search.Cursor;
import com.google.appengine.api.search.Index;
import com.google.appengine.api.search.Query;
import com.google.appengine.api.search.QueryOptions;
import com.google.appengine.api.search.Results;
import com.google.appengine.api.search.ScoredDocument;
import com.google.appengine.api.search.SortExpression;
import com.google.appengine.api.search.SortExpression.SortDirection;
import com.google.appengine.api.search.SortOptions;

/**
 * スポットの検索
 * @author takahara
 *
 */
public class SearchUser {
    
    private StringBuilder qstr = null;
    private Index index = null;
    
    /**
     * コンストラクタ
     * @param index
     */
    public SearchUser(Index index) {
        this.qstr = new StringBuilder();
        this.index = index;
    }
    
    /**
     * 検索結果を取得
     * @param limit
     * @param cursorString
     * @return
     */
    public Results<ScoredDocument> build(int limit, String cursorString) {

        if(StringUtil.isEmpty(qstr.toString().trim())) return null;
        
        if (StringUtil.isEmpty(cursorString)) {
            return search(limit);
            
        }else {
            return search(limit, cursorString);
        }
    }
    
    /**
     * 検索キーワードの設定
     * @param keyword
     * @return
     */
    public SearchUser addKeyword(String keyword) {
        
        if(StringUtil.isEmpty(keyword)) return this;
        
        if(!StringUtil.isEmpty(qstr.toString().trim())) {
            qstr.insert(0, keyword + " AND ");
        }
        
        qstr.append(keyword);
        
        return this;
    }
    
    
    /**
     * 検索結果からスポットリストを生成
     * @param results
     * @param lang
     * @return
     */
    public List<User> getUserListByResults(Results<ScoredDocument> results) {
        
        if(results == null) return new ArrayList<User>();

        List<User> userList = new ArrayList<User>();
        for (ScoredDocument document : results) {

            String userEmail = document.getOnlyField(SearchField.USER_EMAIL).getText();
            
            if(!StringUtil.isEmpty(userEmail)) {
                
                try {
                    User user = UserService.getByEmail(userEmail);
                    userList.add(user);
                }catch(ObjectNotExistException e) {};
            }
        }
        
        return userList;
    }
    
    /**
     * 検索
     * @return
     */
    private Results<ScoredDocument> search(int limit) {
        // クリエ毎のカーソルを使用
        Cursor cursor = Cursor.newBuilder().setPerResult(false).build();

        Query query = Query.newBuilder()
                .setOptions(QueryOptions
                    .newBuilder()
                    .setLimit(limit)
                    .setSortOptions(SortOptions.newBuilder()
                        .addSortExpression(SortExpression.newBuilder()
                            .setExpression(SearchField.CREATE_DATE)
                            .setDirection(SortDirection.DESCENDING)))
                            .setCursor(cursor)
                            .build())
                            .build(qstr.toString());
        Results<ScoredDocument> results = index.search(query);

        return results;
    }
    
    /**
     * 検索
     * @return
     */
    private Results<ScoredDocument> search(int limit, String cursorString) {
        Cursor cursor = Cursor.newBuilder().setPerResult(false).build(cursorString);

        Query query = Query.newBuilder()
                .setOptions(QueryOptions
                    .newBuilder()
                    .setLimit(limit)
                    .setSortOptions(SortOptions.newBuilder()
                        .addSortExpression(SortExpression.newBuilder()
                            .setExpression(SearchField.CREATE_DATE)
                            .setDirection(SortDirection.DESCENDING)))
                        .setCursor(cursor)
                        .build())
                        .build(qstr.toString());
        Results<ScoredDocument> results = index.search(query);

        return results;
    }

}
