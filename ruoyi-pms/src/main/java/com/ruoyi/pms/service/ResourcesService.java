package com.ruoyi.pms.service;

import com.ruoyi.pms.dto.resources.ProjectAddResourcesDm;
import com.ruoyi.pms.dto.resources.ProjectListManagerVm;
import com.ruoyi.pms.dto.resources.ProjectListResourcesVm;

import java.util.List;

public interface ResourcesService {
    List<ProjectListResourcesVm> listResources();

    ProjectListResourcesVm detailResources();

    void addResources(ProjectAddResourcesDm dm);

    void deleteManager(List<String> ids);

    List<ProjectListManagerVm> listManager(String projectId);


}
