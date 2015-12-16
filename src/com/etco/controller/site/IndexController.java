package com.etco.controller.site;

import org.slim3.controller.Navigation;

import com.etco.exception.NoContentsException;
import com.etco.exception.ObjectNotExistException;
import com.etco.model.SitePage;
import com.etco.model.User;
import com.etco.service.PageService;

public class IndexController extends BaseController {

    @Override
    protected Navigation execute(User user) throws Exception {
        
        SitePage sitePage = null;
        try {
            sitePage = PageService.getIndexPage(user);
            requestScope("sitePage", sitePage);
            
        }catch(ObjectNotExistException e) {
            throw new NoContentsException();
        }
        
        
        return forward("/template/" + user.getTemplate().toString() + "/index.jsp");
    }
}
