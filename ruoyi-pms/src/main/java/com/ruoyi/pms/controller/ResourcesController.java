package com.ruoyi.pms.controller;

import com.ruoyi.pms.common.ResponseResult;
import com.ruoyi.pms.dto.resources.ProjectAddResourcesDm;
import com.ruoyi.pms.dto.resources.ProjectListManagerVm;
import com.ruoyi.pms.dto.resources.ProjectListResourcesVm;
import com.ruoyi.pms.service.ResourcesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/pms/resources")
public class ResourcesController {

    @Autowired
    ResourcesService resourcesService;
    @PreAuthorize("@ss.hasPermi('pms:project:list')")
    @GetMapping("/listresources")
    @ResponseBody
    public ResponseResult<List<ProjectListResourcesVm>> listUser() throws Exception {
        List<ProjectListResourcesVm> data = resourcesService.listResources();
        return ResponseResult.success(data);
    }

    @PreAuthorize("@ss.hasPermi('pms:project:list')")
    @GetMapping("/detailresources")
    @ResponseBody
    public ResponseResult<ProjectListResourcesVm> detailUser() throws Exception {
        ProjectListResourcesVm data = resourcesService.detailResources();
        return ResponseResult.success(data);
    }


    @PreAuthorize("@ss.hasPermi('pms:project:save')")
    @PostMapping("/addManager")
    @ResponseBody
    public ResponseResult<Void> addManager(@RequestBody ProjectAddResourcesDm dm) throws Exception {
        dm.setIsManager("1");
        resourcesService.addResources(dm);
        return ResponseResult.success();
    }

    @PreAuthorize("@ss.hasPermi('pms:project:list')")
    @GetMapping("/listManager")
    @ResponseBody
    public ResponseResult<List<ProjectListManagerVm>> listManager(@RequestParam String projectId) {
        List<ProjectListManagerVm>  data =   resourcesService.listManager(projectId);
        return ResponseResult.success(data);
    }


    @PreAuthorize("@ss.hasPermi('pms:project:delete')")
    @PostMapping("/deleteManager")
    @ResponseBody
    public ResponseResult<Void> deleteManager(@RequestBody List<String> ids) {
        resourcesService.deleteManager(ids);
        return ResponseResult.success();
    }





}
