package com.ruoyi.pms.dto.project;

public class WorkStationCountVm {

  //参与的项目
    private Long projectsParticipated;
    //完成的项目
    private Long projectsCompleted;
    //待完成项目
    private Long projectsPending;
    //完成的任务
    private Long tasksCompleted;
    //待完成任务
    private Long tasksPending;
    //逾期任务
    private Long tasksOverdue;


  public Long getProjectsParticipated() {
    return projectsParticipated;
  }

  public void setProjectsParticipated(Long projectsParticipated) {
    this.projectsParticipated = projectsParticipated;
  }

  public Long getProjectsCompleted() {
    return projectsCompleted;
  }

  public void setProjectsCompleted(Long projectsCompleted) {
    this.projectsCompleted = projectsCompleted;
  }

  public Long getProjectsPending() {
    return projectsPending;
  }

  public void setProjectsPending(Long projectsPending) {
    this.projectsPending = projectsPending;
  }

  public Long getTasksCompleted() {
    return tasksCompleted;
  }

  public void setTasksCompleted(Long tasksCompleted) {
    this.tasksCompleted = tasksCompleted;
  }

  public Long getTasksPending() {
    return tasksPending;
  }

  public void setTasksPending(Long tasksPending) {
    this.tasksPending = tasksPending;
  }

  public Long getTasksOverdue() {
    return tasksOverdue;
  }

  public void setTasksOverdue(Long tasksOverdue) {
    this.tasksOverdue = tasksOverdue;
  }
}
