package com.etco.controller.user.account;

import org.slim3.controller.Navigation;
import org.slim3.controller.validator.Validators;

import com.etco.enums.PageRole;
import com.etco.model.User;
import com.etco.service.PageService;

public class AddSitePageEntryController extends BaseController {

    @Override
    protected Navigation execute(User user) throws Exception {
        
        // 入力チェック
        if (!isPost() || !validate()) {
            return forward("/user/account/addSitePage.jsp");
        }
        
        // ------------------------------------------
        // リクエストパラメーターの取得
        // ------------------------------------------
        String pageName = asString("pageName");
        String pageRole = asString("pageRole");
        
        
        // ------------------------------------------
        // ページの追加
        // ------------------------------------------
        PageService.add(user, pageName, PageRole.valueOf(pageRole));

        return redirect("/+" + user.getSiteId());
    }
    
    /**
     * バリデーション
     * @return
     */
    private boolean validate() {
        Validators v = new Validators(request);

        v.add("pageName", 
            v.required("サイト名を入力してください。"), 
            v.maxlength(10, "サイトIDは10文字以上必要です。"));

        v.add("pageRole", 
            v.required("ページタイプを選択してください。")
                );
        
        return v.validate();
    }
}
