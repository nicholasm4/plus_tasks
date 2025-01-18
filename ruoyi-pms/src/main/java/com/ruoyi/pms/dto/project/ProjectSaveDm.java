package com.ruoyi.pms.dto.project;

 
import java.util.Date;

public class ProjectSaveDm {


    /** 项目ID */
    private String id;

    /** 项目名称 */

    private String projectName;

    /** 备注信息 */

    private String description;


    /** 开始时间 */
    private Date startDate;

    /** 结束时间 */
    private Date  endDate;

    private String isVisibility;



    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date  getStartDate() {
        return startDate;
    }

    public void setStartDate(Date  startDate) {
        this.startDate = startDate;
    }

    public Date  getEndDate() {
        return endDate;
    }

    public void setEndDate(Date  endDate) {
        this.endDate = endDate;
    }


    public String getIsVisibility() {
        return isVisibility;
    }

    public void setIsVisibility(String isVisibility) {
        this.isVisibility = isVisibility;
    }
}
