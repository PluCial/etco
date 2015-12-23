package com.etco.enums;

import org.slim3.datastore.SortCriterion;

import com.etco.meta.SitePageMeta;

/**
 * テキストリソース役割
 * <pre>
 * 追加や変更の場合は必ずTextResourcesService 内のUpdateも合わせて修正
 * </pre>
 * @author takahara
 *
 */
public enum ListItemType {
    T001_001(SitePageMeta.get().sortOrder.asc, SitePageMeta.get().createDate.asc)
    ,T001_002(SitePageMeta.get().createDate.desc)
    ,T001_003(SitePageMeta.get().sortOrder.asc, SitePageMeta.get().createDate.asc);
    
    private SortCriterion[] sortCriterion;

    private ListItemType(SortCriterion... sortCriterion) {
        this.setSortCriterion(sortCriterion);
    }

    public SortCriterion[] getSortCriterion() {
        return sortCriterion;
    }

    public void setSortCriterion(SortCriterion[] sortCriterion) {
        this.sortCriterion = sortCriterion;
    }

    
}
