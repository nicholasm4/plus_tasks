package com.ruoyi.pms.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import com.ruoyi.pms.common.BasePmsEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 日历对象 pms_calendar
 *
 * @author ruoyi
 * @date 2024-04-20
 */

@TableName(value = "pms_calendar")
public class Calendar extends BasePmsEntity
{

    /** 项目ID */
    private String id;

    /** 项目名称 */
    @Excel(name = "项目名称")
    private String calendarName;

    /** 备注信息 */
    @Excel(name = "备注信息")
    private String description;

    /** 日历类型1：基准日历  2：项目日历 3.：资源日历 */
    @Excel(name = "日历类型1：基准日历  2：项目日历 3.：资源日历")
    private String calendarType;

    public void setId(String id)
    {
        this.id = id;
    }

    public String getId()
    {
        return id;
    }
    public void setCalendarName(String calendarName)
    {
        this.calendarName = calendarName;
    }

    public String getCalendarName()
    {
        return calendarName;
    }
    public void setDescription(String description)
    {
        this.description = description;
    }

    public String getDescription()
    {
        return description;
    }
    public void setCalendarType(String calendarType)
    {
        this.calendarType = calendarType;
    }

    public String getCalendarType()
    {
        return calendarType;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("calendarName", getCalendarName())
                .append("description", getDescription())
                .append("calendarType", getCalendarType())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .toString();
    }
}
