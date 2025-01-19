package com.ruoyi.pms.dto.project;


import java.util.Date;

public class ProjectPageVm {

    /** 项目ID */
    private String id;

    /** 项目名称 */

    private String projectName;

    /** 备注信息 */

    private String description;

    /** 创建者ID */

    private Long userId;

    private String userName;

    /** 项目状态 */

    private String projectStatus;

    private String taskCount;

    /** 开始时间 */
    private Date startDate;
    /** 结束时间 */
    private Date  endDate;

    private String projectManagers;

    private Integer progress;


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

    public void setProjectStatus(String projectStatus)
    {
        this.projectStatus = projectStatus;
    }

    public String getProjectStatus()
    {
        return projectStatus;
    }
    public void setStartDate(Date  startDate)
    {
        this.startDate = startDate;
    }

    public Date  getStartDate()
    {
        return startDate;
    }
    public void setEndDate(Date  endDate)
    {
        this.endDate = endDate;
    }

    public Date  getEndDate()
    {
        return endDate;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }


    public String getTaskCount() {
        return taskCount;
    }

    public void setTaskCount(String taskCount) {
        this.taskCount = taskCount;
    }

    public String getProjectManagers() {
        return projectManagers;
    }

    public void setProjectManagers(String projectManagers) {
        this.projectManagers = projectManagers;
    }


    public Integer getProgress() {
        return progress;
    }

    public void setProgress(Integer progress) {
        this.progress = progress;
    }


    @Override
    public String toString() {
        return "ProjectPageVm{" +
                "id='" + id + '\'' +
                ", projectName='" + projectName + '\'' +
                ", description='" + description + '\'' +
                ", userId=" + userId +
                ", userName='" + userName + '\'' +
                ", projectStatus='" + projectStatus + '\'' +
                ", taskCount='" + taskCount + '\'' +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                ", projectManagers='" + projectManagers + '\'' +
                ", progress=" + progress +
                '}';
    }
}
