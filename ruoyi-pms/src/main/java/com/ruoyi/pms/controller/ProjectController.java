package com.ruoyi.pms.controller;

import com.ruoyi.pms.common.ResponsePaged;
import com.ruoyi.pms.common.ResponseResult;
import com.ruoyi.pms.dto.project.*;
import com.ruoyi.pms.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author nicholasm4
 */
@RestController
@RequestMapping("/pms/project")
public class ProjectController {


    @Autowired
    ProjectService projectService;

    @PreAuthorize("@ss.hasPermi('pms:project:list')")
    @GetMapping("/page")
    @ResponseBody
    public ResponseResult<ResponsePaged<ProjectPageVm>> page(@ModelAttribute ProjectPageDm dm) {
//        dm.setType("5");
        if(dm.getType() == null){
            dm.setType("1");
        }
        System.out.println("传入后端的参数为(ProjectPageDm)：" + dm);
        ResponsePaged<ProjectPageVm>  data = projectService.page(dm);
        System.out.println("准备响应给前端的数据为(ResponsePaged<ProjectPageVm>)：" + data);
        return ResponseResult.success(data);
    }


    @PreAuthorize("@ss.hasPermi('pms:project:list')")
    @GetMapping("/getWorkStationCount")
    @ResponseBody
    public ResponseResult<WorkStationCountVm> getWorkStationCount() {
        WorkStationCountVm  data =  projectService.getWorkStationCount();
        System.out.println("准备响应给前端的数据为(WorkStationCountVm)：" + data);
        return ResponseResult.success(data);
    }



    @PreAuthorize("@ss.hasPermi('pms:project:detail')")
    @GetMapping("/detail")
    @ResponseBody
    public ResponseResult<ProjectDetailVm>  detail(@RequestParam String id) {
        return ResponseResult.success(projectService.detail(id));
    }

    @PreAuthorize("@ss.hasPermi('pms:project:save')")
    @PostMapping("/save")
    @ResponseBody
    public ResponseResult<Void> save(@RequestBody ProjectSaveDm dm) throws Exception {
        projectService.save(dm);
        return ResponseResult.success();
    }

    @PreAuthorize("@ss.hasPermi('pms:project:delete')")
    @PostMapping("/delete")
    @ResponseBody
    public ResponseResult<Void> delete(@RequestBody List<String> ids) {
        projectService.delete(ids);
        return ResponseResult.success();
    }

    @PreAuthorize("@ss.hasPermi('pms:project:save')")
    @PostMapping("/operate")
    @ResponseBody
    public ResponseResult<Void> operate(@RequestBody ProjectOperateDm dm) {
        projectService.operate(dm);
        return ResponseResult.success();
    }


    //操作项目


}
