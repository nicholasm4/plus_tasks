package com.ruoyi.pms.service.imp;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.pms.domain.ProjectResources;
import com.ruoyi.pms.dto.resources.ProjectAddResourcesDm;
import com.ruoyi.pms.dto.resources.ProjectListManagerVm;
import com.ruoyi.pms.dto.resources.ProjectListResourcesVm;
import com.ruoyi.pms.mapper.ProjectResourcesMapper;
import com.ruoyi.pms.service.ResourcesService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.UUID;

@Service
public class ResourcesServiceImp implements ResourcesService {

    @Resource
    private ProjectResourcesMapper projectResourcesMapper;

    @Override
    public List<ProjectListResourcesVm> listResources() {
        return projectResourcesMapper.listResources();
    }

    @Override
    public ProjectListResourcesVm detailResources() {
        Long userId = SecurityUtils.getUserId();
        return projectResourcesMapper.detailResources(userId);
    }

    @Override
    public void addResources(ProjectAddResourcesDm dm) {
        ProjectResources projectResources = new ProjectResources();
        projectResources.setProjectId(dm.getProjectId());
        projectResources.setUserId(dm.getUserId());
        projectResources.setId(UUID.randomUUID().toString());
        projectResources.setIsManager(dm.getIsManager());
        projectResourcesMapper.insert(projectResources);
    }


    @Transactional(rollbackFor = Exception.class)
    @Override
    public void deleteManager(List<String> ids) {
        LambdaQueryWrapper<ProjectResources> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.in(ProjectResources::getId, ids);
        List<ProjectResources> projectManagers = projectResourcesMapper.selectList(queryWrapper);
        String projectId = projectManagers.get(0).getProjectId();

        projectResourcesMapper.deleteBatchIds(ids);
        LambdaQueryWrapper<ProjectResources> queryWrapper1 = new LambdaQueryWrapper<>();
        queryWrapper1.eq(ProjectResources::getProjectId, projectId);
        long count = projectResourcesMapper.selectCount(queryWrapper1);
        if (count < 1) {
            throw new RuntimeException("项目至少需要一个管理者");
        }
    }

    @Override
    public List<ProjectListManagerVm> listManager(String projectId) {
        Long userId = SecurityUtils.getUserId();
        List<ProjectListManagerVm> projectListManagerVms = projectResourcesMapper.listManager(projectId);
        //排除自己
        projectListManagerVms.removeIf(projectListManagerVm -> projectListManagerVm.getUserId().equals(userId));
        return projectListManagerVms;
    }

}
