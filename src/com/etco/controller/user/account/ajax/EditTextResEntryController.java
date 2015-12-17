package com.etco.controller.user.account.ajax;

import org.slim3.controller.Navigation;
import org.slim3.controller.validator.Validators;

import com.etco.controller.user.account.BaseController;
import com.etco.model.ListItem;
import com.etco.model.SitePage;
import com.etco.model.User;
import com.etco.service.ListItemService;
import com.etco.service.PageService;
import com.etco.service.TextResService;

public class EditTextResEntryController extends BaseController {
    
    @Override
    protected Navigation execute(User user) throws Exception {
        // 入力チェック
        if (!isPost() || !validate()) {
            requestScope("status", "NG");
            return forward("/user/account/ajax_response.jsp");
        }
        
        String objectType = asString("objectType");
        // pageKey or listItemKey
        String parentKey = asString("parentKey");
        String resId = asString("resId");
        
        if(objectType.equals("page")) {
            
            SitePage sitePage = PageService.getByKey(parentKey);
            TextResService.put(user, sitePage, resId, asString("content"));
            
        }else if(objectType.equals("listItem")) {
            ListItem listItem = ListItemService.getByKey(parentKey);
            TextResService.put(user, listItem, resId, asString("content"));
        }
        
        requestScope("status", "OK");
        return forward("/user/account/ajax_response.jsp");
    }
    
    /**
     * バリデーション
     * @return
     */
    private boolean validate() {
        Validators v = new Validators(request);

        v.add("objectType", v.required());
        v.add("parentKey", v.required());
        v.add("resId", v.required());
        
        return v.validate();
    }
}
