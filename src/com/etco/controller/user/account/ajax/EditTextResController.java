package com.etco.controller.user.account.ajax;

import org.slim3.controller.Navigation;

import com.etco.controller.user.account.BaseController;
import com.etco.exception.ObjectNotExistException;
import com.etco.model.ListItem;
import com.etco.model.SitePage;
import com.etco.model.TextRes;
import com.etco.model.User;
import com.etco.service.ListItemService;
import com.etco.service.PageService;
import com.etco.service.TextResService;

public class EditTextResController extends BaseController {

    @Override
    protected Navigation execute(User user) throws Exception {
        
        String objectType = asString("objectType");
        // pageKey or listItemKey
        String parentKey = asString("parentKey");
        String resId = asString("resId");
        
        TextRes textRes = null;
        
        try {
            if(objectType.equals("page")) {

                SitePage sitePage = PageService.getByKey(parentKey);
                textRes = TextResService.get(sitePage, resId);

            }else if(objectType.equals("listItem")) {
                ListItem listItem = ListItemService.getByKey(parentKey);
                textRes = TextResService.get(listItem, resId);
            }
        }catch(ObjectNotExistException e) {}
        
        requestScope("textRes", textRes);
        
        return forward("editTextRes.jsp");
    }
}
