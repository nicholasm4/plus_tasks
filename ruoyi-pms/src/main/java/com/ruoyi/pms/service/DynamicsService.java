package com.ruoyi.pms.service;

import com.ruoyi.pms.dto.calendar.WorkWeekListVm;
import com.ruoyi.pms.dto.dynamics.DynamicsListVm;

import java.util.List;

public interface DynamicsService {

    void save(String projectId,String content);

    List<DynamicsListVm> getProjectDynamics(String projectId);
}
