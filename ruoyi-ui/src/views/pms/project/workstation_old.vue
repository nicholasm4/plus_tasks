<template>
  <div class="app-container workstation-container">
    <el-row :gutter="10">
      <el-col :span="16">
        <!--项目和任务的数量统计模块-->
        <div class="top">
          <el-row>
            <el-col :span="24">
              <el-col :span="4">
                <div class="grid-content grid-content-1" @click="filterProjects('participated')">
                  <div class="top-half">{{ countInfo.projectsParticipated }}</div>
                  <div class="bottom-half">参与项目数</div>
                </div>
              </el-col>
              <el-col :span="4">
                <div class="grid-content grid-content-1" @click="filterProjects('completed')">
                  <div class="top-half">{{ countInfo.projectsCompleted }}</div>
                  <div class="bottom-half">完成项目数</div>
                </div>
              </el-col>
              <el-col :span="4">
                <div class="grid-content grid-content-1" @click="filterProjects('pending')">
                  <div class="top-half">{{ countInfo.projectsPending }}</div>
                  <div class="bottom-half">待办项目数</div>
                </div>
              </el-col>

              <el-col :span="4">
                <div class="grid-content grid-content-1" @click="filterTasks('completed')">
                  <div class="top-half">{{ countInfo.tasksCompleted }}</div>
                  <div class="bottom-half">完成任务数量</div>
                </div>
              </el-col>
              <el-col :span="4">
                <div class="grid-content grid-content-1" @click="filterTasks('pending')">
                  <div class="top-half">{{ countInfo.tasksPending }}</div>
                  <div class="bottom-half">待办任务数量</div>
                </div>
              </el-col>
              <el-col :span="4">
                <div class="grid-content grid-content-1" @click="filterTasks('overdue')">
                  <div class="top-half">{{ countInfo.tasksOverdue }}</div>
                  <div class="bottom-half">逾期任务数量</div>
                </div>
              </el-col>
            </el-col>
          </el-row>
        </div>


        <div class="bottom">
          <el-row style="height:100%" :gutter="10">
            <!-- 项目列表模块 -->
            <el-col :span="10" style="height:100%; ">
              <!--项目的列表-->
              <div class="project-list">
                <el-table
                  class="hide-scrollbar"
                  height="100%"
                  :show-header=true
                  highlight-current-row
                  :data="projectList"
                  @row-click="handleProjectListRowClick"
                  style="width:100%;text-align: center">
                  <el-table-column prop="projectName" :show-overflow-tooltip="true" label="项目列表">
                    <template slot="header" slot-scope="scope">
                      <div
                        style="color: #606266 ;display: flex; align-items: center ; justify-content:  flex-start; height: 80px; font-size: 20px; margin-left: 10px">
                        <span>项目列表</span>
                      </div>
                    </template>
                      <!-- <template slot-scope="scope">-->
                      <!--  <div>-->
                      <!--    <span class="project-name">{{ scope.row.projectName }}</span>-->
                      <!--     <br/>-->
                      <!--     <span class="project-desc">{{ scope.row.description }}</span>-->
                      <!--   </div>-->
                      <!-- </template>-->
                    <template slot-scope="scope">
                      <div>
                        <span class="project-name" style="font-size: medium;color: #606266">{{scope.row.projectName}}</span>
                        <br/>
                        <span class="project-desc">{{ scope.row.description }}</span>
                      </div>
                    </template>
                  </el-table-column>
                  <el-table-column prop="progress" label="进度信息" width="120px">
                    <template slot-scope="scope">
                      <el-progress :percentage="scope.row.progress"></el-progress>
                    </template>
                  </el-table-column>
                </el-table>
              </div>
            </el-col>

            <el-col :span="14" style="height:100%;">
              <!--中间任务列表的表头-->
              <div class="task-list-header">
                <!--用于查看项目的上方、下方、右侧下拉框标签选择器-->
                <el-row>
                  <!--右侧下拉框标签选择器-->
                  <el-col :span="6" style="float: right">
                    <el-select
                      size="medium"
                      style="margin-left:5px"
                      v-model="assignUserIds"
                      v-if="tabPosition==='全部项目'"
                      @change="handleAssignUserChange"
                      multiple
                      collapse-tags
                      placeholder="指派给" clearable>
                      <el-option
                        v-for="item in users"
                        :key="item.userId"
                        :label="item.nickName"
                        :value="item.userId">
                        <span style="float: left">{{ item.nickName }}</span>
                      </el-option>
                    </el-select>
                  </el-col>
                  <!--所有标签选择的条件-->
                  <el-col :span="18">
                    <!--上方标签选择条件-->
                    <el-radio-group size="medium" v-model="tabPosition" @input="handleTaskListTabPositionChange">
                      <!--全部能看到的项目-->
                      <el-radio-button label="全部项目">全部项目</el-radio-button>
                      <!--我所管理或者参与的项目-->
                      <el-radio-button label="我的参与">我的参与</el-radio-button>
                      <!--                      <el-radio-button label="协助">协助</el-radio-button>-->
                    </el-radio-group>
                    <br/>
                    <!--下方标签选择条件-->
                    <el-radio-group style="margin-top: 10px" v-model="tabPosition1"
                                    @input="handleTaskListTabPositionChange">
                      <el-radio-button label="全部">全部</el-radio-button>
                      <!--                      <el-radio-button label="待办">待办</el-radio-button>-->
                      <el-radio-button label="催办">催办</el-radio-button>
                      <el-radio-button label="完成">完成</el-radio-button>
                      <el-radio-button label="逾期">逾期</el-radio-button>
                    </el-radio-group>
                  </el-col>
                </el-row>
              </div>
              <!--中间任务列表的主题内容-->
              <div class="task-list">
                <el-table
                  :show-header="false"
                  class="hide-scrollbar"
                  height="100%"
                  row-key="id"
                  :data="taskList"
                  :tree-props="{children: 'children'}"
                  :expand-row-keys="projectExpandRowKeys[projectId]"
                  @expand-change="handleTaskListExpandChange"
                  style="width: 100%">
                  <el-table-column
                    prop="taskName"
                    label="任务列表">
<!--                    <template slot="header" slot-scope="scope">-->
<!--                      <el-row>-->
<!--                        <el-col :span="24">-->
<!--                          <el-radio-group v-model="tabPosition" @input="handleTaskListTabPositionChange">-->
<!--                            <el-radio-button label="待办">待办</el-radio-button>-->
<!--                            <el-radio-button label="我的">我的</el-radio-button>-->
<!--                            <el-radio-button label="协助">协助</el-radio-button>-->
<!--                            <el-radio-button label="全部">全部</el-radio-button>-->
<!--                          </el-radio-group>-->
<!--                        </el-col>-->
<!--                      </el-row>-->
<!--                    </template>-->
                    <template slot-scope="scope" style="display: inline">
                      <el-tooltip class="item" effect="dark" placement="right">
                        <div slot="content">
                          开始时间：{{ scope.row.startDate }}
                          <br/>
                          结束时间：{{ scope.row.endDate }}
                          <br/>
                          工期：{{ scope.row.duration }}
                          <br/>
                          进度：{{ scope.row.progress }}%
                        </div>
                        <el-button
                          v-if="!scope.row.isChildren"
                          size="mini"
                          style="color: #606266"
                          @click="handleShowTaskDialog(scope.row)" type="text"
                          v-hasPermi="['pms:project:list']">
                          {{ scope.row.taskName }}
                        </el-button>
                        <span style="color: black;font-weight: bold" v-if="scope.row.isChildren ">
                       {{ scope.row.taskName }}
                      </span>
                      </el-tooltip>
                    </template>
                  </el-table-column>

                  <el-table-column
                    width="120px"
                    prop="assignUserName"
                    align="center"
                    label="指派给">
                    <template slot="header" slot-scope="scope">
                      <el-select
                        v-model="assignUserIds"
                        v-if="tabPosition==='全部'"
                        @change="handleAssignUserChange"
                        multiple
                        collapse-tags
                        placeholder="指派给" clearable>
                        <el-option
                          v-for="item in users"
                          :key="item.userId"
                          :label="item.nickName"
                          :value="item.userId">
                          <span style="float: left">{{ item.nickName }}</span>
                        </el-option>
                      </el-select>
                    </template>
                    <template slot-scope="scope">
                      <el-progress :percentage="scope.row.progress"></el-progress>
                    </template>
                  </el-table-column>
                </el-table>
              </div>
            </el-col>
          </el-row>
        </div>
      </el-col>

      <el-col :span="8">
        <!--计划进度、实际进度、进度偏差的总元素-->
        <div class="top">
          <el-row>
            <el-col :span="24">
              <el-row>
                <!--计划进度-->
                <el-col :span="8">
                  <div class="grid-content grid-content-1">
                    <div class="top-half">{{ planProgress }}%</div>
                    <div class="bottom-half">计划进度</div>
                  </div>
                </el-col>
                <!--实际进度-->
                <el-col :span="8">
                  <div class="grid-content grid-content-1">
                    <div class="top-half">{{ actualProgress }}%</div>
                    <div class="bottom-half">实际进度</div>
                  </div>
                </el-col>
                <!--进度偏差-->
                <el-col :span="8">
                  <div class="grid-content grid-content-1">
                    <div style="color: #E6A23C" class="top-half">{{ progressDeterioration }}%</div>
                    <div class="bottom-half">进度偏差</div>
                  </div>
                </el-col>
              </el-row>
            </el-col>
          </el-row>
        </div>
        <!--燃尽图的图像、项目动态的变化-->
        <div class="bottom">
          <el-row style="height:100%" :gutter="10">
            <el-col :span="24" style="height:100%;">
              <!--燃尽图的图像的变化-->
              <div id="tu1" class="project-info">
              </div>
              <!--项目动态的变化-->
              <div class="project-dynamics">
                <el-table
                  class="hide-scrollbar"
                  height="100%"
                  highlight-current-row
                  :data="dynamicsList"
                  style="width:100%;">
                  <el-table-column prop="content" label="项目动态">
                    <template slot-scope="scope">
                      <div>
                        <span class="dynamics-createtime">{{scope.row.createTime }}</span>
                        <br/>
                        <span class="dynamics-context">{{scope.row.content }}</span>
                      </div>
                    </template>
                  </el-table-column>
                </el-table>
              </div>
            </el-col>
          </el-row>
        </div>
      </el-col>
    </el-row>
    <el-dialog
      :title="'任务信息'"
      :visible.sync="open"
      :close-on-click-modal="false"
      width="1200px">
      <div id="dialog">
        <div class="dialog-task-info">
          <el-card class="box-card" shadow="never">
            <el-descriptions :colon="false" :column="3">
              <el-descriptions-item label="任务名称：">{{ form.taskName }}</el-descriptions-item>
            </el-descriptions>
            <el-descriptions :colon="false" :column="3">
              <el-descriptions-item label="开始时间：">{{ form.startDate }}</el-descriptions-item>
              <el-descriptions-item label="结束时间：">{{ form.endDate }}</el-descriptions-item>
              <el-descriptions-item label="工期：">{{ form.duration }}</el-descriptions-item>
            </el-descriptions>
            <el-descriptions :colon="false" :column="1">
              <el-descriptions-item label="指派给：">{{ form.assignUserName }}</el-descriptions-item>
            </el-descriptions>
            <el-descriptions :colon="false" :column="1">
              <el-descriptions-item label="协作人：">{{ form.collaboratorUserNames }}</el-descriptions-item>
            </el-descriptions>
            <el-descriptions :colon="false" :column="1">
              <el-descriptions-item label="进度：">
                <el-slider
                  style="width: 100%"
                  v-model="form.progress"
                  :marks="progressMarks"
                  @change="handleProgressChange"
                  show-input>
                </el-slider>
              </el-descriptions-item>
            </el-descriptions>
            <el-divider></el-divider>
            <el-descriptions :colon="false" :column="1">
              <el-descriptions-item label="任务描述：">
                <div class="ql-editor" v-html="form.description"></div>
              </el-descriptions-item>
            </el-descriptions>
          </el-card>
        </div>
        <ul class="dialog-comment-info">
          <li v-for="row in commentList" class="infinite-list-item">
            <div class="comment-left">
              <el-avatar shape="square" :size="40">
                {{ userLogo }}
              </el-avatar>
            </div>
            <div class="comment-right">
              <div class="comment-right-title">
                <span style="color: #606266">{{ row.userName }} </span> <span style="color: #909399;margin-left: 10px"> {{
                  row.createTime
                }}</span>
              </div>
              <div class="comment-right-body">
                <div class="ql-editor" v-html="row.content"></div>
              </div>
              <div class="comment-right-footer">
                <el-button
                  style="font-size: small;color: #409EFF" @click="handleDeleteComment(row)"
                  type="text"
                  v-hasPermi="['pms:project:delete']">
                  删除
                </el-button>
              </div>
            </div>
          </li>
        </ul>
        <div class="dialog-comment-input">
          <div class="comment-left">
            <el-avatar shape="square" :size="40">
              {{ userLogo }}
            </el-avatar>
          </div>
          <div class="comment-right">
            <editor v-model="comment" :height="192"/>
            <br/>
            <el-button type="primary" style="width: 100px" @click="commentSubmit">备注</el-button>
          </div>
        </div>
      </div>
      <div slot="footer" class="dialog-footer">
        <el-button @click="open= false">关闭</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>


import {
  listProject,
  getWorkStationCount,
} from "@/api/pms/project/project";
import {
  getTask,
  listTask, updateProgress, getTaskBurnDownChartData
} from "@/api/pms/project/task";
import {getProjectDynamics} from "@/api/pms/project/dynamics";
import {detailResources, listResources} from "@/api/pms/project/resources";
import {deleteComment, listComment, saveComment} from "@/api/pms/project/comment";

import 'quill/dist/quill.core.css';
import 'quill/dist/quill.snow.css';
import 'quill/dist/quill.bubble.css';

import moment from "moment";
import * as echarts from 'echarts';


export default {
  name: "Data",
  //初始化了组件的数据属性，包括各种列表、计数器、查询参数等。
  //data()函数是Vue组件的一个生命周期钩子，它返回一个对象，
  // 这个对象包含了组件的所有响应式数据属性。这些属性可以在模板中使用，
  // 并且当它们的值发生变化时，视图会自动更新
  data() {
    return {
      dynamicsList: [], // 项目动态列表
      progressMarks: { // 进度条标记
        0: '',
        10: '开始',
        20: '分析',
        30: '设计',
        40: '开发',
        80: '测试',
        90: '发布',
        100: '',
      },
      countInfo: {}, // 计数信息（如参与项目数、完成项目数等）
      comment: "", // 备注内容
      commentList: [], // 备注列表
      reverse: true, // 是否反转排序
      activities: [{ // 活动列表（示例数据）
        content: '活动按期开始',
        timestamp: '2018-04-15'
      }, {
        content: '通过审核',
        timestamp: '2018-04-13'
      }, {
        content: '创建成功',
        timestamp: '2018-04-11'
      }],
      actualProgress: 0, // 实际进度
      planProgress: 0, // 计划进度
      progressDeterioration: 0, // 进度偏差
      count: 100, // 计数器
      users: [], // 用户列表
      userLogo: undefined, // 用户头像首字母
      user: {}, // 当前用户信息
      assignUserIds: [], // 指派给用户的 ID 列表
      assignUserId: undefined, // 单个指派用户 ID
      collaboratorUserId: undefined, // 协作用户 ID
      filters: [], // 过滤条件
      projectId: undefined, // 当前项目 ID
      projectList: [], // 项目列表
      taskList: [], // 任务列表
      tabPosition: "全部项目", // 任务标签位置（我的、协助、全部）
      tabPosition1: "催办", // 任务状态标签位置（催办、逾期、完成、全部）
      projectExpandRowKeys: {}, // 展开的项目行键
      expandRowKeys: [], // 展开的行键
      loading: true, // 加载状态
      ids: [], // 选中数组
      single: true, // 非单个禁用
      multiple: true, // 非多个禁用
      showSearch: false, // 显示搜索条件
      total: 0, // 总条数
      dataList: [], // 数据列表
      workWeekList: [], // 工作周列表
      workDateList: [], // 工作日期列表
      exceptionDateList: [], // 异常日期列表
      title: "", // 弹出层标题
      open: false, // 是否显示弹出层
      listClassOptions: [ // 数据标签回显样式选项
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
      //queryParams 用于存储分页和过滤参数。当用户点击分页按钮或过滤条件发生变化时，
      // queryParams 会更新。然后，这些参数将被传递给 listTask 函数以获取新的任务列表。
      queryParams: { // 查询参数
        pageNum: 1,
        pageSize: 10,
        taskName: undefined,
        projectId: undefined
      },
      // pickerOptions 用于配置日期选择器的快捷选项。这些选项允许用户快速选择日期范围，
      // 例如今天、昨天、一周前等。当用户选择一个日期范围时，
      // pickerOptions 会触发一个事件，并将所选日期范围传递给 listTask 函数以获取新的任务列表。
      pickerOptions: { // 日期选择器快捷选项
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
        }, {
          text: '一周后',
          onClick(picker) {
            const date = new Date();
            date.setTime(date.getTime() + 3600 * 1000 * 24 * 7);
            picker.$emit('pick', date);
          }
        }]
      },
      form: {}, // 表单参数
    };
  },

  /*
   created: 在实例创建完成后调用，主要负责初始化数据：
    获取当前用户信息及头像首字母。
    获取所有用户列表。
    获取工作台统计数据（如参与项目数、完成项目数等）。
    创建防抖函数以优化获取任务列表和动态列表的请求频率。
   */
  created() {
    // 加载当前用户信息及头像首字母。
    detailResources().then(response => {
      this.user = response.data;
      let str = response.data.nickName
      this.userLogo = str.charAt(0);
    });

    // 加载所有用户列表。
    listResources().then(response => {
      this.users = response.data;
    });

    // 加载工作台统计数据。
    getWorkStationCount().then(response => {
      this.countInfo = response.data;
    })

    this.debouncedGetTaskList = this.debounce(this.getTaskList, 300);
    this.debouncedgetDynamicsList = this.debounce(this.getDynamicsList, 300);

  },

  //mounted: 页面加载完成后立即调用，主要用于首次加载时获取项目列表。
  mounted() {
    this.getProjectList();
  },

  methods: {
    //debounce: 创建一个防抖函数，防止频繁触发某些事件（如输入框变化或滚动），
    // 从而减少不必要的API请求。
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
    //filterProjects & filterTasks: 根据提供的状态参数更新查询参数，
    // 并重新获取项目或任务列表。
    filterProjects(status) {
      this.queryParams.projectStatus = status;
      this.queryParams.taskStatus = undefined; // 清除任务状态过滤
      this.getProjectList();
    },

    filterTasks(status) {
      this.queryParams.taskStatus = status;
      this.queryParams.projectStatus = undefined; // 清除项目状态过滤
      this.getProjectList();
    },
    //getProjectList: 获取项目列表，根据查询参数筛选并展示到页面上
    getProjectList() {
      this.loading = true;
      let queryParams = {
        pageNum: 1,
        pageSize: 1000,
        projectStatus: this.queryParams.projectStatus,
        taskStatus: this.queryParams.taskStatus
      };
      listProject(queryParams).then(response => {
        this.projectList = response.data.rows;
        this.loading = false;
      });
    },
    //getLeafPaths: 获取树结构中所有叶节点路径，用于处理任务列表的层级关系。
    getLeafPaths(tree3) {

      let root = {};
      root.taskName = "root"
      root.id = "0";
      root.children = tree3;

      let leafPaths = [];
      getLeafPaths1(root);
      leafPaths.forEach(item => {
        item.shift();
      });


      return leafPaths;

      function getLeafPaths1(node, path = []) {
        path.push(node);
        if (node.children.length === 0) {
          // let treeData = JSON.parse(JSON.stringify(path));
          leafPaths.push(path);
        } else {
          // 如果不是叶节点，则继续遍历子节点
          node.children.forEach(child => {
            getLeafPaths1(child, [...path]);
          });
        }
      }
    },
    //getTaskList: 根据 projectId 获取任务列表，
    // 并根据返回的数据构建树状结构的任务列表。同时，获取燃尽图数据并渲染图表。
    getTaskList() {

      if (!this.projectId) {
        return
      }

      listTask({projectId: this.projectId}).then(response => {
        let list = this.treeToList(response.data)

        //判断 projectExpand 中 是否有   this.projectId 属性
        if (!this.projectExpandRowKeys.hasOwnProperty(this.projectId)) {
          this.projectExpandRowKeys[this.projectId] = [];
        }

        if (this.projectExpandRowKeys[this.projectId].length === 0) {
          this.projectExpandRowKeys[this.projectId] = list.map(item => item.pId);
        }
//pms_project_dynamics
        let filterList = [];

        list.forEach(item => {
          item.startDate = moment(new Date(item.startDate)).format('YYYY-MM-DD');
          item.endDate = moment(new Date(item.endDate)).format('YYYY-MM-DD');

          if (item.children.length > 0) {
            item.isChildren = true;
          } else {
            item.isChildren = false;
          }

          if (item.isChildren === false) {

            if ("全部" === this.tabPosition) {
              console.log("----------------------11")
              console.log(item.assignUserId)
              console.log(this.assignUserIds)

              if (this.assignUserIds.length > 0 && !this.assignUserIds.includes(item.assignUserId)) {
                filterList.push(item);
              }

            }

            if ("我的" === this.tabPosition) {
              if (this.assignUserId !== item.assignUserId) {
                filterList.push(item);
              }
            }

            if ("协助" === this.tabPosition) {
              let collaboratorUserIds = item.collaboratorUserList.map(item => item.userId);
              if (!collaboratorUserIds.includes(this.collaboratorUserId)) {
                filterList.push(item);
              }
            }


            if ('待办' === this.tabPosition1) {
              if (item.progress === 100) {
                filterList.push(item);
              }
            }

            if ('全部' === this.tabPosition1) {

            }
            if ('逾期' === this.tabPosition1) {
              if (!(item.progress < 100 && new Date(item.endDate) < new Date())) {
                filterList.push(item);
                console.info(item);
              }
            }

            if ('完成' === this.tabPosition1) {
              if (item.progress !== 100) {
                filterList.push(item);
              }
            }

          }
        });
        console.info("filterList", filterList);
        //从list上 移除 filterList的项目
        list = list.filter(item => !filterList.includes(item));
        list.forEach(item => {
          item.children = item.children.filter(item => !filterList.includes(item));
        });
        list.forEach(item => {
          item.children = [];
        });

        let treeDate = this.listToTree(list);
        let leafPaths = this.getLeafPaths(treeDate)
        let reserveList = [];
        leafPaths.forEach(list => {
          //判断list 的最后一个 是否为 isChildren =false
          if (list[list.length - 1].isChildren === false) {
            //将list全部插入 ll
            reserveList.push(...list);
          }
        })
        list = list.filter(item => reserveList.includes(item));
        this.taskList = this.listToTree(list);
      });

      getTaskBurnDownChartData(this.projectId).then(response => {
        this.actualProgress = response.data.actualProgress;
        this.planProgress = response.data.planProgress;
        this.progressDeterioration = response.data.progressDeterioration;
        let chartDom1 = document.getElementById('tu1');
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
              show: false
            },
            axisLabel: {
              show: false
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

    //getDynamicsList: 获取指定项目的动态信息，并格式化时间后展示。
    getDynamicsList() {

      if (!this.projectId) {
        return
      }

      getProjectDynamics(this.projectId).then(response => {

        response.data.forEach(item => {
          item.createTime = moment(new Date(item.createTime)).format('YYYY-MM-DD HH:mm:ss');
        })

        this.dynamicsList = response.data;
      });

    },
    // commentSubmit: 提交备注信息，保存到服务器并刷新备注列表，同时清空输入框。
    commentSubmit() {
      this.count++;
      let saveCommentDm = {};
      saveCommentDm.moduleId = this.form.id;
      saveCommentDm.comment = this.comment;
      saveComment(saveCommentDm).then(response => {
        listComment(this.form.id).then(response => {
          this.commentList = response.data;
          this.$nextTick(() => {
            let table = document.getElementById("dialog");
            table.scrollTop = table.scrollHeight;
            this.comment = "";
          })
        })
      });
    },
    // handleDeleteComment: 删除指定ID的备注信息，并刷新备注列表。
    handleDeleteComment(row) {
      deleteComment(row.id).then(response => {
        listComment(this.form.id).then(response => {
          this.commentList = response.data;
        })
      });
    },
    //handleProjectListRowClick: 当点击项目列表中的某一行时，
    // 设置当前项目的ID，并使用防抖函数获取该项目的任务列表和动态信息。
    handleProjectListRowClick(row, column, event) {
      this.projectId = row.id;

      if ("待办" === this.tabPosition) {
        this.assignUserId = this.user.userId;
      }

      if ("我的" === this.tabPosition) {
        this.assignUserId = this.user.userId;
      }

      if ("协助" === this.tabPosition) {
        this.collaboratorUserId = this.user.userId;
      }

      if ("全部" === this.tabPosition) {
        this.assignUserId = undefined;
        this.collaboratorUserId = undefined;
      }

      this.debouncedGetTaskList();
      this.debouncedgetDynamicsList();
    },
    //handleTaskListExpandChange: 处理任务列表展开/折叠的变化，更新展开的行键。
    handleTaskListExpandChange(row, e) {
      if (e) {
        this.projectExpandRowKeys[this.projectId].push(row.id);
      } else {
        if (row) {
          this.projectExpandRowKeys[this.projectId] = this.projectExpandRowKeys[this.projectId].filter(item => item !== row.id);
        }
      }

    },
    //handleAssignUserChange: 当选择指派用户发生变化时，重新获取任务列表。
    handleAssignUserChange(values) {
      if (this.projectId) {
        this.getTaskList()
      }
    },
    // handleOpenOverview: 打开项目概览页面。
    handleOpenOverview(row) {
      const tableName = row.projectName;
      this.$tab.openPage(tableName + "-概览", '/pms/project-overview/index/' + row.id);
    },

    handleShowTaskDialog(row) {
      getTask(row.id).then(response => {
        response.data.startDate = moment(new Date(response.data.startDate)).format('YYYY-MM-DD');
        response.data.endDate = moment(new Date(response.data.endDate)).format('YYYY-MM-DD');
        let array = response.data.collaboratorUserList.map(item => item.nickName);
        response.data.collaboratorUserNames = array.join(", ");
        this.form = response.data;
        this.open = true;
        this.title = "任务信息";
        listComment(row.id).then(response => {
          this.commentList = response.data;
          this.$nextTick(() => {
            let table = document.getElementById("dialog");
            table.scrollTop = 0;
          })
        })
      });
    },

    handleTaskListTabPositionChange(label) {
      if ("待办" === this.tabPosition) {
        // this.assignUserIds.splice(0, this.assignUserIds.length);
        this.assignUserId = this.user.userId;
      }

      if ("我的" === this.tabPosition) {
        // this.assignUserIds.splice(0, this.assignUserIds.length);
        // this.assignUserIds.push(this.user.userId);
        this.assignUserId = this.user.userId;
      }

      if ("协助" === this.tabPosition) {
        // this.collaboratorUserIds.splice(0, this.collaboratorUserIds.length);
        // this.collaboratorUserIds.push(this.user.userId);
        this.collaboratorUserId = this.user.userId;
      }

      if ("全部" === this.tabPosition) {
        this.assignUserId = undefined;
        this.collaboratorUserId = undefined;

      }

      //this.getTaskList();
      this.debouncedGetTaskList();
      this.debouncedgetDynamicsList();
    },

    handleProgressChange() {
      let dm = {};
      dm.id = this.form.id;
      dm.progress = this.form.progress;
      updateProgress(dm).then(response => {
        this.getTaskList()
      })
    },

    treeToList(treeData) {
      const arr = []
      const expanded = data => {
        if (data && data.length > 0) {
          data.filter(d => d).forEach(e => {
            arr.push(e)
            expanded(e['children'] || [])
          })
        }
      }
      expanded(treeData)
      // arr.forEach(item => {
      //   item.children = [];
      //   item.child = [];
      // });
      return arr
    },

    listToTree(listData) {
      let map = {};
      // 遍历列表，创建节点对象，并添加到map中
      listData.forEach(item => {
        item.children = [];
        map[item.id] = item;
      });

      listData.forEach(item => {
        //设置树节点
        if (item.pId && map[item.pId]) {
          map[item.pId].children.push(item);
        }
      });

      return listData.filter(item => !item.pId);

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

  },
  watch: {},
  filters: {}
}

</script>
<style lang="scss">

.workstation-container {
  height: calc(100vh - 84px);
  background: #F5F8FA;
  min-width: 1366px;

  .el-row {
    height: 100%;
  }

  .el-col {
    height: 100%;
  }

  .top {
    height: calc(100% * 0.13);
    margin-bottom: 10px;
    background: white;
  }

  .bottom {

    height: calc(100% * 0.85);

    el-row {
      padding: 50px;
    }

    el-col {
      padding: 50px;
    }

    .project-list {
      height: 100%;

    }

    .task-list {
      height: calc(100% - 100px);
    }

    .task-list-header {
      height: 100px;
      background: white;
      padding: 10px;
      //下边框
      border-bottom: 1px solid #EBEEF5;
    }

    .project-info {
      height: 25%;
      background: white;
    }

    .project-dynamics {
      height: 75%;
      padding-top: 10px;

      .dynamics-createtime {
        color: #909399;
      }

      .dynamics-context {
        color: #606266;
      }

    }
  }

  .like {
    cursor: pointer;
    font-size: 25px;
    display: inline-block;
  }

  .hide-scrollbar ::-webkit-scrollbar {
    display: none; /* Chrome, Safari, Opera*/
  }

  .hide-scrollbar {
    -ms-overflow-style: none; /* IE, Edge */
    scrollbar-width: none; /* Firefox */
  }

  //表头颜色
  .el-table {
    .el-table__header-wrapper, .el-table__fixed-header-wrapper {
      th {
        background-color: white;
      }
    }
  }

  .project-name {
    font-size: 17px;
    display: inline-block;
  }

  .project-desc {
    font-size: 15px;
    display: inline-block;
    color: #909399;
  }

  .row-bg {
    width: 100%;
    height: 33.333%;
  }

  .row-bg-1 {
    //  border-bottom: 1px solid gray; /* 设置底部边框为1像素宽度，实线样式，黑色 */
  }

  .grid-content {
    height: 100%;
    width: 100%;
    display: flex;
    flex-direction: column;

    justify-content: center; /* 水平居中 */
    align-items: center;
    cursor: pointer; /* 鼠标悬停时显示点击手势 */
  }

  .grid-content-1 {
    //border-right: 1px solid gray; /* 设置底部边框为1像素宽度，实线样式，黑色 */
  }

  .top-half {
    display: flex;
    width: 100%;
    font-weight: bold;
    justify-content: center; /* 水平居中 */
    align-items: flex-end;
    color: #409EFF;
    font-size: 20px;
    padding: 5px;
  }

  .bottom-half {
    display: flex;
    width: 100%;
    color: #606266;
    font-weight: bold;
    justify-content: center; /* 水平居中 */
    align-items: flex-start;
    padding: 5px;

  }

  .el-button--mini {
    padding: 0px;
    font-size: 14px;
  }

  #dialog {
    height: calc(100vh * 0.7);
    overflow: auto;
    padding: 10px;
  }

  .dialog-task-info {
    .el-descriptions-item__container .el-descriptions-item__label, .el-descriptions-item__container .el-descriptions-item__content {
      align-items: center;
      font-size: 16px;
    }
  }


  .dialog-comment-info {
    margin: 0px;
    padding: 0px;
    list-style: none;

    .infinite-list-item {
      display: flex;
      margin-bottom: 10px;
    }
  }


  .dialog-comment-input {
    width: 100%;
    display: flex;
    flex-direction: row;
  }

  .comment-left {
    width: 50px;
  }

  .comment-right {
    width: calc(100% - 60px);
    display: flex;
    flex-direction: column;

    .comment-right-title {
      height: 40px;
      align-content: center;
      font-size: 16px;
    }

    .comment-right-body {
    }

    .comment-right-footer {

    }
  }

  .el-avatar {
    font-size: 25px !important
  }


  .box-card {
    margin-bottom: 10px;
  }


}


</style>
