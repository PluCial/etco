package com.etco.controller.site;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.slim3.controller.Navigation;
import org.slim3.util.StringUtil;

import com.etco.controller.AppBaseController;
import com.etco.enums.PageRole;
import com.etco.exception.NoContentsException;
import com.etco.exception.NoLoginException;
import com.etco.exception.ObjectNotExistException;
import com.etco.model.ListItem;
import com.etco.model.SitePage;
import com.etco.model.User;
import com.etco.service.ListItemService;
import com.etco.service.PageService;
import com.etco.service.UserService;

public abstract class BaseController extends AppBaseController {

    @Override
    public Navigation run() throws Exception {
        requestScope("isSmartPhone", String.valueOf(isSmartPhone()));
        requestScope("isLocal", String.valueOf(isLocal()));
        
        String siteId = asString("siteId");
        if(StringUtil.isEmpty(siteId.trim())) throw new NoContentsException();
        
        User user = null;
        try {
            user = UserService.getBySiteId(siteId);
            requestScope("user", user);
        }catch(ObjectNotExistException e) { 
            throw new NoContentsException();
        }
        
        List<SitePage> pageList = null;
        try { 
            pageList = PageService.getList(user);
            requestScope("pageList", pageList);
        }catch(ObjectNotExistException e) { 
            throw new NoContentsException();
        }

        
        try {
            if(user.getSiteId().equals(getLoginUser().getSiteId())) {
                requestScope("isEditMode", String.valueOf(true));
            }else {
                requestScope("isEditMode", String.valueOf(false));
            }
        }catch(NoLoginException e) {
            requestScope("isEditMode", String.valueOf(false));
        }
        
        return execute(user);
    }
    
    /**
     * アイテムリストの設定
     * @param user
     * @param listType
     */
    protected List<ListItem> setItemList(User user, String listType) {
        List<ListItem> list = new ArrayList<ListItem>();
        try {
            list = ListItemService.getListByType(user, listType);
        } catch (ObjectNotExistException e) {
        }
        
        requestScope(listType, list);
        
        return list;
    }
    
    /**
     * リソースの設定
     * @param user
     * @param pageRole
     */
    protected void setRes(User user, PageRole pageRole) {
        HashMap<String,String> textResMap = new HashMap<String,String>();
        
        for(String listType: pageRole.getListTypes()) {
            List<ListItem> list = setItemList(user, listType);
         // TODO: リストアイテムのテキストリソース
            System.out.println(list.size());
        }
        
        // TODO: ページテキストリソース
        
        requestScope("textResMap", textResMap);
    }
    
    /**
     * リクエスト処理
     * @return
     * @throws Exception
     */
    protected abstract Navigation execute(User user) throws Exception;
}
