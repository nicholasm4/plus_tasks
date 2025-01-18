package com.ruoyi.pms.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.pms.common.BasePmsEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.sql.Time;
import java.util.Date;

/**
 * 日历工作日期对象 pms_calendar_worktime
 *
 * @author ruoyi
 * @date 2024-04-20
 */
@TableName(value = "pms_calendar_work_time")
public class CalendarWorkTime extends BasePmsEntity
{

    /** ID */
    private String id;

    /** 日历Id */
    @Excel(name = "日历Id")
    private String calendarId;

    /** 备注信息 */
    @Excel(name = "备注信息")
    private String description;

    /** 开始时间 */
    @JsonFormat(pattern = "HH:mm:ss")
    @Excel(name = "开始时间", width = 30, dateFormat = "HH:mm:ss")
    private Time startTime;

    /** 结束时间 */
    @JsonFormat(pattern = "HH:mm:ss")
    @Excel(name = "结束时间", width = 30, dateFormat = "HH:mm:ss")
    private Time endTime;

    public void setId(String id)
    {
        this.id = id;
    }

    public String getId()
    {
        return id;
    }
    public void setCalendarId(String calendarId)
    {
        this.calendarId = calendarId;
    }

    public String getCalendarId()
    {
        return calendarId;
    }
    public void setDescription(String description)
    {
        this.description = description;
    }

    public String getDescription()
    {
        return description;
    }

    public Time getStartTime() {
        return startTime;
    }

    public void setStartTime(Time startTime) {
        this.startTime = startTime;
    }

    public Time getEndTime() {
        return endTime;
    }

    public void setEndTime(Time endTime) {
        this.endTime = endTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("calendarId", getCalendarId())
                .append("description", getDescription())
                .append("startTime", getStartTime())
                .append("endTime", getEndTime())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .toString();
    }
}
