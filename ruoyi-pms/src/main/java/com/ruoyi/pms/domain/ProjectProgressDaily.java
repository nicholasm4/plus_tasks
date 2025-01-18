package com.ruoyi.pms.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.Date;

@TableName(value = "pms_project_progress_daily")
public class ProjectProgressDaily {

    /**
     * 项目ID
     */

    private String projectId;
    private String id;

    private int progress;

    private int quota;

    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date daily;


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

    public int getQuota() {
        return quota;
    }

    public void setQuota(int quota) {
        this.quota = quota;
    }

    public Date getDaily() {
        return daily;
    }

    public void setDaily(Date daily) {
        this.daily = daily;
    }


    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("quota", getQuota())
                .append("progress", getProgress())
                .append("daily", getDaily())
                .append("projectId", getProjectId())
                .toString();
    }
}
