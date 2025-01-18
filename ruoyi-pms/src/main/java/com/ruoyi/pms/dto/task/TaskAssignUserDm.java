package com.ruoyi.pms.dto.task;

public class TaskAssignUserDm {
    private String taskId ;

    private Long assignUserId ;


    public String getTaskId() {
        return taskId;
    }

    public void setTaskId(String taskId) {
        this.taskId = taskId;
    }


    public Long getAssignUserId() {
        return assignUserId;
    }

    public void setAssignUserId(Long assignUserId) {
        this.assignUserId = assignUserId;
    }
}
