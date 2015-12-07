package com.etco.controller.user;

import org.slim3.controller.Navigation;
import org.slim3.controller.validator.Validators;

import com.etco.exception.ObjectNotExistException;
import com.etco.model.User;
import com.etco.service.UserService;
import com.etco.validator.NGValidator;

public class LoginEntryController extends BaseController {

    @Override
    public Navigation execute() throws Exception {
        
        // 入力チェック
        if (!isPost() || !validate()) {
            return forward("/user/login");
        }
        
        // クライアントの取得
        String email = asString("email");
        String password = asString("password");
        
        User user = null;
        try {
            user = UserService.login(email, password);
            
        } catch (ObjectNotExistException e) {
            // ログインエラー
            Validators v = new Validators(request);
            v.add("email", new NGValidator("メールアドレスもしくはパスワードが違います。"));
            v.validate();
            return forward("/user/login");
        }
        
        // ログイン処理
        sessionScope("user", user);
        
        return redirect("/user/account/selectSpot");
    }
    
    /**
     * バリデーション(入力)
     * @return
     */
    private boolean validate() {
        Validators v = new Validators(request);

        // メール
        v.add("email", 
            v.required("メールアドレスを入力してください。"),
            v.maxlength(256, "メールアドレスが長すぎます。"), 
            v.minlength(6, "メールアドレスが短すぎます。"),
            v.regexp("\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*([,;]\\s*\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*)*", "メールアドレスが正しくありません。"));

        // パスワード
        v.add("password", 
            v.required("パスワードを入力してください。")
             );

        return v.validate();
    }
}
