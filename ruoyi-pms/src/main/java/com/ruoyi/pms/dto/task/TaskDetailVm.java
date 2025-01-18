package com.ruoyi.pms.dto.task;

 
import java.util.Date;

public class TaskDetailVm {
    /** 项目ID */
    private String id;

    private String  predecessorId;

    private Integer sortNum;

    /** 任务Id */

    private String projectId;

    /** 项目名称 */

    private String taskName;


    /** 任务类型 */

    private String taskType;


    /** 开始日期 */

    private Date startDate;

    /** 结束日期 */

    private Date  endDate;

    /** 描述 */

    private String description;


    /** 工期日期 */
    private Double duration;


    /** 前置任务Id */

    private String pId;

    private Long  assignUserId;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    public String getTaskName() {
        return taskName;
    }

    public void setTaskName(String taskName) {
        this.taskName = taskName;
    }

    public String getTaskType() {
        return taskType;
    }

    public void setTaskType(String taskType) {
        this.taskType = taskType;
    }

    public Date  getStartDate() {
        return startDate;
    }

    public void setStartDate(Date  startDate) {
        this.startDate = startDate;
    }

    public Date  getEndDate() {
        return endDate;
    }

    public void setEndDate(Date  endDate) {
        this.endDate = endDate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getpId() {
        return pId;
    }

    public void setpId(String pId) {
        this.pId = pId;
    }

    public Long getAssignUserId() {
        return assignUserId;
    }

    public void setAssignUserId(Long assignUserId) {
        this.assignUserId = assignUserId;
    }

    public Integer getSortNum() {
        return sortNum;
    }

    public void setSortNum(Integer sortNum) {
        this.sortNum = sortNum;
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
}
