package com.ruoyi.pms.service.imp;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.ruoyi.pms.domain.CalendarExceptionDate;
import com.ruoyi.pms.domain.CalendarWorkTime;
import com.ruoyi.pms.domain.CalendarWorkWeek;
import com.ruoyi.pms.domain.CalendarWorkDate;
import com.ruoyi.pms.dto.calendar.*;
import com.ruoyi.pms.mapper.*;
import com.ruoyi.pms.service.CalendarService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.concurrent.atomic.AtomicInteger;

@Service
public class CalendarServiceImp implements CalendarService {

    @Resource
    private CalendarMapper calendarMapper;
    @Resource
    private CalendarWorkWeekMapper calendarWorkWeekMapper;

    @Resource
    private CalendarWorkDateMapper calendarWorkDateMapper;

    @Resource
    private CalendarWorkTimeMapper calendarWorkTimeMapper;
    @Resource
    private CalendarExceptionDateMapper calendarExceptionDateMapper;

    SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");

    @Override
    public ProjectCalendarInfoVm getProjectCalendarInfo(String calendarId) {


        List<Date> exceptionDates = new ArrayList<>();
        List<Date> workDates = new ArrayList<>();
        List<Long> workWeeks = new ArrayList<>();

        List<Long> startTimes = new ArrayList<>();
        List<Long> endTimes = new ArrayList<>();


        int workHoursPerDay = 8;

        //假日列表
        List<WorkDateListVm> workDateListVmList = getWorkDatelist(calendarId);
        workDateListVmList.forEach(workDateListVm -> {
            Date startDate = workDateListVm.getStartDate();
            Date endDate = workDateListVm.getEndDate();
            //获取 startDate 至  endDate 之间的所有日期 存到  workDays
            while (startDate.getTime() <= endDate.getTime()) {
                startDate.setHours(0);
                startDate.setMinutes(0);
                startDate.setSeconds(0);
                workDates.add(startDate);
                startDate = new Date(startDate.getTime() + 24 * 60 * 60 * 1000);
            }
        });
        List<ExceptionDateListVm> workExceptionDateListVmList = getExceptionDatelist(calendarId);
        workExceptionDateListVmList.forEach(exceptionDateListVm -> {
            Date startDate = exceptionDateListVm.getStartDate();
            Date endDate = exceptionDateListVm.getEndDate();
            while (startDate.getTime() <= endDate.getTime()) {
                startDate.setHours(0);
                startDate.setMinutes(0);
                startDate.setSeconds(0);
                exceptionDates.add(startDate);
                startDate = new Date(startDate.getTime() + 24 * 60 * 60 * 1000);
            }
        });
        exceptionDates.removeAll(workDates);

        //工作周
        List<WorkWeekListVm> workWeekListVmList = getWorkWeeklist(calendarId);
        workWeekListVmList.forEach(workWeekListVm -> {
            if ("1".equals(workWeekListVm.getIsWorkday())) {
                workWeeks.add(workWeekListVm.getWeekDay());
            }
        });

        //工作时段内
        List<WorkTimeListVm> workTimeListVmList = getWorkTimelist(calendarId);




        if(workTimeListVmList.isEmpty()){
            WorkTimeListVm workTimeListVm1 = new WorkTimeListVm();
            //上午9点
            workTimeListVm1.setStartTime(new Time(9,0,0));
            //上午12点
            workTimeListVm1.setEndTime(new Time(12,0,0));
            workTimeListVmList.add(workTimeListVm1);

            WorkTimeListVm workTimeListVm2 = new WorkTimeListVm();
            //上午9点
            workTimeListVm2.setStartTime(new Time(13,0,0));
            //上午12点
            workTimeListVm2.setEndTime(new Time(18,0,0));
            workTimeListVmList.add(workTimeListVm2);

        }


        for(WorkTimeListVm workTimeListVm  :workTimeListVmList){
            long stime = workTimeListVm.getStartTime().getTime();
            long etime = workTimeListVm.getEndTime().getTime();
            long es = etime - stime;
            double hours = es / (3600 * 1000.0);
            workHoursPerDay += (int)hours;

            startTimes.add(workTimeListVm.getStartTime().getTime());
            endTimes.add(workTimeListVm.getEndTime().getTime());

//            List<Time> timeList = new ArrayList<>();
//            timeList.add(new Time(stime));
//            timeList.add(new Time(etime));
//            workTimes.add(timeList);
        }

        //获取 startHours 中最小的值
        startTimes.sort(Comparator.comparingLong(o -> o));
        //获取 endHours 中最大的值
        endTimes.sort(Comparator.comparingLong(o -> o));


        ProjectCalendarInfoVm projectCalendarInfoVm = new ProjectCalendarInfoVm();
        projectCalendarInfoVm.setExceptionDates(exceptionDates);
        projectCalendarInfoVm.setEndTime(new Time(startTimes.get(0)));
        projectCalendarInfoVm.setStartTime(new Time(endTimes.get(endTimes.size() - 1)));
        projectCalendarInfoVm.setWorkDates(workDates);
        projectCalendarInfoVm.setWorkWeeks(workWeeks);
        projectCalendarInfoVm.setWorkHoursPerDay(workHoursPerDay);
        projectCalendarInfoVm.setWorkTimes(workTimeListVmList);
//        if (workTimes.size() < 1) {
//            Map<String, Integer> map = new HashMap<>();
//            map.put("startHour", 9);
//            map.put("endHour", 12);
//            Map<String, Integer> map1 = new HashMap<>();
//            map1.put("startHour", 13);
//            map1.put("endHour", 18);
//            workTimes.add(map);
//            workTimes.add(map1);
//            projectCalendarInfoVm.setWorkHoursPerDay(8);
//            projectCalendarInfoVm.setEndHour(18);
//            projectCalendarInfoVm.setStartHour(9);
//        }


//        List<Date> ddddd = new ArrayList<>();
//        Date date = new Date();
//        date.setHours(0);
//        date.setMinutes(0);
//        date.setSeconds(0);
//        ddddd.add(date);
//
//        Date date2 = new Date();
//        date2.setHours(0);
//        date2.setMinutes(0);
//        date2.setSeconds(1);
//
//        boolean result = ddddd.contains(date2);


        return projectCalendarInfoVm;
    }

    @Override
    public List<WorkWeekListVm> getWorkWeeklist(String calendarId) {
        LambdaQueryWrapper<CalendarWorkWeek> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(CalendarWorkWeek::getCalendarId, calendarId);
        queryWrapper.orderByAsc(true, CalendarWorkWeek::getWeekDay);
        List<CalendarWorkWeek> calendarWorkWeekList = calendarWorkWeekMapper.selectList(queryWrapper);
        List<WorkWeekListVm> workWeekListVmList = new ArrayList<>();
        calendarWorkWeekList.forEach(calendarWorkWeek -> {
            WorkWeekListVm workWeekListVm = new WorkWeekListVm();
            workWeekListVm.setId(calendarWorkWeek.getId());
            workWeekListVm.setCalendarId(calendarWorkWeek.getCalendarId());
            workWeekListVm.setWeekDay(calendarWorkWeek.getWeekDay());
            workWeekListVm.setDescription(calendarWorkWeek.getDescription());
            workWeekListVm.setIsWorkday(calendarWorkWeek.getIsWorkday());
            workWeekListVmList.add(workWeekListVm);
        });

        return workWeekListVmList;
    }


    @Override
    public List<WorkDateListVm> getWorkDatelist(String calendarId) {
        LambdaQueryWrapper<CalendarWorkDate> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(CalendarWorkDate::getCalendarId, calendarId);
        List<CalendarWorkDate> calendarWorkDateList = calendarWorkDateMapper.selectList(queryWrapper);
        List<WorkDateListVm> workDateListVmList = new ArrayList<>();
        calendarWorkDateList.forEach(calendarWorkDate -> {
            WorkDateListVm workDateListVm = new WorkDateListVm();
            workDateListVm.setId(calendarWorkDate.getId());
            workDateListVm.setCalendarId(calendarWorkDate.getCalendarId());
            workDateListVm.setStartDate(calendarWorkDate.getStartDate());
            workDateListVm.setEndDate(calendarWorkDate.getEndDate());
            workDateListVm.setDescription(calendarWorkDate.getDescription());
            workDateListVmList.add(workDateListVm);
        });
        return workDateListVmList;
    }


    @Override
    public List<ExceptionDateListVm> getExceptionDatelist(String calendarId) {
        LambdaQueryWrapper<CalendarExceptionDate> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(CalendarExceptionDate::getCalendarId, calendarId);
        List<CalendarExceptionDate> calendarExceptionDateList = calendarExceptionDateMapper.selectList(queryWrapper);
        List<ExceptionDateListVm> exceptionDateListVmList = new ArrayList<>();

        calendarExceptionDateList.forEach(calendarExceptionDate -> {
            ExceptionDateListVm exceptionDateListVm = new ExceptionDateListVm();
            exceptionDateListVm.setId(calendarExceptionDate.getId());
            exceptionDateListVm.setCalendarId(calendarExceptionDate.getCalendarId());
            exceptionDateListVm.setStartDate(calendarExceptionDate.getStartDate());
            exceptionDateListVm.setEndDate(calendarExceptionDate.getEndDate());
            exceptionDateListVm.setDescription(calendarExceptionDate.getDescription());
            exceptionDateListVmList.add(exceptionDateListVm);
        });

        return exceptionDateListVmList;
    }

    @Override
    public List<WorkTimeListVm> getWorkTimelist(String calendarId) {
        LambdaQueryWrapper<CalendarWorkTime> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(CalendarWorkTime::getCalendarId, calendarId);
        List<CalendarWorkTime> calendarWorkTimeList = calendarWorkTimeMapper.selectList(queryWrapper);
        List<WorkTimeListVm> workTimeListVmList = new ArrayList<>();
        calendarWorkTimeList.forEach(calendarWorkTime -> {
            WorkTimeListVm workDateListVm = new WorkTimeListVm();
            workDateListVm.setId(calendarWorkTime.getId());
            workDateListVm.setCalendarId(calendarWorkTime.getCalendarId());
            workDateListVm.setStartTime(calendarWorkTime.getStartTime());
            workDateListVm.setEndTime(calendarWorkTime.getEndTime());
            workDateListVm.setDescription(calendarWorkTime.getDescription());
            workTimeListVmList.add(workDateListVm);
        });
        return workTimeListVmList;

    }

    @Override
    public void saveWorkWeek(WorkWeekSaveDm dm) throws Exception {
        CalendarWorkWeek calendarWorkWeek = calendarWorkWeekMapper.selectById(dm.getId());
        if (calendarWorkWeek == null) {
            throw new Exception("数据不存在");
        }
        calendarWorkWeek.setIsWorkday(dm.getIsWorkday());
        calendarWorkWeekMapper.updateById(calendarWorkWeek);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void saveWorkDate(WorkDateSaveDm dm) {
        if (StringUtils.hasText(dm.getId())) {
            updateWorkDate(dm);
        } else {
            addWorkDate(dm);
        }
    }

    private void addWorkDate(WorkDateSaveDm dm) {
        CalendarWorkDate calendarWorkDate = new CalendarWorkDate();
        calendarWorkDate.setId(UUID.randomUUID().toString());
        calendarWorkDate.setCalendarId(dm.getCalendarId());
        calendarWorkDate.setStartDate(dm.getStartDate());
        calendarWorkDate.setEndDate(dm.getEndDate());
        calendarWorkDate.setDescription(dm.getDescription());
        calendarWorkDateMapper.insert(calendarWorkDate);
    }

    private void updateWorkDate(WorkDateSaveDm dm) {
        CalendarWorkDate calendarWorkDate = calendarWorkDateMapper.selectById(dm.getId());
        if (calendarWorkDate == null) {
            throw new RuntimeException("数据不存在");
        }
        calendarWorkDate.setStartDate(dm.getStartDate());
        calendarWorkDate.setEndDate(dm.getEndDate());
        calendarWorkDate.setDescription(dm.getDescription());
        calendarWorkDateMapper.updateById(calendarWorkDate);
    }


    @Override
    public void saveWorkTime(WorkTimeSaveDm dm) throws ParseException {


        //判断开始时间是否大于结束时间
        if (dm.getStartTime().compareTo(dm.getEndTime()) > 0) {
            throw new RuntimeException("开始时间不能大于结束时间");
        }


        if (StringUtils.hasText(dm.getId())) {
            updateWorkTime(dm);
        } else {
            addWorkTime(dm);
        }
    }


    private void updateWorkTime(WorkTimeSaveDm dm) throws ParseException {
        CalendarWorkTime calendarWorkTime = calendarWorkTimeMapper.selectById(dm.getId());
        if (calendarWorkTime == null) {
            throw new RuntimeException("数据不存在");
        }
        Time startTime = getTime(dm.getStartTime());
        calendarWorkTime.setStartTime(startTime);
        Time endTime = getTime(dm.getEndTime());
        calendarWorkTime.setEndTime(endTime);
        calendarWorkTime.setDescription(dm.getDescription());
        calendarWorkTimeMapper.updateById(calendarWorkTime);
    }


    private Time getTime(String timeStr) throws ParseException {
        Date date = sdf.parse(timeStr);
        Time time = new Time(date.getTime());
        return time;
    }


    private void addWorkTime(WorkTimeSaveDm dm) throws ParseException {
        CalendarWorkTime calendarWorkTime = new CalendarWorkTime();
        calendarWorkTime.setId(UUID.randomUUID().toString());
        calendarWorkTime.setCalendarId(dm.getCalendarId());
        Time startTime = getTime(dm.getStartTime());
        calendarWorkTime.setStartTime(startTime);
        Time endTime = getTime(dm.getEndTime());
        calendarWorkTime.setEndTime(endTime);
        calendarWorkTime.setDescription(dm.getDescription());
        calendarWorkTimeMapper.insert(calendarWorkTime);
    }

    @Override
    public void saveExceptionDate(ExceptionDateSaveDm dm) {
        if (StringUtils.hasText(dm.getId())) {
            updateExceptionDate(dm);
        } else {
            addExceptionDate(dm);
        }
    }

    private void addExceptionDate(ExceptionDateSaveDm dm) {
        CalendarExceptionDate calendarExceptionDate = new CalendarExceptionDate();
        calendarExceptionDate.setId(UUID.randomUUID().toString());
        calendarExceptionDate.setCalendarId(dm.getCalendarId());
        calendarExceptionDate.setStartDate(dm.getStartDate());
        calendarExceptionDate.setEndDate(dm.getEndDate());
        calendarExceptionDate.setDescription(dm.getDescription());
        calendarExceptionDateMapper.insert(calendarExceptionDate);
    }

    private void updateExceptionDate(ExceptionDateSaveDm dm) {
        CalendarExceptionDate calendarExceptionDate = calendarExceptionDateMapper.selectById(dm.getId());
        if (calendarExceptionDate == null) {
            throw new RuntimeException("数据不存在");
        }
        calendarExceptionDate.setStartDate(dm.getStartDate());
        calendarExceptionDate.setEndDate(dm.getEndDate());
        calendarExceptionDate.setDescription(dm.getDescription());
        calendarExceptionDateMapper.updateById(calendarExceptionDate);
    }

    @Override
    public void deleteWorkDate(List<String> ids) {
        calendarWorkDateMapper.deleteBatchIds(ids);
    }

    @Override
    public void deleteExceptionDate(List<String> ids) {
        calendarExceptionDateMapper.deleteBatchIds(ids);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteWorkTime(List<String> ids) {
        LambdaQueryWrapper<CalendarWorkTime> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.in(CalendarWorkTime::getId, ids);
        List<CalendarWorkTime> calendarWorkTimes = calendarWorkTimeMapper.selectList(queryWrapper);

        calendarWorkTimeMapper.deleteBatchIds(ids);

        LambdaQueryWrapper<CalendarWorkTime> queryWrapper1 = new LambdaQueryWrapper<>();
        queryWrapper1.in(CalendarWorkTime::getCalendarId, calendarWorkTimes.get(0).getCalendarId());
        Long count = calendarWorkTimeMapper.selectCount(queryWrapper1);
        if (count < 1) {
            throw new RuntimeException("必须保留一条记录");
        }

    }
}
