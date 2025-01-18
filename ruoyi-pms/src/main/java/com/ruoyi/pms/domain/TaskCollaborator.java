package com.ruoyi.pms.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import com.ruoyi.pms.common.BasePmsEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

@TableName(value = "pms_project_task_collaborator")
public class TaskCollaborator extends BasePmsEntity
{

    /** 项目ID */
    private String id;

    /** 项目名称 */

    private String taskId;


    /** 创建者ID */

    private Long userId;



    public void setId(String id)
    {
        this.id = id;
    }

    public String getId()
    {
        return id;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }


    public String getTaskId() {
        return taskId;
    }

    public void setTaskId(String taskId) {
        this.taskId = taskId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("userId", getUserId())
                .append("taskId", getTaskId())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .toString();
    }
}
