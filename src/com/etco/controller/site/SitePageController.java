package com.etco.controller.site;

import org.slim3.controller.Navigation;
import org.slim3.util.StringUtil;

import com.etco.exception.NoContentsException;
import com.etco.exception.ObjectNotExistException;
import com.etco.model.SitePage;
import com.etco.model.User;
import com.etco.service.PageService;

public class SitePageController extends BaseController {

    @Override
    protected Navigation execute(User user) throws Exception {
        
        String pageName = asString("pageName");
        if(StringUtil.isEmpty(pageName.trim())) throw new NoContentsException();
        
        SitePage sitePage = null;
        try {
            sitePage = PageService.getByName(user, pageName);
            requestScope("sitePage", sitePage);
            
        }catch(ObjectNotExistException e) {
            throw new NoContentsException();
        }
        
        
        return forward("/template/" + user.getTemplate().toString() + "index.jsp");
    }
}
