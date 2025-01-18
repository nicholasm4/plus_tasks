package com.ruoyi.pms.controller;

import com.ruoyi.pms.common.ResponseResult;
import com.ruoyi.pms.dto.calendar.*;
import com.ruoyi.pms.dto.dynamics.DynamicsListVm;
import com.ruoyi.pms.service.CalendarService;
import com.ruoyi.pms.service.DynamicsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.util.List;

@RestController
@RequestMapping("/pms/dynamics")
public class DynamicsController {



    @Autowired
    DynamicsService dynamicsService;
    @PreAuthorize("@ss.hasPermi('pms:project:list')")
    @GetMapping("/getProjectDynamics")
    public ResponseResult<List<DynamicsListVm>> getProjectDynamics(@RequestParam("projectId") String projectId) {
        return   ResponseResult.success(dynamicsService.getProjectDynamics(projectId))  ;
    }

}
