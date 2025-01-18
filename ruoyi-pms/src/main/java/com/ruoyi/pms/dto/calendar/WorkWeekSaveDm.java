package com.ruoyi.pms.dto.calendar;

import java.io.Serializable;

public class WorkWeekSaveDm {
    private Serializable id;
    private String isWorkday;

    public Serializable getId() {
        return id;
    }

    public void setId(Serializable id) {
        this.id = id;
    }

    public String getIsWorkday() {
        return isWorkday;
    }

    public void setIsWorkday(String isWorkday) {
        this.isWorkday = isWorkday;
    }
}
