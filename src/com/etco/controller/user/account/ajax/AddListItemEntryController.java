package com.etco.controller.user.account.ajax;

import org.slim3.controller.Navigation;
import org.slim3.controller.validator.Validators;

import com.etco.controller.user.account.BaseController;
import com.etco.model.ListItem;
import com.etco.model.User;
import com.etco.service.ListItemService;

public class AddListItemEntryController extends BaseController {
    
//    @Override
//    protected Navigation execute(User user) throws Exception {
//        // 入力チェック
//        if (!validate()) {
//            requestScope("status", "NG");
//            return forward("/user/account/ajax_response.jsp");
//        }
//        
//        String listType = asString("listType");
//        
//        ListItemService.put(user, listType);
//        
//        requestScope("status", "OK");
//        return forward("/user/account/ajax_response.jsp");
//    }
    
    @Override
    protected Navigation execute(User user) throws Exception {
        // 入力チェック
        if (!validate()) {
            return null;
        }
        
        String listType = asString("listType");
        
        ListItem listItem = ListItemService.put(user, listType);
        requestScope("listItem", listItem);
        
        return forward("/template/" + user.getTemplate().toString() + "/include-parts/" + listType + "_add_response.jsp");
    }
    
    /**
     * バリデーション
     * @return
     */
    private boolean validate() {
        Validators v = new Validators(request);

        v.add("listType", v.required());
        
        return v.validate();
    }
}
