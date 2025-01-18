package com.ruoyi.pms.dto.task;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class TaskListVm {

    /**
     * 项目ID
     */
    private String id;


    private String predecessorId;

    private String predecessor;

    private Double sortNum;

    /**
     * 任务Id
     */

    private String projectId;

    /**
     * 项目名称
     */

    private String taskName;


    /**
     * 项目类型
     */

    private String taskType;

    /**
     * 任务状态
     */
    private String taskStatus;

    /**
     * 开始日期
     */

    private Date startDate;

    /**
     * 结束日期
     */

    private Date endDate;

    /**
     * 工期日期
     */
    private Double duration;

    /**
     * 描述
     */

    private String description;

    /**
     * 前置任务Id
     */

    private String pId;

    private Long assignUserId;


    private String assignUserName;

    private List<TaskListVm> child = new ArrayList<>();

    private List<TaskListVm> children = new ArrayList<>();

    private List<TaskCollaboratorUserVm> collaboratorUserList = new ArrayList<>();

    private int progress;

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

    public String getTaskStatus() {return taskStatus;}

    public void setTaskStatus(String taskStatus) { this.taskStatus = taskStatus;}

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

    public Double getSortNum() {
        return sortNum;
    }

    public void setSortNum(Double sortNum) {
        this.sortNum = sortNum;
    }


    public Double getDuration() {
        return duration;
    }

    public void setDuration(Double duration) {
        this.duration = duration;
    }


    public List<TaskListVm> getChildren() {
        return children;
    }

    public void setChildren(List<TaskListVm> children) {
        this.children = children;
    }

    public String getPredecessorId() {
        return predecessorId;
    }

    public void setPredecessorId(String predecessorId) {
        this.predecessorId = predecessorId;
    }


    public String getAssignUserName() {
        return assignUserName;
    }

    public void setAssignUserName(String assignUserName) {
        this.assignUserName = assignUserName;
    }

    public List<TaskListVm> getChild() {
        return child;
    }

    public void setChild(List<TaskListVm> child) {
        this.child = child;
    }


    public String getPredecessor() {
        return predecessor;
    }

    public void setPredecessor(String predecessor) {
        this.predecessor = predecessor;
    }

    public List<TaskCollaboratorUserVm> getCollaboratorUserList() {
        return collaboratorUserList;
    }

    public void setCollaboratorUserList(List<TaskCollaboratorUserVm> collaboratorUserList) {
        this.collaboratorUserList = collaboratorUserList;
    }

    public int getProgress() {
        return progress;
    }

    public void setProgress(int progress) {
        this.progress = progress;
    }
}
