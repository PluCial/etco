package com.etco.controller.user;

import org.slim3.controller.Navigation;
import org.slim3.util.StringUtil;

import com.etco.enums.EntryType;
import com.etco.exception.NoContentsException;
import com.etco.model.Entry;
import com.etco.service.ResetPasswordEntryService;
import com.etco.service.SignupEntryService;

public class EntryCompleteController extends BaseController {

    @Override
    protected Navigation execute() throws Exception {
        String entryId = asString("entryId");
        String type = asString("type");
        
        if(StringUtil.isEmpty(entryId) || StringUtil.isEmpty(type)) {
            throw new NoContentsException();
        }
        
        // エントリータイプの設定
        EntryType entryType = null;
        try {
            entryType = EntryType.valueOf(type);
            
        }catch(Exception e) {
            throw new NoContentsException();
        }
        
        Entry entry = null;
        
        
        // DBからエントリー情報を取得
        if(entryType == EntryType.REGISTER) {
            entry = SignupEntryService.getByKey(entryId);

        }else if(entryType == EntryType.RESET_PASSWORD) {
            entry = ResetPasswordEntryService.getByKey(entryId);
            
        }else {
            throw new NoContentsException();
        }
        
        if(entry == null) throw new NoContentsException();
        
        return redirect(entryType.getRedirectPath() + "?entryId=" + entryId);
    }
}
