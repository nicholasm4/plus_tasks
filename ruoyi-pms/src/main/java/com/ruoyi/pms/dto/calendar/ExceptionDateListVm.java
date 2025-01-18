package com.ruoyi.pms.dto.calendar;

import java.util.Date;

public class ExceptionDateListVm {
    private String id;
    private String calendarId;
    private Date startDate;
    private Date endDate;
    private String description;

    public void setId(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public void setCalendarId(String calendarId) {
        this.calendarId = calendarId;
    }

    public String getCalendarId() {
        return calendarId;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }
}
