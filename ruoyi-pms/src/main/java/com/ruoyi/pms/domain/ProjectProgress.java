package com.ruoyi.pms.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.Date;

@TableName(value = "pms_project_progress")
public class ProjectProgress {

    /**
     * 项目ID
     */
    private String id;

    /**
     * 项目名称
     */

    private int progress;

    private double duration;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date startDate;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date endDate;


    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date progressUpdateTime;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date taskUpdateTime;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getProgress() {
        return progress;
    }

    public void setProgress(int progress) {
        this.progress = progress;
    }

    public Date getProgressUpdateTime() {
        return progressUpdateTime;
    }

    public void setProgressUpdateTime(Date progressUpdateTime) {
        this.progressUpdateTime = progressUpdateTime;
    }

    public Date getTaskUpdateTime() {
        return taskUpdateTime;
    }

    public void setTaskUpdateTime(Date taskUpdateTime) {
        this.taskUpdateTime = taskUpdateTime;
    }


    public double getDuration() {
        return duration;
    }

    public void setDuration(double duration) {
        this.duration = duration;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("progress", getProgress())
                .append("startDate", getStartDate())
                .append("duration", getDuration())
                .append("endDate", getEndDate())
                .append("taskUpdateTime", getTaskUpdateTime())
                .append("progressUpdateTime", getProgressUpdateTime())
                .toString();
    }
}
