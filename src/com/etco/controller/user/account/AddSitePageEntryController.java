package com.etco.controller.user.account;

import org.slim3.controller.Navigation;
import org.slim3.controller.validator.Validators;

import com.etco.exception.ObjectNotExistException;
import com.etco.model.User;
import com.etco.service.PageService;
import com.etco.validator.NGValidator;

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
        
        // ページ名の重複チェック
        try {
            PageService.getByName(user, pageName);
            
            Validators v = new Validators(request);
            v.add("pageName",
                new NGValidator("同じ名前のページはすでに存在します。"));
            v.validate();
            return forward("/user/account/addSitePage.jsp");
            
        }catch(ObjectNotExistException e) {}
        
        // ------------------------------------------
        // ページの追加
        // ------------------------------------------
        PageService.add(user, pageName, pageRole);

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
