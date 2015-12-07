package com.etco.controller.user;

import org.slim3.controller.Navigation;
import org.slim3.controller.validator.Validators;

import com.etco.enums.EntryType;
import com.etco.exception.ObjectNotExistException;
import com.etco.model.ResetPasswordEntry;
import com.etco.model.User;
import com.etco.service.EMailService;
import com.etco.service.ResetPasswordEntryService;
import com.etco.service.UserService;
import com.etco.validator.NGValidator;

public class ResetPasswordEntryController extends BaseController {

    @Override
    protected Navigation execute() throws Exception {
        // 入力チェック
        if (!isPost() || !validate()) {
            return forward("/user/resetPassword");
        }
        
        String email = asString("email");
        
        User user = null;
        try {
            user = UserService.getByEmail(email);
            
        } catch (ObjectNotExistException e) {
            // Email未登録の場合
            Validators v = new Validators(request);
            v.add("email", 
                new NGValidator("このメールアドレスは登録されていません。"));
            v.validate();
            
            return forward("/user/resetPassword");
        }
        
        // エントリーを保存
        ResetPasswordEntry entry = ResetPasswordEntryService.put(user);
        
        String entryUrl = super.getAccessDomeinUrl() + "/user/EntryComplete?type=" + EntryType.RESET_PASSWORD.toString() + "&entryId=" + entry.getKey().getName();
        
        // メール確認フロー
        EMailService.resetPassword(email, user.getName(), entryUrl, isLocal());
        
        return redirect("/user/entryCompletion?type=" + EntryType.RESET_PASSWORD.toString());
    }
    
    /**
     * バリデーション
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

        return v.validate();
    }
}
