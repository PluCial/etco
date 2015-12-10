package com.etco.controller.user.account;

import org.slim3.controller.Navigation;
import org.slim3.controller.validator.Validators;

import com.etco.exception.ObjectNotExistException;
import com.etco.model.User;
import com.etco.service.UserService;
import com.etco.validator.NGValidator;

public class SettingSiteInfoEntryController extends BaseController {

    @Override
    protected Navigation execute(User user) throws Exception {
        
        // 入力チェック
        if (!isPost() || !validate()) {
            return forward("/user/account/settingSiteInfo.jsp");
        }
        
        // ------------------------------------------
        // リクエストパラメーターの取得
        // ------------------------------------------
        String siteId = asString("siteId");
        String siteName = asString("name");
        
        
        // ------------------------------------------
        // siteId重複チェック
        // ------------------------------------------
        try {
            UserService.getBySiteId(siteId);
            
            // Spot Id 重複エラー
            Validators v = new Validators(request);
            v.add("spotId", new NGValidator("このスポットIDは既に利用されています。"));
            v.validate();
            return forward("/client/account/addSpotStep1.jsp");
            
        } catch (ObjectNotExistException e) {}
        
        // ------------------------------------------
        // サイト情報の登録の設定
        // ------------------------------------------
        UserService.settingSiteInfo(user, siteId, siteName);

        return redirect("/user/account/settingTemplate");
    }
    
    /**
     * バリデーション
     * @return
     */
    private boolean validate() {
        Validators v = new Validators(request);
        
        // サイトId
        v.add("siteId", 
            v.required("サイトIDを入力してください。"), 
            v.minlength(5, "サイトIDは5文字以上必要です。"),
            v.regexp("^[a-z0-9_-]+$", "スポットIDで使用できる文字は半角英語(小文字)、0〜9の数字、[-]、[_]のみです。"));
        
        // サイト名
        v.add("name", 
            v.required("サイト名"),
            v.maxlength(20, "サイト名は20文字までです。")
                );
        
        return v.validate();
    }
}
