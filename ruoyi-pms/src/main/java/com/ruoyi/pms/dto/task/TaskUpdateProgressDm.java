package com.ruoyi.pms.dto.task;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class TaskUpdateProgressDm {


    /** 项目ID */
    private String id;


    /** 进度 */
    private int progress;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getProgress() {
        return progress;
    }

    public void setProgress(int progress) {
        this.progress = progress;
    }
}
