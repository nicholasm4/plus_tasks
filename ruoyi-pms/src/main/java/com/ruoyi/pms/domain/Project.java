package com.ruoyi.pms.domain;

import java.util.Date;

import com.baomidou.mybatisplus.annotation.TableName;
import com.ruoyi.pms.common.BasePmsEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

@TableName(value = "pms_project")
public class Project extends BasePmsEntity
{

    /** 项目ID */
    private String id;

    /** 项目名称 */

    private String projectName;

    /** 备注信息 */

    private String description;

    /** 创建者ID */

    private Long userId;

    /** 项目状态 */

    private String projectStatus;

    private String isVisibility;

    private String isArchived;

    private String isDeleted;
    public void setId(String id)
    {
        this.id = id;
    }

    public String getId()
    {
        return id;
    }
    public void setProjectName(String projectName)
    {
        this.projectName = projectName;
    }

    public String getProjectName()
    {
        return projectName;
    }
    public void setDescription(String description)
    {
        this.description = description;
    }

    public String getDescription()
    {
        return description;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public void setProjectStatus(String projectStatus)
    {
        this.projectStatus = projectStatus;
    }

    public String getProjectStatus()
    {
        return projectStatus;
    }


    public String getIsVisibility() {
        return isVisibility;
    }

    public void setIsVisibility(String isVisibility) {
        this.isVisibility = isVisibility;
    }

    public String getIsArchived() {
        return isArchived;
    }

    public void setIsArchived(String isArchived) {
        this.isArchived = isArchived;
    }

    public String getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(String isDeleted) {
        this.isDeleted = isDeleted;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("projectName", getProjectName())
                .append("description", getDescription())
                .append("userId", getUserId())
                .append("projectStatus", getProjectStatus())
                .append("isVisibility", getIsVisibility())
                .append("isDeleted", getIsDeleted())
                .append("isArchived", getIsArchived())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .toString();
    }
}
