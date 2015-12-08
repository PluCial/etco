package com.etco.controller;

import org.slim3.controller.Navigation;

public class Error404Controller extends BaseController {

    @Override
    protected Navigation execute() throws Exception {
        
        return forward("404.jsp");
    }
}
