package com.etco.controller.user;

import org.slim3.controller.Navigation;
import org.slim3.controller.validator.Validators;

import com.etco.enums.EntryType;
import com.etco.exception.ObjectNotExistException;
import com.etco.model.SignupEntry;
import com.etco.service.EMailService;
import com.etco.service.SignupEntryService;
import com.etco.service.UserService;
import com.etco.validator.NGValidator;
import com.etco.validator.PasswordConfirmationValidator;
import com.google.apphosting.api.ApiProxy.ArgumentException;

public class RegisterEntryController extends BaseController {

    @Override
    protected Navigation execute() throws Exception {
        // 入力チェック
        if (!isPost() || !validate()) {
            return forward("/user/register");
        }
        
        String name = asString("name");
        String email = asString("email");
        String password = asString("password");
        
        // メール重複チェック & パスワード確認入力チェック
        if (!validate(email, password)) {
            return forward("/user/register");
        }
        
        // エントリーを保存
        SignupEntry entry = SignupEntryService.add(name, email, password);
        
        String registerUrl = super.getAccessDomeinUrl() + "/user/EntryComplete?type=" + EntryType.REGISTER.toString() + "&entryId=" + entry.getKey().getName();
        
        // メール確認フロー
        EMailService.register(email, name, registerUrl, isLocal());
        
        return redirect("/user/entryCompletion?type=" + EntryType.REGISTER.toString());
    }
    
    /**
     * バリデーション
     * @return
     */
    private boolean validate() {
        Validators v = new Validators(request);
        
        // 名前
        v.add("name", 
            v.required("名前を入力してください。")
             );

        // メール
        v.add("email", 
            v.required("メールアドレスを入力してください。"),
            v.maxlength(256, "メールアドレスが長すぎます。"), 
            v.minlength(6, "メールアドレスが短すぎます。"),
            v.regexp("\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*([,;]\\s*\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*)*", "メールアドレスが正しくありません。"));

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
        
        // 規約確認
        v.add("agreeTerms", 
            v.required("登録するには規約やプライバシーポリシーに同意して頂く必要があります。")
             );

        return v.validate();
    }
    
    /**
     * バリデーション
     * @return
     * @throws ArgumentException 
     */
    private boolean validate(String email, String password) {
        Validators v = new Validators(request);

        // パスワード と 確認用パスワードの相関チェック
        v.add("passwordConfirmation",
            new PasswordConfirmationValidator(password, "入力したパスワードが異なります。<br />もう一度確認用パスワードをご入力ください。")
             );
        
        try {
            // メールの重複チェック
            UserService.getByEmail(email);
            
            // 重複エラーを生成
            v.add("email", 
                new NGValidator("このメールアドレスは既に利用されています。<br />ログインをする場合はログイン画面をご利用ください。"));
        } catch (ObjectNotExistException e) {}

        return v.validate();
    }
}
