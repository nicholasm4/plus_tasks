package com.ruoyi.pms.service.imp;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.pms.common.ResponsePaged;
import com.ruoyi.pms.domain.*;
import com.ruoyi.pms.dto.project.*;
import com.ruoyi.pms.mapper.*;
import com.ruoyi.pms.service.ProjectService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
public class ProjectServiceImp implements ProjectService {

    @Resource
    private ProjectMapper projectMapper;

    @Resource
    private TaskMapper taskMapper;

    @Resource
    private ProjectResourcesMapper projectResourcesMapper;
    @Resource
    private CalendarMapper calendarMapper;
    @Resource
    private CalendarWorkWeekMapper calendarWorkWeekMapper;

    @Resource
    ProjectProgressMapper projectProgressMapper;


    @Override
    public ResponsePaged<ProjectPageVm> page(ProjectPageDm dm) {
        Long userId = SecurityUtils.getUserId();
        IPage<ProjectPageVm> classInfoIPage = this.projectMapper.pageProject(new Page<>(dm.getPageNum(), dm.getPageSize()), dm, userId);
        ResponsePaged<ProjectPageVm> page = new ResponsePaged<>();
        page.setPageCount(classInfoIPage.getPages());
        page.setTotal(classInfoIPage.getTotal());
        page.setRows(classInfoIPage.getRecords());
        return page;
    }

    @Override
    public ProjectDetailVm detail(String id) {
        ProjectDetailVm projectDetailVm = this.projectMapper.detailProject(id);
        List<String> projectMembers = this.projectMapper.getProjectMembers(id);
        //projectMembers转为字符串用逗号分割
        projectDetailVm.setProjectMembers(String.join(",", projectMembers));
        return projectDetailVm;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void save(ProjectSaveDm dm) throws Exception {
        if (StringUtils.hasText(dm.getId())) {
            updateProject(dm);
        } else {
            addProject(dm);
        }
        saveProjectProgress(dm.getId());
    }

    private void saveProjectProgress(String projectId) {
        ProjectProgress projectProgress = projectProgressMapper.selectById(projectId);
        if (projectProgress == null) {
            projectProgress = new ProjectProgress();
            projectProgress.setId(projectId);
            projectProgress.setProgress(0);
            Date date = new Date();
            projectProgress.setProgressUpdateTime(date);
            projectProgress.setTaskUpdateTime(date);
            projectProgressMapper.insert(projectProgress);
        } else {
            projectProgress.setTaskUpdateTime(new Date());
            projectProgressMapper.updateById(projectProgress);
        }
    }


    private void addProject(ProjectSaveDm dm) {
        Long userId = SecurityUtils.getUserId();
        String username = SecurityUtils.getUsername();
        Project project = new Project();
        project.setUserId(userId);
        project.setId(UUID.randomUUID().toString());
        project.setProjectName(dm.getProjectName());
        project.setDescription(dm.getDescription());
        project.setProjectStatus("0");
        project.setIsVisibility(dm.getIsVisibility());
        project.setIsArchived("0");
        project.setIsDeleted("0");
        projectMapper.insert(project);
        //添加日历
        addProjectCalendar(project);

        //添加自己为管理者
        ProjectResources projectManager = new ProjectResources();
        projectManager.setId(UUID.randomUUID().toString());
        projectManager.setProjectId(project.getId());
        projectManager.setUserId(userId);
        projectManager.setIsManager("1");
        projectResourcesMapper.insert(projectManager);

    }


    private void updateProject(ProjectSaveDm dm) throws Exception {
        Project project = projectMapper.selectById(dm.getId());
        if (project == null) {
            throw new Exception("项目不存在");
        }
        project.setProjectName(dm.getProjectName());
        project.setDescription(dm.getDescription());
        project.setIsVisibility(dm.getIsVisibility());
        projectMapper.updateById(project);
        //添加日历
        addProjectCalendar(project);
    }

    private void addProjectCalendar(Project project) {


        LambdaQueryWrapper<Calendar> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Calendar::getId, project.getId());

        if (calendarMapper.selectCount(queryWrapper) > 0) {
            return;
        }

        Calendar calendar = new Calendar();
        calendar.setId(project.getId());
        calendar.setCalendarName(project.getProjectName());
        calendar.setCalendarType("项目日历");
        calendar.setCalendarType("1");
        calendarMapper.insert(calendar);

        String[] weekdays = {"星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"};
        List<CalendarWorkWeek> calendarWorkWeeks = new ArrayList<>();
        for (int i = 0; i <= 6; i++) {
            CalendarWorkWeek calendarWorkWeek = new CalendarWorkWeek();
            calendarWorkWeek.setCalendarId(calendar.getId());
            calendarWorkWeek.setWeekDay((long) i);
            calendarWorkWeek.setDescription(weekdays[i]);
            if (i == 0 || i == 6) {
                calendarWorkWeek.setIsWorkday("0");
            } else {
                calendarWorkWeek.setIsWorkday("1");
            }
            calendarWorkWeek.setId(UUID.randomUUID().toString());
            calendarWorkWeeks.add(calendarWorkWeek);
        }
        calendarWorkWeekMapper.insertBatchSomeColumn(calendarWorkWeeks);
    }

    @Override
    public void delete(List<String> ids) {
        projectMapper.deleteBatchIds(ids);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void operate(ProjectOperateDm dm) {
        Long userId = SecurityUtils.getUserId();

        //判断用户是否管理者
        LambdaQueryWrapper<ProjectResources> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(ProjectResources::getProjectId, dm.getProjectId()).eq(ProjectResources::getUserId, userId);
        long count = projectResourcesMapper.selectCount(queryWrapper);
        if (count == 0) {
            throw new RuntimeException("您不是该项目的管理者");
        }
        Project project = projectMapper.selectById(dm.getProjectId());
        switch (dm.getOperate()) {
            case "1":
                //发布项目
                project.setProjectStatus("1");
                break;
            case "2":
                //退出管理
                LambdaQueryWrapper<ProjectResources> queryWrapper1 = new LambdaQueryWrapper<>();
                queryWrapper1.eq(ProjectResources::getProjectId, dm.getProjectId()).ne(ProjectResources::getUserId, userId);
                int i = projectResourcesMapper.delete(queryWrapper1);
                //验证是否唯一的管理者
                LambdaQueryWrapper<ProjectResources> queryWrapper2 = new LambdaQueryWrapper<>();
                queryWrapper2.eq(ProjectResources::getProjectId, dm.getProjectId());
                long count2 = projectResourcesMapper.selectCount(queryWrapper2);
                if (count2 < 1)
                    throw new RuntimeException("您是该项目的唯一管理者，不能退出管理");
                break;
            case "3":
                //归档项目
                project.setIsArchived("1");
                break;
            case "4":
                //删除项目
                project.setIsDeleted("1");
                break;
            case "5":
                //删除项目
                project.setIsDeleted("0");
                break;
        }
        projectMapper.updateById(project);
    }

    @Override
    public WorkStationCountVm getWorkStationCount() {
        WorkStationCountVm workStationCountVm = new WorkStationCountVm();
        Long userId = SecurityUtils.getUserId();

        workStationCountVm.setProjectsParticipated(projectMapper.countProject(userId, "1"));
        workStationCountVm.setProjectsCompleted(projectMapper.countProject(userId, "2"));
        workStationCountVm.setProjectsPending(projectMapper.countProject(userId, "3"));

        workStationCountVm.setTasksCompleted(taskMapper.countTask(userId, "1"));
        workStationCountVm.setTasksPending(taskMapper.countTask(userId, "2"));
        workStationCountVm.setTasksOverdue(taskMapper.countTask(userId, "3"));

        return workStationCountVm;

    }
}
