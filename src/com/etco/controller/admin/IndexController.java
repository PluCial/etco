package com.etco.controller.admin;

import java.util.ArrayList;
import java.util.List;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;
import org.slim3.util.StringUtil;

import com.etco.model.User;
import com.etco.service.UserService;

public class IndexController extends Controller {

    @Override
    public Navigation run() throws Exception {
        
        List<User> userList = null;
        
        String keyword = asString("keyword");
        
        if(StringUtil.isEmpty(keyword) || StringUtil.isEmpty(keyword.trim())) {
            userList = UserService.getList(100);
        
        }else {
            
        }
        
        requestScope("userList", userList != null ? userList : new ArrayList<User>());
        
        return forward("index.jsp");
    }
}
