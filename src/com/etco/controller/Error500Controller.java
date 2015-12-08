package com.etco.controller;

import org.slim3.controller.Navigation;

public class Error500Controller extends BaseController {

    @Override
    protected Navigation execute() throws Exception {
        
        return forward("500.jsp");
    }
}
