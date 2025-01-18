<template>
  <div class="app-container">

    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="项目名称" prop="projectName">
        <el-input
          v-model="queryParams.projectName"
          placeholder="请输入项目名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>

      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['pms:project:save']"
        >新增
        </el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="projectList">
      <!--      <el-table-column type="selection" width="55" align="center"/>-->
      <el-table-column label="项目名称" align="left" :show-overflow-tooltip="true">
        <template slot-scope="scope">
          <div>
            <!--            <el-button-->
            <!--              style="font-size: medium;color: #606266" @click="handleOpenOverview(scope.row)" type="text"-->
            <!--              v-hasPermi="['pms:project:list']"-->
            <!--            >-->
            <!--              {{ scope.row.projectName }}-->
            <!--            </el-button>-->
            <span class="task-desc" style="font-size: medium;color: #606266">{{ scope.row.projectName }}</span>
            <br/>
            <span class="task-desc">{{ scope.row.description }}</span>
          </div>
        </template>
      </el-table-column>
      <el-table-column label="项目状态" align="center" prop="projectStatus" width="120">
        <template slot-scope="scope">
          <el-tag v-if="scope.row.projectStatus === '0'" type="info">草稿</el-tag>
          <el-tag v-if="scope.row.projectStatus === '1'" type="success">发布</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="任务数量" align="center" prop="taskCount" width="120"/>
      <el-table-column label="开始时间" align="center" prop="startDate" width="120">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.startDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="结束时间" align="center" prop="endDate" width="120">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.endDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="创建者" align="center" prop="userName" width="120"/>
      <el-table-column label="操作" align="center" fixed="right" width="280" class-name="small-padding fixed-width">
        <template slot-scope="scope">

          <el-button
            @click="handleOpenTask(scope.row)"
            size="mini"
            type="text"
            icon="el-icon-tickets"
            v-if="scope.row.isManager & type!=='3' & type!=='4'  "
            v-hasPermi="['pms:project:detail']">
            任务
          </el-button>


          <el-button
            @click="handleOpenOverview(scope.row)"
            size="mini"
            type="text"
            icon="el-icon-tickets"
            v-hasPermi="['pms:project:list']">
            概览
          </el-button>

          <el-button
            @click="handleOpenCalendar(scope.row)"
            size="mini"
            type="text"
            icon="el-icon-date"
            v-if="scope.row.isManager & type!=='3' & type!=='4'  "
            v-hasPermi="['pms:project:detail']">
            日历
          </el-button>

          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-if="scope.row.isManager"
            v-hasPermi="['pms:project:detail']">
            设置
          </el-button>


        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />


    <!-- 添加或修改项目对话框 -->
    <el-dialog
      :title="title" :visible.sync="open"  :key="dialogKey"  width="600px" style="height: 600px">
      <el-tabs :tab-position="'left'">
        <el-tab-pane label="基本设置" style="height: 400px">
          <el-form ref="form" :model="form" :rules="rules" label-width="80px">
            <el-form-item label="项目名称" prop="projectName">
              <el-input v-model="form.projectName" placeholder="请输入项目名称"/>
            </el-form-item>
            <el-form-item label="项目描述" prop="description">
              <el-input :autosize="{'minRows': 6,'maxRows': 6}" v-model="form.description" type="textarea"
                        placeholder="请输入内容"/>
            </el-form-item>
            <el-form-item label="可见性" prop="isVisibility" style="width: 100%;">
              <el-select v-model="form.isVisibility" placeholder="请选择" style="width: 100%;">
                <el-option :key="'0'" :label="'私有项目(项目成员可见)'" :value="'0'"></el-option>
                <el-option :key="'1'" :label="'公开项目(所有成员可见)'" :value="'1'"></el-option>
              </el-select>
            </el-form-item>
            <el-form-item
              style="position: absolute; bottom: 0; left: 0; width: 100%; display: flex; justify-content: flex-end;">
              <el-button type="primary" @click="submitForm">保存设置</el-button>
            </el-form-item>
          </el-form>
        </el-tab-pane>
        <el-tab-pane :disabled="!this.form.id" label="管理协作者" style="height: 400px">
          <el-form :inline="true">
            <el-form-item>
              <el-select v-model="selectManagerId" placeholder="请选择" filterable>
                <el-option
                  v-for="item in users"
                  :key="item.userId"
                  :label="item.nickName"
                  :value="item.userId">
                  <span style="float: left">{{ item.nickName }}</span>
                  <span style="float: right; color: #8492a6; font-size: 13px">{{ item.dept }}</span>
                </el-option>
              </el-select>
            </el-form-item>
            <el-form-item>
              <el-button type="primary" plain icon="el-icon-plus" @click="handleAddManager(selectManagerId)">新增
              </el-button>
            </el-form-item>
          </el-form>
          <el-table :data="managerList" style="width: 100%">
            <el-table-column label="姓名" prop="nickName" width="180">
            </el-table-column>
            <el-table-column label="部门" prop="deptName" width="180">
            </el-table-column>
            <el-table-column label="操作">
              <template slot-scope="scope">
                <el-button
                  size="mini"
                  type="danger"
                  @click="handleDeleteManager(scope.row)">删除
                </el-button>
              </template>
            </el-table-column>
          </el-table>
        </el-tab-pane>
        <el-tab-pane :disabled="!this.form.id" label="项目操作" style="height: 400px">
          <el-row class="operator-tab" v-if="this.form.projectStatus==='0'">
            <el-col :span="16">
              <div>
                <span class="project-op-info">发布项目</span>
                <br/>
                <span class="project-op-desc">发布项目，项目成员将能够查看项目。</span>
              </div>
            </el-col>
            <el-col :span="8">
              <el-button type="warning" @click="handleOperate('1')">发布项目</el-button>
            </el-col>
          </el-row>
          <el-row class="operator-tab">
            <el-col :span="16">
              <div>
                <span class="project-op-info">退出管理</span>
                <br/>
                <span class="project-op-desc">退出管理，您将无法管理该项目。</span>
              </div>
            </el-col>
            <el-col :span="8">
              <div>
                <el-button type="warning" @click="handleOperate('2')">退出管理</el-button>
              </div>
            </el-col>
          </el-row>
          <el-row class="operator-tab" v-if="this.form.isArchived==='0'">
            <el-col :span="16">
              <div>
                <span class="project-op-info">归档项目</span>
                <br/>
                <span class="project-op-desc">归档项目，项目将移至已归档项目。</span>
              </div>
            </el-col>
            <el-col :span="8">
              <div>
                <el-button type="warning" @click="handleOperate('3')">归档项目</el-button>
              </div>
            </el-col>
          </el-row>
          <el-row class="operator-tab" v-if="this.form.isDeleted==='0'">
            <el-col :span="16">
              <div>
                <span class="project-op-info">删除项目</span>
                <br/>
                <span class="project-op-desc">删除项目，项目将移至已删除项目。</span>
              </div>
            </el-col>
            <el-col :span="8">
              <div>
                <el-button type="warning" @click="handleOperate('4')">删除项目</el-button>
              </div>
            </el-col>
          </el-row>
          <el-row class="operator-tab" v-if="this.form.isDeleted==='1'">
            <el-col :span="16">
              <div>
                <span class="project-op-info">恢复项目</span>
                <br/>
                <span class="project-op-desc">恢复项目，项目将已删除项目恢复。</span>
              </div>
            </el-col>
            <el-col :span="8">
              <div>
                <el-button type="warning" @click="handleOperate('5')">恢复项目</el-button>
              </div>
            </el-col>
          </el-row>
        </el-tab-pane>
      </el-tabs>
    </el-dialog>

    <!--    项目日历-->
    <el-dialog
      :title="'项目日历'"
      :visible.sync="calendarVisible"
      :fullscreen="true"
      :key="dialogKey1"
    >
      <calendar :projectId="projectId"></calendar>
    </el-dialog>

    <!--    项目任务-->
    <el-dialog
      :fullscreen="true"
      :custom-class="'task-dialog'"
      :title="'项目计划'"
      :visible.sync="taskVisible"
      :key="dialogKey2"
    >
      <task :projectId="projectId"></task>
    </el-dialog>

    <!--    项目概览-->
    <el-dialog
      :fullscreen="true"
      :title="'项目计划'"
      :visible.sync="ovreviewVisible"
      :key="dialogKey3"
    >
      <overview :projectId="projectId"></overview>
    </el-dialog>


  </div>


</template>

<script>

import {
  listProject, getProject, delProject, addProject, updateProject
  , operateProject
} from "@/api/pms/project/project";

import {
  listResources, detailResources, deleteManager, addManager, listManager,
} from "@/api/pms/project/resources";

import GanttElastic from "gantt-elastic";
import GanttHeader from "gantt-elastic-header";
import gantt from '@/components/Gantt/index.vue';
import calendar from "@/views/pms/project/calendar.vue";
import task from "@/views/pms/project/task.vue";
import overview from "@/views/pms/project/overview.vue";

export default {
  name: "Project",
  components: {GanttElastic, GanttHeader, gantt, calendar, task, overview},
  data() {
    return {
      dialogKey1: 0,
      dialogKey2: 0,
      dialogKey3: 0,
      user: {},
      type: "1",
      projectId: null,
      r: "",
      selectManagerId: "",
      //用户列表
      users: [],
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 项目表格数据
      projectList: [],
      managerList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      //日历是否显示
      calendarVisible: false,
      //任务是否显示
      taskVisible: false,
      //概览是否显示
      ovreviewVisible: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        projectName: null,
        description: null,
        userId: null,
        projectStatus: null,
        startDate: null,
        endDate: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        projectName: [
          {required: true, message: "项目名称不能为空", trigger: "blur"}
        ],
        userId: [
          {required: true, message: "创建者ID不能为空", trigger: "blur"}
        ],
        createBy: [
          {required: true, message: "创建者不能为空", trigger: "blur"}
        ],
        createTime: [
          {required: true, message: "创建时间不能为空", trigger: "blur"}
        ],
        updateBy: [
          {required: true, message: "更新者不能为空", trigger: "blur"}
        ],
        updateTime: [
          {required: true, message: "更新时间不能为空", trigger: "blur"}
        ]
      }
    };
  },
  created() {
    let type = this.$route.name;
    //把type转为小写
    type = type.toLowerCase();
    console.info(type)
    this.r = type;
    if (type === 'project/public') {
      this.type = "1";
    } else if (type === 'project/private') {
      this.type = "2";
    } else if (type === 'project/archived') {
      this.type = "3";
    } else if (type === 'project/deleted') {
      this.type = "4";
    } else {
      this.type = "1";
    }

    // listResources().then(response => {
    //  this.users = response.data;
    // });
    detailResources().then(response => {
      this.user = response.data;
      this.getList();
    });


  },
  methods: {
    /** 查询项目列表 */
    getList() {
      this.loading = true;
      this.queryParams.type = this.type;
      listProject(this.queryParams).then(response => {
        this.projectList = response.data.rows;
        this.projectList.forEach(item => {

          if (item.projectManagers) {
            let projectManagersUserIds = item.projectManagers.split(',');
            item.isManager = projectManagersUserIds.includes(this.user.userId + "");
          } else {
            item.isManager = false;
          }

          if (item.isManager === false) {
            if (item.userId === this.user.userId) {
              item.isManager = true;
            } else {
              item.isManager = false;
            }
          }

        });
        this.total = response.data.total;
        this.loading = false;
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
        id: null,
        projectName: null,
        description: null,
        userId: null,
        projectStatus: null,
        startDate: null,
        endDate: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null
      };
      this.selectManagerId = null;
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加项目";

    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id;
      getProject(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改项目";
        this.getManagerList();
      });

    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateProject(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addProject(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除项目编号为"' + ids + '"的数据项？').then(function () {
        return delProject(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {
      });
    },

    handleOperate(operate) {
      let dm = {};
      dm.projectId = this.form.id;
      dm.operate = operate
      let str = "";
      if (operate === '1') {
        str = "发布项目";
      } else if (operate === '2') {
        str = "退出项目";
      } else if (operate === '3') {
        str = "归档项目";
      } else if (operate === '4') {
        str = "删除项目";
      }

      this.$modal.confirm('是否确认' + str + '项目？').then(function () {
        return operateProject(dm);
      }).then(() => {
        this.$modal.msgSuccess("操作成功");
        this.open = false;
        this.getList();
      }).catch(() => {
      });
    },
    /** 导出按钮操作 */
    handleExport() {
      // this.download('system/project/export', {
      //   ...this.queryParams
      // }, `project_${new Date().getTime()}.xlsx`)
      alert("实现中")
    },

    getManagerList() {
      listManager(this.form.id).then(response => {
        this.managerList = response.data;
      });
    },

    handleAddManager(userId) {

      console.info(userId)
      if (userId === null) {
        this.$modal.msgWarning("请选择用户");
        return;
      }


      let manager = {
        userId: userId,
        projectId: this.form.id
      }
      addManager(manager).then(
        response => {
          this.getManagerList();
        }
      )
    },
    handleDeleteManager(row) {
      deleteManager(row.id).then(
        response => {
          this.getManagerList();
        }
      )
    },

    updateProjectTime(projectId) {

    },

    handleOpenTask(row) {
      // const tableName = row.projectName;
      // this.$tab.openPage(tableName + "-任务", '/pms/project-task/index/' + row.id);
      this.projectId = row.id;
      this.dialogKey2 += 1;
      this.taskVisible = true;

    },

    handleOpenCalendar(row) {
      const tableName = row.projectName;
      // this.$tab.openPage(tableName + "-日历", '/pms/project-calendar/index/' + row.id);
      // this.$router.push({ path: '/pms/project-calendar/index/' + row.id, query: '' });
      this.projectId = row.id;
      this.dialogKey1 += 1;
      this.calendarVisible = true;
    },

    handleOpenOverview(row) {
      // const tableName = row.projectName;
      // this.$tab.openPage(tableName + "-概览", '/pms/project-overview/index/' + row.id);
      this.projectId = row.id;
      this.dialogKey3 += 1;
      this.ovreviewVisible = true;
    },


  },
  watch: {
    '$store.state.project.listLastTime': function (newValue, oldValue) {
      this.getList();
    }
  }
}
</script>
<style lang="scss">
.task-desc {
  display: inline-block;
  color: #909399;
}

.task-desc {
  display: inline-block;
  color: #909399;
}

.project-op-info {
  display: inline-block;
  color: #606266;
  font-size: 18px;
}

.project-op-desc {
  display: inline-block;
  font-size: 14px;
  color: #909399;
}

.operator-tab {
  margin-bottom: 20px;
}

.el-table--medium .el-table__cell {
  padding: 8px 0;
}

.el-dialog__body {
padding: 10px 10px !important;

}




</style>
