package com.ruoyi.pms.controller;

import com.ruoyi.pms.common.ResponseResult;
import com.ruoyi.pms.dto.task.*;
import com.ruoyi.pms.service.CalendarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.pms.dto.calendar.*;
import com.ruoyi.pms.service.CalendarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.util.List;

@RestController
@RequestMapping("/pms/calendar")
public class CalendarController {

    @Autowired
    CalendarService calendarService;

    @PreAuthorize("@ss.hasPermi('pms:project:detail')")
    @GetMapping("/getWorkWeeklist")
    public ResponseResult<List<WorkWeekListVm>> getWorkWeeklist(@RequestParam("calendarId") String calendarId) {
        return   ResponseResult.success(calendarService.getWorkWeeklist(calendarId))  ;
    }
    @PreAuthorize("@ss.hasPermi('pms:project:detail')")
    @GetMapping("/getWorkDatelist")
    public ResponseResult<List<WorkDateListVm>> getWorkDatelist(@RequestParam("calendarId") String calendarId) {
        return ResponseResult.success(calendarService.getWorkDatelist(calendarId));
    }

    @PreAuthorize("@ss.hasPermi('pms:project:detail')")
    @GetMapping("/getWorkTimelist")
    public ResponseResult<List<WorkTimeListVm>> getWorkTimelist(@RequestParam("calendarId") String calendarId) {
        return ResponseResult.success(calendarService.getWorkTimelist(calendarId));
    }

    @PreAuthorize("@ss.hasPermi('pms:project:detail')")
    @GetMapping("/getExceptionDatelist")
    public ResponseResult<List<ExceptionDateListVm>> getExceptionDatelist(@RequestParam("calendarId") String calendarId) {
        return ResponseResult.success(calendarService.getExceptionDatelist(calendarId));
    }
    @PreAuthorize("@ss.hasPermi('pms:project:save')")
    @PostMapping("/saveWorkWeek")
    public ResponseResult<Void> saveWorkWeek(@RequestBody WorkWeekSaveDm dm) throws Exception {
        calendarService.saveWorkWeek(dm);
        return ResponseResult.success();
    }
    @PreAuthorize("@ss.hasPermi('pms:project:save')")
    @PostMapping("/saveWorkDate")
    public ResponseResult<Void> saveWorkDate(@RequestBody WorkDateSaveDm dm) {
        calendarService.saveWorkDate(dm);
        return ResponseResult.success();
    }

    @PreAuthorize("@ss.hasPermi('pms:project:save')")
    @PostMapping("/saveWorkTime")
    public ResponseResult<Void> saveWorkTime(@RequestBody WorkTimeSaveDm dm) throws ParseException {
        calendarService.saveWorkTime(dm);
        return ResponseResult.success();
    }
    @PreAuthorize("@ss.hasPermi('pms:project:save')")
    @PostMapping("/saveExceptionDate")
    public ResponseResult<Void> saveExceptionDate(@RequestBody ExceptionDateSaveDm dm) {
        calendarService.saveExceptionDate(dm);
        return ResponseResult.success();
    }
    @PreAuthorize("@ss.hasPermi('pms:project:delete')")
    @PostMapping("/deleteWorkDate")
    public ResponseResult<Void> deleteWorkDate(@RequestBody List<String> ids) {
        calendarService.deleteWorkDate(ids);
        return ResponseResult.success();
    }


    @PreAuthorize("@ss.hasPermi('pms:project:delete')")
    @PostMapping("/deleteWorkTime")
    public ResponseResult<Void> deleteWorkTime(@RequestBody List<String> ids) {
        calendarService.deleteWorkTime(ids);
        return ResponseResult.success();
    }

    @PreAuthorize("@ss.hasPermi('pms:project:delete')")
    @PostMapping("/deleteExceptionDate")
    public ResponseResult<Void> deleteExceptionDate(@RequestBody List<String> ids) {
        calendarService.deleteExceptionDate(ids);
        return ResponseResult.success();
    }

}
