package com.ruoyi.pms.dto.calendar;

import io.swagger.v3.oas.annotations.media.Schema;

public class WorkWeekListVm {
    @Schema(description = "id")
    private String id;
    @Schema(description = "日历Id")
    private String calendarId;
    @Schema(description = "星期几")
    private Long weekDay;
    @Schema(description = "描述")
    private String description;
    @Schema(description = "是否工作日")
    private String isWorkday;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setCalendarId(String calendarId) {
        this.calendarId = calendarId;
    }

    public String getCalendarId() {
        return calendarId;
    }

    public void setWeekDay(Long weekDay) {
        this.weekDay = weekDay;
    }

    public Long getWeekDay() {
        return weekDay;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }

    public void setIsWorkday(String isWorkday) {
        this.isWorkday = isWorkday;
    }

    public String getIsWorkday() {
        return isWorkday;
    }
}
