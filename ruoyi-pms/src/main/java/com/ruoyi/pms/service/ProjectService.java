package com.ruoyi.pms.service;

import com.ruoyi.pms.common.ResponsePaged;
import com.ruoyi.pms.dto.project.*;

import java.util.List;

public interface ProjectService {

    ResponsePaged<ProjectPageVm> page(ProjectPageDm dm);

    ProjectDetailVm detail(String id);

    void save(ProjectSaveDm dm) throws Exception;

    void delete(List<String> ids);

    void operate(ProjectOperateDm dm);

    WorkStationCountVm getWorkStationCount();
}
