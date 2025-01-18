package com.ruoyi.pms.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import com.ruoyi.pms.common.BasePmsEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;

/**
 * 日历工作周对象 pms_calendar_workweek
 *
 * @author ruoyi
 * @date 2024-04-20
 */
@TableName(value = "pms_calendar_work_week")
public class CalendarWorkWeek extends BasePmsEntity
{

    /** ID */
    private String id;

    /** 日历ID */
    @Excel(name = "日历ID")
    private String calendarId;

    /** 备注信息 */
    @Excel(name = "备注信息")
    private String description;

    /** 表示星期几，取值范围为1到7 */
    @Excel(name = "表示星期几，取值范围为1到7")
    private Long weekDay;

    /** 1表示工作日，0表示非工作日 */
    @Excel(name = "1表示工作日，0表示非工作日")
    private String isWorkday;

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
    public void setWeekDay(Long weekDay)
    {
        this.weekDay = weekDay;
    }

    public Long getWeekDay()
    {
        return weekDay;
    }
    public void setIsWorkday(String isWorkday)
    {
        this.isWorkday = isWorkday;
    }

    public String getIsWorkday()
    {
        return isWorkday;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("calendarId", getCalendarId())
                .append("description", getDescription())
                .append("weekDay", getWeekDay())
                .append("isWorkday", getIsWorkday())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .toString();
    }
}

