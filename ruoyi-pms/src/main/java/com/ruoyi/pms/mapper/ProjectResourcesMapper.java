package com.ruoyi.pms.mapper;

import com.ruoyi.pms.common.BasePmsMapper;
import com.ruoyi.pms.domain.ProjectResources;
import com.ruoyi.pms.dto.resources.ProjectListManagerVm;
import com.ruoyi.pms.dto.resources.ProjectListResourcesVm;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;


@Mapper
public interface ProjectResourcesMapper extends BasePmsMapper<ProjectResources> {
    List<ProjectListResourcesVm> listResources();

    List<ProjectListManagerVm> listManager(@Param("projectId") String projectId);

    ProjectListResourcesVm detailResources(@Param("userId") Long userId);

}
