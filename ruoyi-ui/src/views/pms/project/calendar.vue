<template>
  <div class="app-container calendar-container">

    <el-row :gutter="10">
      <el-col :span="12">
        <el-tabs class="my-el-tabs" type="card" v-model:activeName="activeName" @tab-click="onTabClick">
          <el-tab-pane :lazy="true" label="工作周" name="first">
            <el-row :gutter="10" class="mb8">
              <right-toolbar :showSearch.sync="showSearch" :search="false"
                             @queryTable="getWorkWeekList"></right-toolbar>
            </el-row>
            <el-table row-key="id" v-loading="loading" :data="workWeekList" highlight-current-row height="535px">
              <el-table-column label="描述" align="center" prop="description"/>
              <el-table-column label="工作日" align="center" class-name="small-padding fixed-width">
                <template slot-scope="scope">
                  <el-switch
                    v-model="scope.row.isWorkday"
                    active-value="1"
                    active-color="#13ce66"
                    @change="saveWorkWeek(scope.row)"
                    inactive-color="#ff4949"
                    inactive-value="0"
                  >
                  </el-switch>
                </template>
              </el-table-column>
            </el-table>
          </el-tab-pane>
          <el-tab-pane label="工作时间" name="fourth">
            <el-row :gutter="10" class="mb8">
              <el-col :span="1.5">
                <el-button
                  type="primary"
                  plain
                  icon="el-icon-plus"
                  size="mini"
                  @click="handleAddWorkTime()"
                  v-hasPermi="['pms:project:save']"
                >新增
                </el-button>
              </el-col>
              <el-col :span="1.5">
                <el-button
                  type="danger"
                  plain
                  icon="el-icon-delete"
                  size="mini"
                  :disabled="multiple"
                  @click="handleDeleteWorkTime"
                  v-hasPermi="['pms:project:delete']"
                >删除
                </el-button>
              </el-col>

              <right-toolbar :showSearch.sync="showSearch" :search="false"
                             @queryTable="getWorkDateList"></right-toolbar>
            </el-row>
            <el-table row-key="id" v-loading="loading" :data="workTimeList" highlight-current-row height="535px"
                      @selection-change="handleSelectionChange">
              <el-table-column type="selection" width="55" align="center"/>
              <el-table-column label="描述" align="left" prop="description">
                <template slot-scope="scope">
                  <el-input v-model="scope.row.description" class="centered-input"
                            size="mini"
                            @change="saveWorkTime(scope.row)"
                            clearable>
                  </el-input>
                </template>
              </el-table-column>
              <el-table-column label="开始时间" align="center" prop="startTime" width="150">
                <template slot-scope="scope">
                  <el-time-select
                    size="mini"
                    style="width:100%"
                    v-model:value="scope.row.startTime" @change="saveWorkTime(scope.row)"
                    placeholder="起始时间"></el-time-select>
                </template>
              </el-table-column>
              <el-table-column label="结束时间" align="center" prop="endTime" width="150">
                <template slot-scope="scope">
                  <el-time-select
                    size="mini"
                    style="width:100%"
                    v-model:value="scope.row.endTime" @change="saveWorkTime(scope.row)"
                    placeholder="起始时间"></el-time-select>
                </template>
              </el-table-column>
              <el-table-column label="操作" align="center" width="150" class-name="small-padding fixed-width">
                <template slot-scope="scope">
                  <el-button
                    size="mini"
                    type="text"
                    icon="el-icon-delete"
                    @click="handleDeleteWorkTime(scope.row)"
                    v-hasPermi="['pms:project:delete']">
                    删除
                  </el-button>
                </template>
              </el-table-column>
            </el-table>
          </el-tab-pane>
          <el-tab-pane label="例外日期" name="second">
            <el-row :gutter="10" class="mb8">
              <el-col :span="1.5">
                <el-button
                  type="primary"
                  plain
                  icon="el-icon-plus"
                  size="mini"
                  @click="handleAddExceptionDate()"
                  v-hasPermi="['pms:project:save']">
                  新增
                </el-button>
              </el-col>
              <el-col :span="1.5">
                <el-button
                  type="danger"
                  plain
                  icon="el-icon-delete"
                  size="mini"
                  :disabled="multiple"
                  @click="handleDeleteExpeptionDate"
                  v-hasPermi="['pms:project:delete']"
                >删除
                </el-button>
              </el-col>
              <right-toolbar :showSearch.sync="showSearch" :search="false"
                             @queryTable="getExceptionDateList"></right-toolbar>
            </el-row>

            <el-table row-key="id" v-loading="loading" :data="exceptionDateList" highlight-current-row height="535px"
                      @selection-change="handleSelectionChange">
              <el-table-column type="selection" width="55" align="center"/>
              <el-table-column label="描述" align="left">
                <template slot-scope="scope">
                  <el-input v-model="scope.row.description" class="centered-input"
                            size="mini"
                            @change="saveExceptionDate(scope.row)"
                            clearable>
                  </el-input>
                </template>
              </el-table-column>
              <el-table-column label="开始时间" align="center" prop="startDate" width="150">
                <template slot-scope="scope">
                  <el-date-picker clearable
                                  style="width:100%"
                                  v-model="scope.row.startDate"
                                  @change="saveExceptionDate(scope.row)"
                                  size="mini"
                                  type="date"
                                  value-format="yyyy-MM-dd"
                                  :picker-options="pickerOptions"
                                  format="yyyy-MM-dd "
                                  placeholder="请选择">
                  </el-date-picker>
                </template>
              </el-table-column>
              <el-table-column label="结束时间" align="center" prop="endDate" width="150">
                <template slot-scope="scope">
                  <el-date-picker clearable
                                  style="width:100%"
                                  v-model="scope.row.endDate"
                                  @change="saveExceptionDate(scope.row)"
                                  size="mini"
                                  type="date"
                                  value-format="yyyy-MM-dd"
                                  :picker-options="pickerOptions"
                                  format="yyyy-MM-dd "
                                  placeholder="请选择">
                  </el-date-picker>
                </template>
              </el-table-column>
              <el-table-column label="操作" align="center" width="150" class-name="small-padding fixed-width">
                <template slot-scope="scope">
                  <el-button
                    size="mini"
                    type="text"
                    icon="el-icon-delete"
                    @click="handleDeleteExpeptionDate(scope.row)"
                    v-hasPermi="['pms:project:delete']"
                  >删除
                  </el-button>
                </template>
              </el-table-column>
            </el-table>

          </el-tab-pane>
          <el-tab-pane label="工作日期" name="third">

            <el-row :gutter="10" class="mb8">
              <el-col :span="1.5">
                <el-button
                  type="primary"
                  plain
                  icon="el-icon-plus"
                  size="mini"
                  @click="handleAddWorkDate()"
                  v-hasPermi="['pms:project:save']"
                >新增
                </el-button>
              </el-col>
              <el-col :span="1.5">
                <el-button
                  type="danger"
                  plain
                  icon="el-icon-delete"
                  size="mini"
                  :disabled="multiple"
                  @click="handleDeleteWorkDate"
                  v-hasPermi="['pms:project:delete']"
                >删除
                </el-button>
              </el-col>

              <right-toolbar :showSearch.sync="showSearch" :search="false"
                             @queryTable="getWorkDateList"></right-toolbar>
            </el-row>

            <el-table row-key="id" v-loading="loading" :data="workDateList" highlight-current-row height="535px"
                      @selection-change="handleSelectionChange">
              <el-table-column type="selection" width="55" align="center"/>
              <el-table-column label="描述" align="left" prop="taskName">
                <template slot-scope="scope">
                  <el-input v-model="scope.row.description" class="centered-input"
                            size="mini"
                            @change="saveWorkDate(scope.row)"
                            clearable>
                  </el-input>
                </template>
              </el-table-column>
              <el-table-column label="开始日期" align="center" prop="startDate" width="150">
                <template slot-scope="scope">
                  <el-date-picker clearable
                                  style="width:100%"
                                  v-model="scope.row.startDate"
                                  @change="saveWorkDate(scope.row)"
                                  size="mini"
                                  type="date"
                                  value-format="yyyy-MM-dd"
                                  :picker-options="pickerOptions"
                                  format="yyyy-MM-dd "
                                  placeholder="请选择">
                  </el-date-picker>
                </template>
              </el-table-column>
              <el-table-column label="结束日期" align="center" prop="endDate" width="150">
                <template slot-scope="scope">
                  <el-date-picker clearable
                                  style="width:100%"
                                  v-model="scope.row.endDate"
                                  @change="saveWorkDate(scope.row)"
                                  size="mini"
                                  type="date"
                                  value-format="yyyy-MM-dd"
                                  :picker-options="pickerOptions"
                                  format="yyyy-MM-dd "
                                  placeholder="请选择">
                  </el-date-picker>
                </template>
              </el-table-column>
              <el-table-column label="操作" align="center" width="150" class-name="small-padding fixed-width">
                <template slot-scope="scope">
                  <el-button
                    size="mini"
                    type="text"
                    icon="el-icon-delete"
                    @click="handleDeleteWorkDate(scope.row)"
                    v-hasPermi="['pms:project:delete']">
                    删除
                  </el-button>
                </template>
              </el-table-column>
            </el-table>

          </el-tab-pane>
        </el-tabs>
      </el-col>
      <el-col :span="12">
        <el-calendar>
          <!-- 这里使用的是 2.5 slot 语法，对于新项目请使用 2.6 slot 语法-->
          <template
            slot="dateCell"
            slot-scope="{date, data}">
            <div :class="getDateStyle(date)">
              <span class="badge work-day-badge">班</span>
              <span class="badge exception-day-badge">休</span>
              {{ data.day.split('-').slice(1)[1] }}
              <span class="dot"></span>
            </div>
          </template>

        </el-calendar>
      </el-col>
    </el-row>

    <el-row :gutter="10" class="mb8">
      <el-breadcrumb separator-class="el-icon-arrow-right">
        <el-breadcrumb-item>工作日期</el-breadcrumb-item>
        <el-breadcrumb-item>例外日期</el-breadcrumb-item>
        <el-breadcrumb-item>工作周</el-breadcrumb-item>
      </el-breadcrumb>
    </el-row>

<!--    <br/>-->

<!--    <el-row :gutter="10" class="mb8">-->
<!--      <el-button   v-hasPermi="['pms:project:detail']">-->
<!--      更新项目时间-->
<!--      </el-button>-->
<!--    </el-row>-->


  </div>
</template>

<script>
import {
  getExceptionDatelist,
  getWorkDatelist,
  getWorkTimelist,
  getWorkWeeklist,
  saveWorkWeek,
  saveWorkDate,
  saveWorkTime,
  saveExceptionDate,
  deleteExceptionDate,
  deleteWorkDate,
  deleteWorkTime
} from "@/api/pms/project/calendar";
import moment from "moment/moment";


export default {
  name: "Data",
  props: {
    // 定义一个名为id的prop，类型为String
    projectId: {
      type: String,
      default: ''
    }
  },
  data() {
    return {
      activeName: 'first',
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: false,
      // 总条数
      total: 0,
      // list数据格式
      dataList: [],
      workWeekList: [],
      workTimeList: [],
      exceptionDateList: [],
      workDateList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 数据标签回显样式
      listClassOptions: [
        {
          value: "default",
          label: "默认"
        },
        {
          value: "primary",
          label: "主要"
        },
        {
          value: "success",
          label: "成功"
        },
        {
          value: "info",
          label: "信息"
        },
        {
          value: "warning",
          label: "警告"
        },
        {
          value: "danger",
          label: "危险"
        }
      ],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        taskName: undefined,
        projectId: undefined
      },
      pickerOptions: {
        shortcuts: [{
          text: '今天',
          onClick(picker) {
            picker.$emit('pick', new Date());
          }
        }, {
          text: '昨天',
          onClick(picker) {
            const date = new Date();
            date.setTime(date.getTime() - 3600 * 1000 * 24);
            picker.$emit('pick', date);
          }
        }, {
          text: '一周前',
          onClick(picker) {
            const date = new Date();
            date.setTime(date.getTime() - 3600 * 1000 * 24 * 7);
            picker.$emit('pick', date);
          }
        },
          {
            text: '一周后',
            onClick(picker) {
              const date = new Date();
              date.setTime(date.getTime() + 3600 * 1000 * 24 * 7);
              picker.$emit('pick', date);
            }
          }]
      },
      // 表单参数
      form: {}
      // 表单校验
    };
  },
  created() {
    this.queryParams.calendarId = this.projectId;
    this.getWorkWeekList();
    this.getWorkDateList();
    this.getExceptionDateList();
  },
  mounted() {

  },
  methods: {
    getDateStyle(date) {

      let m = (1000 * 60 * 60 * 24);
      date.setHours(0, 0, 0, 0);
      let dateM = date.getTime() / m

      let weekStyle = "week-day";
      let workDays = this.workWeekList.filter(item => item.isWorkday === '1').map(item => item.weekDay);
      if (workDays.indexOf(date.getDay()) === -1) {
        weekStyle = 'week-end';
      }

      let dateStyle = "ordinary-day";

      //判断当前日期是否在例外日期列表thishis.exceptionDateList中
      //exceptionDateList中 是一个 有开始时间和结束时间的列表
      let exceptionDateList = this.exceptionDateList;
      for (let i = 0; i < exceptionDateList.length; i++) {
        let startDate = new Date(exceptionDateList[i].startDate);
        startDate.setHours(0, 0, 0, 0);
        let startDateM = startDate.getTime() / m;
        let endDate = new Date(exceptionDateList[i].endDate);
        endDate.setHours(0, 0, 0, 0);
        let endDateM = endDate.getTime() / m;
        if (dateM >= startDateM && dateM <= endDateM) {
          dateStyle = 'exception-day';
          break;
        }
      }

      //判断当前日期是否在例外日期列表this.workDateList中
      let workDateList = this.workDateList;

      for (let i = 0; i < workDateList.length; i++) {
        let startDate = new Date(workDateList[i].startDate);
        startDate.setHours(0, 0, 0, 0);
        let startDateM = startDate.getTime() / m;
        let endDate = new Date(workDateList[i].endDate);
        endDate.setHours(0, 0, 0, 0);
        let endDateM = endDate.getTime() / m;
        if (dateM >= startDateM && dateM <= endDateM) {
          dateStyle = 'work-day';
          break;
        }
      }
      let curDate = new Date()
      curDate.setHours(0, 0, 0, 0);
      let curDateM = curDate.getTime() / m;
      if (dateM === curDateM) {
        weekStyle = 'current-day';
      }

      return weekStyle + " " + dateStyle;

    },
    onTabClick(s) {
      if (s.name === 'first') {
        this.getWorkWeekList();
      } else if (s.name === 'second') {
        this.getWorkDateList();
      } else if (s.name === 'third') {
        this.getExceptionDateList();
      } else if (s.name === 'fourth') {
        this.getWorkTimeList();
      }
      this.ids = [];
    },
    //获取工作日列表
    getWorkWeekList() {
      this.loading = true;
      getWorkWeeklist(this.queryParams.calendarId).then(response => {
        this.workWeekList = response.data
        this.loading = false;
      });
    },
    getWorkDateList() {
      this.loading = true;
      getWorkDatelist(this.queryParams.calendarId).then(response => {
        this.workDateList = response.data
        this.loading = false;
      });
    },
    getWorkTimeList() {
      this.loading = true;
      getWorkTimelist(this.queryParams.calendarId).then(response => {
        this.workTimeList = response.data
        this.loading = false;
      });
    },
    getExceptionDateList() {
      this.loading = true;
      getExceptionDatelist(this.queryParams.calendarId).then(response => {
        this.exceptionDateList = response.data
        this.loading = false;
      });
    },
    saveWorkWeek(row) {
      saveWorkWeek(row).then(response => {
        //this.getWorkWeekList();
      });
    },
    saveWorkDate(row) {
      saveWorkDate(row).then(response => {
        this.getWorkDateList();
      });
    },
    saveWorkTime(row) {
      saveWorkTime(row).then(response => {
        this.getWorkTimeList();
      });
    },
    saveExceptionDate(row) {
      saveExceptionDate(row).then(response => {
        this.getExceptionDatelist();
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        startDate: new Date(),
        endDate: new Date(),
        description: '',
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 返回按钮操作 */
    handleClose() {
      const obj = {path: "/pms/project"};
      this.$tab.closeOpenPage(obj);
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      // this.queryParams.projectId = this.queryParams.projectId;
      this.handleQuery();
    },

    /** 新增按钮操作 */
    handleAddWorkDate() {
      this.reset();
      this.form.calendarId = this.queryParams.calendarId;



      saveWorkDate(this.form).then(response => {
        this.getWorkDateList();
      });
    },

    handleAddWorkTime() {
      this.reset();
      this.form.calendarId = this.queryParams.calendarId;
      this.form.startTime = "09:00"
      this.form.endTime = "12:00"
      saveWorkTime(this.form).then(response => {
        this.getWorkTimeList();
      });
    },


    handleAddExceptionDate(row) {
      this.reset();
      this.form.calendarId = this.queryParams.calendarId;
      saveExceptionDate(this.form).then(response => {
        this.getExceptionDateList();
      });
    },


    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },

    /** 删除按钮操作 */
    handleDeleteWorkDate(row) {
      let list = row.id || this.ids;
      this.$modal.confirm('是否确认删除工作日期').then(function () {
        return deleteWorkDate(list);
      }).then(() => {
        this.$modal.msgSuccess("删除成功");
        this.getWorkDateList();
      }).catch(() => {
      });
    },
    handleDeleteWorkTime(row) {
      let list = row.id || this.ids;
      this.$modal.confirm('是否确认删除工作时间').then(function () {
        return deleteWorkTime(list);
      }).then(() => {
        this.$modal.msgSuccess("删除成功");
        this.getWorkDateList();
      }).catch(() => {
      });
    },

    handleDeleteExpeptionDate(row) {
      let list = row.id || this.ids;
      this.$modal.confirm('是否确认删除例外日期').then(function () {
        return deleteExceptionDate(list);
      }).then(() => {
        this.$modal.msgSuccess("删除成功");
        this.getExceptionDateList();
      }).catch(() => {
      });
    },
  },
  watch: {},
  filters: {
    formatDate(value) {
      const date = new Date(value);
      const year = date.getFullYear();
      const month = String(date.getMonth() + 1).padStart(2, '0');
      const day = String(date.getDate()).padStart(2, '0');
      return `${year}-${month}-${day}`;
    }
  }

}

</script>
<style lang="scss">

.calendar-container {

  .my-el-tabs {
    margin-top: 12px;
  }


  .el-calendar-table .el-calendar-day {
    height: 82px;
  }


  .current-day {
    color: #409EFF;
  }

  //工作日
  .current .week-day {
    color: black;
  }

  //周末
  .current .week-end {
    color: red;
  }

  .next .week-day {
    color: #C0C4CC;
  }

  .next .week-end {
    color: #C0C4CC;
  }

  .prev .week-day {
    color: #C0C4CC;
  }

  .prev .week-end {
    color: #C0C4CC;
  }

  //例外日期（休假）
  .exception-day {
    position: relative;
    display: grid;
    place-items: center; /* 水平和垂直居中 */
    font-size: 30px;
    height: 100%;
    width: 100%;
    border-radius: 5px;
    background: white;
  }

  //工作日期（补班）
  .work-day {
    position: relative;
    display: grid;
    place-items: center; /* 水平和垂直居中 */
    font-size: 30px;
    height: 100%;
    width: 100%;
    border-radius: 5px;
    background: white;
  }

  .ordinary-day {
    position: relative;
    display: grid;
    place-items: center; /* 水平和垂直居中 */
    font-size: 35px;
    height: 100%;
    width: 100%;
    border-radius: 5px;
    background: white;
  }


  .el-calendar-table td.is-selected {
    background: transparent;
  }

  .el-calendar-table .el-calendar-day:hover {
    background: transparent;
  }

  .el-calendar-table .el-calendar-day {
    background: transparent;
    padding: 0;

  }

  .el-calendar-table tr:first-child td {
    border-top: 5px solid #EBEEF5;
  }

  .el-calendar-table tr td:first-child {
    border-left: 5px solid #EBEEF5;
  }

  .el-calendar-table td {
    border-bottom: 5px solid #EBEEF5;
    border-right: 5px solid #EBEEF5;
  }

  .el-calendar-table tbody {
    border: 2px solid black; /* 添加边框，1像素宽，黑色 */
    padding: 10px;
  }


  .badge {
    position: absolute;
    top: 2px;
    right: 2px;
    padding: 2px; /* 内边距，可根据需要修改 */
    font-size: 12px;
    border-radius: 50%;
    width: 20px;
    height: 20px;
    display: grid;
    place-items: center; /* 水平和垂直居中 */
  }

  .work-day-badge {
    color: #67C23A; /* 文字颜色，可根据需要修改 */
    background-color: rgb(225, 243, 216);
    visibility: hidden;
  }

  .exception-day-badge {
    color: red; /* 文字颜色，可根据需要修改 */
    background-color: rgb(253, 226, 226);
    visibility: hidden;
  }

  .dot {
    position: absolute;
    bottom: 10px;
    left: 50%; /* 将圆点水平居中 */
    transform: translateX(-50%); /* 通过偏移将圆点水平居中 */
    width: 8px;
    height: 8px;
    background-color: #C0C4CC;
    border-radius: 50%;
    visibility: hidden;
  }


  .ordinary-day {


  }

  .work-day {
    .work-day-badge {
      visibility: visible;
    }

    .exception-day-badge {
      visibility: hidden;
    }

    .dot {
      visibility: visible;
      background-color: rgb(225, 243, 216);
    }

  }

  .exception-day {
    .work-day-badge {
      visibility: hidden;
    }

    .exception-day-badge {
      visibility: visible;
    }

    .dot {
      visibility: visible;
      background-color: rgb(253, 226, 226);
    }
  }


}


</style>
