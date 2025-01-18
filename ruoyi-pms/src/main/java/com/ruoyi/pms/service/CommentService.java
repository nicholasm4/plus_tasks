package com.ruoyi.pms.service;

import com.ruoyi.pms.dto.calendar.ExceptionDateListVm;
import com.ruoyi.pms.dto.comment.CommentListVm;
import com.ruoyi.pms.dto.comment.CommentSaveDm;
import com.ruoyi.pms.dto.resources.ProjectAddResourcesDm;
import com.ruoyi.pms.dto.resources.ProjectListManagerVm;
import com.ruoyi.pms.dto.resources.ProjectListResourcesVm;

import java.util.List;

public interface CommentService  {


    void saveComment(CommentSaveDm dm);

    List<CommentListVm> listComment(String moduleId);

    void deleteComment(List<String> ids);
}
