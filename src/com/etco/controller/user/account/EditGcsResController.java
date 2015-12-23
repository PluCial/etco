package com.etco.controller.user.account;

import org.slim3.controller.Navigation;

import com.etco.controller.user.account.BaseController;
import com.etco.model.User;

public class EditGcsResController extends BaseController {

    @Override
    protected Navigation execute(User user) throws Exception {
        
        return forward("editGcsRes.jsp");
    }
}
