package com.ruoyi.pms.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.pms.domain.Comment;
import com.ruoyi.pms.dto.comment.CommentListVm;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CommentMapper extends BaseMapper<Comment>
{

    List<CommentListVm> listComment(@Param("moduleId") String moduleId);
}
