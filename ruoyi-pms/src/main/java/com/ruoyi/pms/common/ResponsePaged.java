package com.ruoyi.pms.common;



import java.util.List;


/**
 * @author nicholasm4
 */
public class ResponsePaged<T> {
    public ResponsePaged() {

    }
    public ResponsePaged(int total, long pageCount, List<T> rows) {
        this.total = total;
        this.pageCount = pageCount;
        this.rows = rows;
    }
    /**
     * 总记录数
     */

    private long total;
    /**
     * 总页数
     */

    private long pageCount;
    /**
     * 分页数据
     */

    private List<T> rows;

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
    }

    public long getPageCount() {
        return pageCount;
    }

    public void setPageCount(long pageCount) {
        this.pageCount = pageCount;
    }

    public List<T> getRows() {
        return rows;
    }

    public void setRows(List<T> rows) {
        this.rows = rows;
    }

    @Override
    public String toString() {
        return "ResponsePaged{" +
                "total=" + total +
                ", pageCount=" + pageCount +
                ", rows=" + rows +
                '}';
    }
}
