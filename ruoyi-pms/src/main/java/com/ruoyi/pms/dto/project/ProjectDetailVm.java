package com.ruoyi.pms.dto.project;

 
import java.util.Date;
import java.util.List;

public class ProjectDetailVm {

    /** 项目ID */
    private String id;

    /** 项目名称 */

    private String projectName;

    /** 备注信息 */

    private String description;

    /** 创建者ID */

    private String userId;

    /** 项目状态 */

    private String projectStatus;

    private String isVisibility;

    private String isArchived;

    private String isDeleted;

    private String  projectMembers;

    private String projectManagers;

    private String userName;

    private Date startDate;

    private Date endDate;

    private String progress;

    private String duration;


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
    public void setUserId(String userId)
    {
        this.userId = userId;
    }

    public String getUserId()
    {
        return userId;
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


    public String getProjectManagers() {
        return projectManagers;
    }

    public void setProjectManagers(String projectManagers) {
        this.projectManagers = projectManagers;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getProjectMembers() {
        return projectMembers;
    }

    public void setProjectMembers(String projectMembers) {
        this.projectMembers = projectMembers;
    }

    public String getProgress() {
        return progress;
    }

    public void setProgress(String progress) {
        this.progress = progress;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }
}
