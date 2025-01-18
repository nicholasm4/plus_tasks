package com.ruoyi.pms.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.ruoyi.pms.common.*;

import com.ruoyi.pms.dto.task.*;

import com.ruoyi.pms.dto.task.TaskDetailVm;
import com.ruoyi.pms.dto.task.TaskListVm;
import com.ruoyi.pms.dto.task.TaskSaveDm;
import com.ruoyi.pms.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/pms/task")
public class TaskController {


    @Autowired
    TaskService taskService;

    @PreAuthorize("@ss.hasPermi('pms:project:list')")
    @GetMapping("/list")
    @ResponseBody
    public ResponseResult<List<TaskListVm>> list(@ModelAttribute TaskListDm dm) throws Exception {
        List<TaskListVm> data = taskService.list(dm);
        return ResponseResult.success(data);
    }


    @PreAuthorize("@ss.hasPermi('pms:project:list')")
    @GetMapping("/getTaskBurnDownChartData")
    @ResponseBody
    public ResponseResult<TaskBurnDownChartDataVm> getTaskBurnDownChartData(@RequestParam String projectId) throws Exception {
        TaskBurnDownChartDataVm data = taskService.getTaskBurnDownChartData(projectId);
        return ResponseResult.success(data);
    }

    @PreAuthorize("@ss.hasPermi('pms:project:detail')")
    @GetMapping("/detail")
    @ResponseBody
    public ResponseResult<TaskListVm> detail(@RequestParam String id) {
        return ResponseResult.success(taskService.detail(id));
    }

    @PreAuthorize("@ss.hasPermi('pms:project:save')")
    @PostMapping("/save")
    @ResponseBody
    public ResponseResult<Void> save(@RequestBody TaskSaveDm dm) throws Exception {
        taskService.save(dm);
        return ResponseResult.success();
    }


    @PreAuthorize("@ss.hasPermi('pms:project:save')")
    @PostMapping("/updateProgress")
    @ResponseBody
    public ResponseResult<Void> updateProgress(@RequestBody TaskUpdateProgressDm dm) throws Exception {
        taskService.updateProgress(dm);
        return ResponseResult.success();
    }

    @PreAuthorize("@ss.hasPermi('pms:project:save')")
    @PostMapping("/assignUser")
    @ResponseBody
    public ResponseResult<Void> assignUser(@RequestBody TaskAssignUserDm dm) throws Exception {
        taskService.assignUser(dm);
        return ResponseResult.success();
    }

    @PreAuthorize("@ss.hasPermi('pms:project:save')")
    @PostMapping("/updatesortnum")
    @ResponseBody
    public ResponseResult<Void> updateSortNum(@RequestBody List<TaskUpdateSortNumDm> dm) throws Exception {
        taskService.updateSortNum(dm);
//        TaskListDm dm1 = new TaskListDm();
//        dm1.setProjectId(dm.get(0).getProjectId());
//        List<TaskListVm> data = taskService.list(dm1);
        return ResponseResult.success();
    }


    @PreAuthorize("@ss.hasPermi('pms:project:delete')")
    @PostMapping("/delete")
    @ResponseBody
    public ResponseResult<Void> delete(@RequestBody List<String> ids) {
        taskService.delete(ids);
        return ResponseResult.success();
    }

}
