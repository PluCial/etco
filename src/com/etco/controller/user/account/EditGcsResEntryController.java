package com.etco.controller.user.account;

import org.slim3.controller.Navigation;
import org.slim3.controller.upload.FileItem;
import org.slim3.controller.validator.Validators;

import com.etco.controller.user.account.BaseController;
import com.etco.model.ListItem;
import com.etco.model.SitePage;
import com.etco.model.User;
import com.etco.service.GcsResService;
import com.etco.service.ListItemService;
import com.etco.service.PageService;

public class EditGcsResEntryController extends BaseController {
    
    @Override
    protected Navigation execute(User user) throws Exception {
        // 入力チェック
        if (!isPost() || !validate()) {
            return forward("/user/account/editGcsRes.jsp");
        }
        
        // ---------------------------------------------------
        // リソース情報の取得
        // ---------------------------------------------------  
        String objectType = asString("objectType");
        // pageKey or listItemKey
        String parentKey = asString("parentKey");
        String resId = asString("resId");
        
        // ---------------------------------------------------
        // ファイル情報
        // ---------------------------------------------------  
        int imageX = asInteger("imageX");
        int imageY = asInteger("imageY");
        int imageWidth = asInteger("imageWidth");
        int imageHeight = asInteger("imageHeight");
        
        FileItem fileItem = requestScope("uploadImage");
        
        if(objectType.equals("page")) {
            
            SitePage sitePage = PageService.getByKey(parentKey);
            GcsResService.put(user, sitePage, resId, fileItem, imageX, imageY, imageWidth, imageHeight);
            
        }else if(objectType.equals("listItem")) {
            ListItem listItem = ListItemService.getByKey(parentKey);
            GcsResService.put(user, listItem, resId, fileItem, imageX, imageY, imageWidth, imageHeight);
        }
        
        return redirect("/+" + user.getSiteId());
    }
    
    /**
     * バリデーション
     * @return
     */
    private boolean validate() {
        Validators v = new Validators(request);

        v.add("objectType", v.required());
        v.add("parentKey", v.required());
        v.add("resId", v.required());
        
        // 画像
        v.add("uploadImage", v.required("アイテム画像を添付してください。"));
        v.add("imageX", v.required());
        v.add("imageY", v.required());
        v.add("imageWidth", v.required());
        v.add("imageHeight", v.required());
        
        return v.validate();
    }
}
