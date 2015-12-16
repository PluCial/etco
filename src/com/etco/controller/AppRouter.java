package com.etco.controller;

import org.slim3.controller.router.RouterImpl;

/**
 * 公開部分ルーティング
 * addRoutingメソッドの順番変更は禁止！
 * @author takahara
 *
 */
public class AppRouter extends RouterImpl {

	public AppRouter() {
        
	    setPage();
	    
	}
	
	/**
     * ページの設定
     */
    private void setPage() {

        addRouting(
                "/\\+{siteId}",
                "/site/index?siteId={siteId}");
        addRouting(
            "/\\+{siteId}/{pageName}",
            "/site/sitePage?siteId={siteId}&pageName={pageName}");
    }

}
