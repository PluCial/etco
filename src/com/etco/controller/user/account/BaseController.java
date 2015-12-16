package com.etco.controller.user.account;

import org.slim3.controller.Navigation;

import com.etco.controller.AppBaseController;
import com.etco.exception.NoLoginException;
import com.etco.model.User;

public abstract class BaseController extends AppBaseController {

    @Override
    protected Navigation run() throws Exception {

        User user = null;
        try {
            user = getLoginUser();
        }catch(NoLoginException e) {
            return redirect("/user/login");
        }

        requestScope("isSmartPhone", String.valueOf(isSmartPhone()));
        requestScope("isLocal", String.valueOf(isLocal()));
        requestScope("isEditMode", String.valueOf(user != null));
        requestScope("user", user);

        return execute(user);
    }

    /**
     * リクエスト処理
     * @return
     * @throws Exception
     */
    protected abstract Navigation execute(User user) throws Exception;

}
