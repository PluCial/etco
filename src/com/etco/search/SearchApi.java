package com.etco.search;

import com.etco.model.User;
import com.google.appengine.api.search.Document;
import com.google.appengine.api.search.Document.Builder;
import com.google.appengine.api.search.Field;
import com.google.appengine.api.search.Index;
import com.google.appengine.api.search.IndexSpec;
import com.google.appengine.api.search.SearchServiceFactory;

public class SearchApi {
    
    private static final String USER_INFO_INDEX = "user_info";
    
    /**
     * ドキュメントインデックスの取得
     * @return
     */
    private static Index getDocumentIndex() {
        return SearchServiceFactory.getSearchService()
                .getIndex(IndexSpec.newBuilder()
                    .setName(USER_INFO_INDEX));
    }
    
    /**
     * ドキュメントのキーを取得
     * @param user
     * @return
     */
    private static String getDocumentId(User user) {
        return String.valueOf(user.getKey().getId());
    }
    
    /**
     * user からドキュメントを取得
     * @param user
     * @return
     */
    private static Document getDocumentById(User user) {
        String documentId = getDocumentId(user);
        
        Index index = getDocumentIndex();
        
        return index.get(documentId);
    }
    
    /**
     * ドキュメントを削除
     * @param user
     */
    public static void deleteSpot(User user) {
        Document document = getDocumentById(user);
        if(document == null) return;
        Index index = getDocumentIndex();
        
        index.delete(document.getId());
    }
    
    /**
     * ドキュメントの追加・更新
     * @param user
     */
    public static void putDocument(User user) {
        
        // ドキュメントの作成
        Builder builder = Document.newBuilder()
                .setId(getDocumentId(user))
                .addField(Field.newBuilder()
                    .setName(SearchField.USER_KEY_ID)
                    .setAtom(String.valueOf(user.getKey().getId())))
                .addField(Field.newBuilder()
                    .setName(SearchField.USER_NAME)
                    .setText(user.getName()))
                .addField(Field.newBuilder()
                    .setName(SearchField.USER_EMAIL)
                    .setText(user.getEmail().getEmail()));
                
                builder.addField(Field.newBuilder()
                    .setName(SearchField.CREATE_DATE)
                    .setAtom(String.valueOf(user.getCreateDate().getTime())));
        
        Document document = builder.build();
        
        // ドキュメントの保存
        Index index = getDocumentIndex();
        index.put(document);
    }
    
    /**
     * Search Builder を取得
     * @return
     */
    public static SearchUser newSearchBuilder() {
        Index index = getDocumentIndex();
        
        return new SearchUser(index);
    }

}
