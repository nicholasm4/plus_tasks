package com.ruoyi.pms.dto.project;

import io.swagger.v3.oas.annotations.media.Schema;

public class ProjectPageDm {

    @Schema(description = "每页数量")
    private  Integer pageSize;
    @Schema(description = "每页码")
    private  Integer pageNum;
    @Schema(description = "项目名称")
    private  String projectName;

    @Schema(description = "项目状态")
    private  String projectStatus;
    @Schema(description = "开始时间")
    private String startDate;
    @Schema(description = "结束时间")
    private String endDate;

    @Schema(description = "sql条件查询时需要用到的类型做判断")
    private String type;

    @Schema(description = "任务名称")
    private String taskName;
    @Schema(description = "任务状态")
    private String taskStatus;
    @Schema(description = "项目ID")
    private String projectId;

    public void setTaskName(String taskName) {
        this.taskName = taskName;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    public void setTaskStatus(String taskStatus) {
        this.taskStatus = taskStatus;
    }

    public String getTaskName() {
        return taskName;
    }

    public String getTaskStatus() {
        return taskStatus;
    }

    public String getProjectId() {
        return projectId;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getPageNum() {
        return pageNum;
    }

    public void setPageNum(Integer pageNum) {
        this.pageNum = pageNum;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getProjectStatus() {
        return projectStatus;
    }

    public void setProjectStatus(String projectStatus) {
        this.projectStatus = projectStatus;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "ProjectPageDm{" +
                "pageSize=" + pageSize +
                ", pageNum=" + pageNum +
                ", projectName='" + projectName + '\'' +
                ", projectStatus='" + projectStatus + '\'' +
                ", startDate='" + startDate + '\'' +
                ", endDate='" + endDate + '\'' +
                ", type='" + type + '\'' +
                ", taskName='" + taskName + '\'' +
                ", taskStatus='" + taskStatus + '\'' +
                ", projectId='" + projectId + '\'' +
                '}';
    }
}
