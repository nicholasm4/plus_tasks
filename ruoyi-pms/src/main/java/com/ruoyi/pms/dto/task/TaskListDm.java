package com.ruoyi.pms.dto.task;

import io.swagger.v3.oas.annotations.media.Schema;

public class TaskListDm {

    @Schema(description = "项目Id")
    private  String projectId;

    @Schema(description = "项目名称")
    private  String taskName;

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
}
