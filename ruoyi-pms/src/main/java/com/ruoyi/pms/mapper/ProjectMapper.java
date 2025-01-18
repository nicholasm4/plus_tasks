package com.ruoyi.pms.mapper;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ruoyi.pms.common.BasePmsMapper;
import com.ruoyi.pms.dto.project.ProjectDetailVm;
import com.ruoyi.pms.dto.project.ProjectPageDm;
import com.ruoyi.pms.dto.project.ProjectPageVm;
import com.ruoyi.pms.domain.Project;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;


@Mapper
public interface ProjectMapper extends BasePmsMapper<Project>
{
    IPage<ProjectPageVm> pageProject(Page<Object> objectPage, @Param("query") ProjectPageDm ProjectPageDm, @Param("userId") Long userId);

    ProjectDetailVm detailProject(@Param("id") String id);


    Long countProject(@Param("userId") Long userId,@Param("type") String typ);


    List<String> getProjectMembers(@Param("projectId") String projectId);

}
