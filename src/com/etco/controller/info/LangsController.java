package com.etco.controller.info;

import org.slim3.controller.Navigation;

public class LangsController extends BaseController {

    @Override
    protected Navigation execute() throws Exception {
        return forward("langs.jsp");
    }
}
