package com.etco.controller.user.account.ajax;

import java.util.List;

import org.slim3.controller.Navigation;
import org.slim3.controller.validator.Validators;

import com.etco.controller.user.account.BaseController;
import com.etco.enums.ListItemType;
import com.etco.exception.ObjectNotExistException;
import com.etco.model.ListItem;
import com.etco.model.User;
import com.etco.service.ListItemService;

public class AddListItemEntryController extends BaseController {
    
    @Override
    protected Navigation execute(User user) throws Exception {
        // 入力チェック
        if (!validate()) {
            return null;
        }
        
        String listType = asString("listType");
        ListItemType listItemType = ListItemType.valueOf(listType);
        
        ListItem listItem = ListItemService.put(user, ListItemType.valueOf(listType));
        requestScope("listItem", listItem);

        try {
            List<ListItem> itemList = ListItemService.getListByType(user, listItemType);
            requestScope("listSize", String.valueOf(itemList.size()));

        }catch(ObjectNotExistException e) {
            requestScope("listSize", String.valueOf(0));
        }
        
        return forward("/template/" + user.getTemplate().toString() + "/include-parts/" + listItemType.toString() + "_add_response.jsp");
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
