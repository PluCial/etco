package com.etco.controller.user.account;

import org.slim3.controller.Navigation;
import org.slim3.controller.validator.Validators;

import com.etco.enums.Template;
import com.etco.model.User;
import com.etco.service.UserService;
import com.etco.validator.NGValidator;

public class SettingTemplateEntryController extends BaseController {

    @Override
    protected Navigation execute(User user) throws Exception {
        
        // 入力チェック
        if (!validate()) {
            return forward("/user/account/settingTemplate.jsp");
        }
        
        // ------------------------------------------
        // リクエストパラメーターの取得
        // ------------------------------------------
        String temp = asString("template");
        
        
        // ------------------------------------------
        // siteId重複チェック
        // ------------------------------------------
        try {
            Template template = Template.valueOf(temp);
            
            // ------------------------------------------
            // サイト情報の登録の設定
            // ------------------------------------------
            UserService.settingTemplate(user, template);
            
            
        } catch (Exception e) {
            Validators v = new Validators(request);
            v.add("template", new NGValidator("Template IDが正しくありません。"));
            v.validate();
            return forward("/user/account/settingTemplate.jsp");
        }
        
        

        return redirect("/+" + user.getSiteId());
    }
    
    /**
     * バリデーション
     * @return
     */
    private boolean validate() {
        Validators v = new Validators(request);
        
        // template
        v.add("template", 
            v.required("テンプレートIDを入力してください。"));
        
        return v.validate();
    }
}
