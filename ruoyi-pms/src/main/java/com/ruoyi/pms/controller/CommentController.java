package com.ruoyi.pms.controller;

import com.ruoyi.pms.common.ResponseResult;
import com.ruoyi.pms.dto.comment.CommentListVm;
import com.ruoyi.pms.dto.comment.CommentSaveDm;
import com.ruoyi.pms.service.CommentService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author nicholasm4
 */
@RestController
@RequestMapping("/pms/comment")
public class CommentController {

    final
    CommentService commentService;

    public CommentController(CommentService commentService) {
        this.commentService = commentService;
    }


    @PreAuthorize("@ss.hasPermi('pms:project:save')")
    @PostMapping("/saveComment")
    public ResponseResult<Void> saveComment(@RequestBody CommentSaveDm dm)  {
        commentService.saveComment(dm);
        return ResponseResult.success();
    }


    @PreAuthorize("@ss.hasPermi('pms:project:list')")
    @GetMapping("/listComment")
    public ResponseResult<List<CommentListVm>> listComment(@RequestParam("moduleId") String moduleId) {
        return ResponseResult.success(commentService.listComment(moduleId));
    }


    @PreAuthorize("@ss.hasPermi('pms:project:delete')")
    @PostMapping("/deleteComment")
    public ResponseResult<Void> deleteComment(@RequestBody List<String> ids) {
        commentService.deleteComment(ids);
        return ResponseResult.success();
    }


}
