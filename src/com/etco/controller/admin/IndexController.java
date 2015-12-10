package com.etco.controller.admin;

import java.util.ArrayList;
import java.util.List;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;
import org.slim3.util.StringUtil;

import com.etco.model.User;
import com.etco.search.SearchApi;
import com.etco.search.SearchUser;
import com.etco.service.UserService;
import com.google.appengine.api.search.Results;
import com.google.appengine.api.search.ScoredDocument;

public class IndexController extends Controller {

    @Override
    public Navigation run() throws Exception {
        
        List<User> userList = null;
        
        String keyword = asString("keyword");
        
        if(StringUtil.isEmpty(keyword) || StringUtil.isEmpty(keyword.trim())) {
            userList = UserService.getList(100);
        
        }else {
            // 検索ビルダーの初期化
            SearchUser builder = SearchApi.newSearchBuilder();
            builder.addKeyword(keyword);
            
            String cursor = asString("cursor");
            // リストの取得
            Results<ScoredDocument> results = builder.build(100, cursor);
            userList = builder.getUserListByResults(results);
        }
        
        requestScope("userList", userList != null ? userList : new ArrayList<User>());
        
        return forward("index.jsp");
    }
}
