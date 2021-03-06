package com.ios.kefu.common.pojo;

import java.io.Serializable;
import java.util.List;

public class SearchResult implements Serializable {

    private long recordCount;
    private int totalPages;

    public long getRecordCount() {
        return recordCount;
    }

    public void setRecordCount(long recordCount) {
        this.recordCount = recordCount;
    }

    public int getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(int totalPages) {
        this.totalPages = totalPages;
    }

    public List<SearchItem> getItemList() {
        return itemList;
    }

    public void setItemList(List<SearchItem> itemList) {
        this.itemList = itemList;
    }

    private List<SearchItem> itemList;
}
