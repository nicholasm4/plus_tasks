package com.ruoyi.pms.dto.task;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;

import java.util.Date;

public class TaskUpdatePlanDm {

    @Schema(description = "项目Id")
    private  String id;
    @Schema(description = "前置任务Id")
    private String  predecessorId;

    @Schema(description = "开始时间")
//    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private String  startDate;

    /** 结束日期 */
    @Schema(description = "结束日期")
//    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private String endDate;

    @Schema(description = "任务类型")
    private String taskType;
    @Schema(description = "工期")
    private Double duration;

    @Schema(description = "项目名称")
    private  String pId;


    private int progress;



    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPredecessorId() {
        return predecessorId;
    }

    public void setPredecessorId(String predecessorId) {
        this.predecessorId = predecessorId;
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

    public String getTaskType() {
        return taskType;
    }

    public void setTaskType(String taskType) {
        this.taskType = taskType;
    }

    public Double getDuration() {
        return duration;
    }

    public void setDuration(Double duration) {
        this.duration = duration;
    }

    public String getpId() {
        return pId;
    }

    public void setpId(String pId) {
        this.pId = pId;
    }

    public int getProgress() {
        return progress;
    }

    public void setProgress(int progress) {
        this.progress = progress;
    }
}
