<template>
  <gantt-elastic :options="ganttOptions" :tasks="tasks">
    <gantt-header :options="ganttHeaderOptions"  slot="header"></gantt-header>
  </gantt-elastic>
</template>

<script>
import Vue from 'vue';
import GanttElastic from "gantt-elastic";
import GanttHeader from "gantt-elastic-header";
export default {
  name: 'PmsGantt',
  components: {GanttElastic,GanttHeader},
  props: {
    projectName: String,
    taskList: Array
  },
  data() {
    return {
      ganttHeaderOptions : {
        title: {
          label: "",
          html: false
        },
        locale: {
          Now: "现在",
          "X-Scale": "缩放-X",
          "Y-Scale": "缩放-Y",
          "Task list width": "任务列表",
          "Before/After": "展开",
          "Display task list": "显示任务列表"
        }
      },
      ganttOptions : {
        taskMapping: {
          progress: "percent"
        },
        scope:{
          before:15,
          after:15
        },
        times:{
          timeZoom:21
        },
        maxRows: 1000,
        maxHeight: 500,
        row: {
          height: 20
        },
        calendar: {
          hour: {
            display: false
          }
        },
        chart: {
          progress: {
            bar: true
          },
          expander: {
            display: true
          }
        },
        taskList: {
          expander: {
            straight: false
          },
          percent:100,
          columns: [
            {
              id: 0,
              label: "任务",
              value: "taskName",
              expander: true,
              width: 200,
              html: false,
            },
            {
              id: 1,
              label: "工期",
              value: "durationStr",
              percent: 0,
              width: 68,
              style: {
                "task-list-header-label": {
                  "text-align": "center",
                  width: "100%"
                },
                "task-list-item-value-container": {
                  "text-align": "center",
                  width: "100%"
                }
              }
            },
            {
              id: 2,
              label: "开始",
              value: "startDate",
              width: 78
            },
            {
              id: 3,
              label: "结束",
              value: "endDate",
              width: 78
            },
            {
              id: 4,
              label: "指派给",
              value: "user",
              width: 130,
              html: true
            },
            {
              id: 5,
              label: "%",
              value: "progress",
              width: 35,
              style: {
                "task-list-header-label": {
                  "text-align": "center",
                  width: "100%"
                },
                "task-list-item-value-container": {
                  "text-align": "center",
                  width: "100%"
                }
              }
            }
          ]
        },
        locale: {
          name: "en",
          Now: "Now",
          "X-Scale": "Zoom-X",
          "Y-Scale": "Zoom-Y",
          "Task list width": "Task list",
          "Before/After": "Expand",
          "Display task list": "Task list"
        }
      },
      tasks:[
        {
          id: "001",
          taskName: "权限管理",
          label: "85%",
          user:"",
          start: new Date(2024, 4, 1).getTime(),
          end:new Date(2024, 4, 3).getTime(),
          duration: 30 * 24 * 60 * 60 * 1000,
          durationStr: "3",
          percent: 85,
          type: "milestone",
          collapsed: false,
          style: {
            base: {
              fill: "#1EBC61",
              stroke: "#0EAC51"
            }
          }
        },
        {
          id: "002",
          taskName: "用户管理",
          label: "",
          user:"小明",
          parentId: "001",
          start: new Date(2024, 4, 1).getTime(),
          end:new Date(2024, 4, 1).getTime(),
          duration: 1 * 24 * 60 * 60 * 1000,
          durationStr: "1",
          percent: 50,
          type: "task"
        },
        {
          id: "003",
          label: "",
          user:"小明",
          taskName: "角色管理",
          parentId: "001",
          start: new Date(2024, 4, 2).getTime(),
          end:new Date(2024, 4, 2).getTime(),
          duration: 1 * 24 * 60 * 60 * 1000,
          durationStr: "1",
          percent: 100,
          type: "task",
          dependentOn: ["002"]
        },
        {
          id: "004",
          label: "",
          user:"小明",
          taskName: "权限管理",
          parentId: "001",
          start: new Date(2024, 4, 3).getTime(),
          end:new Date(2024, 4, 3).getTime(),
          duration: 1 * 24 * 60 * 60 * 1000,
          durationStr: "1",
          percent: 100,
          type: "task",
          dependentOn: ["003"]
        }
      ],
    }
  },
  computed: {

  },
  watch: {

  },
  created() {

  },
  mounted() {
    this.ganttHeaderOptions.title.label=this.projectName;
  },
  methods: {

  }
}

</script>

<style scoped lang="scss">

</style>
