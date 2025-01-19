package com.ruoyi.pms.dto.project;

public class WorkStationCountVm {

    //参加过的所有项目
    private Long projectsParticipated;
    //已完成的项目数量
    private Long projectsCompleted;
    //未完成的项目数量
    private Long projectsPending;

    //已经完成的项目任务
    private Long tasksCompleted;
    //待办项目任务
    private Long tasksPending;
    //逾期项目任务
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

  @Override
  public String toString() {
      return "WorkStationCountVm{" +
              "projectsParticipated=" + projectsParticipated +
              ", projectsCompleted=" + projectsCompleted +
              ", projectsPending=" + projectsPending +
              ", tasksCompleted=" + tasksCompleted +
              ", tasksPending=" + tasksPending +
              ", tasksOverdue=" + tasksOverdue +
              '}';
    }
}
