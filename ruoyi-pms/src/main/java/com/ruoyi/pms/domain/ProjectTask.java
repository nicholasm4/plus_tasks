package com.ruoyi.pms.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import com.ruoyi.pms.common.BasePmsEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

 
import java.util.Date;

@TableName(value = "pms_project_task")
public class ProjectTask extends BasePmsEntity
{
    /** 项目ID */
    private String id;

    /** 前置任务ID */
    private String  predecessorId;

    /** 任务Id */

    private String projectId;

    /** 项目名称 */

    private String taskName;


    private Double sortNum;

    /** 创建者ID */

    private Long userId;

    /** 指派用户ID */
    private Long  assignUserId;

    /** 项目类型 */

    private String taskType;

    /** 任务状态 */

    private String taskStatus;

    /** 开始日期 */

    private Date startDate;

    /** 结束日期 */

    private Date  endDate;

    /** 描述 */

    private String description;

    /** 前置任务Id */

    private String pId;

    /** 工期 */
    private Double duration;

    /** 进度 */
    private int progress;


    public void setId(String id)
    {
        this.id = id;
    }

    public String getId()
    {
        return id;
    }
    public void setProjectId(String projectId)
    {
        this.projectId = projectId;
    }

    public String getProjectId()
    {
        return projectId;
    }
    public void setTaskName(String taskName)
    {
        this.taskName = taskName;
    }

    public String getTaskName()
    {
        return taskName;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public void setTaskType(String taskType)
    {
        this.taskType = taskType;
    }

    public String getTaskType()
    {
        return taskType;
    }
    public void setTaskStatus(String taskStatus)
    {
        this.taskStatus = taskStatus;
    }

    public String getTaskStatus()
    {
        return taskStatus;
    }
    public void setStartDate(Date  startDate)
    {
        this.startDate = startDate;
    }

    public Date  getStartDate()
    {
        return startDate;
    }
    public void setEndDate(Date  endDate)
    {
        this.endDate = endDate;
    }

    public Date  getEndDate()
    {
        return endDate;
    }
    public void setDescription(String description)
    {
        this.description = description;
    }

    public String getDescription()
    {
        return description;
    }
    public void setpId(String pId)
    {
        this.pId = pId;
    }

    public String getpId()
    {
        return pId;
    }


    public Double getSortNum() {
        return sortNum;
    }

    public void setSortNum(Double sortNum) {
        this.sortNum = sortNum;
    }

    public Long getAssignUserId() {
        return assignUserId;
    }

    public void setAssignUserId(Long assignUserId) {
        this.assignUserId = assignUserId;
    }

    public String getPredecessorId() {
        return predecessorId;
    }

    public void setPredecessorId(String predecessorId) {
        this.predecessorId = predecessorId;
    }

    public Double getDuration() {
        return duration;
    }

    public void setDuration(Double duration) {
        this.duration = duration;
    }

    public int getProgress() {
        return progress;
    }

    public void setProgress(int progress) {
        this.progress = progress;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("predecessorId", getPredecessorId())
                .append("projectId", getProjectId())
                .append("taskName", getTaskName())
                .append("userId", getUserId())
                .append("assignUserId", getAssignUserId())
                .append("duration", getDuration())
                .append("progress", getProgress())
                .append("sortNum", getSortNum())
                .append("taskType", getTaskType())
                .append("taskStatus", getTaskStatus())
                .append("startDate", getStartDate())
                .append("endDate", getEndDate())
                .append("description", getDescription())
                .append("pId", getpId())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .toString();
    }
}
