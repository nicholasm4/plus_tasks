package com.ruoyi.pms.quartz;

import com.ruoyi.pms.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

@Component("pmsTask")
public class Task {

    @Autowired
    TaskService taskService;


    public void syncProjectProgress() {
//        taskService.updateProjectProgress();
    }

}
