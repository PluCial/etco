package com.etco.controller.site;

import java.util.List;

import org.slim3.controller.Navigation;
import org.slim3.util.StringUtil;

import com.etco.controller.AppBaseController;
import com.etco.exception.NoContentsException;
import com.etco.exception.NoLoginException;
import com.etco.exception.ObjectNotExistException;
import com.etco.model.SitePage;
import com.etco.model.User;
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
     * リクエスト処理
     * @return
     * @throws Exception
     */
    protected abstract Navigation execute(User user) throws Exception;
}
