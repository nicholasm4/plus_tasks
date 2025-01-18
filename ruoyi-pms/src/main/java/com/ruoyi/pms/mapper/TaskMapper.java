package com.ruoyi.pms.mapper;

import com.ruoyi.pms.common.BasePmsMapper;
import com.ruoyi.pms.domain.ProjectTask;
import com.ruoyi.pms.dto.task.TaskListVm;
import com.ruoyi.pms.dto.task.TaskUpdatePlanDm;
import com.ruoyi.pms.dto.task.TaskUpdateSortNumDm;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface TaskMapper extends BasePmsMapper<ProjectTask>
{
    void batchUpdate(@Param("list") List<TaskUpdatePlanDm> list);
    void batchUpdateSortNum(@Param("list") List<TaskUpdateSortNumDm> list);
    List<TaskListVm> listTask(@Param("projectId") String projectId,@Param("taskId") String taskId);

    Long countTask(@Param("userId")Long userId, @Param("type")String type);
}
