package com.ruoyi.pms.service.imp;

import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.pms.domain.ProjectDynamics;
import com.ruoyi.pms.dto.calendar.WorkWeekListVm;
import com.ruoyi.pms.dto.dynamics.DynamicsListVm;
import com.ruoyi.pms.mapper.ProjectDynamicsMapper;
import com.ruoyi.pms.service.DynamicsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class DynamicsServiceImp implements DynamicsService {

    @Resource
    ProjectDynamicsMapper projectDynamicsMapper;
    @Override
    public void save(String projectId,String content) {
        String name = SecurityUtils.getLoginUser().getUser().getNickName();

        ProjectDynamics projectDynamics = new ProjectDynamics();
        projectDynamics.setProjectId(projectId);
        projectDynamics.setContent(name+content);
        projectDynamicsMapper.insert(projectDynamics);
    }

    @Override
    public List<DynamicsListVm> getProjectDynamics(String projectId) {

        List<DynamicsListVm> dynamicsListVms = projectDynamicsMapper.getProjectDynamics(projectId);

        return dynamicsListVms;
    }
}
