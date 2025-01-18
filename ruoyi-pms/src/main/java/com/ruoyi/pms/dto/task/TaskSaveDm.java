package com.ruoyi.pms.dto.task;

import com.fasterxml.jackson.annotation.JsonFormat;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class TaskSaveDm {



    /** 项目ID */
    private String id;


    private String predecessorId;

    private Double sortNum;

    /** 任务Id */

    private String projectId;

    /** 项目名称 */

    private String taskName;


    /** 项目类型 */

    private String taskType;


    /** 开始日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date  startDate;

    /** 结束日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date endDate;

    /** 描述 */
    private String description;

    /** 前置任务Id */
    private String pId;

    /** 指派给 */
    private Long  assignUserId;

    /** 进度 */
    private int progress;

    /** 工期 */
    private Double duration;

    /** 协助者Id */
    private List<Long> collaboratorUserIds = new ArrayList<>();

    //
    private List<String> taskIds = new ArrayList<>();
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }


    public Double getSortNum() {
        return sortNum;
    }

    public void setSortNum(Double sortNum) {
        this.sortNum = sortNum;
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

    public String getPredecessorId() {
        return predecessorId;
    }

    public void setPredecessorId(String predecessorId) {
        this.predecessorId = predecessorId;
    }


    public int getProgress() {
        return progress;
    }

    public void setProgress(int progress) {
        this.progress = progress;
    }

    public List<Long> getCollaboratorUserIds() {
        return collaboratorUserIds;
    }

    public void setCollaboratorUserIds(List<Long> collaboratorUserIds) {
        this.collaboratorUserIds = collaboratorUserIds;
    }

    public List<String> getTaskIds() {
        return taskIds;
    }

    public void setTaskIds(List<String> taskIds) {
        this.taskIds = taskIds;
    }

    public Double getDuration() {
        return duration;
    }

    public void setDuration(Double duration) {
        this.duration = duration;
    }
}
