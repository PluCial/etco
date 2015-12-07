package com.etco.controller.info;

import org.slim3.controller.Navigation;

public class SctlController extends BaseController {

    @Override
    protected Navigation execute() throws Exception {
        return forward("sctl.jsp");
    }
}
