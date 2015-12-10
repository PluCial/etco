package com.etco.controller.user.account;

import org.slim3.controller.Navigation;

import com.etco.model.User;

public class SettingSiteInfoController extends BaseController {

    @Override
    protected Navigation execute(User user) throws Exception {
        return forward("settingSiteInfo.jsp");
    }
}
