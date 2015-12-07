package com.etco.controller.info;

import org.slim3.controller.Navigation;

import com.etco.controller.AppBaseController;

public abstract class BaseController extends AppBaseController {

    @Override
    public Navigation run() throws Exception {
        requestScope("isSmartPhone", String.valueOf(isSmartPhone()));
        requestScope("isLocal", String.valueOf(isLocal()));

        return execute();
    }
    
    /**
     * リクエスト処理
     * @return
     * @throws Exception
     */
    protected abstract Navigation execute() throws Exception;
}
