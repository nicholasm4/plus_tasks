package com.ruoyi.pms.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.ruoyi.pms.dto.task.*;

import java.util.HashMap;
import java.util.List;

public interface TaskService {
    List<TaskListVm> list(TaskListDm dm) throws Exception;

    void  updateProjectProgress(String projectId) throws Exception;

    TaskListVm detail(String id);

    void save(TaskSaveDm dm) throws Exception;

    void delete(List<String> ids);

    void updateSortNum(List<TaskUpdateSortNumDm> dm);

    void assignUser(TaskAssignUserDm dm) throws Exception;


    void updateProgress(TaskUpdateProgressDm dm) throws Exception;


     TaskBurnDownChartDataVm getTaskBurnDownChartData(String projectId) throws Exception;
}
