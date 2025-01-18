<template>
  <div class="app-overview">
    <el-tabs style="background: #F5F8FA" type="border-card" v-model="activeName" @tab-click="onTabClick">
      <el-tab-pane label="甘特图" name="first">
        <gantt-elastic
          v-if="tasks.length>0"
          :options="ganttOptions"
          :tasks="tasks">
          <gantt-header :options="ganttHeaderOptions" slot="header">
          </gantt-header>
        </gantt-elastic>
      </el-tab-pane>
      <el-tab-pane style=";width: 100%;" label="项目概览" name="second">

        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <span>项目信息</span>
          </div>
          <el-descriptions title="">
            <el-descriptions-item label="项目名称">{{projectInfo.projectName}}</el-descriptions-item>
            <el-descriptions-item label="项目负责人">{{projectInfo.userName}}</el-descriptions-item>
          </el-descriptions>
          <el-descriptions title="">
            <el-descriptions-item label="计划完成周期">{{projectInfo.startDate}} 至 {{projectInfo.endDate}}</el-descriptions-item>
            <el-descriptions-item label="工期">{{projectInfo.duration}}</el-descriptions-item>
          </el-descriptions>
          <el-descriptions title="">
            <el-descriptions-item label="项目管理员">
              {{projectInfo.projectManagers}}
            </el-descriptions-item>
          </el-descriptions>
          <el-descriptions title="">
            <el-descriptions-item label="项目成员">
              {{projectInfo.projectMembers}}
            </el-descriptions-item>
          </el-descriptions>
          <el-descriptions title="">
            <el-descriptions-item label="项目描述">
              {{projectInfo.description}}
            </el-descriptions-item>
          </el-descriptions>
        </el-card>

        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <span>项目概况</span>
          </div>

          <el-row :gutter="1">
            <el-col :span="10">
              <div class="project-info">
                <el-row type="flex" class="row-bg row-bg-1">
                  <el-col :span="8">
                    <div class="grid-content grid-content-1">
                      <div class="top-half">{{100-actualProgress}}%</div>
                      <div class="bottom-half">实际进度</div>
                    </div>
                  </el-col>
                  <el-col :span="8">
                    <div class="grid-content grid-content-1">
                      <div class="top-half">{{100-planProgress}}%</div>
                      <div class="bottom-half">计划进度</div>
                    </div>
                  </el-col>
                  <el-col :span="8">
                    <div class="grid-content ">
                      <div class="top-half">{{progressDeterioration}}%</div>
                      <div class="bottom-half">进度偏差</div>
                    </div>
                  </el-col>
                </el-row>

                <el-row type="flex" class="row-bg row-bg-1">
                  <el-col :span="8">
                    <div class="grid-content grid-content-1">
                      <div class="top-half">100</div>
                      <div class="bottom-half">任务数量</div>
                    </div>
                  </el-col>
                  <el-col :span="8">
                    <div class="grid-content grid-content-1">
                      <div class="top-half">50</div>
                      <div class="bottom-half">完成任务数量</div>
                    </div>
                  </el-col>
                  <el-col :span="8">
                    <div class="grid-content">
                      <div class="top-half">50%</div>
                      <div class="bottom-half">完成百分比</div>
                    </div>
                  </el-col>
                </el-row>
                <el-row type="flex" class="row-bg ">
                  <el-col :span="8">
                    <div class="grid-content grid-content-1">
                      <div class="top-half">100</div>
                      <div class="bottom-half">逾期数量</div>
                    </div>
                  </el-col>
                  <el-col :span="8">
                    <div class="grid-content grid-content-1">
                      <div class="top-half">50</div>
                      <div class="bottom-half">逾期完成</div>
                    </div>
                  </el-col>
                  <el-col :span="8">
                    <div class="grid-content">
                      <div class="top-half">50%</div>
                      <div class="bottom-half">逾期百分比</div>
                    </div>
                  </el-col>
                </el-row>

              </div>
            </el-col>
            <el-col :span="14">
              <div id="bin-tu">

              </div>
            </el-col>
          </el-row>

        </el-card>


        <el-card class="box-card">
          <div id="ran-jin-tu"></div>
        </el-card>



      </el-tab-pane>
      <el-tab-pane style="width: 100%;" label="项目动态" name="third">
        <div>

        </div>
      </el-tab-pane>
      <el-tab-pane style="background: #1ab394;width: 100%;height: 100%" label="资源报告" name="fourth">
        <div style="width: 100%">

        </div>
      </el-tab-pane>
    </el-tabs>
  </div>

</template>

<script>
import Vue from 'vue';
import 'element-ui/lib/theme-chalk/display.css';
import {
  getProject,
} from "@/api/pms/project/project";
import {
  listManager
} from "@/api/pms/project/resources";
import {
  listTask,getTaskBurnDownChartData
} from "@/api/pms/project/task";
import GanttElastic from "gantt-elastic";
import GanttHeader from "gantt-elastic-header";
import moment from "moment/moment";
import * as echarts from "echarts";


export default {
  name: "Project",
  components: {GanttElastic, GanttHeader},
  props: {
    // 定义一个名为id的prop，类型为String
    projectId: {
      type: String,
      default: ''
    }
  },
  data() {
    return {
      ganttHeaderOptions: {
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
      ganttOptions: {
        taskMapping: {
          progress: "percent"
        },
        scope: {
          before: 20,
          after: 20
        },
        times: {
          timeZoom: 21
        },
        maxRows: 1000,
        maxHeight: 600,
        row: {
          height: 20
        },
        calendar: {
          workingDays: [1, 2, 3, 4, 5], //*
          gap: 6, //*
          height: 0,
          strokeWidth: 1,
          hour: {
            height: 20, //*
            display: true, //*
            widths: [],
            maxWidths: { short: 0, medium: 0, long: 0 },
            formatted: {
              long: [],
              medium: [],
              short: []
            },
            format: {
              //*
              long(date) {
                return date.format('HH:mm');
              },
              medium(date) {
                return date.format('HH:mm');
              },
              short(date) {
                return date.format('HH');
              }
            }
          },
          day: {
            height: 20, //*
            display: true, //*
            widths: [],
            maxWidths: { short: 0, medium: 0, long: 0 },
            format: {
              long(date) {
                return date.format('DD dddd');
              },
              medium(date) {
                return date.format('DD ddd');
              },
              short(date) {
                return date.format('DD');
              }
            }
          },
          month: {
            height: 20, //*
            display: true, //*
            widths: [],
            maxWidths: { short: 0, medium: 0, long: 0 },
            format: {
              //*
              short(date) {
                return date.format('MM');
              },
              medium(date) {
                return date.format("'YY年MMM");
              },
              long(date) {
                return date.format('YYYY年MMMM');
              }
            }
          }
        },
        chart: {
          progress: {
            bar: true
          },
          expander: {
            display: false
          }
        },
        taskList: {
          expander: {
            straight: true
          },
          percent: 100,
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
              width: 78,
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
              id: 3,
              label: "结束",
              value: "endDate",
              width: 78,
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
              id: 4,
              label: "指派给",
              value: "user",
              width: 110,
              html: true,
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
          //*
          name: 'en',
          weekdays: '星期日_星期一_星期二_星期三_星期四_星期五_星期六'.split('_'),
          weekdaysShort: '星期日_星期一_星期二_星期三_星期四_星期五_星期六'.split('_'),
          weekdaysMin: '星期日_星期一_星期二_星期三_星期四_星期五_星期六'.split('_'),
          months: '1月_2月_3月_4月_5月_6月_7月_8月_9月_10月_11月_12月'.split('_'),
          monthsShort: '1月_2月_3月_4月_5月_6月_7月_8月_9月_10月_11月_12月'.split('_'),
          weekStart: 1,
          relativeTime: {
            future: 'in %s',
            past: '%s ago',
            s: 'a few seconds',
            m: 'a minute',
            mm: '%d minutes',
            h: 'an hour',
            hh: '%d hours',
            d: 'a day',
            dd: '%d days',
            M: 'a month',
            MM: 'months',
            y: 'a year',
            yy: 'years'
          },
          formats: {
            LT: 'HH:mm',
            LTS: 'HH:mm:ss',
            L: 'DD/MM/YYYY',
            LL: 'D MMMM YYYY',
            LLL: 'D MMMM YYYY HH:mm',
            LLLL: 'dddd, D MMMM YYYY HH:mm'
          },
          ordinal: n => {
            const s = ['th', 'st', 'nd', 'rd'];
            const v = n % 100;
            return `[${n}${s[(v - 20) % 10] || s[v] || s[0]}]`;
          }
        }
      },
      tasks: [],
      ganttTitle: undefined,
      projectId: undefined,
      projectInfo: {},
      actualProgress: 0,
      planProgress: 0,
      progressDeterioration: 0,

      activeName: 'first',
      // 遮罩层
      loading: true,
      // 项目表格数据
      projectList: [],
      managerList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
    };
  },
  created() {
    // const projectId = this.projectId;
    // this.projectId = projectId;

  },

  mounted() {


    getProject(this.projectId).then(response => {

      response.data.startDate = moment(new Date(response.data.startDate)).format('YYYY-MM-DD');
      response.data.endDate = moment(new Date(response.data.endDate)).format('YYYY-MM-DD');

      this.projectInfo = response.data
    })

    listManager(this.projectId).then(response => {
      this.managerList = response.data;
    })
    let pm = {};
    pm.projectId = this.projectId;
    listTask(pm).then(response => {

      let list = this.treeToList(response.data);

      let pIds = list.map(item => item.pId);

      list.forEach(element => {
        let task = {};
        task.id = element.id;
        task.taskName = element.taskName;
        task.label = element.taskName;
        task.user = element.assignUserName;

        task.start = new Date(element.startDate).getTime();
        task.end = new Date(element.endDate).getTime();


        let timeDifference = new Date(element.endDate).getTime() - new Date(element.startDate).getTime();
        task.duration = timeDifference;

        task.durationStr = element.duration;
        task.startDate = moment(new Date(element.startDate)).format('YYYY-MM-DD');
        task.endDate = moment(new Date(element.endDate)).format('YYYY-MM-DD');

        //计算 startDate 至 endDate 之间有多少天
        task.percent = element.progress
        task.type = "task";
        //判断element的ID是否 在 pIds里面
        if (pIds.includes(element.id)) {
          task.type = "milestone";
          task.collapsed = false;
          task.user = "";
          task.style = {
            base: {
              fill: "#1EBC61",
              stroke: "#0EAC51"
            }
          }
        }
        if (element.pId !== null) {
          task.parentId = element.pId;
        }

        if (element.predecessorId !== null) {
          task.dependentOn = [];
          task.dependentOn[0] = element.predecessorId;
        }


        this.tasks.push(task)
      })


    })


    let chartDom = document.getElementById('bin-tu');
    let myChart = echarts.init(chartDom);
    let option = {
      legend: {
        orient: 'vertical',
        left: 'left'
      },
      series: [
        {
          name: 'Access From',
          type: 'pie',
          radius: '50%',
          data: [
            {value: 1048, name: '完成'},
            {value: 735, name: '待办'},
            {value: 580, name: '预期'},
            {value: 484, name: '预期完成'}
          ],
          emphasis: {
            itemStyle: {
              shadowBlur: 10,
              shadowOffsetX: 0,
              shadowColor: 'rgba(0, 0, 0, 0.5)'
            }
          }
        }
      ]
    };
    option && myChart.setOption(option);

    getTaskBurnDownChartData(this.projectId).then(response => {
      this.actualProgress = response.data.actualProgress;
      this.planProgress = response.data.planProgress;
      this.progressDeterioration = response.data.progressDeterioration;
      let chartDom1 = document.getElementById('ran-jin-tu');
      let myChart = echarts.init(chartDom1);
      let option1 = {
        title: {
          text: '燃尽图',
          textStyle: {
            fontSize: 14
          }
        },
        legend: {
          data: ['计划', '实际', '预测']
        },
        xAxis: {
          type: 'category',
          boundaryGap: false,
          axisLabel: {
            show: true
          },
          data: response.data.xAxisData
        },
        yAxis: {
          type: 'value',
          axisLine: {
            show: true
          },
          axisLabel: {
            show: true
          }
        },

        grid: {
          top: '30',
          left: '20',
          right: '20',
          bottom: '5',
          containLabel: true
        },
        series: [
          {
            name: '计划',
            showSymbol: false,
            data: response.data.plannedProgressData,
            type: 'line',
            smooth: true,
          },
          {
            name: '实际',
            showSymbol: false,
            data: response.data.actualProgressData,
            type: 'line',
            smooth: true,
          },
          {
            name: '预测',
            showSymbol: false,
            data: response.data.predictingProgress,
            type: 'line',
            smooth: true,
          }
        ]
      };
      option1 && myChart.setOption(option1);

    });



  },

  methods: {
    onTabClick: function (tab, event) {
      console.log(tab, event);
    },
    getTask: function () {
      return this.tasks
    },
    tasksUpdate(tasks) {
      this.tasks = tasks;
    },
    optionsUpdate(options) {
      this.options = options;
    },
    styleUpdate(style) {
      this.dynamicStyle = style;
    },
    treeToList(treeData, childKey = 'children') {
      const arr = []
      const expanded = data => {
        if (data && data.length > 0) {
          data.filter(d => d).forEach(e => {
            arr.push(e)
            expanded(e[childKey] || [])
          })
        }
      }
      expanded(treeData)
      arr.forEach(item => {
        item.children = [];
        item.child = [];
      });
      return arr
    },

  },
  watch: {}
}


</script>


<style scoped lang="scss">
.app-overview {
  background: #F5F8FA;


  .box-card {
    width: 1000px;
    margin-bottom: 20px;
  }


  .project-name {
    font-size: 20px;
    display: inline-block;
  }

  .project-desc {
    font-size: 15px;
    display: inline-block;
    color: #909399;
  }


  .row-bg {
    width: 100%;
    height: 100px;
  }

  .row-bg-1 {
    border-bottom: 1px solid gray; /* 设置底部边框为1像素宽度，实线样式，黑色 */
  }


  .grid-content {
    height: 100%;
    width: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
    background: white;
  }

  .grid-content-1 {
    border-right: 1px solid gray; /* 设置底部边框为1像素宽度，实线样式，黑色 */
  }

  .top-half {
    display: flex;
    align-items: flex-end;
    justify-content: center;
    text-align: center;
    width: 100%;
    flex: 1;
    padding: 5px;
    font-weight: bold;
    color: #409EFF;
    font-size: 20px;
  }

  .bottom-half {
    display: flex;
    align-items: flex-start;
    justify-content: center;
    width: 100%;
    flex: 1;
    color: #606266;
    //加粗
    font-weight: bold;
    padding: 5px;
  }

  #bin-tu {
    padding-left: 20px;
    height: 280px;
    width: 580px;
  }

  #ran-jin-tu {
    height: 300px;
    width: 1000px;
  }

  #ran-jin-tu2 {
    height: 300px;
    width: 1000px;
  }

  .app-overview{

  }

  .el-tabs__content{
    height: 700px;
  }

}
</style>
