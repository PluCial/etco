package com.etco.controller.user;

import org.slim3.controller.Navigation;

import com.etco.App;
import com.etco.model.SignupEntry;
import com.etco.model.User;
import com.etco.service.SignupEntryService;
import com.etco.service.UserService;

public class AddAccountController extends BaseController {

    @Override
    protected Navigation execute() throws Exception {
        String entryId = asString("entryId");
        
        // DBからエントリー情報を取得
        SignupEntry signupEntry = SignupEntryService.getByKey(entryId);
        
        // クライアントの追加
        User user = UserService.add(
            signupEntry.getName(), 
            signupEntry.getEmail().getEmail(), 
            signupEntry.getPassword());
        
        // セッションの設定
        sessionScope("user", user);
        
        // エントリー情報の削除
        SignupEntryService.delete(signupEntry);
        
        // ログイン後画面に遷移
        return redirect(App.USER_LOGIN_REDIRECT_URL);
    }
}
