package com.ruoyi.pms.dto.task;

import java.util.ArrayList;
import java.util.List;

public class TaskBurnDownChartDataVm {

    // x轴数据
    List<String> xAxisData = new ArrayList<>();

    // 实际进度
    List<Integer> actualProgressData = new ArrayList<>();

    // 实际进度
    List<Integer> plannedProgressData = new ArrayList<>();

    // 预测进度
    List<Integer> predictingProgress  = new ArrayList<>();

    public List<String> getxAxisData() {
        return xAxisData;
    }


    Integer actualProgress =0;
    Integer planProgress =0;
    Integer  progressDeterioration =0;

    public void setxAxisData(List<String> xAxisData) {
        this.xAxisData = xAxisData;
    }

    public List<Integer> getActualProgressData() {
        return actualProgressData;
    }

    public void setActualProgressData(List<Integer> actualProgressData) {
        this.actualProgressData = actualProgressData;
    }

    public List<Integer> getPlannedProgressData() {
        return plannedProgressData;
    }

    public void setPlannedProgressData(List<Integer> plannedProgressData) {
        this.plannedProgressData = plannedProgressData;
    }

    public List<Integer> getPredictingProgress() {
        return predictingProgress;
    }

    public void setPredictingProgress(List<Integer> predictingProgress) {
        this.predictingProgress = predictingProgress;
    }

    public Integer getActualProgress() {
        return actualProgress;
    }

    public void setActualProgress(Integer actualProgress) {
        this.actualProgress = actualProgress;
    }

    public Integer getPlanProgress() {
        return planProgress;
    }

    public void setPlanProgress(Integer planProgress) {
        this.planProgress = planProgress;
    }

    public Integer getProgressDeterioration() {
        return progressDeterioration;
    }

    public void setProgressDeterioration(Integer progressDeterioration) {
        this.progressDeterioration = progressDeterioration;
    }
}
