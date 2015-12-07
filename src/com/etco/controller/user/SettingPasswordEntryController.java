package com.etco.controller.user;

import org.slim3.controller.Navigation;
import org.slim3.controller.validator.Validators;
import org.slim3.util.StringUtil;

import com.etco.exception.NoContentsException;
import com.etco.model.ResetPasswordEntry;
import com.etco.model.User;
import com.etco.service.ResetPasswordEntryService;
import com.etco.service.SignupEntryService;
import com.etco.service.UserService;
import com.etco.validator.PasswordConfirmationValidator;

public class SettingPasswordEntryController extends BaseController {

    @Override
    protected Navigation execute() throws Exception {
        // 入力チェック
        if (!isPost() || !validate()) {
            return forward("/user/settingPassword");
        }
        
        String password = asString("password");
        String entryId = asString("entryId");
        
        // パスワード確認入力チェック
        if (!validate(password)) {
            return forward("/user/settingPassword");
        }
        
        if(StringUtil.isEmpty(entryId)) {
            throw new NoContentsException();
        }
        
        // エントリーを保存
        ResetPasswordEntry entry = ResetPasswordEntryService.getByKey(entryId);
        if(entry == null) {
            throw new NoContentsException();
        }
        
        // Userの取得
        User user = entry.getUserRef().getModel();
        
        // パスワードの変更
        UserService.updatePassword(user, password);
        
        // ログイン処理
        sessionScope("user", user);
        
        // エントリー情報の削除
        SignupEntryService.delete(entry);
        
        return redirect("/user/account/selectSpot");
    }
    
    /**
     * バリデーション
     * @return
     */
    private boolean validate() {
        Validators v = new Validators(request);
        
        // パスワード
        v.add("password", 
            v.required("パスワードを入力してください。"),
            v.minlength(5, "パスワードは5文字以上必要です。"),
            v.regexp("^[a-zA-Z0-9]+$", "パスワードに使用できるのは半角英数字のみです。")
             );
        
        // 確認用パスワード
        v.add("passwordConfirmation",
            v.required("確認用のパスワードを入力してください。")
             );

        return v.validate();
    }
    
    /**
     * バリデーション
     * @return
     */
    private boolean validate(String password) {
        Validators v = new Validators(request);

        // パスワード と 確認用パスワードの相関チェック
        v.add("passwordConfirmation",
            new PasswordConfirmationValidator(password, "入力したパスワードが異なります。<br />もう一度確認用パスワードをご入力ください。")
             );

        return v.validate();
    }
}
