package com.ruoyi.pms.dto.task;

import io.swagger.v3.oas.annotations.media.Schema;

public class TaskUpdateSortNumDm {

    @Schema(description = "任务Id")
    private  String id;


    @Schema(description = "任务Id")
    private  String projectId;

    @Schema(description = "项目名称")
    private  Double sortNum;

    @Schema(description = "pId")
    private String pId;

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

    public String getpId() {
        return pId;
    }

    public void setpId(String pId) {
        this.pId = pId;
    }


    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }
}
