package com.ruoyi.pms.service;

import com.ruoyi.pms.common.ResponsePaged;
import com.ruoyi.pms.dto.calendar.*;
import com.ruoyi.pms.dto.project.ProjectDetailVm;
import com.ruoyi.pms.dto.project.ProjectPageDm;
import com.ruoyi.pms.dto.project.ProjectPageVm;
import com.ruoyi.pms.dto.project.ProjectSaveDm;

import javax.annotation.Resource;
import java.text.ParseException;
import java.util.List;

public interface CalendarService {


    ProjectCalendarInfoVm getProjectCalendarInfo(String projectId) throws Exception;
    List<WorkWeekListVm> getWorkWeeklist(String calendarId);

    List<WorkDateListVm> getWorkDatelist(String calendarId);

    List<ExceptionDateListVm> getExceptionDatelist(String calendarId);

    List<WorkTimeListVm> getWorkTimelist(String calendarId);

    void saveWorkWeek(WorkWeekSaveDm dm) throws Exception;

    void saveWorkDate(WorkDateSaveDm dm);

    void saveExceptionDate(ExceptionDateSaveDm dm);

    void saveWorkTime(WorkTimeSaveDm dm) throws ParseException;

    void deleteWorkDate(List<String> ids);

    void deleteExceptionDate(List<String> ids);

    void deleteWorkTime(List<String> ids);


}
