package com.ruoyi.pms.dto.calendar;

import java.sql.Time;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class ProjectCalendarInfoVm {
    //假日
    List<Date> exceptionDates = new ArrayList<>();

    //工作周
    List<Long> workWeeks = new ArrayList<>();


    List<Date> workDates = new ArrayList<>();

    //工作时间段 开始时间
    Time startTime ;

    //工作时间段 结束时间
    Time endTime ;

    //工作时间段
    List<WorkTimeListVm> workTimes = new ArrayList<>();



   int  workHoursPerDay;


    public List<Date> getExceptionDates() {
        return exceptionDates;
    }

    public void setExceptionDates(List<Date> exceptionDates) {
        this.exceptionDates = exceptionDates;
    }

    public List<Long> getWorkWeeks() {
        return workWeeks;
    }

    public void setWorkWeeks(List<Long> workWeeks) {
        this.workWeeks = workWeeks;
    }

    public List<WorkTimeListVm> getWorkTimes() {
        return workTimes;
    }

    public void setWorkTimes(List<WorkTimeListVm> workTimes) {
        this.workTimes = workTimes;
    }

    public List<Date> getWorkDates() {
        return workDates;
    }

    public void setWorkDates(List<Date> workDates) {
        this.workDates = workDates;
    }


    public int getWorkHoursPerDay() {
        return workHoursPerDay;
    }

    public void setWorkHoursPerDay(int workHoursPerDay) {
        this.workHoursPerDay = workHoursPerDay;
    }

    public Time getStartTime() {
        return startTime;
    }

    public void setStartTime(Time startTime) {
        this.startTime = startTime;
    }

    public Time getEndTime() {
        return endTime;
    }

    public void setEndTime(Time endTime) {
        this.endTime = endTime;
    }
}
