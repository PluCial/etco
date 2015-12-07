package com.etco.controller.user;

import org.slim3.controller.Navigation;

public class LogoutController extends BaseController {

    @Override
    protected Navigation execute() throws Exception {
        // セッション削除
        removeSessionScope("user");

        return redirect("/user/login");
    }
}
