package com.ruoyi.pms.mapper;

import com.ruoyi.pms.common.BasePmsMapper;
import com.ruoyi.pms.domain.ProjectDynamics;
import com.ruoyi.pms.domain.ProjectProgress;
import com.ruoyi.pms.dto.dynamics.DynamicsListVm;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ProjectDynamicsMapper extends BasePmsMapper<ProjectDynamics>
{


    List<DynamicsListVm> getProjectDynamics(@Param("projectId") String projectId);
}
