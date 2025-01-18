package com.ruoyi.pms.service.imp;

import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.pms.domain.Comment;
import com.ruoyi.pms.dto.calendar.ExceptionDateListVm;
import com.ruoyi.pms.dto.comment.CommentListVm;
import com.ruoyi.pms.dto.comment.CommentSaveDm;
import com.ruoyi.pms.dto.resources.ProjectAddResourcesDm;
import com.ruoyi.pms.dto.resources.ProjectListManagerVm;
import com.ruoyi.pms.dto.resources.ProjectListResourcesVm;
import com.ruoyi.pms.mapper.CommentMapper;
import com.ruoyi.pms.service.CommentService;
import com.ruoyi.pms.service.DynamicsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.UUID;

@Service
public class CommentServiceImp implements CommentService {

    @Resource
    private CommentMapper commentMapper;

    @Autowired
    DynamicsService dynamicsService;

    @Override
    public void saveComment(CommentSaveDm dm) {
        Long userId = SecurityUtils.getUserId();
        Comment comment = new Comment();
        comment.setContent(dm.getComment());
        comment.setModuleId(dm.getModuleId());
        comment.setUserId(userId);
        comment.setId(UUID.randomUUID().toString());
        commentMapper.insert(comment);
    }

    @Override
    public List<CommentListVm> listComment(String moduleId) {
        return commentMapper.listComment(moduleId);
    }

    @Override
    public void deleteComment(List<String> ids) {
        commentMapper.deleteBatchIds(ids);
    }
}
