<template>
  <div class="app-container task-container">
    <div class="top">
      <!--      <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">-->
      <!--        <el-form-item label="任务名称" prop="taskName">-->
      <!--          <el-input-->
      <!--            v-model="queryParams.taskName"-->
      <!--            placeholder="请输入任务名称"-->
      <!--            clearable-->
      <!--            @keyup.enter.native="handleQuery"-->
      <!--          />-->
      <!--        </el-form-item>-->
      <!--        <el-form-item>-->
      <!--          <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>-->
      <!--          <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>-->
      <!--        </el-form-item>-->
      <!--      </el-form>-->
      <el-row :gutter="10" class="mb8">
        <el-col :span="1.5">
          <el-button
            type="primary"
            plain
            icon="el-icon-plus"
            size="mini"
            @click="handleAdd(undefined)"
            v-hasPermi="['pms:project:save']"
          >新增
          </el-button>
        </el-col>
        <el-col :span="1.5">
          <el-button
            type="success"
            plain
            icon="el-icon-plus"
            size="mini"
            :disabled="single"
            @click="handleAbstract"
            v-hasPermi="['pms:project:save']"
          >摘要
          </el-button>
        </el-col>
        <el-col :span="1.5">
          <el-button
            type="danger"
            plain
            icon="el-icon-delete"
            size="mini"
            :disabled="multiple"
            @click="handleDelete"
            v-hasPermi="['pms:project:delete']"
          >删除
          </el-button>
        </el-col>
        <el-col :span="1.5">
          <el-button
            type="warning"
            plain
            icon="el-icon-download"
            size="mini"
            @click="handleExport"
            v-hasPermi="['pms:project:save']"
          >导出
          </el-button>
        </el-col>
        <!--        <el-col :span="1.5">-->
        <!--          <el-button-->
        <!--            type="warning"-->
        <!--            plain-->
        <!--            icon="el-icon-close"-->
        <!--            size="mini"-->
        <!--            @click="handleClose"-->
        <!--          >关闭-->
        <!--          </el-button>-->
        <!--        </el-col>-->
        <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
      </el-row>
    </div>
    <div class="bottom">
      <el-table id="table" row-key="_id" :height="'100%'" :key="tableKey" v-loading="loading" :data="dataTree"
                highlight-current-row
                :row-class-name="headerStyle"
                :indent="32" :expand-row-keys="expandRowKeys" @expand-change="onExpandChange"
                :tree-props="{children: 'children'}"
                @selection-change="handleSelectionChange">
        <el-table-column type="selection" width="55" align="center"/>
        <el-table-column type="index"></el-table-column>
        <el-table-column label="任务名称" align="left" prop="taskName" :show-overflow-tooltip='true'>
          <template slot-scope="scope">
    <span :class="getRowClass(scope.row)">
        {{ scope.row.taskName }}
    </span>
          </template>
        </el-table-column>
        <!--        <el-table-column label="任务编号" align="center" prop="sortNum"/>-->
        <el-table-column label="任务模式" align="center" prop="taskType" width="120">
          <template slot-scope="scope">
            <span :class="getRowClass(scope.row)" v-show="scope.row.taskType === '0'">自动</span>
            <span :class="getRowClass(scope.row)" v-show="scope.row.taskType === '1'">手动</span>
          </template>
        </el-table-column>
        <el-table-column label="工期" align="center" width="120">
          <template slot-scope="scope">
            <el-input v-model="scope.row.duration" class="centered-input"
                      size="mini"
                      @focus="onFocus($event)"
                      :tabindex="(scope.row.sortNum+100000) +''"
                      v-show="!(scope.row.taskType==='1'|| scope.row.children.length>0) "
                      @change="updateTaskPlan(scope.row)"
                      @input="(v)=>(scope.row.duration=v.replace(/[^\d|\.]/g, ''))" clearable>
            </el-input>
            <span :class="getRowClass(scope.row)"
                  v-show="(scope.row.taskType==='1'|| scope.row.children.length>0)">{{ scope.row.duration }}</span>
          </template>
        </el-table-column>

        <el-table-column label="开始时间" align="center" prop="startDate" width="150">
          <template slot-scope="scope">
            <el-date-picker clearable
                            style="width:100%"
                            :tabindex="(scope.row.sortNum+200000) +''"
                            v-model="scope.row.startDate"
                            v-show="scope.row.taskType==='1'"
                            @change="updateTaskPlan(scope.row)"
                            size="mini"
                            type="date"
                            value-format="yyyy-MM-dd"
                            :picker-options="pickerOptions"
                            format="yyyy-MM-dd "
                            placeholder="请选择">
            </el-date-picker>
            <span :class="getRowClass(scope.row)" v-show="scope.row.taskType==='0'">{{
                scope.row.startDate|formatDate
              }}</span>
          </template>
        </el-table-column>

        <el-table-column label="结束时间" align="center" prop="endDate" width="150">
          <template slot-scope="scope">
            <el-date-picker clearable
                            style="width:100%"
                            v-model="scope.row.endDate"
                            :tabindex="(scope.row.sortNum+300000) +''"
                            v-show="scope.row.taskType==='1'"
                            @change="updateTaskPlan(scope.row)"
                            size="mini"
                            type="date"
                            value-format="yyyy-MM-dd"
                            :picker-options="pickerOptions"
                            format="yyyy-MM-dd "
                            placeholder="请选择">
            </el-date-picker>
            <span :class="getRowClass(scope.row)" v-show="scope.row.taskType==='0'">{{
                scope.row.endDate|formatDate
              }}</span>
          </template>
        </el-table-column>
        <el-table-column label="前置任务" align="center" width="120">
          <template slot-scope="scope">
            <el-input v-model="scope.row.predecessor" class="centered-input"
                      :tabindex="(scope.row.sortNum+400000) +''"
                      @focus="onFocus($event)"
                      size="mini"
                      v-show="scope.row.children.length===0&&scope.row.taskType!=='1'"
                      @change="updateTaskPlan(scope.row)"
                      @input="(v)=>(scope.row.predecessor=v.replace(/[^\d]/g,''))" clearable>
            </el-input>
          </template>
        </el-table-column>

        <el-table-column label="指派给" prop="assignUserId" align="center" width="150">
          <template slot-scope="scope">
            <el-select
              size="mini"
              v-show="scope.row.children.length===0"
              :tabindex="(scope.row.sortNum+500000) +''"
              @change="onAssignUserChange(scope.row)"
              v-model="scope.row.assignUserId" placeholder="请选择" filterable>
              <el-option
                v-for="item in users"
                :key="item.userId"
                :label="item.nickName"
                :value="item.userId">
                <span style="float: left">{{ item.nickName }}</span>
              </el-option>
            </el-select>

          </template>
        </el-table-column>

        <el-table-column label="进度" prop="progress" align="center" width="70">
          <template slot-scope="scope">
            <span :class="getRowClass(scope.row)" v-show="scope.row.taskType === '0'">{{ scope.row.progress }}%</span>
            <span :class="getRowClass(scope.row)" v-show="scope.row.taskType === '1'">{{ scope.row.progress }}%</span>
          </template>
        </el-table-column>

        <el-table-column label="操作" align="center" fixed="right" width="200" class-name="small-padding fixed-width">
          <template slot-scope="scope">
            <el-button
              size="mini"
              type="text"
              icon="el-icon-plus"
              @click="handleAdd(scope.row)"
              v-hasPermi="['pms:project:save']"
            >增加
            </el-button>
            <el-button
              size="mini"
              type="text"
              icon="el-icon-edit"
              @click="handleUpdate(scope.row)"
              v-hasPermi="['pms:project:save']"
            >修改
            </el-button>
            <el-button
              size="mini"
              type="text"
              icon="el-icon-delete"
              @click="handleDelete(scope.row)"
              v-hasPermi="['pms:project:delete']"
            >删除
            </el-button>
          </template>
        </el-table-column>

      </el-table>
    </div>
    <!-- 添加或修改参数配置对话框 -->
    <el-dialog
      :title="title"
      :visible.sync="open"
      :close-on-click-modal="false"
      :lock-scroll="false"
      append-to-body
      width="980px">

      <el-form ref="form" inline :model="form" :rules="rules" label-width="80px">

        <el-form-item label="任务名称" prop="taskName">
          <el-input style="width: 835px" v-model="form.taskName" placeholder="请输入任务名称"/>
        </el-form-item>

        <el-form-item label="任务类型" prop="taskType">
          <el-select v-model="form.taskType">
            <el-option label="自动" value="0"></el-option>
            <el-option label="手动" value="1"></el-option>
          </el-select>
        </el-form-item>

        <el-form-item label="工期" prop="duration" v-if="form.taskType==='0'">
          <el-input
            style="width: 220px"
            v-model="form.duration"
            @input="(v)=>(form.duration=v.replace(/[^\d|\.]/g, ''))"
            clearable
            placeholder="请输入工期"/>
        </el-form-item>

        <el-form-item label="开始时间" prop="startDate" v-if="form.taskType==='1'">
          <el-date-picker clearable
                          v-model="form.startDate"
                          type="date"
                          value-format="yyyy-MM-dd"
                          format="yyyy-MM-dd "
                          :picker-options="pickerOptions"
                          placeholder="请选择开始时间">
          </el-date-picker>
        </el-form-item>

        <el-form-item label="结束时间" prop="endDate" v-if="form.taskType==='1'">
          <el-date-picker clearable
                          v-model="form.endDate"
                          type="date"
                          value-format="yyyy-MM-dd"
                          format="yyyy-MM-dd"
                          :picker-options="pickerOptions"
                          placeholder="请选择结束时间">
          </el-date-picker>
        </el-form-item>

        <el-form-item v-show="form.taskType==='0'">
          <span style="width: 200px;display: block"></span>
        </el-form-item>

        <el-form-item label="指派给" prop="assignUserId">
          <el-select v-model="form.assignUserId" placeholder="请选择" filterable clearable>
            <el-option
              v-for="item in users"
              :key="item.userId"
              :label="item.nickName"
              :value="item.userId">
              <span style="float: left">{{ item.nickName }}</span>
              <span style="float: right; color: #8492a6; font-size: 13px">{{ item.deptName }}</span>
            </el-option>
          </el-select>
        </el-form-item>


        <el-form-item label="协作人" prop="collaboratorUserIds">
          <el-select
            style="width: 835px"
            multiple
            v-model="form.collaboratorUserIds"
            placeholder="请选择"
            filterable
            clearable>
            <el-option
              v-for="item in users"
              :key="item.userId"
              :label="item.nickName"
              :value="item.userId">
              <span style="float: left">{{ item.nickName }}</span>
              <span style="float: right; color: #8492a6; font-size: 13px">{{ item.deptName }}</span>
            </el-option>
          </el-select>
        </el-form-item>

        <el-form-item label="进度" prop="progress">
          <el-slider
            style="width: 840px"
            v-model="form.progress"
            :marks="progressMarks"
            show-input
          >
          </el-slider>
        </el-form-item>

        <el-form-item label="任务描述" prop="description">
          <editor v-model="form.description" :min-height="192"/>
        </el-form-item>


      </el-form>

      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>
<script>
import {
  saveTask,
  delTask,
  getTask,
  listTask,

  updateSortNum,
  assignUser
} from "@/api/pms/project/task";
import {
  listResources, detailResources
} from "@/api/pms/project/resources";
import Sortable from 'sortablejs'
import moment from 'moment';
import 'quill/dist/quill.core.css';
import 'quill/dist/quill.snow.css';
import 'quill/dist/quill.bubble.css';

export default {
  name: "Data",
  props: {
    // 定义一个名为id的prop，类型为String
    projectId: {
      type: String,
      default: ''
    }
  },
  // 初始化data对象，包括表格配置、查询参数、规则验证等。
  data() {
    return {
      selectNum: 0,
      progressMarks: {
        0: '',
        10: '开始',
        20: '分析',
        30: '设计',
        40: '开发',
        70: '完成',
        80: '测试',
        90: '发布',
        100: '',
      },
      leafPaths: [],
      r: "",
      timeNum: 0,
      expandRowKeys: [],
      tableKey: Math.random(),
      taskNameColumnWidth: "380",
      users: [],
      sortNum: 0,
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
      dataMap: {},
      //tree数据格式
      dataTree: [],
      // 默认字典类型
      defaultDictType: "",
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
      // 类型数据字典
      typeOptions: [],
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
      form: {},
      // 表单校验
      rules: {
        projectId: [
          {required: true, message: "任务Id不能为空", trigger: "blur"}
        ],
        taskName: [
          {required: true, message: "任务名字不能为空", trigger: "blur"}
        ],
        taskType: [
          {required: true, message: "任务类型不能为空", trigger: "blur"}
        ],
        startDate: [
          {required: true, message: "开始时间不能为空", trigger: "blur"}
        ],
        endDate: [
          {required: true, message: "结束时间不能为空", trigger: "blur"}
        ]
      }
    };
  },
  // 在实例创建完成后立即获取用户列表和任务列表。
  created() {
    //获取我是从那个路由进入

  },
  // 页面加载完成后初始化可拖拽行。
  mounted() {
    this.load();
  },
  methods: {

    load() {

      this.queryParams.projectId = this.projectId;

      listResources().then(response => {
        this.users = response.data;
      });

      this.getTaskList(this.projectId);

      this.rowDrop();
    },
    onTaskTypeChange(row) {
      this.updateTaskPlan(row);
    },
    onAssignUserChange(row) {
      let dm = {};
      dm.taskId = this.removeAfterPipe(row.id);
      dm.assignUserId = row.assignUserId
      assignUser(dm).then(response => {
      });
    },
    onExpandChange(row, e) {
      if (e) {
        this.expandRowKeys.push(row._id);
      } else {
        if (row) {
          this.expandRowKeys = this.expandRowKeys.filter(item => item !== row._id);
        }
      }
    },
    onPredecessorChange(row) {
      this.updateTaskPlan(row);
    },
    //检查是否工作时间
    isWorkingHour(hour, workPeriods) {
      // 遍历所有工作时间段
      for (const period of workPeriods) {
        const [start, end] = period;
        // 如果当前时间处于任何一个工作时间段内，返回true
        if (hour >= start && hour < end) {
          return true;
        }
      }
      // 如果当前时间不处于任何一个工作时间段内，返回false
      return false;
    },
// 检查给定日期是否是工作日
    isWorkDay(date) {
      const dayOfWeek = date.getDay();
      // 0表示星期日，6表示星期六
      return dayOfWeek !== 0 && dayOfWeek !== 6;
    },
    addWorkDays(startDate, numWorkDays) {
      const workHoursPerDay = 8; // 一天的工作时间（小时）
      const workPeriods = [
        [8, 12], // 上午工作时间段
        [13, 17] // 下午工作时间段
      ];

      let currentDate = new Date(startDate);
      let remainingWorkDays = numWorkDays;

      // 循环，直到剩余工作日数为0
      while (remainingWorkDays > 0) {
        // 如果是工作日
        if (this.isWorkDay(currentDate)) {
          // 如果当前时间处于工作时间段内
          if (this.isWorkingHour(currentDate.getHours(), workPeriods)) {
            // 减去当前小时所占的工作日数
            remainingWorkDays -= 1 / workHoursPerDay;
          }
        }
        // 将日期向后推一小时
        currentDate.setHours(currentDate.getHours() + 1);
      }
      return currentDate;
    },
    updateTaskPlan(row) {
      if (!row) {
        return;
      }

      // let row1 = {};
      // row1.predecessor = row.predecessor;
      // row1.id = row.id;
      // row1.taskType = row.taskType;
      // row1.startDate = moment(row.startDate).format('YYYY-MM-DD HH:mm:ss');
      // row1.endDate = moment(row.endDate).format('YYYY-MM-DD HH:mm:ss');
      // row1.duration = row.duration;
      // row1.pId = row.pId;
      let r = this.dataList[row.predecessor - 1];
      if (r) {
        console.info("------1------")
        // row1.predecessorId = this.removeAfterPipe(r.id);
        row.predecessorId = this.removeAfterPipe(r.id);
        //自己引用自己
        if (r.id === row.id) {
          row.predecessorId = null;
          row.predecessor = "";
        }
        //互相引用
        if (r.predecessorId === row.id) {
          row.predecessorId = null;
          row.predecessor = "";
        }
      } else {
        row.predecessorId = null;
        row.predecessor = "";
      }
      this.selectNum = row.sortNum;
      saveTask(row).then(res => {
        this.getList1();
      });
    },
    onFocus(event) {
      event.currentTarget.select();
    },
    debounce(func, delay) {
      let timer;
      return function () {
        const context = this;
        const args = arguments;
        clearTimeout(timer);
        timer = setTimeout(() => {
          func.apply(context, args);
        }, delay);
      };
    },
    deepCopyTaskList(obj) {
      let list = [];
      obj.forEach(item => {
        let row = {};
        row.id = item.id;
        row.pId = item.pId
        row.projectId = item.projectId;
        // row.predecessorId = item.predecessorId
        // row.startDate = moment(item.startDate).format('YYYY-MM-DD HH:mm:ss');
        // row.endDate = moment(item.endDate).format('YYYY-MM-DD HH:mm:ss');
        // row.duration = item.duration;
        // row.taskType = item.taskType;
        // row.taskName = item.taskName;
        // row.assignUserId = item.assignUserId;
        list.push(row);
      });
      return list;
    },
    removeAfterPipe(str) {
      if (str === null) {
        return null;
      }
      const index = str.indexOf('|'); // 找到 '|' 字符的位置
      if (index !== -1) {
        return str.substring(0, index); // 截取 '|' 字符之前的部分
      } else {
        return str; // 如果没有 '|' 字符，直接返回原始字符串
      }
    },
    getLatestEndDateNode(children) {
      let latestNode = null;
      //2222年
      let latestEndDate;
      // 遍历子节点
      children.forEach(child => {
        child.endDate = new Date(child.endDate)
        if (!latestNode || child.endDate.getTime() > latestEndDate.getTime()) {
          latestNode = child;
          latestEndDate = new Date(child.endDate);
        }
      });
      return latestNode;
    },
    getEarliestStartDateNode(children) {
      let earliestNode = null;
      //1991年
      let earliestStartDate;
      // 遍历子节点
      children.forEach(child => {
        child.startDate = new Date(child.startDate)
        if (!earliestNode || child.startDate.getTime() < earliestStartDate.getTime()) {
          earliestNode = child;
          earliestStartDate = new Date(child.startDate);
        }
      });
      return earliestNode;
    },
    traverseUpFromLeaf(node, callback) {
      if (!node.children || node.children.length === 0) {
        // 如果当前节点没有子节点，调用回调函数
        callback(node);
      } else {
        // 遍历当前节点的子节点
        node.children.forEach(child => {
          // 递归调用自身，向下遍历子节点
          this.traverseUpFromLeaf(child, callback);
        });
        // 遍历完所有子节点后，调用回调函数
        callback(node);
      }
    },
    //获取所有叶节点路径
    getLeafPaths(tree3) {

      let root = {};
      root.taskName = "root"
      root.id = "0";
      root.child = tree3;

      let leafPaths = [];
      getLeafPaths1(root);
      leafPaths.forEach(item => {
        item.shift();
      });


      return leafPaths;


      function getLeafPaths1(node, path = []) {
        path.push(node);
        if (node.child.length === 0) {
          // let treeData = JSON.parse(JSON.stringify(path));
          leafPaths.push(path);
        } else {
          // 如果不是叶节点，则继续遍历子节点
          node.child.forEach(child => {
            getLeafPaths1(child, [...path]);
          });
        }
      }
    },
    /** 将树数据转化为平铺数据 */
    treeToList(treeData1, childKey = 'children') {
      // let treeData = JSON.parse(JSON.stringify(treeData1));
      // let that = this;
      const arr = []
      const expanded = data => {
        if (data && data.length > 0) {
          data.filter(d => d).forEach(e => {
            arr.push(e)
            expanded(e[childKey] || [])
          })
        }
      }
      expanded(treeData1)
      // arr.forEach(item => {
      //   item.id = that.removeAfterPipe(item.id);
      //   item.pId = that.removeAfterPipe(item.pId)
      //   item.predecessorId = that.removeAfterPipe(item.predecessorId)
      // });
      return arr
    },
    /** 行拖拽 */
    rowDrop() {
      // 此时找到的元素是要拖拽元素的父容器
      const tbody = document.querySelector('.el-dialog__wrapper .el-table__body-wrapper tbody');
      console.info(tbody);
      const self = this;

      Sortable.create(tbody, {
        animation: 100,
        delay: 0,
        invertSwap: true,
        handle: ".current-row",
        onStart: (e) => {
          self.startScreenX = e.originalEvent.screenX;
          self.startScreenY = e.originalEvent.screenY;
          // console.info("onStart_screenX:" + e.originalEvent.screenX)
        },

        onEnd: (e) => {

          self.activeRows = this.dataList;
          let cRow = self.activeRows.splice(e.oldIndex, 1)[0];
          self.activeRows.splice(e.newIndex, 0, cRow);
          let pRow = self.activeRows[e.newIndex - 1];
          if (e.newIndex === e.oldIndex) {
            if (self.startScreenX > e.originalEvent.screenX) {
              self.onDragLeftward(self.activeRows, cRow, pRow)
            }
            if (self.startScreenX < e.originalEvent.screenX) {
              self.onDragRightward(self.activeRows, cRow, pRow)
            }
          } else {
            if (self.startScreenY > e.originalEvent.screenY) {
              self.onDragUpward(self.activeRows, cRow, pRow)
            }
            if (self.startScreenY < e.originalEvent.screenY) {
              self.onDragDownward(self.activeRows, cRow, pRow)
            }
          }


          this.$nextTick(() => {
            let list = this.deepCopyTaskList(self.activeRows);
            this.loading = true
            updateSortNum(list).then(res => {
              this.getList();
            });
          });


        },

      })
    },
    /** 查询字典类型详细 */
    getTaskList(projectId) {
      this.queryParams.projectId = projectId;
      this.getList();
    },
    /** 查询字典数据列表 */
    getList(isScroll) {
      // this.loading = true;
      // let that = this;
      listTask(this.queryParams).then(response => {
        let dataTree = response.data;
        this.dataList = this.treeToList(dataTree);
        this.timeNum = new Date().getTime();
        this.dataList.forEach(item => {
          item._id = item.id + "|" + this.timeNum;
          this.dataMap[item.id] = item;
        });

        this.dataTree = dataTree;

        if (this.expandRowKeys.length === 0) {
          this.expandRowKeys = this.dataList.map(item => item.pId + "|" + this.timeNum);
        } else {
          let l = this.expandRowKeys.map(item => this.removeAfterPipe(item));
          this.expandRowKeys = l.map(item => item + "|" + this.timeNum);
        }
        this.loading = false;

        if (!isScroll)
          return;

        this.$nextTick(() => {
          let table = document.getElementsByClassName("el-table__body-wrapper")[0];
          console.info(table);
          table.scrollTop = table.scrollHeight;
        })

      });
    },

    getList1() {

      listTask(this.queryParams).then(response => {
        let dataTree = response.data;
        this.dataList = this.treeToList(dataTree);
        this.dataList.forEach(item => {
          let row = this.dataMap[item.id];
          row.startDate = item.startDate;
          row.endDate = item.endDate;
          row.duration = item.duration

        })

      });
    },

    headerStyle(e) {
      return 'tr_' + e.row.id;
    },

    getProw(list, cRow, pRow) {


      //获取所有class为el-table__row 的元素
      let rows = document.getElementsByClassName("el-table__row");
      //  console.info(rows)
      //rows倒序
      // rows = Array.prototype.slice.call(rows).reverse();
      //
      // return ;

      let rs = [];
      for (let r of rows) {
        if (window.getComputedStyle(r).display !== 'none') {
          for (let classListKeyValue of r.classList) {

            if (typeof (classListKeyValue) === 'string' && classListKeyValue.includes("tr_")) {

              if (rs.indexOf(classListKeyValue) === -1) {
                rs.push(classListKeyValue);
                break
              }
            }
          }
        }
      }

      console.info(rs)
      let cRowIndex = rs.indexOf("tr_" + cRow.id);
      console.info(cRowIndex, cRowIndex)
      let pRowId = rs[cRowIndex - 1];
      console.info("pRowId", pRowId)
      pRowId = pRowId.replace("tr_", "");
      console.info("pRowId", pRowId)
      let ppRows = list.filter(item => item.id === pRowId)
      console.info("ppRows")
      console.info(ppRows)
      return ppRows[0];

    },

    onDragDownward(list, cRow, pRow) {
      console.info("向下拖动:")
      console.info(pRow)
      console.info("pRow:" + pRow.taskName)

      let pRowHasChild = (pRow.children.length > 0);
      let pRowExpand = false;

      //前节点折叠的时候处理
      if (pRowHasChild === true) {
        if (this.expandRowKeys.indexOf(pRow._id) === -1) {
          pRowExpand = true;
        }
      }

      if (pRowExpand === true) {
        cRow.pId = pRow.pId;
      } else {
        if (pRowHasChild === true) {
          cRow.pId = pRow.id;
        } else {
          cRow.pId = pRow.pId;
        }
      }
    },

    onDragUpward(list, cRow, pRow) {
      console.info("向上拖动")
      if (!pRow) {
        cRow.pId = null;
        return
      }
      let bRow = this.getProw(list, cRow, pRow);
      this.onDragDownward(list, cRow, bRow);
    },

    onDragLeftward(list, cRow, pRow) {
      if (!pRow) {
        cRow.pId = null;
        return
      }
      let bRow = this.getProw(list, cRow, pRow);
      console.info("向左拖动")
      console.info("crow:" + cRow.taskName)
      console.info("prow:" + pRow.taskName)
      console.info("bRow:" + bRow.taskName)

      if (!bRow.pId) {
        return;
      }

      if (cRow.pId === bRow.id) {
        cRow.pId = bRow.pId;
      } else if (cRow.pId === bRow.pId) {
        let bbRows = list.filter(item => item.id === bRow.pId);
        let bbRow = bbRows[0];
        cRow.pId = bbRow.pId;
      }
    },

    onDragRightward(list, cRow, pRow) {
      console.info("向右拖动:")
      console.info("cRow:" + cRow.taskName)
      console.info("pRow:" + pRow.taskName)
      let bRow = this.getProw(list, cRow, pRow);
      console.info("bRow:" + bRow.taskName)
      if (cRow.pId === bRow.pId) {
        cRow.pId = bRow.id;
      } else {
        if (cRow.pId === bRow.id) {
        } else {
          cRow.pId = bRow.pId;
        }
      }
    },

    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        taskIds: [],
        taskName: undefined,
        taskType: "0",
        duration: 1,
        startDate: new Date(),
        endDate: new Date(),
        description: undefined,
        assignmentUser: undefined,
        collaboratorUserIds: []
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.loading = true;
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 返回按钮操作 */
    handleClose() {
      const obj = {path: "/pms/task"};
      this.$tab.closePage();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      // this.queryParams.projectId = this.queryParams.projectId;
      this.handleQuery();
    },
    /** 新增按钮操作 */
    handleAdd(row) {
      this.reset();
      this.title = "添加任务";
      this.form.projectId = this.projectId;
      if (row !== undefined) {
        this.form.pId = this.removeAfterPipe(row.id);
        this.form.sortNum = 0;
      } else {
        this.form.pId = null;
        this.form.sortNum = this.dataList.length + 1000;
      }
      this.open = true;
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length < 0
      this.multiple = !selection.length
      this.dataList.forEach(item => {
        item.select = false;
      });
      selection.forEach(item => {
        item.select = true;
      });
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      // console.log(row);
      //this.reset();
      const id = this.removeAfterPipe(row.id)
      getTask(id).then(response => {
        response.data.collaboratorUserIds = response.data.collaboratorUserList.map(item => item.userId);
        this.form = response.data;
        this.open = true;
        this.title = "修改任务";
      });
    },
    /** 提交按钮 */
    submitForm: function () {
      this.$refs["form"].validate(valid => {
        if (valid) {
          //  console.info(this.form)
          if (this.form.id != undefined) {
            saveTask(this.form).then(response => {
              this.$store.dispatch('project/setListLastTime');
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            saveTask(this.form).then(response => {
              this.$store.dispatch('project/setListLastTime');
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              if (this.form.taskIds.length > 0 || this.form.pId === null) {
                this.getList();
              } else {
                this.getList(true);
              }
              // this.expandRowKeys.push(this.form.pId + "|" + this.timeNum);
            });
          }
        }
      });
    },
    handleAbstract() {
      this.reset();
      this.title = "添加摘要";
      this.open = true;
      this.form.projectId = this.queryParams.projectId;
      let l = [];
      this.dataList.forEach(item => {
        if (item.select) {
          l.push(this.removeAfterPipe(item.id));
        }
      });
      this.form.taskIds = l;
      this.form.sortNum = 0;
    },

    /** 删除按钮操作 */
    handleDelete(row) {
      let list = row.id || this.ids;
      if (Array.isArray(list)) {
        //   console.log("dictCodes 是数组");
        let l = [];
        list.forEach(item => {
          l.push(this.removeAfterPipe(item));
        });
        list = l;
      } else {
        list = this.removeAfterPipe(list);
      }

      this.$modal.confirm('是否确认删除任务数据').then(function () {
        return delTask(list);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
        this.$emit('updateProject', '')
        this.$store.dispatch('project/setListLastTime');
      }).catch(() => {
      });
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/dict/data/export', {
        ...this.queryParams
      }, `data_${new Date().getTime()}.xlsx`)
    },
    getRowClass(row) {
      return {
        'bold-text': row.children.length > 0,
        'black-text': row.children.length > 0
      };
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
.task-container {
  display: flex;
  flex-direction: column;
  height: calc(100vh - 84px);

  .top {
    flex: 0 0 auto; /* 上面的空间不随内容变化而改变大小 */
  }

  .bottom {
    flex: 1; /* 下面的空间根据剩余空间自适应高度 */
  }

  .centered-input .el-input__inner {
    text-align: center;
  }

  .el-table {
    font-size: 12px;
  }

  .el-table__cell {
    padding: 2px 0;
  }

  .bold-text {
    font-weight: bold;
  }

  .black-text {
    color: black;
  }

  .el-dialog__body {
    height: calc(100vh * 0.75);
    overflow: auto;

  }


  .el-dialog.is-fullscreen {
    overflow: hidden !important;
  }


  //.dialog-footer {
  //  display: flex;
  //  justify-content: right; /* 水平居中 */
  //  align-items: center; /* 垂直居中 */
  //}

}
</style>
