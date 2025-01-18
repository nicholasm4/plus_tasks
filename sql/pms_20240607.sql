/*
 Navicat Premium Data Transfer

 Source Server         : home
 Source Server Type    : MySQL
 Source Server Version : 50741
 Source Host           : home.plus01.ltd:3306
 Source Schema         : pms

 Target Server Type    : MySQL
 Target Server Version : 50741
 File Encoding         : 65001

 Date: 07/06/2024 17:00:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (3, 'pms_project', '项目', NULL, NULL, 'PmsProject', 'crud', '', 'com.ruoyi.system', 'system', 'project', '项目', 'ruoyi', '0', '/', NULL, 'admin', '2024-04-13 11:16:46', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (4, 'pms_task', '任务', NULL, NULL, 'PmsTask', 'crud', '', 'com.ruoyi.system', 'system', 'task', '任务', 'ruoyi', '0', '/', NULL, 'admin', '2024-04-13 11:16:46', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (5, 'pms_task_assignment', '任务指派', NULL, NULL, 'PmsTaskAssignment', 'crud', '', 'com.ruoyi.system', 'system', 'assignment', '任务指派', 'ruoyi', '0', '/', NULL, 'admin', '2024-04-13 11:16:47', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (6, 'pms_calendar_exceptiondate', '日历例外日期', NULL, NULL, 'PmsCalendarExceptiondate', 'crud', '', 'com.ruoyi.system', 'system', 'exceptiondate', '日历例外日期', 'ruoyi', '0', '/', NULL, 'admin', '2024-04-20 11:16:26', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (7, 'pms_calendar_workdate', '日历工作日期', NULL, NULL, 'PmsCalendarWorkdate', 'crud', '', 'com.ruoyi.system', 'system', 'workdate', '日历工作日期', 'ruoyi', '0', '/', NULL, 'admin', '2024-04-20 11:16:26', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (8, 'pms_calendar_workweek', '日历工作周', NULL, NULL, 'PmsCalendarWorkweek', 'crud', '', 'com.ruoyi.system', 'system', 'workweek', '日历工作周', 'ruoyi', '0', '/', NULL, 'admin', '2024-04-20 11:16:27', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (9, 'pms_calendar', '日历', NULL, NULL, 'PmsCalendar', 'crud', '', 'com.ruoyi.system', 'system', 'calendar', '日历', 'ruoyi', '0', '/', NULL, 'admin', '2024-04-20 11:16:56', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (10, 'pms_calendar_work_time', '日历工作日期', NULL, NULL, 'PmsCalendarWorkTime', 'crud', '', 'com.ruoyi.system', 'system', 'time', '日历工作日期', 'ruoyi', '0', '/', NULL, 'admin', '2024-04-29 05:30:56', '', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint(20) NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 107 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (31, 3, 'id', '项目ID', 'char(36)', 'String', 'id', '1', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-04-13 11:16:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (32, 3, 'project_name', '项目名称', 'varchar(64)', 'String', 'projectName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-04-13 11:16:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (33, 3, 'description', '备注信息', 'varchar(500)', 'String', 'description', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 3, 'admin', '2024-04-13 11:16:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (34, 3, 'user_id', '创建者ID', 'char(36)', 'String', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-04-13 11:16:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (35, 3, 'project_status', '项目状态', 'char(1)', 'String', 'projectStatus', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 5, 'admin', '2024-04-13 11:16:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (36, 3, 'start_date', NULL, 'datetime', 'Date', 'startDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2024-04-13 11:16:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (37, 3, 'end_date', NULL, 'datetime', 'Date', 'endDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 7, 'admin', '2024-04-13 11:16:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (38, 3, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2024-04-13 11:16:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (39, 3, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2024-04-13 11:16:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (40, 3, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2024-04-13 11:16:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (41, 3, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2024-04-13 11:16:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (42, 4, 'id', '项目ID', 'char(36)', 'String', 'id', '1', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-04-13 11:16:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (43, 4, 'project_id', '任务Id', 'char(36)', 'String', 'projectId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-04-13 11:16:47', '', NULL);
INSERT INTO `gen_table_column` VALUES (44, 4, 'task_name', '项目名称', 'varchar(64)', 'String', 'taskName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2024-04-13 11:16:47', '', NULL);
INSERT INTO `gen_table_column` VALUES (45, 4, 'user_id', '创建者ID', 'char(36)', 'String', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-04-13 11:16:47', '', NULL);
INSERT INTO `gen_table_column` VALUES (46, 4, 'task_type', '项目类型', 'char(1)', 'String', 'taskType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 5, 'admin', '2024-04-13 11:16:47', '', NULL);
INSERT INTO `gen_table_column` VALUES (47, 4, 'task_status', '任务状态', 'char(1)', 'String', 'taskStatus', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 6, 'admin', '2024-04-13 11:16:47', '', NULL);
INSERT INTO `gen_table_column` VALUES (48, 4, 'start_date', '开始日期', 'datetime', 'Date', 'startDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 7, 'admin', '2024-04-13 11:16:47', '', NULL);
INSERT INTO `gen_table_column` VALUES (49, 4, 'end_date', '结束日期', 'datetime', 'Date', 'endDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 8, 'admin', '2024-04-13 11:16:47', '', NULL);
INSERT INTO `gen_table_column` VALUES (50, 4, 'description', '描述', 'varchar(255)', 'String', 'description', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-04-13 11:16:47', '', NULL);
INSERT INTO `gen_table_column` VALUES (51, 4, 'p_id', '前置任务Id', 'char(36)', 'String', 'pId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2024-04-13 11:16:47', '', NULL);
INSERT INTO `gen_table_column` VALUES (52, 4, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2024-04-13 11:16:47', '', NULL);
INSERT INTO `gen_table_column` VALUES (53, 4, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2024-04-13 11:16:47', '', NULL);
INSERT INTO `gen_table_column` VALUES (54, 4, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2024-04-13 11:16:47', '', NULL);
INSERT INTO `gen_table_column` VALUES (55, 4, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2024-04-13 11:16:47', '', NULL);
INSERT INTO `gen_table_column` VALUES (56, 5, 'id', '项目ID', 'char(36)', 'String', 'id', '1', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-04-13 11:16:47', '', NULL);
INSERT INTO `gen_table_column` VALUES (57, 5, 'task_id', '任务Id', 'char(36)', 'String', 'taskId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-04-13 11:16:47', '', NULL);
INSERT INTO `gen_table_column` VALUES (58, 5, 'user_id', '创建者ID', 'char(36)', 'String', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-04-13 11:16:47', '', NULL);
INSERT INTO `gen_table_column` VALUES (59, 5, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 4, 'admin', '2024-04-13 11:16:47', '', NULL);
INSERT INTO `gen_table_column` VALUES (60, 5, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 5, 'admin', '2024-04-13 11:16:47', '', NULL);
INSERT INTO `gen_table_column` VALUES (61, 5, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2024-04-13 11:16:47', '', NULL);
INSERT INTO `gen_table_column` VALUES (62, 5, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2024-04-13 11:16:47', '', NULL);
INSERT INTO `gen_table_column` VALUES (63, 6, 'id', 'ID', 'char(36)', 'String', 'id', '1', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-04-20 11:16:26', '', NULL);
INSERT INTO `gen_table_column` VALUES (64, 6, 'calendar_id', '日历Id', 'char(36)', 'String', 'calendarId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-04-20 11:16:26', '', NULL);
INSERT INTO `gen_table_column` VALUES (65, 6, 'description', '备注信息', 'varchar(500)', 'String', 'description', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'textarea', '', 3, 'admin', '2024-04-20 11:16:26', '', NULL);
INSERT INTO `gen_table_column` VALUES (66, 6, 'start_date', '开始时间', 'datetime', 'Date', 'startDate', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2024-04-20 11:16:26', '', NULL);
INSERT INTO `gen_table_column` VALUES (67, 6, 'end_date', '结束时间', 'datetime', 'Date', 'endDate', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2024-04-20 11:16:26', '', NULL);
INSERT INTO `gen_table_column` VALUES (68, 6, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2024-04-20 11:16:26', '', NULL);
INSERT INTO `gen_table_column` VALUES (69, 6, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2024-04-20 11:16:26', '', NULL);
INSERT INTO `gen_table_column` VALUES (70, 6, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2024-04-20 11:16:26', '', NULL);
INSERT INTO `gen_table_column` VALUES (71, 6, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2024-04-20 11:16:26', '', NULL);
INSERT INTO `gen_table_column` VALUES (72, 7, 'id', 'ID', 'char(36)', 'String', 'id', '1', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-04-20 11:16:26', '', NULL);
INSERT INTO `gen_table_column` VALUES (73, 7, 'calendar_id', '日历Id', 'char(36)', 'String', 'calendarId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-04-20 11:16:26', '', NULL);
INSERT INTO `gen_table_column` VALUES (74, 7, 'description', '备注信息', 'varchar(500)', 'String', 'description', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'textarea', '', 3, 'admin', '2024-04-20 11:16:26', '', NULL);
INSERT INTO `gen_table_column` VALUES (75, 7, 'start_date', '开始时间', 'datetime', 'Date', 'startDate', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2024-04-20 11:16:26', '', NULL);
INSERT INTO `gen_table_column` VALUES (76, 7, 'end_date', '结束时间', 'datetime', 'Date', 'endDate', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2024-04-20 11:16:27', '', NULL);
INSERT INTO `gen_table_column` VALUES (77, 7, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2024-04-20 11:16:27', '', NULL);
INSERT INTO `gen_table_column` VALUES (78, 7, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2024-04-20 11:16:27', '', NULL);
INSERT INTO `gen_table_column` VALUES (79, 7, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2024-04-20 11:16:27', '', NULL);
INSERT INTO `gen_table_column` VALUES (80, 7, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2024-04-20 11:16:27', '', NULL);
INSERT INTO `gen_table_column` VALUES (81, 8, 'id', 'ID', 'char(36)', 'String', 'id', '1', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-04-20 11:16:27', '', NULL);
INSERT INTO `gen_table_column` VALUES (82, 8, 'calendar_id', '日历ID', 'char(36)', 'String', 'calendarId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-04-20 11:16:27', '', NULL);
INSERT INTO `gen_table_column` VALUES (83, 8, 'description', '备注信息', 'varchar(500)', 'String', 'description', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'textarea', '', 3, 'admin', '2024-04-20 11:16:27', '', NULL);
INSERT INTO `gen_table_column` VALUES (84, 8, 'week_day', '表示星期几，取值范围为1到7', 'int(11)', 'Long', 'weekDay', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-04-20 11:16:27', '', NULL);
INSERT INTO `gen_table_column` VALUES (85, 8, 'is_workday', '1表示工作日，0表示非工作日', 'char(1)', 'String', 'isWorkday', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-04-20 11:16:27', '', NULL);
INSERT INTO `gen_table_column` VALUES (86, 8, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2024-04-20 11:16:27', '', NULL);
INSERT INTO `gen_table_column` VALUES (87, 8, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2024-04-20 11:16:27', '', NULL);
INSERT INTO `gen_table_column` VALUES (88, 8, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2024-04-20 11:16:27', '', NULL);
INSERT INTO `gen_table_column` VALUES (89, 8, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2024-04-20 11:16:27', '', NULL);
INSERT INTO `gen_table_column` VALUES (90, 9, 'id', '项目ID', 'char(36)', 'String', 'id', '1', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-04-20 11:16:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (91, 9, 'calendar_name', '项目名称', 'varchar(64)', 'String', 'calendarName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-04-20 11:16:57', '', NULL);
INSERT INTO `gen_table_column` VALUES (92, 9, 'description', '备注信息', 'varchar(500)', 'String', 'description', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 3, 'admin', '2024-04-20 11:16:57', '', NULL);
INSERT INTO `gen_table_column` VALUES (93, 9, 'calendar_type', '日历类型1：基准日历  2：项目日历 3.：资源日历', 'char(1)', 'String', 'calendarType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 4, 'admin', '2024-04-20 11:16:57', '', NULL);
INSERT INTO `gen_table_column` VALUES (94, 9, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 5, 'admin', '2024-04-20 11:16:57', '', NULL);
INSERT INTO `gen_table_column` VALUES (95, 9, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2024-04-20 11:16:57', '', NULL);
INSERT INTO `gen_table_column` VALUES (96, 9, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2024-04-20 11:16:57', '', NULL);
INSERT INTO `gen_table_column` VALUES (97, 9, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2024-04-20 11:16:57', '', NULL);
INSERT INTO `gen_table_column` VALUES (98, 10, 'id', 'ID', 'char(36)', 'String', 'id', '1', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-04-29 05:30:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (99, 10, 'calendar_id', '日历Id', 'char(36)', 'String', 'calendarId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-04-29 05:30:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (100, 10, 'description', '备注信息', 'varchar(500)', 'String', 'description', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'textarea', '', 3, 'admin', '2024-04-29 05:30:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (101, 10, 'start_date', '开始时间', 'time', 'Date', 'startDate', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2024-04-29 05:30:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (102, 10, 'end_date', '结束时间', 'time', 'Date', 'endDate', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2024-04-29 05:30:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (103, 10, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2024-04-29 05:30:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (104, 10, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2024-04-29 05:30:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (105, 10, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2024-04-29 05:30:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (106, 10, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2024-04-29 05:30:56', '', NULL);

-- ----------------------------
-- Table structure for pms_calendar
-- ----------------------------
DROP TABLE IF EXISTS `pms_calendar`;
CREATE TABLE `pms_calendar`  (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目ID',
  `calendar_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '项目名称',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  `calendar_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日历类型1：基准日历  2：项目日历 3.：资源日历',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日历' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_calendar
-- ----------------------------
INSERT INTO `pms_calendar` VALUES ('088dbd65-daac-4885-9b36-e6ad75ed0964', '测试2', '', '1', 'admin', '2024-05-01 00:42:48', 'admin', '2024-05-01 00:42:48');
INSERT INTO `pms_calendar` VALUES ('1a00e73c-aaec-453b-98d3-c81ec02faaac', '111', '', '1', 'rd1', '2024-06-07 16:49:55', 'rd1', '2024-06-07 16:49:55');
INSERT INTO `pms_calendar` VALUES ('2c6fae55-c62b-45a6-8623-cb037e7ddafa', '测试', '', '1', 'admin', '2024-04-30 21:13:37', 'admin', '2024-04-30 21:13:37');
INSERT INTO `pms_calendar` VALUES ('35ebb77e-4de5-4593-9671-74e668863e90', '', '', '1', 'admin', '2024-04-23 13:38:18', 'admin', '2024-04-23 13:38:18');
INSERT INTO `pms_calendar` VALUES ('385a77ec-934c-4176-b1bf-19e2e08920e6', '中医临床信息系统', '', '1', 'admin', '2024-04-21 10:48:44', 'admin', '2024-04-21 10:48:44');
INSERT INTO `pms_calendar` VALUES ('460c907f-3130-4e44-848e-4f4b73d40c6d', 'TCIS-科研模块第二期', '', '1', 'jiangjn', '2024-06-06 11:41:03', 'jiangjn', '2024-06-06 11:41:03');
INSERT INTO `pms_calendar` VALUES ('5510a444-2789-4db1-9357-4f45c04a294e', '一级', '', '1', 'admin', '2024-04-21 13:22:27', 'admin', '2024-04-21 13:22:27');
INSERT INTO `pms_calendar` VALUES ('5ebcbbed-68cb-47f6-b57b-397c86835769', 'TEST', '', '1', 'rd1', '2024-05-27 15:52:31', 'rd1', '2024-05-27 15:52:31');
INSERT INTO `pms_calendar` VALUES ('5f7ca606-a33f-41d9-80fa-8a2b613a9471', '', '', '1', 'admin', '2024-04-23 14:27:33', 'admin', '2024-04-23 14:27:33');
INSERT INTO `pms_calendar` VALUES ('89d1e170-ca60-45d4-bc17-b3c3f0577917', 'CIS  4.2.01.001', '', '1', 'rd1', '2024-05-24 14:52:48', 'rd1', '2024-05-24 14:52:48');
INSERT INTO `pms_calendar` VALUES ('945ce344-18b7-4768-b8ec-b9cef51eab5b', '11', '', '1', 'rd1', '2024-06-07 14:57:06', 'rd1', '2024-06-07 14:57:06');
INSERT INTO `pms_calendar` VALUES ('9bd0bfdc-46a6-4550-abf3-a45f023b74a8', 'save测试', '', '1', 'admin', '2024-04-22 22:42:26', 'admin', '2024-04-22 22:42:26');
INSERT INTO `pms_calendar` VALUES ('a372fca9-f45b-439a-97cf-6cb6bb0afd87', '12', '', '1', 'rd1', '2024-06-05 15:19:36', 'rd1', '2024-06-05 15:19:36');
INSERT INTO `pms_calendar` VALUES ('fce10486-94e9-4215-9287-d34a31bd4edb', '测试', '', '1', 'admin', '2024-04-22 22:42:32', 'admin', '2024-04-22 22:42:32');

-- ----------------------------
-- Table structure for pms_calendar_exception_date
-- ----------------------------
DROP TABLE IF EXISTS `pms_calendar_exception_date`;
CREATE TABLE `pms_calendar_exception_date`  (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `calendar_id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日历Id',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注信息',
  `start_date` datetime(0) NOT NULL COMMENT '开始时间',
  `end_date` datetime(0) NOT NULL COMMENT '结束时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日历例外日期' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_calendar_exception_date
-- ----------------------------
INSERT INTO `pms_calendar_exception_date` VALUES ('1d441cb7-0753-40bc-a78a-80de4004a7bc', '385a77ec-934c-4176-b1bf-19e2e08920e6', '五一假期', '2024-05-01 00:00:00', '2024-05-07 00:00:00', 'admin', '2024-04-21 16:06:47', 'admin', '2024-04-21 16:06:47');
INSERT INTO `pms_calendar_exception_date` VALUES ('251283ba-8c26-4621-b4a3-62bdba17d21c', '35ebb77e-4de5-4593-9671-74e668863e90', '五一假期', '2024-05-01 00:00:00', '2024-05-05 00:00:00', 'admin', '2024-04-23 15:20:35', 'admin', '2024-04-23 15:20:35');
INSERT INTO `pms_calendar_exception_date` VALUES ('672210f0-f525-4181-991d-ea906b7b401a', '5510a444-2789-4db1-9357-4f45c04a294e', '五一', '2024-05-01 00:00:00', '2024-05-05 00:00:00', 'admin', '2024-04-23 10:31:02', 'admin', '2024-04-23 10:31:02');
INSERT INTO `pms_calendar_exception_date` VALUES ('7945c8a9-c7de-4151-9a99-e60cd89ff269', '088dbd65-daac-4885-9b36-e6ad75ed0964', '五一', '2024-05-01 00:00:00', '2024-05-10 00:00:00', 'admin', '2024-05-03 18:52:32', 'admin', '2024-05-03 18:52:32');
INSERT INTO `pms_calendar_exception_date` VALUES ('ced92bc4-b83b-4383-86b5-9dd8098b6089', '5510a444-2789-4db1-9357-4f45c04a294e', '五一', '2024-05-05 00:00:00', '2024-05-10 00:00:00', 'admin', '2024-05-03 17:01:39', 'admin', '2024-05-03 17:01:39');

-- ----------------------------
-- Table structure for pms_calendar_work_date
-- ----------------------------
DROP TABLE IF EXISTS `pms_calendar_work_date`;
CREATE TABLE `pms_calendar_work_date`  (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `calendar_id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日历Id',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注信息',
  `start_date` datetime(0) NOT NULL COMMENT '开始时间',
  `end_date` datetime(0) NOT NULL COMMENT '结束时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日历工作日期' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_calendar_work_date
-- ----------------------------
INSERT INTO `pms_calendar_work_date` VALUES ('24f91b65-81b6-4931-acd1-04fe07017755', '385a77ec-934c-4176-b1bf-19e2e08920e6', '五一加班', '2024-05-01 00:00:00', '2024-05-01 00:00:00', 'admin', '2024-04-21 22:56:31', 'admin', '2024-04-21 22:56:31');
INSERT INTO `pms_calendar_work_date` VALUES ('2d7389ee-eb75-422d-996f-8f2bd76bd592', '5510a444-2789-4db1-9357-4f45c04a294e', '', '2024-05-03 17:30:04', '2024-05-03 17:30:04', 'admin', '2024-05-03 17:30:04', 'admin', '2024-05-03 17:30:04');
INSERT INTO `pms_calendar_work_date` VALUES ('3176da68-8659-44c1-b145-83f624acb325', '385a77ec-934c-4176-b1bf-19e2e08920e6', '五一加班', '2024-05-02 00:00:00', '2024-05-02 00:00:00', 'admin', '2024-04-21 13:42:32', 'admin', '2024-04-21 13:42:32');
INSERT INTO `pms_calendar_work_date` VALUES ('3a48a6e8-5a8f-402e-9b54-d2d7e7efff2c', '5510a444-2789-4db1-9357-4f45c04a294e', '', '2024-05-03 17:02:15', '2024-05-03 17:02:15', 'admin', '2024-05-03 17:02:15', 'admin', '2024-05-03 17:02:15');
INSERT INTO `pms_calendar_work_date` VALUES ('47af073c-6aeb-4e26-a5b5-d38b2ee75223', '35ebb77e-4de5-4593-9671-74e668863e90', '五一加班', '2024-05-01 00:00:00', '2024-05-01 00:00:00', 'admin', '2024-04-29 10:32:15', 'admin', '2024-04-29 10:32:15');
INSERT INTO `pms_calendar_work_date` VALUES ('91ca4f6c-848e-4ded-a8f8-3c6128704c29', '088dbd65-daac-4885-9b36-e6ad75ed0964', '', '2024-05-03 19:18:26', '2024-05-03 19:18:26', 'admin', '2024-05-03 19:18:26', 'admin', '2024-05-03 19:18:26');
INSERT INTO `pms_calendar_work_date` VALUES ('9204eeec-d1bb-4dfa-b847-19c9ba3a769a', '5510a444-2789-4db1-9357-4f45c04a294e', '', '2024-05-09 00:00:00', '2024-05-10 00:00:00', 'admin', '2024-05-03 17:01:59', 'admin', '2024-05-03 17:01:59');
INSERT INTO `pms_calendar_work_date` VALUES ('b6b73ea5-9c96-4515-95da-f0d40f0155f3', '5510a444-2789-4db1-9357-4f45c04a294e', '', '2024-05-03 17:29:58', '2024-05-03 17:29:58', 'admin', '2024-05-03 17:29:58', 'admin', '2024-05-03 17:29:58');
INSERT INTO `pms_calendar_work_date` VALUES ('c50f4026-fa3b-4ec2-91b8-d607f1682cd3', '5510a444-2789-4db1-9357-4f45c04a294e', '', '2024-05-03 17:30:18', '2024-05-03 17:30:18', 'admin', '2024-05-03 17:30:18', 'admin', '2024-05-03 17:30:18');
INSERT INTO `pms_calendar_work_date` VALUES ('d60267e4-aaf8-4d1b-b66a-153b4dab656d', '5510a444-2789-4db1-9357-4f45c04a294e', '', '2024-05-03 17:30:08', '2024-05-03 17:30:08', 'admin', '2024-05-03 17:30:09', 'admin', '2024-05-03 17:30:09');

-- ----------------------------
-- Table structure for pms_calendar_work_time
-- ----------------------------
DROP TABLE IF EXISTS `pms_calendar_work_time`;
CREATE TABLE `pms_calendar_work_time`  (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `calendar_id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日历Id',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注信息',
  `start_time` time(0) NOT NULL COMMENT '开始时间',
  `end_time` time(0) NOT NULL COMMENT '结束时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日历工作日期' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_calendar_work_time
-- ----------------------------
INSERT INTO `pms_calendar_work_time` VALUES ('24f91b65-81b6-4931-acd1-04fe07017755', '385a77ec-934c-4176-b1bf-19e2e08920e6', '五一加班', '09:30:00', '09:30:00', 'admin', '2024-04-21 22:56:31', 'admin', '2024-04-21 22:56:31');
INSERT INTO `pms_calendar_work_time` VALUES ('3176da68-8659-44c1-b145-83f624acb325', '385a77ec-934c-4176-b1bf-19e2e08920e6', '五一加班', '13:00:00', '17:30:00', 'admin', '2024-04-21 13:42:32', 'admin', '2024-04-21 13:42:32');
INSERT INTO `pms_calendar_work_time` VALUES ('47af073c-6aeb-4e26-a5b5-d38b2ee75223', '35ebb77e-4de5-4593-9671-74e668863e90', '上午', '09:00:00', '12:00:00', 'admin', '2024-04-29 10:32:15', 'admin', '2024-04-29 10:32:15');
INSERT INTO `pms_calendar_work_time` VALUES ('47e10a11-5bf1-4d05-a80c-467519873471', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '下午', '13:30:00', '18:00:00', 'rd1', '2024-05-24 17:10:39', 'rd1', '2024-05-24 17:10:39');
INSERT INTO `pms_calendar_work_time` VALUES ('8e639709-c414-4d1e-bad5-6c38870d5de2', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '上午', '09:00:00', '12:00:00', 'rd1', '2024-05-24 17:10:30', 'rd1', '2024-05-24 17:10:30');
INSERT INTO `pms_calendar_work_time` VALUES ('c54d5fd5-2a39-4f5b-881d-2fafb24cf7ef', '35ebb77e-4de5-4593-9671-74e668863e90', '下午', '13:30:00', '18:00:00', 'admin', '2024-04-29 10:31:27', 'admin', '2024-04-29 10:31:27');
INSERT INTO `pms_calendar_work_time` VALUES ('fb51d77c-fcb3-477e-888f-d54b9db4dd13', '1a00e73c-aaec-453b-98d3-c81ec02faaac', '', '09:00:00', '12:00:00', 'rd1', '2024-06-07 16:51:09', 'rd1', '2024-06-07 16:51:09');

-- ----------------------------
-- Table structure for pms_calendar_work_week
-- ----------------------------
DROP TABLE IF EXISTS `pms_calendar_work_week`;
CREATE TABLE `pms_calendar_work_week`  (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `calendar_id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日历ID',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注信息',
  `week_day` int(11) NOT NULL COMMENT '表示星期几，取值范围为1到7',
  `is_workday` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '1表示工作日，0表示非工作日',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日历工作周' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_calendar_work_week
-- ----------------------------
INSERT INTO `pms_calendar_work_week` VALUES ('00f3b12a-1528-4ca6-ba71-bc88b12384c2', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '星期六', 6, '0', 'rd1', '2024-05-24 14:52:48', 'rd1', '2024-05-24 14:52:48');
INSERT INTO `pms_calendar_work_week` VALUES ('06df8a3f-15af-45c0-9ab3-c6d4631ea623', '460c907f-3130-4e44-848e-4f4b73d40c6d', '星期五', 5, '1', 'jiangjn', '2024-06-06 11:41:03', 'jiangjn', '2024-06-06 11:41:03');
INSERT INTO `pms_calendar_work_week` VALUES ('094ecd13-e7b1-4772-aac2-a6b80779b4e6', '35ebb77e-4de5-4593-9671-74e668863e90', '星期二', 2, '1', 'admin', '2024-04-23 13:38:18', 'admin', '2024-04-23 13:38:18');
INSERT INTO `pms_calendar_work_week` VALUES ('09dadf11-2af2-4bda-9ff8-e4dabda7e3b3', '35ebb77e-4de5-4593-9671-74e668863e90', '星期五', 5, '1', 'admin', '2024-04-23 13:38:18', 'admin', '2024-04-23 13:38:18');
INSERT INTO `pms_calendar_work_week` VALUES ('0c69c977-7d70-4071-bee4-9281a2320dbf', '5ebcbbed-68cb-47f6-b57b-397c86835769', '星期五', 5, '1', 'rd1', '2024-05-27 15:52:31', 'rd1', '2024-05-27 15:52:31');
INSERT INTO `pms_calendar_work_week` VALUES ('0ebc7af5-0263-4296-9695-c49def11e5e2', '460c907f-3130-4e44-848e-4f4b73d40c6d', '星期日', 0, '0', 'jiangjn', '2024-06-06 11:41:03', 'jiangjn', '2024-06-06 11:41:03');
INSERT INTO `pms_calendar_work_week` VALUES ('140be52e-3993-46b9-934a-afbfb5c8baa3', 'a372fca9-f45b-439a-97cf-6cb6bb0afd87', '星期二', 2, '1', 'rd1', '2024-06-05 15:19:36', 'rd1', '2024-06-05 15:19:36');
INSERT INTO `pms_calendar_work_week` VALUES ('1436d9b1-52b5-4cda-ae95-fd47a8c7a657', 'a372fca9-f45b-439a-97cf-6cb6bb0afd87', '星期五', 5, '1', 'rd1', '2024-06-05 15:19:36', 'rd1', '2024-06-05 15:19:36');
INSERT INTO `pms_calendar_work_week` VALUES ('16ea92e1-ef7b-4aa3-92bf-12b479bd6dcb', '35ebb77e-4de5-4593-9671-74e668863e90', '星期六', 6, '0', 'admin', '2024-04-23 13:38:18', 'admin', '2024-04-23 13:38:18');
INSERT INTO `pms_calendar_work_week` VALUES ('1ac74a0d-9d39-4930-8549-e3d5850a986d', '385a77ec-934c-4176-b1bf-19e2e08920e6', '星期五', 5, '1', 'admin', '2024-04-21 10:48:46', 'admin', '2024-04-21 10:48:46');
INSERT INTO `pms_calendar_work_week` VALUES ('1f91db57-0915-4231-b864-7a37b79818ee', '5510a444-2789-4db1-9357-4f45c04a294e', '星期五', 5, '1', 'admin', '2024-04-21 13:22:27', 'admin', '2024-04-21 13:22:27');
INSERT INTO `pms_calendar_work_week` VALUES ('255e1024-c91c-470f-9bb2-9ebea2cc58d5', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '星期一', 1, '1', 'rd1', '2024-05-24 14:52:48', 'rd1', '2024-05-24 14:52:48');
INSERT INTO `pms_calendar_work_week` VALUES ('25a2cd7c-5eb7-4b61-bc13-943272b9da7e', '1a00e73c-aaec-453b-98d3-c81ec02faaac', '星期一', 1, '1', 'rd1', '2024-06-07 16:49:55', 'rd1', '2024-06-07 16:49:55');
INSERT INTO `pms_calendar_work_week` VALUES ('29ef3ca7-6441-4e15-8a66-761405775494', '5510a444-2789-4db1-9357-4f45c04a294e', '星期六', 6, '0', 'admin', '2024-04-21 13:22:27', 'admin', '2024-04-21 13:22:27');
INSERT INTO `pms_calendar_work_week` VALUES ('2a0a6869-99ed-4cf8-b215-dc8ab809ae5b', '1a00e73c-aaec-453b-98d3-c81ec02faaac', '星期三', 3, '1', 'rd1', '2024-06-07 16:49:55', 'rd1', '2024-06-07 16:49:55');
INSERT INTO `pms_calendar_work_week` VALUES ('2e03ca5f-77f4-44e5-9654-539c9dc103bb', '9bd0bfdc-46a6-4550-abf3-a45f023b74a8', '星期日', 0, '0', 'admin', '2024-04-22 22:42:26', 'admin', '2024-04-22 22:42:26');
INSERT INTO `pms_calendar_work_week` VALUES ('2fcd2870-948e-44bd-883f-2d6d4ec6bdbb', '088dbd65-daac-4885-9b36-e6ad75ed0964', '星期日', 0, '0', 'admin', '2024-05-01 00:42:48', 'admin', '2024-05-01 00:42:48');
INSERT INTO `pms_calendar_work_week` VALUES ('2fec95eb-6651-4e8d-92ce-c56a1d1e9f56', '5510a444-2789-4db1-9357-4f45c04a294e', '星期四', 4, '1', 'admin', '2024-04-21 13:22:27', 'admin', '2024-04-21 13:22:27');
INSERT INTO `pms_calendar_work_week` VALUES ('3046e77d-310c-4276-b7cb-2756736351cd', '35ebb77e-4de5-4593-9671-74e668863e90', '星期四', 4, '1', 'admin', '2024-04-23 13:38:18', 'admin', '2024-04-23 13:38:18');
INSERT INTO `pms_calendar_work_week` VALUES ('32961ea0-b276-43ba-a2a8-d53101b8f159', '945ce344-18b7-4768-b8ec-b9cef51eab5b', '星期三', 3, '1', 'rd1', '2024-06-07 14:57:06', 'rd1', '2024-06-07 14:57:06');
INSERT INTO `pms_calendar_work_week` VALUES ('34ebfa9e-460a-4f24-ac54-87a8e01634e0', 'a372fca9-f45b-439a-97cf-6cb6bb0afd87', '星期三', 3, '1', 'rd1', '2024-06-05 15:19:36', 'rd1', '2024-06-05 15:19:36');
INSERT INTO `pms_calendar_work_week` VALUES ('3690e660-52aa-4ffc-84bf-6ca36949d463', '2c6fae55-c62b-45a6-8623-cb037e7ddafa', '星期四', 4, '1', 'admin', '2024-04-30 21:13:37', 'admin', '2024-04-30 21:13:37');
INSERT INTO `pms_calendar_work_week` VALUES ('37996f10-b3c6-43e2-8892-de198aaed3cf', 'fce10486-94e9-4215-9287-d34a31bd4edb', '星期六', 6, '0', 'admin', '2024-04-22 22:42:32', 'admin', '2024-04-22 22:42:32');
INSERT INTO `pms_calendar_work_week` VALUES ('37efc367-9c60-4f5d-8f50-3a48f216cff5', '460c907f-3130-4e44-848e-4f4b73d40c6d', '星期三', 3, '1', 'jiangjn', '2024-06-06 11:41:03', 'jiangjn', '2024-06-06 11:41:03');
INSERT INTO `pms_calendar_work_week` VALUES ('38b76f8d-1f5a-4b2b-a1d9-a01ac537f3c4', '5510a444-2789-4db1-9357-4f45c04a294e', '星期日', 0, '0', 'admin', '2024-04-21 13:22:27', 'admin', '2024-04-21 13:22:27');
INSERT INTO `pms_calendar_work_week` VALUES ('3a9360d6-96c5-40b7-941e-2cd852f354bc', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '星期二', 2, '1', 'rd1', '2024-05-24 14:52:48', 'rd1', '2024-05-24 14:52:48');
INSERT INTO `pms_calendar_work_week` VALUES ('3c7ecca2-b3bb-4934-9698-38eefa1c552b', '5ebcbbed-68cb-47f6-b57b-397c86835769', '星期一', 1, '1', 'rd1', '2024-05-27 15:52:31', 'rd1', '2024-05-27 15:52:31');
INSERT INTO `pms_calendar_work_week` VALUES ('3e5ff19f-6c45-44b1-abae-9e953611d992', '35ebb77e-4de5-4593-9671-74e668863e90', '星期三', 3, '1', 'admin', '2024-04-23 13:38:18', 'admin', '2024-04-23 13:38:18');
INSERT INTO `pms_calendar_work_week` VALUES ('3e834489-3248-423c-b858-3e05f905bc32', '088dbd65-daac-4885-9b36-e6ad75ed0964', '星期一', 1, '1', 'admin', '2024-05-01 00:42:48', 'admin', '2024-05-01 00:42:48');
INSERT INTO `pms_calendar_work_week` VALUES ('41abe58e-d281-49a8-a5b5-e12d7086b4c8', '088dbd65-daac-4885-9b36-e6ad75ed0964', '星期五', 5, '1', 'admin', '2024-05-01 00:42:48', 'admin', '2024-05-01 00:42:48');
INSERT INTO `pms_calendar_work_week` VALUES ('4388dfc4-30c0-4730-bc2d-64f8d8ab0938', '5ebcbbed-68cb-47f6-b57b-397c86835769', '星期六', 6, '0', 'rd1', '2024-05-27 15:52:31', 'rd1', '2024-05-27 15:52:31');
INSERT INTO `pms_calendar_work_week` VALUES ('444262f1-be12-4d11-a445-24694a32aab2', '35ebb77e-4de5-4593-9671-74e668863e90', '星期一', 1, '1', 'admin', '2024-04-23 13:38:18', 'admin', '2024-04-23 13:38:18');
INSERT INTO `pms_calendar_work_week` VALUES ('4701a418-035b-45f4-8c6f-fb1eeed27cd5', '2c6fae55-c62b-45a6-8623-cb037e7ddafa', '星期六', 6, '0', 'admin', '2024-04-30 21:13:37', 'admin', '2024-04-30 21:13:37');
INSERT INTO `pms_calendar_work_week` VALUES ('4814bdc2-0e4b-440d-9f8e-3c49be98b985', '5f7ca606-a33f-41d9-80fa-8a2b613a9471', '星期日', 0, '0', 'admin', '2024-04-23 14:27:33', 'admin', '2024-04-23 14:27:33');
INSERT INTO `pms_calendar_work_week` VALUES ('482f894a-db95-45c9-b32a-060bee1f92a7', '945ce344-18b7-4768-b8ec-b9cef51eab5b', '星期日', 0, '0', 'rd1', '2024-06-07 14:57:06', 'rd1', '2024-06-07 14:57:06');
INSERT INTO `pms_calendar_work_week` VALUES ('4d48776d-3b32-4945-9c6b-727508e19fbd', '2c6fae55-c62b-45a6-8623-cb037e7ddafa', '星期二', 2, '1', 'admin', '2024-04-30 21:13:37', 'admin', '2024-04-30 21:13:37');
INSERT INTO `pms_calendar_work_week` VALUES ('52173803-22f9-4b94-8d5a-754602a5b4e4', '945ce344-18b7-4768-b8ec-b9cef51eab5b', '星期一', 1, '1', 'rd1', '2024-06-07 14:57:06', 'rd1', '2024-06-07 14:57:06');
INSERT INTO `pms_calendar_work_week` VALUES ('54ceb2c6-c1f1-412d-8826-c927ff104726', '460c907f-3130-4e44-848e-4f4b73d40c6d', '星期四', 4, '1', 'jiangjn', '2024-06-06 11:41:03', 'jiangjn', '2024-06-06 11:41:03');
INSERT INTO `pms_calendar_work_week` VALUES ('55966a27-26ff-4e4a-a04d-d9783b2b30d5', '1a00e73c-aaec-453b-98d3-c81ec02faaac', '星期五', 5, '1', 'rd1', '2024-06-07 16:49:55', 'rd1', '2024-06-07 16:49:55');
INSERT INTO `pms_calendar_work_week` VALUES ('5714a9be-05ea-4974-851b-afac2547bf3d', '9bd0bfdc-46a6-4550-abf3-a45f023b74a8', '星期二', 2, '1', 'admin', '2024-04-22 22:42:26', 'admin', '2024-04-22 22:42:26');
INSERT INTO `pms_calendar_work_week` VALUES ('5d2fd941-832a-44bd-801b-6b0b2cbc79e5', '385a77ec-934c-4176-b1bf-19e2e08920e6', '星期三', 3, '1', 'admin', '2024-04-21 10:48:46', 'admin', '2024-04-21 10:48:46');
INSERT INTO `pms_calendar_work_week` VALUES ('5ea1a6f8-9a38-44cf-8ec3-d4ead2605bb9', 'a372fca9-f45b-439a-97cf-6cb6bb0afd87', '星期四', 4, '1', 'rd1', '2024-06-05 15:19:36', 'rd1', '2024-06-05 15:19:36');
INSERT INTO `pms_calendar_work_week` VALUES ('608a2f6d-675a-493a-af6f-ca52b1b8d7fe', 'fce10486-94e9-4215-9287-d34a31bd4edb', '星期二', 2, '1', 'admin', '2024-04-22 22:42:32', 'admin', '2024-04-22 22:42:32');
INSERT INTO `pms_calendar_work_week` VALUES ('64f12139-33a8-4430-821e-6c815275ffaf', '5f7ca606-a33f-41d9-80fa-8a2b613a9471', '星期一', 1, '1', 'admin', '2024-04-23 14:27:33', 'admin', '2024-04-23 14:27:33');
INSERT INTO `pms_calendar_work_week` VALUES ('674f97f3-6095-419d-8e2b-af6622934fff', '5ebcbbed-68cb-47f6-b57b-397c86835769', '星期三', 3, '1', 'rd1', '2024-05-27 15:52:31', 'rd1', '2024-05-27 15:52:31');
INSERT INTO `pms_calendar_work_week` VALUES ('6774b91a-24e1-4f27-b91b-25fc37106ed0', 'fce10486-94e9-4215-9287-d34a31bd4edb', '星期三', 3, '1', 'admin', '2024-04-22 22:42:32', 'admin', '2024-04-22 22:42:32');
INSERT INTO `pms_calendar_work_week` VALUES ('6f5fb458-7886-4ef8-8435-816595b390c9', '5ebcbbed-68cb-47f6-b57b-397c86835769', '星期二', 2, '1', 'rd1', '2024-05-27 15:52:31', 'rd1', '2024-05-27 15:52:31');
INSERT INTO `pms_calendar_work_week` VALUES ('714c4279-864c-4b77-90a8-8cbb9c0ab0e5', '460c907f-3130-4e44-848e-4f4b73d40c6d', '星期六', 6, '0', 'jiangjn', '2024-06-06 11:41:03', 'jiangjn', '2024-06-06 11:41:03');
INSERT INTO `pms_calendar_work_week` VALUES ('7259b378-5d44-4556-9b39-b8288d15cc4a', '1a00e73c-aaec-453b-98d3-c81ec02faaac', '星期二', 2, '1', 'rd1', '2024-06-07 16:49:55', 'rd1', '2024-06-07 16:49:55');
INSERT INTO `pms_calendar_work_week` VALUES ('74141683-ba30-408c-aba1-731d475ae897', '1a00e73c-aaec-453b-98d3-c81ec02faaac', '星期四', 4, '1', 'rd1', '2024-06-07 16:49:55', 'rd1', '2024-06-07 16:49:55');
INSERT INTO `pms_calendar_work_week` VALUES ('78047788-17d4-488a-b70b-b69fcf233f95', '9bd0bfdc-46a6-4550-abf3-a45f023b74a8', '星期一', 1, '1', 'admin', '2024-04-22 22:42:26', 'admin', '2024-04-22 22:42:26');
INSERT INTO `pms_calendar_work_week` VALUES ('7be945f2-34c6-4d4c-8c19-513b5f19e29c', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '星期四', 4, '1', 'rd1', '2024-05-24 14:52:48', 'rd1', '2024-05-24 14:52:48');
INSERT INTO `pms_calendar_work_week` VALUES ('7d605bdd-f0f7-4f85-87f7-211d27c510bf', '5ebcbbed-68cb-47f6-b57b-397c86835769', '星期四', 4, '1', 'rd1', '2024-05-27 15:52:31', 'rd1', '2024-05-27 15:52:31');
INSERT INTO `pms_calendar_work_week` VALUES ('8166d84c-ac1b-40e8-9911-c89cf60f0a02', '5f7ca606-a33f-41d9-80fa-8a2b613a9471', '星期三', 3, '1', 'admin', '2024-04-23 14:27:33', 'admin', '2024-04-23 14:27:33');
INSERT INTO `pms_calendar_work_week` VALUES ('85b7e39e-73d5-49dd-96a3-cd845af0902f', '5510a444-2789-4db1-9357-4f45c04a294e', '星期三', 3, '1', 'admin', '2024-04-21 13:22:27', 'admin', '2024-04-21 13:22:27');
INSERT INTO `pms_calendar_work_week` VALUES ('878754d9-9ff6-4dfc-bac8-044431e09de9', '9bd0bfdc-46a6-4550-abf3-a45f023b74a8', '星期五', 5, '1', 'admin', '2024-04-22 22:42:26', 'admin', '2024-04-22 22:42:26');
INSERT INTO `pms_calendar_work_week` VALUES ('8a12d72a-8a7f-4958-9a0f-a1ef1f16689c', '945ce344-18b7-4768-b8ec-b9cef51eab5b', '星期二', 2, '1', 'rd1', '2024-06-07 14:57:06', 'rd1', '2024-06-07 14:57:06');
INSERT INTO `pms_calendar_work_week` VALUES ('8b9620b2-d87b-40de-898e-b5f4f9682860', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '星期三', 3, '1', 'rd1', '2024-05-24 14:52:48', 'rd1', '2024-05-24 14:52:48');
INSERT INTO `pms_calendar_work_week` VALUES ('94467f6a-67ed-490a-bb9f-6c75aeaa6822', 'fce10486-94e9-4215-9287-d34a31bd4edb', '星期一', 1, '1', 'admin', '2024-04-22 22:42:32', 'admin', '2024-04-22 22:42:32');
INSERT INTO `pms_calendar_work_week` VALUES ('9661de78-e502-48b3-ba2f-1b553b165e82', '5510a444-2789-4db1-9357-4f45c04a294e', '星期一', 1, '1', 'admin', '2024-04-21 13:22:27', 'admin', '2024-04-21 13:22:27');
INSERT INTO `pms_calendar_work_week` VALUES ('970ef222-ead5-4e93-9ccf-dd21ff2c4b81', '5f7ca606-a33f-41d9-80fa-8a2b613a9471', '星期二', 2, '1', 'admin', '2024-04-23 14:27:33', 'admin', '2024-04-23 14:27:33');
INSERT INTO `pms_calendar_work_week` VALUES ('9a277b58-2bde-4619-99c3-73594f096039', '460c907f-3130-4e44-848e-4f4b73d40c6d', '星期二', 2, '1', 'jiangjn', '2024-06-06 11:41:03', 'jiangjn', '2024-06-06 11:41:03');
INSERT INTO `pms_calendar_work_week` VALUES ('9c2edd5a-b796-4e05-94fd-5a0a0c04e9ed', 'fce10486-94e9-4215-9287-d34a31bd4edb', '星期四', 4, '1', 'admin', '2024-04-22 22:42:32', 'admin', '2024-04-22 22:42:32');
INSERT INTO `pms_calendar_work_week` VALUES ('9daa5729-5080-4d21-a229-c633da8d88d1', '2c6fae55-c62b-45a6-8623-cb037e7ddafa', '星期三', 3, '1', 'admin', '2024-04-30 21:13:37', 'admin', '2024-04-30 21:13:37');
INSERT INTO `pms_calendar_work_week` VALUES ('a0445a14-89b6-4f18-b0e8-863eb7416317', '5f7ca606-a33f-41d9-80fa-8a2b613a9471', '星期五', 5, '1', 'admin', '2024-04-23 14:27:33', 'admin', '2024-04-23 14:27:33');
INSERT INTO `pms_calendar_work_week` VALUES ('a3887fcc-07fc-47a3-8731-4141734d96e3', '088dbd65-daac-4885-9b36-e6ad75ed0964', '星期六', 6, '0', 'admin', '2024-05-01 00:42:48', 'admin', '2024-05-01 00:42:48');
INSERT INTO `pms_calendar_work_week` VALUES ('a4101500-4b58-487f-9f9a-408fd0669a80', '5510a444-2789-4db1-9357-4f45c04a294e', '星期二', 2, '1', 'admin', '2024-04-21 13:22:27', 'admin', '2024-04-21 13:22:27');
INSERT INTO `pms_calendar_work_week` VALUES ('a4714818-8e1f-445a-8b3b-1c6fef9f410e', 'a372fca9-f45b-439a-97cf-6cb6bb0afd87', '星期一', 1, '1', 'rd1', '2024-06-05 15:19:36', 'rd1', '2024-06-05 15:19:36');
INSERT INTO `pms_calendar_work_week` VALUES ('a6e09d3a-0630-4b11-a3e9-1ed05b172b84', 'fce10486-94e9-4215-9287-d34a31bd4edb', '星期日', 0, '0', 'admin', '2024-04-22 22:42:32', 'admin', '2024-04-22 22:42:32');
INSERT INTO `pms_calendar_work_week` VALUES ('a7bd20bc-f5af-430e-b2a5-f3e198383356', '460c907f-3130-4e44-848e-4f4b73d40c6d', '星期一', 1, '1', 'jiangjn', '2024-06-06 11:41:03', 'jiangjn', '2024-06-06 11:41:03');
INSERT INTO `pms_calendar_work_week` VALUES ('a87a3a08-5b82-4a69-bb25-16f7d03ea461', '385a77ec-934c-4176-b1bf-19e2e08920e6', '星期日', 0, '0', 'admin', '2024-04-21 10:48:46', 'admin', '2024-04-21 10:48:46');
INSERT INTO `pms_calendar_work_week` VALUES ('ab14763c-54ce-4c15-aa94-707d3a89a489', '5f7ca606-a33f-41d9-80fa-8a2b613a9471', '星期四', 4, '1', 'admin', '2024-04-23 14:27:33', 'admin', '2024-04-23 14:27:33');
INSERT INTO `pms_calendar_work_week` VALUES ('b9a22d5c-a3b2-44b4-88a7-73f0b7845060', '088dbd65-daac-4885-9b36-e6ad75ed0964', '星期三', 3, '1', 'admin', '2024-05-01 00:42:48', 'admin', '2024-05-01 00:42:48');
INSERT INTO `pms_calendar_work_week` VALUES ('ba2ff768-1f74-49a1-bc4b-4a7084b59a3d', '5ebcbbed-68cb-47f6-b57b-397c86835769', '星期日', 0, '0', 'rd1', '2024-05-27 15:52:31', 'rd1', '2024-05-27 15:52:31');
INSERT INTO `pms_calendar_work_week` VALUES ('ba8ba70b-a8d2-4451-92e0-214597e5ae85', '1a00e73c-aaec-453b-98d3-c81ec02faaac', '星期六', 6, '0', 'rd1', '2024-06-07 16:49:55', 'rd1', '2024-06-07 16:49:55');
INSERT INTO `pms_calendar_work_week` VALUES ('c00bf436-2173-4344-9f0a-7335bb93e41c', '5f7ca606-a33f-41d9-80fa-8a2b613a9471', '星期六', 6, '0', 'admin', '2024-04-23 14:27:33', 'admin', '2024-04-23 14:27:33');
INSERT INTO `pms_calendar_work_week` VALUES ('c120e977-8f17-4049-829d-660623ca8204', '385a77ec-934c-4176-b1bf-19e2e08920e6', '星期六', 6, '0', 'admin', '2024-04-21 10:48:46', 'admin', '2024-04-21 10:48:46');
INSERT INTO `pms_calendar_work_week` VALUES ('c79b7ac9-2b57-494f-ae41-5ead0e223a78', 'a372fca9-f45b-439a-97cf-6cb6bb0afd87', '星期六', 6, '0', 'rd1', '2024-06-05 15:19:36', 'rd1', '2024-06-05 15:19:36');
INSERT INTO `pms_calendar_work_week` VALUES ('cd2eeac6-0d98-4ab7-93f2-11c1d1806d46', '088dbd65-daac-4885-9b36-e6ad75ed0964', '星期四', 4, '1', 'admin', '2024-05-01 00:42:48', 'admin', '2024-05-01 00:42:48');
INSERT INTO `pms_calendar_work_week` VALUES ('ce6a93ba-b30c-4495-aa09-ba3f3083c44a', '1a00e73c-aaec-453b-98d3-c81ec02faaac', '星期日', 0, '0', 'rd1', '2024-06-07 16:49:55', 'rd1', '2024-06-07 16:49:55');
INSERT INTO `pms_calendar_work_week` VALUES ('ce970f1e-b1bc-45cf-9f4a-ef5728aba035', '945ce344-18b7-4768-b8ec-b9cef51eab5b', '星期五', 5, '1', 'rd1', '2024-06-07 14:57:06', 'rd1', '2024-06-07 14:57:06');
INSERT INTO `pms_calendar_work_week` VALUES ('d76776ef-2f7a-4525-b533-f4d281fc0172', 'fce10486-94e9-4215-9287-d34a31bd4edb', '星期五', 5, '1', 'admin', '2024-04-22 22:42:32', 'admin', '2024-04-22 22:42:32');
INSERT INTO `pms_calendar_work_week` VALUES ('d8f73ca0-b9fd-4d57-b9d9-3af059b5f098', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '星期日', 0, '0', 'rd1', '2024-05-24 14:52:48', 'rd1', '2024-05-24 14:52:48');
INSERT INTO `pms_calendar_work_week` VALUES ('d9b105b7-7ed7-44f2-b856-2e747d3f527d', '9bd0bfdc-46a6-4550-abf3-a45f023b74a8', '星期三', 3, '1', 'admin', '2024-04-22 22:42:26', 'admin', '2024-04-22 22:42:26');
INSERT INTO `pms_calendar_work_week` VALUES ('db5d81ba-b6c5-4a38-95c8-62b8598c382b', '35ebb77e-4de5-4593-9671-74e668863e90', '星期日', 0, '0', 'admin', '2024-04-23 13:38:18', 'admin', '2024-04-23 13:38:18');
INSERT INTO `pms_calendar_work_week` VALUES ('dd26f092-85cd-4d38-b8fb-1fc2734ee9a4', '9bd0bfdc-46a6-4550-abf3-a45f023b74a8', '星期四', 4, '1', 'admin', '2024-04-22 22:42:26', 'admin', '2024-04-22 22:42:26');
INSERT INTO `pms_calendar_work_week` VALUES ('e1a58271-ddcc-4cce-81f5-71058883fdbc', '385a77ec-934c-4176-b1bf-19e2e08920e6', '星期二', 2, '1', 'admin', '2024-04-21 10:48:46', 'admin', '2024-04-21 10:48:46');
INSERT INTO `pms_calendar_work_week` VALUES ('e5043aa6-eca9-4494-bede-3101fde9efcb', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '星期五', 5, '1', 'rd1', '2024-05-24 14:52:48', 'rd1', '2024-05-24 14:52:48');
INSERT INTO `pms_calendar_work_week` VALUES ('e5f92303-83e2-4897-9af2-d057e02ae109', '945ce344-18b7-4768-b8ec-b9cef51eab5b', '星期六', 6, '0', 'rd1', '2024-06-07 14:57:06', 'rd1', '2024-06-07 14:57:06');
INSERT INTO `pms_calendar_work_week` VALUES ('ea95e7f8-5d85-4acf-8a25-58be26c56b0b', 'a372fca9-f45b-439a-97cf-6cb6bb0afd87', '星期日', 0, '0', 'rd1', '2024-06-05 15:19:36', 'rd1', '2024-06-05 15:19:36');
INSERT INTO `pms_calendar_work_week` VALUES ('ed7fbfef-c95d-45bf-bd4f-215d1d079a87', '2c6fae55-c62b-45a6-8623-cb037e7ddafa', '星期五', 5, '1', 'admin', '2024-04-30 21:13:37', 'admin', '2024-04-30 21:13:37');
INSERT INTO `pms_calendar_work_week` VALUES ('ee9700b0-d791-4f21-86ba-63919c02f862', '088dbd65-daac-4885-9b36-e6ad75ed0964', '星期二', 2, '1', 'admin', '2024-05-01 00:42:48', 'admin', '2024-05-01 00:42:48');
INSERT INTO `pms_calendar_work_week` VALUES ('f32cfae8-c73c-49c1-894a-25eadd64b6f9', '945ce344-18b7-4768-b8ec-b9cef51eab5b', '星期四', 4, '1', 'rd1', '2024-06-07 14:57:06', 'rd1', '2024-06-07 14:57:06');
INSERT INTO `pms_calendar_work_week` VALUES ('f3deca7f-42c9-4311-9098-4751e389b86b', '385a77ec-934c-4176-b1bf-19e2e08920e6', '星期四', 4, '1', 'admin', '2024-04-21 10:48:46', 'admin', '2024-04-21 10:48:46');
INSERT INTO `pms_calendar_work_week` VALUES ('f5f4ff99-0411-4614-9a5b-a00bbae319fb', '2c6fae55-c62b-45a6-8623-cb037e7ddafa', '星期日', 0, '0', 'admin', '2024-04-30 21:13:37', 'admin', '2024-04-30 21:13:37');
INSERT INTO `pms_calendar_work_week` VALUES ('f7bf99d3-e08c-4605-bf3a-36b4cb536653', '9bd0bfdc-46a6-4550-abf3-a45f023b74a8', '星期六', 6, '0', 'admin', '2024-04-22 22:42:26', 'admin', '2024-04-22 22:42:26');
INSERT INTO `pms_calendar_work_week` VALUES ('fd851675-f67b-48b2-9d2a-f75dbbb0dc78', '385a77ec-934c-4176-b1bf-19e2e08920e6', '星期一', 1, '1', 'admin', '2024-04-21 10:48:46', 'admin', '2024-04-21 10:48:46');
INSERT INTO `pms_calendar_work_week` VALUES ('ff8025cf-107b-43c8-9826-79c6f67cce86', '2c6fae55-c62b-45a6-8623-cb037e7ddafa', '星期一', 1, '1', 'admin', '2024-04-30 21:13:37', 'admin', '2024-04-30 21:13:37');

-- ----------------------------
-- Table structure for pms_comment
-- ----------------------------
DROP TABLE IF EXISTS `pms_comment`;
CREATE TABLE `pms_comment`  (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目ID',
  `module_id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模块Id',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `user_id` bigint(20) NOT NULL COMMENT '创建者ID',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务指派' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_comment
-- ----------------------------
INSERT INTO `pms_comment` VALUES ('23be9c36-c599-416c-aa6d-2c759bd35165', 'e43f3945-c5de-4769-a476-d4d85fcf70d1', '<p>qqqqq</p>', 1, 'admin', '2024-05-17 22:17:08', 'admin', '2024-05-17 22:17:08');
INSERT INTO `pms_comment` VALUES ('38612e2d-1500-4b79-bfc2-7b655df25897', '008987c1-016a-4513-92c4-96643604aa42', '', 2, 'ry', '2024-05-11 15:27:20', 'ry', '2024-05-11 15:27:20');
INSERT INTO `pms_comment` VALUES ('6bb7c6ea-1af8-42bd-bc82-87aadda3812d', '06c96943-ece0-437a-86e7-7242f228de1c', '', 2, 'ry', '2024-05-11 15:53:11', 'ry', '2024-05-11 15:53:11');
INSERT INTO `pms_comment` VALUES ('826ae0ea-ceaa-4cad-96ee-cc2c800d5df1', 'dcb98d19-bb00-4a6f-b25d-d9307fc19b9b', '<p>经验医案没有广泛查询</p>', 4, 'rd1', '2024-05-27 11:41:23', 'rd1', '2024-05-27 11:41:23');
INSERT INTO `pms_comment` VALUES ('a3d43e97-81bb-44c3-901b-8062c7a80c27', 'dcb98d19-bb00-4a6f-b25d-d9307fc19b9b', '<p>欠 ：广泛筛选</p>', 4, 'rd1', '2024-05-25 17:37:54', 'rd1', '2024-05-25 17:37:54');
INSERT INTO `pms_comment` VALUES ('c48b4601-d665-47ce-bac3-0bf76052fa40', 'b8f2e9bc-2f07-4c40-8880-9e165563e990', '<p>欠经验医案</p>', 4, 'rd1', '2024-05-30 17:58:05', 'rd1', '2024-05-30 17:58:05');
INSERT INTO `pms_comment` VALUES ('e96b944e-9d65-456d-971c-8d3e27d8fcc8', '13e37820-565c-4ada-b99a-e7a756b79454', '<p>欠   广泛筛选 、 科研问卷分值、常规问卷分值 条建判断</p>', 4, 'rd1', '2024-05-25 17:38:45', 'rd1', '2024-05-25 17:38:45');

-- ----------------------------
-- Table structure for pms_project
-- ----------------------------
DROP TABLE IF EXISTS `pms_project`;
CREATE TABLE `pms_project`  (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目ID',
  `project_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '项目名称',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  `user_id` bigint(20) NOT NULL COMMENT '创建者ID',
  `project_status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0：草稿 ，1：发布',
  `is_visibility` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0:项目管理者可见，1：全部人可见',
  `is_archived` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0 ：未归档 ，1：已归档',
  `is_deleted` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1：未删除， 1：已删除',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_project
-- ----------------------------
INSERT INTO `pms_project` VALUES ('088dbd65-daac-4885-9b36-e6ad75ed0964', '测试2', '', 1, '0', '0', '0', '0', 'admin', '2024-05-01 00:42:48', 'admin', '2024-05-01 00:42:48');
INSERT INTO `pms_project` VALUES ('1a00e73c-aaec-453b-98d3-c81ec02faaac', '111', '111', 4, '1', '0', '0', '0', 'rd1', '2024-06-07 16:49:55', 'rd1', '2024-06-07 16:49:55');
INSERT INTO `pms_project` VALUES ('2c6fae55-c62b-45a6-8623-cb037e7ddafa', '测试1', '', 1, '0', '0', '0', '0', 'admin', '2024-04-30 21:13:37', 'admin', '2024-04-30 21:13:37');
INSERT INTO `pms_project` VALUES ('35ebb77e-4de5-4593-9671-74e668863e90', '中医临床信息系统', '中医临床信息系统............1', 1, '0', '0', '0', '0', 'admin', '2024-04-23 13:38:18', 'admin', '2024-04-23 13:38:18');
INSERT INTO `pms_project` VALUES ('385a77ec-934c-4176-b1bf-19e2e08920e6', '信息系统', '', 1, '1', '1', '0', '0', 'admin', '2024-04-14 22:02:19', 'admin', '2024-04-14 22:02:19');
INSERT INTO `pms_project` VALUES ('460c907f-3130-4e44-848e-4f4b73d40c6d', 'TCIS-科研模块第二期', 'V4.1.02.001', 7, '1', '1', '0', '0', 'jiangjn', '2024-06-06 11:41:03', 'jiangjn', '2024-06-06 11:41:03');
INSERT INTO `pms_project` VALUES ('5510a444-2789-4db1-9357-4f45c04a294e', '一级', '中医临床信息系统...........', 1, '1', '0', '0', '0', 'admin', '2024-04-18 09:08:11', 'admin', '2024-04-18 09:08:11');
INSERT INTO `pms_project` VALUES ('5ebcbbed-68cb-47f6-b57b-397c86835769', 'TEST', '测试模块', 4, '0', '0', '0', '0', 'rd1', '2024-05-27 15:52:31', 'rd1', '2024-05-27 15:52:31');
INSERT INTO `pms_project` VALUES ('5f7ca606-a33f-41d9-80fa-8a2b613a9471', '1212', '121212', 1, '0', '0', '0', '0', 'admin', '2024-04-23 14:27:33', 'admin', '2024-04-23 14:27:33');
INSERT INTO `pms_project` VALUES ('89d1e170-ca60-45d4-bc17-b3c3f0577917', '科研模块', 'V4.1.001', 4, '1', '1', '0', '0', 'rd1', '2024-05-24 14:52:48', 'rd1', '2024-05-24 14:52:48');
INSERT INTO `pms_project` VALUES ('945ce344-18b7-4768-b8ec-b9cef51eab5b', '11', '111', 4, '0', '0', '0', '0', 'rd1', '2024-06-07 14:57:05', 'rd1', '2024-06-07 14:57:05');
INSERT INTO `pms_project` VALUES ('9bd0bfdc-46a6-4550-abf3-a45f023b74a8', 'save测试', '中医临床信息系统...........', 1, '0', '0', '0', '0', 'admin', '2024-04-18 13:39:33', 'admin', '2024-04-18 13:39:33');
INSERT INTO `pms_project` VALUES ('a372fca9-f45b-439a-97cf-6cb6bb0afd87', '12', '12', 4, '1', '1', '1', '0', 'rd1', '2024-06-05 15:19:36', 'rd1', '2024-06-05 15:19:36');
INSERT INTO `pms_project` VALUES ('fce10486-94e9-4215-9287-d34a31bd4edb', '测试', '中医临床信息系统...........', 1, '0', '0', '0', '0', 'admin', '2024-04-19 11:01:09', 'admin', '2024-04-19 11:01:09');

-- ----------------------------
-- Table structure for pms_project_dynamics
-- ----------------------------
DROP TABLE IF EXISTS `pms_project_dynamics`;
CREATE TABLE `pms_project_dynamics`  (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目ID',
  `project_id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目ID',
  `content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务指派' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_project_dynamics
-- ----------------------------
INSERT INTO `pms_project_dynamics` VALUES ('1791477632247394305', '5510a444-2789-4db1-9357-4f45c04a294e', '系统管理员更新了项目进度,当前项目进度为99%', 'admin', '2024-05-17 22:35:26', 'admin', '2024-05-17 22:35:26');
INSERT INTO `pms_project_dynamics` VALUES ('1791477637565771778', '5510a444-2789-4db1-9357-4f45c04a294e', '系统管理员更新了项目进度,当前项目进度为99%', 'admin', '2024-05-17 22:35:28', 'admin', '2024-05-17 22:35:28');
INSERT INTO `pms_project_dynamics` VALUES ('1792013946961117185', '5510a444-2789-4db1-9357-4f45c04a294e', '系统管理员更新了项目进度,当前项目进度为98%', 'admin', '2024-05-19 10:06:34', 'admin', '2024-05-19 10:06:34');
INSERT INTO `pms_project_dynamics` VALUES ('1793939932646850562', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为1%', 'rd1', '2024-05-24 17:39:44', 'rd1', '2024-05-24 17:39:44');
INSERT INTO `pms_project_dynamics` VALUES ('1793940065925054466', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为3%', 'rd1', '2024-05-24 17:40:16', 'rd1', '2024-05-24 17:40:16');
INSERT INTO `pms_project_dynamics` VALUES ('1793940104516845569', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为5%', 'rd1', '2024-05-24 17:40:25', 'rd1', '2024-05-24 17:40:25');
INSERT INTO `pms_project_dynamics` VALUES ('1793940354711273473', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为6%', 'rd1', '2024-05-24 17:41:25', 'rd1', '2024-05-24 17:41:25');
INSERT INTO `pms_project_dynamics` VALUES ('1793940622710521857', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为9%', 'rd1', '2024-05-24 17:42:29', 'rd1', '2024-05-24 17:42:29');
INSERT INTO `pms_project_dynamics` VALUES ('1793940638695014401', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为12%', 'rd1', '2024-05-24 17:42:33', 'rd1', '2024-05-24 17:42:33');
INSERT INTO `pms_project_dynamics` VALUES ('1793940747377819650', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为13%', 'rd1', '2024-05-24 17:42:59', 'rd1', '2024-05-24 17:42:59');
INSERT INTO `pms_project_dynamics` VALUES ('1793940779787206658', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为14%', 'rd1', '2024-05-24 17:43:06', 'rd1', '2024-05-24 17:43:06');
INSERT INTO `pms_project_dynamics` VALUES ('1793940847164506114', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为15%', 'rd1', '2024-05-24 17:43:22', 'rd1', '2024-05-24 17:43:22');
INSERT INTO `pms_project_dynamics` VALUES ('1793940902483181570', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为17%', 'rd1', '2024-05-24 17:43:36', 'rd1', '2024-05-24 17:43:36');
INSERT INTO `pms_project_dynamics` VALUES ('1793940951464263682', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为19%', 'rd1', '2024-05-24 17:43:47', 'rd1', '2024-05-24 17:43:47');
INSERT INTO `pms_project_dynamics` VALUES ('1793940967289372674', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为21%', 'rd1', '2024-05-24 17:43:51', 'rd1', '2024-05-24 17:43:51');
INSERT INTO `pms_project_dynamics` VALUES ('1793940980698562562', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为23%', 'rd1', '2024-05-24 17:43:54', 'rd1', '2024-05-24 17:43:54');
INSERT INTO `pms_project_dynamics` VALUES ('1793941004006309890', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为25%', 'rd1', '2024-05-24 17:44:00', 'rd1', '2024-05-24 17:44:00');
INSERT INTO `pms_project_dynamics` VALUES ('1793941222437273602', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为27%', 'rd1', '2024-05-24 17:44:52', 'rd1', '2024-05-24 17:44:52');
INSERT INTO `pms_project_dynamics` VALUES ('1793941235552862210', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为29%', 'rd1', '2024-05-24 17:44:55', 'rd1', '2024-05-24 17:44:55');
INSERT INTO `pms_project_dynamics` VALUES ('1793941389697728513', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为30%', 'rd1', '2024-05-24 17:45:32', 'rd1', '2024-05-24 17:45:32');
INSERT INTO `pms_project_dynamics` VALUES ('1793944728409825281', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为29%', 'rd1', '2024-05-24 17:58:48', 'rd1', '2024-05-24 17:58:48');
INSERT INTO `pms_project_dynamics` VALUES ('1793944761788096514', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为28%', 'rd1', '2024-05-24 17:58:56', 'rd1', '2024-05-24 17:58:56');
INSERT INTO `pms_project_dynamics` VALUES ('1793944776984059905', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为27%', 'rd1', '2024-05-24 17:58:59', 'rd1', '2024-05-24 17:58:59');
INSERT INTO `pms_project_dynamics` VALUES ('1793944845623844865', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为26%', 'rd1', '2024-05-24 17:59:16', 'rd1', '2024-05-24 17:59:16');
INSERT INTO `pms_project_dynamics` VALUES ('1793948253235798017', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为26%', 'rd1', '2024-05-24 18:12:48', 'rd1', '2024-05-24 18:12:48');
INSERT INTO `pms_project_dynamics` VALUES ('1793950981022396417', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为28%', 'rd1', '2024-05-24 18:23:39', 'rd1', '2024-05-24 18:23:39');
INSERT INTO `pms_project_dynamics` VALUES ('1793991711524401153', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为28%', 'rd1', '2024-05-24 21:05:29', 'rd1', '2024-05-24 21:05:29');
INSERT INTO `pms_project_dynamics` VALUES ('1793992143529324546', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为28%', 'rd1', '2024-05-24 21:07:12', 'rd1', '2024-05-24 21:07:12');
INSERT INTO `pms_project_dynamics` VALUES ('1793994920200515585', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为28%', 'rd1', '2024-05-24 21:18:14', 'rd1', '2024-05-24 21:18:14');
INSERT INTO `pms_project_dynamics` VALUES ('1793994936784793601', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为28%', 'rd1', '2024-05-24 21:18:18', 'rd1', '2024-05-24 21:18:18');
INSERT INTO `pms_project_dynamics` VALUES ('1794017415058173953', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为30%', 'rd1', '2024-05-24 22:47:38', 'rd1', '2024-05-24 22:47:38');
INSERT INTO `pms_project_dynamics` VALUES ('1794017426009501697', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为30%', 'rd1', '2024-05-24 22:47:40', 'rd1', '2024-05-24 22:47:40');
INSERT INTO `pms_project_dynamics` VALUES ('1794017773851521026', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为32%', 'rd1', '2024-05-24 22:49:03', 'rd1', '2024-05-24 22:49:03');
INSERT INTO `pms_project_dynamics` VALUES ('1794018095164567554', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为30%', 'rd1', '2024-05-24 22:50:20', 'rd1', '2024-05-24 22:50:20');
INSERT INTO `pms_project_dynamics` VALUES ('1794018126919643138', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为28%', 'rd1', '2024-05-24 22:50:27', 'rd1', '2024-05-24 22:50:27');
INSERT INTO `pms_project_dynamics` VALUES ('1794018585394819074', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为27%', 'rd1', '2024-05-24 22:52:17', 'rd1', '2024-05-24 22:52:17');
INSERT INTO `pms_project_dynamics` VALUES ('1794018595943493633', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为27%', 'rd1', '2024-05-24 22:52:19', 'rd1', '2024-05-24 22:52:19');
INSERT INTO `pms_project_dynamics` VALUES ('1794018636154286082', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为27%', 'rd1', '2024-05-24 22:52:29', 'rd1', '2024-05-24 22:52:29');
INSERT INTO `pms_project_dynamics` VALUES ('1794018653850054658', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为27%', 'rd1', '2024-05-24 22:52:33', 'rd1', '2024-05-24 22:52:33');
INSERT INTO `pms_project_dynamics` VALUES ('1794018670715351042', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为27%', 'rd1', '2024-05-24 22:52:37', 'rd1', '2024-05-24 22:52:37');
INSERT INTO `pms_project_dynamics` VALUES ('1794018747429171202', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为28%', 'rd1', '2024-05-24 22:52:55', 'rd1', '2024-05-24 22:52:55');
INSERT INTO `pms_project_dynamics` VALUES ('1794018803658010626', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为28%', 'rd1', '2024-05-24 22:53:09', 'rd1', '2024-05-24 22:53:09');
INSERT INTO `pms_project_dynamics` VALUES ('1794021948857528321', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为28%', 'rd1', '2024-05-24 23:05:39', 'rd1', '2024-05-24 23:05:39');
INSERT INTO `pms_project_dynamics` VALUES ('1794032507661332481', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为28%', 'rd1', '2024-05-24 23:47:36', 'rd1', '2024-05-24 23:47:36');
INSERT INTO `pms_project_dynamics` VALUES ('1794033004640219138', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为28%', 'rd1', '2024-05-24 23:49:34', 'rd1', '2024-05-24 23:49:34');
INSERT INTO `pms_project_dynamics` VALUES ('1794187005085134850', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为28%', 'rd1', '2024-05-25 10:01:31', 'rd1', '2024-05-25 10:01:31');
INSERT INTO `pms_project_dynamics` VALUES ('1794187016585916418', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为28%', 'rd1', '2024-05-25 10:01:34', 'rd1', '2024-05-25 10:01:34');
INSERT INTO `pms_project_dynamics` VALUES ('1794187179326304258', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为28%', 'rd1', '2024-05-25 10:02:13', 'rd1', '2024-05-25 10:02:13');
INSERT INTO `pms_project_dynamics` VALUES ('1794187187584888833', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为28%', 'rd1', '2024-05-25 10:02:15', 'rd1', '2024-05-25 10:02:15');
INSERT INTO `pms_project_dynamics` VALUES ('1794187200935358466', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为28%', 'rd1', '2024-05-25 10:02:18', 'rd1', '2024-05-25 10:02:18');
INSERT INTO `pms_project_dynamics` VALUES ('1794213877642760194', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为30%', 'rd1', '2024-05-25 11:48:18', 'rd1', '2024-05-25 11:48:18');
INSERT INTO `pms_project_dynamics` VALUES ('1794275920836104193', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为31%', 'rd1', '2024-05-25 15:54:50', 'rd1', '2024-05-25 15:54:50');
INSERT INTO `pms_project_dynamics` VALUES ('1794275937646874625', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为31%', 'rd1', '2024-05-25 15:54:54', 'rd1', '2024-05-25 15:54:54');
INSERT INTO `pms_project_dynamics` VALUES ('1794275951987200002', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为32%', 'rd1', '2024-05-25 15:54:58', 'rd1', '2024-05-25 15:54:58');
INSERT INTO `pms_project_dynamics` VALUES ('1794275965434138625', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为34%', 'rd1', '2024-05-25 15:55:01', 'rd1', '2024-05-25 15:55:01');
INSERT INTO `pms_project_dynamics` VALUES ('1794275993535975426', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为34%', 'rd1', '2024-05-25 15:55:08', 'rd1', '2024-05-25 15:55:08');
INSERT INTO `pms_project_dynamics` VALUES ('1794276021491011586', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为35%', 'rd1', '2024-05-25 15:55:14', 'rd1', '2024-05-25 15:55:14');
INSERT INTO `pms_project_dynamics` VALUES ('1794276036699557890', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为36%', 'rd1', '2024-05-25 15:55:18', 'rd1', '2024-05-25 15:55:18');
INSERT INTO `pms_project_dynamics` VALUES ('1794276040365379585', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为36%', 'rd1', '2024-05-25 15:55:19', 'rd1', '2024-05-25 15:55:19');
INSERT INTO `pms_project_dynamics` VALUES ('1794276062565830657', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为37%', 'rd1', '2024-05-25 15:55:24', 'rd1', '2024-05-25 15:55:24');
INSERT INTO `pms_project_dynamics` VALUES ('1794276075278766082', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为38%', 'rd1', '2024-05-25 15:55:27', 'rd1', '2024-05-25 15:55:27');
INSERT INTO `pms_project_dynamics` VALUES ('1794276091217121281', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为40%', 'rd1', '2024-05-25 15:55:31', 'rd1', '2024-05-25 15:55:31');
INSERT INTO `pms_project_dynamics` VALUES ('1794276109407817730', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为40%', 'rd1', '2024-05-25 15:55:35', 'rd1', '2024-05-25 15:55:35');
INSERT INTO `pms_project_dynamics` VALUES ('1794276125677522946', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为41%', 'rd1', '2024-05-25 15:55:39', 'rd1', '2024-05-25 15:55:39');
INSERT INTO `pms_project_dynamics` VALUES ('1794276137874558978', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为42%', 'rd1', '2024-05-25 15:55:42', 'rd1', '2024-05-25 15:55:42');
INSERT INTO `pms_project_dynamics` VALUES ('1794276150977564674', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为43%', 'rd1', '2024-05-25 15:55:45', 'rd1', '2024-05-25 15:55:45');
INSERT INTO `pms_project_dynamics` VALUES ('1794276574837149698', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为45%', 'rd1', '2024-05-25 15:57:26', 'rd1', '2024-05-25 15:57:26');
INSERT INTO `pms_project_dynamics` VALUES ('1794279610053627906', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为45%', 'rd1', '2024-05-25 16:09:30', 'rd1', '2024-05-25 16:09:30');
INSERT INTO `pms_project_dynamics` VALUES ('1794279615787241474', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为46%', 'rd1', '2024-05-25 16:09:31', 'rd1', '2024-05-25 16:09:31');
INSERT INTO `pms_project_dynamics` VALUES ('1794279645055094786', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为45%', 'rd1', '2024-05-25 16:09:38', 'rd1', '2024-05-25 16:09:38');
INSERT INTO `pms_project_dynamics` VALUES ('1794279659043098625', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为46%', 'rd1', '2024-05-25 16:09:41', 'rd1', '2024-05-25 16:09:41');
INSERT INTO `pms_project_dynamics` VALUES ('1794281481283637250', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为47%', 'rd1', '2024-05-25 16:16:56', 'rd1', '2024-05-25 16:16:56');
INSERT INTO `pms_project_dynamics` VALUES ('1794281510576656385', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为48%', 'rd1', '2024-05-25 16:17:03', 'rd1', '2024-05-25 16:17:03');
INSERT INTO `pms_project_dynamics` VALUES ('1794281538439417857', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为48%', 'rd1', '2024-05-25 16:17:10', 'rd1', '2024-05-25 16:17:10');
INSERT INTO `pms_project_dynamics` VALUES ('1794281566990045186', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为48%', 'rd1', '2024-05-25 16:17:16', 'rd1', '2024-05-25 16:17:16');
INSERT INTO `pms_project_dynamics` VALUES ('1794281571914158082', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为48%', 'rd1', '2024-05-25 16:17:18', 'rd1', '2024-05-25 16:17:18');
INSERT INTO `pms_project_dynamics` VALUES ('1794281586262872066', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为48%', 'rd1', '2024-05-25 16:17:21', 'rd1', '2024-05-25 16:17:21');
INSERT INTO `pms_project_dynamics` VALUES ('1794281687635005441', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为48%', 'rd1', '2024-05-25 16:17:45', 'rd1', '2024-05-25 16:17:45');
INSERT INTO `pms_project_dynamics` VALUES ('1794281907001298945', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为48%', 'rd1', '2024-05-25 16:18:37', 'rd1', '2024-05-25 16:18:37');
INSERT INTO `pms_project_dynamics` VALUES ('1794281921765249025', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为50%', 'rd1', '2024-05-25 16:18:41', 'rd1', '2024-05-25 16:18:41');
INSERT INTO `pms_project_dynamics` VALUES ('1794282586105253889', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为50%', 'rd1', '2024-05-25 16:21:19', 'rd1', '2024-05-25 16:21:19');
INSERT INTO `pms_project_dynamics` VALUES ('1794282614500691969', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为50%', 'rd1', '2024-05-25 16:21:26', 'rd1', '2024-05-25 16:21:26');
INSERT INTO `pms_project_dynamics` VALUES ('1794282619743571969', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为49%', 'rd1', '2024-05-25 16:21:27', 'rd1', '2024-05-25 16:21:27');
INSERT INTO `pms_project_dynamics` VALUES ('1794282623598137345', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为49%', 'rd1', '2024-05-25 16:21:28', 'rd1', '2024-05-25 16:21:28');
INSERT INTO `pms_project_dynamics` VALUES ('1794282635509960706', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为49%', 'rd1', '2024-05-25 16:21:31', 'rd1', '2024-05-25 16:21:31');
INSERT INTO `pms_project_dynamics` VALUES ('1794282647967043586', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为49%', 'rd1', '2024-05-25 16:21:34', 'rd1', '2024-05-25 16:21:34');
INSERT INTO `pms_project_dynamics` VALUES ('1794282665604091906', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为48%', 'rd1', '2024-05-25 16:21:38', 'rd1', '2024-05-25 16:21:38');
INSERT INTO `pms_project_dynamics` VALUES ('1794282676748357634', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为48%', 'rd1', '2024-05-25 16:21:41', 'rd1', '2024-05-25 16:21:41');
INSERT INTO `pms_project_dynamics` VALUES ('1794282686508503042', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为48%', 'rd1', '2024-05-25 16:21:43', 'rd1', '2024-05-25 16:21:43');
INSERT INTO `pms_project_dynamics` VALUES ('1794282696474169346', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为47%', 'rd1', '2024-05-25 16:21:46', 'rd1', '2024-05-25 16:21:46');
INSERT INTO `pms_project_dynamics` VALUES ('1794282710873214977', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为47%', 'rd1', '2024-05-25 16:21:49', 'rd1', '2024-05-25 16:21:49');
INSERT INTO `pms_project_dynamics` VALUES ('1794282728090832898', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为47%', 'rd1', '2024-05-25 16:21:53', 'rd1', '2024-05-25 16:21:53');
INSERT INTO `pms_project_dynamics` VALUES ('1794282736743682049', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为46%', 'rd1', '2024-05-25 16:21:55', 'rd1', '2024-05-25 16:21:55');
INSERT INTO `pms_project_dynamics` VALUES ('1794282749360148481', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为46%', 'rd1', '2024-05-25 16:21:58', 'rd1', '2024-05-25 16:21:58');
INSERT INTO `pms_project_dynamics` VALUES ('1794282758860247041', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为46%', 'rd1', '2024-05-25 16:22:01', 'rd1', '2024-05-25 16:22:01');
INSERT INTO `pms_project_dynamics` VALUES ('1794282940863680513', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为47%', 'rd1', '2024-05-25 16:22:44', 'rd1', '2024-05-25 16:22:44');
INSERT INTO `pms_project_dynamics` VALUES ('1794282976032919553', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为46%', 'rd1', '2024-05-25 16:22:52', 'rd1', '2024-05-25 16:22:52');
INSERT INTO `pms_project_dynamics` VALUES ('1794282984975175682', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为47%', 'rd1', '2024-05-25 16:22:54', 'rd1', '2024-05-25 16:22:54');
INSERT INTO `pms_project_dynamics` VALUES ('1794283084870914049', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为47%', 'rd1', '2024-05-25 16:23:18', 'rd1', '2024-05-25 16:23:18');
INSERT INTO `pms_project_dynamics` VALUES ('1794301250170851330', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为46%', 'rd1', '2024-05-25 17:35:29', 'rd1', '2024-05-25 17:35:29');
INSERT INTO `pms_project_dynamics` VALUES ('1794302190403784706', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为45%', 'rd1', '2024-05-25 17:39:13', 'rd1', '2024-05-25 17:39:13');
INSERT INTO `pms_project_dynamics` VALUES ('1794302478468583425', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为43%', 'rd1', '2024-05-25 17:40:22', 'rd1', '2024-05-25 17:40:22');
INSERT INTO `pms_project_dynamics` VALUES ('1794302501017161729', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为43%', 'rd1', '2024-05-25 17:40:27', 'rd1', '2024-05-25 17:40:27');
INSERT INTO `pms_project_dynamics` VALUES ('1794302540900798466', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为43%', 'rd1', '2024-05-25 17:40:37', 'rd1', '2024-05-25 17:40:37');
INSERT INTO `pms_project_dynamics` VALUES ('1794302586153144322', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为43%', 'rd1', '2024-05-25 17:40:48', 'rd1', '2024-05-25 17:40:48');
INSERT INTO `pms_project_dynamics` VALUES ('1794303054925336578', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为43%', 'rd1', '2024-05-25 17:42:39', 'rd1', '2024-05-25 17:42:39');
INSERT INTO `pms_project_dynamics` VALUES ('1794303168498700290', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为44%', 'rd1', '2024-05-25 17:43:07', 'rd1', '2024-05-25 17:43:07');
INSERT INTO `pms_project_dynamics` VALUES ('1794303396278767617', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为43%', 'rd1', '2024-05-25 17:44:01', 'rd1', '2024-05-25 17:44:01');
INSERT INTO `pms_project_dynamics` VALUES ('1794304532444418049', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为43%', 'rd1', '2024-05-25 17:48:32', 'rd1', '2024-05-25 17:48:32');
INSERT INTO `pms_project_dynamics` VALUES ('1794304598898970625', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为43%', 'rd1', '2024-05-25 17:48:48', 'rd1', '2024-05-25 17:48:48');
INSERT INTO `pms_project_dynamics` VALUES ('1794304702800269313', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为45%', 'rd1', '2024-05-25 17:49:12', 'rd1', '2024-05-25 17:49:12');
INSERT INTO `pms_project_dynamics` VALUES ('1794936841146855426', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为46%', 'rd1', '2024-05-27 11:41:06', 'rd1', '2024-05-27 11:41:06');
INSERT INTO `pms_project_dynamics` VALUES ('1794936980624240642', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为46%', 'rd1', '2024-05-27 11:41:39', 'rd1', '2024-05-27 11:41:39');
INSERT INTO `pms_project_dynamics` VALUES ('1794964791577669634', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为48%', 'rd1', '2024-05-27 13:32:10', 'rd1', '2024-05-27 13:32:10');
INSERT INTO `pms_project_dynamics` VALUES ('1794964814184968193', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为47%', 'rd1', '2024-05-27 13:32:15', 'rd1', '2024-05-27 13:32:15');
INSERT INTO `pms_project_dynamics` VALUES ('1794990192949587969', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为48%', 'rd1', '2024-05-27 15:13:06', 'rd1', '2024-05-27 15:13:06');
INSERT INTO `pms_project_dynamics` VALUES ('1794992067073667074', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为48%', 'rd1', '2024-05-27 15:20:33', 'rd1', '2024-05-27 15:20:33');
INSERT INTO `pms_project_dynamics` VALUES ('1794999031522250753', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为48%', 'rd1', '2024-05-27 15:48:13', 'rd1', '2024-05-27 15:48:13');
INSERT INTO `pms_project_dynamics` VALUES ('1795000340761661441', '5ebcbbed-68cb-47f6-b57b-397c86835769', '研发经理更新了项目进度,当前项目进度为0%', 'rd1', '2024-05-27 15:53:25', 'rd1', '2024-05-27 15:53:25');
INSERT INTO `pms_project_dynamics` VALUES ('1795000364111351810', '5ebcbbed-68cb-47f6-b57b-397c86835769', '研发经理更新了项目进度,当前项目进度为0%', 'rd1', '2024-05-27 15:53:31', 'rd1', '2024-05-27 15:53:31');
INSERT INTO `pms_project_dynamics` VALUES ('1795000372550291457', '5ebcbbed-68cb-47f6-b57b-397c86835769', '研发经理更新了项目进度,当前项目进度为0%', 'rd1', '2024-05-27 15:53:33', 'rd1', '2024-05-27 15:53:33');
INSERT INTO `pms_project_dynamics` VALUES ('1795001671316525057', '5ebcbbed-68cb-47f6-b57b-397c86835769', '研发经理更新了项目进度,当前项目进度为0%', 'rd1', '2024-05-27 15:58:43', 'rd1', '2024-05-27 15:58:43');
INSERT INTO `pms_project_dynamics` VALUES ('1795001858944520193', '5ebcbbed-68cb-47f6-b57b-397c86835769', '研发经理更新了项目进度,当前项目进度为0%', 'rd1', '2024-05-27 15:59:27', 'rd1', '2024-05-27 15:59:27');
INSERT INTO `pms_project_dynamics` VALUES ('1795001935347961857', '5ebcbbed-68cb-47f6-b57b-397c86835769', '研发经理更新了项目进度,当前项目进度为0%', 'rd1', '2024-05-27 15:59:46', 'rd1', '2024-05-27 15:59:46');
INSERT INTO `pms_project_dynamics` VALUES ('1795001959997886465', '5ebcbbed-68cb-47f6-b57b-397c86835769', '研发经理更新了项目进度,当前项目进度为0%', 'rd1', '2024-05-27 15:59:51', 'rd1', '2024-05-27 15:59:51');
INSERT INTO `pms_project_dynamics` VALUES ('1795005808833843201', '5ebcbbed-68cb-47f6-b57b-397c86835769', '研发经理更新了项目进度,当前项目进度为0%', 'rd1', '2024-05-27 16:15:09', 'rd1', '2024-05-27 16:15:09');
INSERT INTO `pms_project_dynamics` VALUES ('1795007387796361218', '5ebcbbed-68cb-47f6-b57b-397c86835769', '研发经理更新了项目进度,当前项目进度为0%', 'rd1', '2024-05-27 16:21:26', 'rd1', '2024-05-27 16:21:26');
INSERT INTO `pms_project_dynamics` VALUES ('1795007567073497090', '5ebcbbed-68cb-47f6-b57b-397c86835769', '研发经理更新了项目进度,当前项目进度为0%', 'rd1', '2024-05-27 16:22:08', 'rd1', '2024-05-27 16:22:08');
INSERT INTO `pms_project_dynamics` VALUES ('1795007612938211329', '5ebcbbed-68cb-47f6-b57b-397c86835769', '研发经理更新了项目进度,当前项目进度为0%', 'rd1', '2024-05-27 16:22:19', 'rd1', '2024-05-27 16:22:19');
INSERT INTO `pms_project_dynamics` VALUES ('1795007630797557762', '5ebcbbed-68cb-47f6-b57b-397c86835769', '研发经理更新了项目进度,当前项目进度为0%', 'rd1', '2024-05-27 16:22:23', 'rd1', '2024-05-27 16:22:23');
INSERT INTO `pms_project_dynamics` VALUES ('1795007828701560834', '5ebcbbed-68cb-47f6-b57b-397c86835769', '研发经理更新了项目进度,当前项目进度为0%', 'rd1', '2024-05-27 16:23:11', 'rd1', '2024-05-27 16:23:11');
INSERT INTO `pms_project_dynamics` VALUES ('1795007837488627713', '5ebcbbed-68cb-47f6-b57b-397c86835769', '研发经理更新了项目进度,当前项目进度为0%', 'rd1', '2024-05-27 16:23:13', 'rd1', '2024-05-27 16:23:13');
INSERT INTO `pms_project_dynamics` VALUES ('1795007847211024385', '5ebcbbed-68cb-47f6-b57b-397c86835769', '研发经理更新了项目进度,当前项目进度为0%', 'rd1', '2024-05-27 16:23:15', 'rd1', '2024-05-27 16:23:15');
INSERT INTO `pms_project_dynamics` VALUES ('1795007892568227842', '5ebcbbed-68cb-47f6-b57b-397c86835769', '研发经理更新了项目进度,当前项目进度为0%', 'rd1', '2024-05-27 16:23:26', 'rd1', '2024-05-27 16:23:26');
INSERT INTO `pms_project_dynamics` VALUES ('1795007937510195202', '5ebcbbed-68cb-47f6-b57b-397c86835769', '研发经理更新了项目进度,当前项目进度为0%', 'rd1', '2024-05-27 16:23:37', 'rd1', '2024-05-27 16:23:37');
INSERT INTO `pms_project_dynamics` VALUES ('1795008113943592961', '5ebcbbed-68cb-47f6-b57b-397c86835769', '研发经理更新了项目进度,当前项目进度为0%', 'rd1', '2024-05-27 16:24:19', 'rd1', '2024-05-27 16:24:19');
INSERT INTO `pms_project_dynamics` VALUES ('1795008118502801410', '5ebcbbed-68cb-47f6-b57b-397c86835769', '研发经理更新了项目进度,当前项目进度为0%', 'rd1', '2024-05-27 16:24:20', 'rd1', '2024-05-27 16:24:20');
INSERT INTO `pms_project_dynamics` VALUES ('1795008270793781250', '5ebcbbed-68cb-47f6-b57b-397c86835769', '研发经理更新了项目进度,当前项目进度为0%', 'rd1', '2024-05-27 16:24:56', 'rd1', '2024-05-27 16:24:56');
INSERT INTO `pms_project_dynamics` VALUES ('1795008296890740737', '5ebcbbed-68cb-47f6-b57b-397c86835769', '研发经理更新了项目进度,当前项目进度为0%', 'rd1', '2024-05-27 16:25:02', 'rd1', '2024-05-27 16:25:02');
INSERT INTO `pms_project_dynamics` VALUES ('1795008320408203265', '5ebcbbed-68cb-47f6-b57b-397c86835769', '研发经理更新了项目进度,当前项目进度为0%', 'rd1', '2024-05-27 16:25:08', 'rd1', '2024-05-27 16:25:08');
INSERT INTO `pms_project_dynamics` VALUES ('1795009391406882818', '5ebcbbed-68cb-47f6-b57b-397c86835769', '研发经理更新了项目进度,当前项目进度为0%', 'rd1', '2024-05-27 16:29:23', 'rd1', '2024-05-27 16:29:23');
INSERT INTO `pms_project_dynamics` VALUES ('1795010415500730369', '5ebcbbed-68cb-47f6-b57b-397c86835769', '研发经理更新了项目进度,当前项目进度为0%', 'rd1', '2024-05-27 16:33:27', 'rd1', '2024-05-27 16:33:27');
INSERT INTO `pms_project_dynamics` VALUES ('1795013090069979137', '5ebcbbed-68cb-47f6-b57b-397c86835769', '研发经理更新了项目进度,当前项目进度为0%', 'rd1', '2024-05-27 16:44:05', 'rd1', '2024-05-27 16:44:05');
INSERT INTO `pms_project_dynamics` VALUES ('1795013136941326337', '5ebcbbed-68cb-47f6-b57b-397c86835769', '研发经理更新了项目进度,当前项目进度为0%', 'rd1', '2024-05-27 16:44:16', 'rd1', '2024-05-27 16:44:16');
INSERT INTO `pms_project_dynamics` VALUES ('1795013433877078018', '5ebcbbed-68cb-47f6-b57b-397c86835769', '研发经理更新了项目进度,当前项目进度为0%', 'rd1', '2024-05-27 16:45:27', 'rd1', '2024-05-27 16:45:27');
INSERT INTO `pms_project_dynamics` VALUES ('1795013447974133762', '5ebcbbed-68cb-47f6-b57b-397c86835769', '研发经理更新了项目进度,当前项目进度为0%', 'rd1', '2024-05-27 16:45:30', 'rd1', '2024-05-27 16:45:30');
INSERT INTO `pms_project_dynamics` VALUES ('1795014219398914050', '5ebcbbed-68cb-47f6-b57b-397c86835769', '研发经理更新了项目进度,当前项目进度为0%', 'rd1', '2024-05-27 16:48:34', 'rd1', '2024-05-27 16:48:34');
INSERT INTO `pms_project_dynamics` VALUES ('1795014232690663425', '5ebcbbed-68cb-47f6-b57b-397c86835769', '研发经理更新了项目进度,当前项目进度为0%', 'rd1', '2024-05-27 16:48:37', 'rd1', '2024-05-27 16:48:37');
INSERT INTO `pms_project_dynamics` VALUES ('1795014243704905730', '5ebcbbed-68cb-47f6-b57b-397c86835769', '研发经理更新了项目进度,当前项目进度为0%', 'rd1', '2024-05-27 16:48:40', 'rd1', '2024-05-27 16:48:40');
INSERT INTO `pms_project_dynamics` VALUES ('1795016064561577985', '5ebcbbed-68cb-47f6-b57b-397c86835769', '研发经理更新了项目进度,当前项目进度为0%', 'rd1', '2024-05-27 16:55:54', 'rd1', '2024-05-27 16:55:54');
INSERT INTO `pms_project_dynamics` VALUES ('1795016087642832898', '5ebcbbed-68cb-47f6-b57b-397c86835769', '研发经理更新了项目进度,当前项目进度为0%', 'rd1', '2024-05-27 16:56:00', 'rd1', '2024-05-27 16:56:00');
INSERT INTO `pms_project_dynamics` VALUES ('1795016350449532929', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为48%', 'rd1', '2024-05-27 16:57:02', 'rd1', '2024-05-27 16:57:02');
INSERT INTO `pms_project_dynamics` VALUES ('1795016383488065537', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为48%', 'rd1', '2024-05-27 16:57:10', 'rd1', '2024-05-27 16:57:10');
INSERT INTO `pms_project_dynamics` VALUES ('1795031651715121154', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为48%', 'rd1', '2024-05-27 17:57:51', 'rd1', '2024-05-27 17:57:51');
INSERT INTO `pms_project_dynamics` VALUES ('1795031872918519810', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为48%', 'rd1', '2024-05-27 17:58:43', 'rd1', '2024-05-27 17:58:43');
INSERT INTO `pms_project_dynamics` VALUES ('1795031890010308609', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为50%', 'rd1', '2024-05-27 17:58:47', 'rd1', '2024-05-27 17:58:47');
INSERT INTO `pms_project_dynamics` VALUES ('1795031921589223425', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为50%', 'rd1', '2024-05-27 17:58:55', 'rd1', '2024-05-27 17:58:55');
INSERT INTO `pms_project_dynamics` VALUES ('1795268635410825217', '385a77ec-934c-4176-b1bf-19e2e08920e6', '研发经理更新了项目进度,当前项目进度为64%', 'rd1', '2024-05-28 09:39:32', 'rd1', '2024-05-28 09:39:32');
INSERT INTO `pms_project_dynamics` VALUES ('1795268663802068993', '385a77ec-934c-4176-b1bf-19e2e08920e6', '研发经理更新了项目进度,当前项目进度为64%', 'rd1', '2024-05-28 09:39:39', 'rd1', '2024-05-28 09:39:39');
INSERT INTO `pms_project_dynamics` VALUES ('1795287478099247105', '385a77ec-934c-4176-b1bf-19e2e08920e6', '研发经理更新了项目进度,当前项目进度为88%', 'rd1', '2024-05-28 10:54:24', 'rd1', '2024-05-28 10:54:24');
INSERT INTO `pms_project_dynamics` VALUES ('1795287483346321410', '385a77ec-934c-4176-b1bf-19e2e08920e6', '研发经理更新了项目进度,当前项目进度为77%', 'rd1', '2024-05-28 10:54:26', 'rd1', '2024-05-28 10:54:26');
INSERT INTO `pms_project_dynamics` VALUES ('1795287493546868738', '385a77ec-934c-4176-b1bf-19e2e08920e6', '研发经理更新了项目进度,当前项目进度为86%', 'rd1', '2024-05-28 10:54:28', 'rd1', '2024-05-28 10:54:28');
INSERT INTO `pms_project_dynamics` VALUES ('1795287513654362114', '385a77ec-934c-4176-b1bf-19e2e08920e6', '研发经理更新了项目进度,当前项目进度为86%', 'rd1', '2024-05-28 10:54:33', 'rd1', '2024-05-28 10:54:33');
INSERT INTO `pms_project_dynamics` VALUES ('1795287576082382850', '385a77ec-934c-4176-b1bf-19e2e08920e6', '研发经理更新了项目进度,当前项目进度为86%', 'rd1', '2024-05-28 10:54:48', 'rd1', '2024-05-28 10:54:48');
INSERT INTO `pms_project_dynamics` VALUES ('1795403026980143106', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为51%', 'rd1', '2024-05-28 18:33:33', 'rd1', '2024-05-28 18:33:33');
INSERT INTO `pms_project_dynamics` VALUES ('1795403050568908802', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为53%', 'rd1', '2024-05-28 18:33:39', 'rd1', '2024-05-28 18:33:39');
INSERT INTO `pms_project_dynamics` VALUES ('1795403071406211073', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为54%', 'rd1', '2024-05-28 18:33:44', 'rd1', '2024-05-28 18:33:44');
INSERT INTO `pms_project_dynamics` VALUES ('1795403141694357506', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为54%', 'rd1', '2024-05-28 18:34:01', 'rd1', '2024-05-28 18:34:01');
INSERT INTO `pms_project_dynamics` VALUES ('1795403145439870978', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为54%', 'rd1', '2024-05-28 18:34:02', 'rd1', '2024-05-28 18:34:02');
INSERT INTO `pms_project_dynamics` VALUES ('1795403180084822018', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为56%', 'rd1', '2024-05-28 18:34:10', 'rd1', '2024-05-28 18:34:10');
INSERT INTO `pms_project_dynamics` VALUES ('1795403196232892417', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为56%', 'rd1', '2024-05-28 18:34:14', 'rd1', '2024-05-28 18:34:14');
INSERT INTO `pms_project_dynamics` VALUES ('1795721077311143937', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为59%', 'rd1', '2024-05-29 15:37:22', 'rd1', '2024-05-29 15:37:22');
INSERT INTO `pms_project_dynamics` VALUES ('1795721105433952257', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为59%', 'rd1', '2024-05-29 15:37:29', 'rd1', '2024-05-29 15:37:29');
INSERT INTO `pms_project_dynamics` VALUES ('1795721120889962498', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为60%', 'rd1', '2024-05-29 15:37:33', 'rd1', '2024-05-29 15:37:33');
INSERT INTO `pms_project_dynamics` VALUES ('1795721185700347906', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为61%', 'rd1', '2024-05-29 15:37:48', 'rd1', '2024-05-29 15:37:48');
INSERT INTO `pms_project_dynamics` VALUES ('1795743190243868674', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为61%', 'rd1', '2024-05-29 17:05:15', 'rd1', '2024-05-29 17:05:15');
INSERT INTO `pms_project_dynamics` VALUES ('1795743199009964034', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为61%', 'rd1', '2024-05-29 17:05:17', 'rd1', '2024-05-29 17:05:17');
INSERT INTO `pms_project_dynamics` VALUES ('1796118553247612930', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为62%', 'rd1', '2024-05-30 17:56:48', 'rd1', '2024-05-30 17:56:48');
INSERT INTO `pms_project_dynamics` VALUES ('1796118569026584577', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为62%', 'rd1', '2024-05-30 17:56:52', 'rd1', '2024-05-30 17:56:52');
INSERT INTO `pms_project_dynamics` VALUES ('1796118592367886338', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为62%', 'rd1', '2024-05-30 17:56:57', 'rd1', '2024-05-30 17:56:57');
INSERT INTO `pms_project_dynamics` VALUES ('1796118607471575041', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为62%', 'rd1', '2024-05-30 17:57:01', 'rd1', '2024-05-30 17:57:01');
INSERT INTO `pms_project_dynamics` VALUES ('1796118624907296769', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为62%', 'rd1', '2024-05-30 17:57:05', 'rd1', '2024-05-30 17:57:05');
INSERT INTO `pms_project_dynamics` VALUES ('1796118648705777665', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为63%', 'rd1', '2024-05-30 17:57:11', 'rd1', '2024-05-30 17:57:11');
INSERT INTO `pms_project_dynamics` VALUES ('1796118678468558849', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为63%', 'rd1', '2024-05-30 17:57:18', 'rd1', '2024-05-30 17:57:18');
INSERT INTO `pms_project_dynamics` VALUES ('1796118700404768770', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为65%', 'rd1', '2024-05-30 17:57:23', 'rd1', '2024-05-30 17:57:23');
INSERT INTO `pms_project_dynamics` VALUES ('1796118717832101890', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为66%', 'rd1', '2024-05-30 17:57:27', 'rd1', '2024-05-30 17:57:27');
INSERT INTO `pms_project_dynamics` VALUES ('1796118732583469058', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为67%', 'rd1', '2024-05-30 17:57:31', 'rd1', '2024-05-30 17:57:31');
INSERT INTO `pms_project_dynamics` VALUES ('1796118749637509122', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为68%', 'rd1', '2024-05-30 17:57:35', 'rd1', '2024-05-30 17:57:35');
INSERT INTO `pms_project_dynamics` VALUES ('1796118766922235905', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为69%', 'rd1', '2024-05-30 17:57:39', 'rd1', '2024-05-30 17:57:39');
INSERT INTO `pms_project_dynamics` VALUES ('1796118779492564994', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为70%', 'rd1', '2024-05-30 17:57:42', 'rd1', '2024-05-30 17:57:42');
INSERT INTO `pms_project_dynamics` VALUES ('1796118907775352834', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为70%', 'rd1', '2024-05-30 17:58:13', 'rd1', '2024-05-30 17:58:13');
INSERT INTO `pms_project_dynamics` VALUES ('1796119719977156610', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为71%', 'rd1', '2024-05-30 18:01:26', 'rd1', '2024-05-30 18:01:26');
INSERT INTO `pms_project_dynamics` VALUES ('1796119736074895361', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为71%', 'rd1', '2024-05-30 18:01:30', 'rd1', '2024-05-30 18:01:30');
INSERT INTO `pms_project_dynamics` VALUES ('1796119751832895489', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为72%', 'rd1', '2024-05-30 18:01:34', 'rd1', '2024-05-30 18:01:34');
INSERT INTO `pms_project_dynamics` VALUES ('1796121243797159937', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为76%', 'rd1', '2024-05-30 18:07:29', 'rd1', '2024-05-30 18:07:29');
INSERT INTO `pms_project_dynamics` VALUES ('1796124594920226817', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为77%', 'rd1', '2024-05-30 18:20:48', 'rd1', '2024-05-30 18:20:48');
INSERT INTO `pms_project_dynamics` VALUES ('1796376403236618241', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为77%', 'rd1', '2024-05-31 11:01:24', 'rd1', '2024-05-31 11:01:24');
INSERT INTO `pms_project_dynamics` VALUES ('1796376417384005633', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为77%', 'rd1', '2024-05-31 11:01:28', 'rd1', '2024-05-31 11:01:28');
INSERT INTO `pms_project_dynamics` VALUES ('1796376431929851905', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为78%', 'rd1', '2024-05-31 11:01:31', 'rd1', '2024-05-31 11:01:31');
INSERT INTO `pms_project_dynamics` VALUES ('1796376448547684354', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为79%', 'rd1', '2024-05-31 11:01:35', 'rd1', '2024-05-31 11:01:35');
INSERT INTO `pms_project_dynamics` VALUES ('1796376462233698305', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为79%', 'rd1', '2024-05-31 11:01:38', 'rd1', '2024-05-31 11:01:38');
INSERT INTO `pms_project_dynamics` VALUES ('1796376476888596481', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为80%', 'rd1', '2024-05-31 11:01:42', 'rd1', '2024-05-31 11:01:42');
INSERT INTO `pms_project_dynamics` VALUES ('1796387596516982785', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为81%', 'rd1', '2024-05-31 11:45:53', 'rd1', '2024-05-31 11:45:53');
INSERT INTO `pms_project_dynamics` VALUES ('1796490650515931137', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为82%', 'rd1', '2024-05-31 18:35:23', 'rd1', '2024-05-31 18:35:23');
INSERT INTO `pms_project_dynamics` VALUES ('1796490666584309762', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为82%', 'rd1', '2024-05-31 18:35:27', 'rd1', '2024-05-31 18:35:27');
INSERT INTO `pms_project_dynamics` VALUES ('1796490904522981377', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为82%', 'rd1', '2024-05-31 18:36:23', 'rd1', '2024-05-31 18:36:23');
INSERT INTO `pms_project_dynamics` VALUES ('1796490936332582914', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为82%', 'rd1', '2024-05-31 18:36:31', 'rd1', '2024-05-31 18:36:31');
INSERT INTO `pms_project_dynamics` VALUES ('1796490951012646913', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为85%', 'rd1', '2024-05-31 18:36:35', 'rd1', '2024-05-31 18:36:35');
INSERT INTO `pms_project_dynamics` VALUES ('1796491362608087042', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为86%', 'rd1', '2024-05-31 18:38:13', 'rd1', '2024-05-31 18:38:13');
INSERT INTO `pms_project_dynamics` VALUES ('1796491378131206146', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为87%', 'rd1', '2024-05-31 18:38:16', 'rd1', '2024-05-31 18:38:16');
INSERT INTO `pms_project_dynamics` VALUES ('1796491394828730369', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为87%', 'rd1', '2024-05-31 18:38:20', 'rd1', '2024-05-31 18:38:20');
INSERT INTO `pms_project_dynamics` VALUES ('1796491419101167617', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为87%', 'rd1', '2024-05-31 18:38:26', 'rd1', '2024-05-31 18:38:26');
INSERT INTO `pms_project_dynamics` VALUES ('1797896909999960065', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为89%', 'rd1', '2024-06-04 15:43:21', 'rd1', '2024-06-04 15:43:21');
INSERT INTO `pms_project_dynamics` VALUES ('1797896922280882177', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为90%', 'rd1', '2024-06-04 15:43:24', 'rd1', '2024-06-04 15:43:24');
INSERT INTO `pms_project_dynamics` VALUES ('1797896940308000769', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为91%', 'rd1', '2024-06-04 15:43:29', 'rd1', '2024-06-04 15:43:29');
INSERT INTO `pms_project_dynamics` VALUES ('1797896954862235649', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为92%', 'rd1', '2024-06-04 15:43:32', 'rd1', '2024-06-04 15:43:32');
INSERT INTO `pms_project_dynamics` VALUES ('1797896967759720449', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为92%', 'rd1', '2024-06-04 15:43:35', 'rd1', '2024-06-04 15:43:35');
INSERT INTO `pms_project_dynamics` VALUES ('1797896980762062850', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为92%', 'rd1', '2024-06-04 15:43:38', 'rd1', '2024-06-04 15:43:38');
INSERT INTO `pms_project_dynamics` VALUES ('1797896992439005186', '89d1e170-ca60-45d4-bc17-b3c3f0577917', '研发经理更新了项目进度,当前项目进度为93%', 'rd1', '2024-06-04 15:43:41', 'rd1', '2024-06-04 15:43:41');
INSERT INTO `pms_project_dynamics` VALUES ('1798556734337097729', '385a77ec-934c-4176-b1bf-19e2e08920e6', '研发经理任务分配给江小宁', 'rd1', '2024-06-06 11:25:16', 'rd1', '2024-06-06 11:25:16');
INSERT INTO `pms_project_dynamics` VALUES ('1798556770206785538', '385a77ec-934c-4176-b1bf-19e2e08920e6', '研发经理任务分配给研发经理', 'rd1', '2024-06-06 11:25:24', 'rd1', '2024-06-06 11:25:24');
INSERT INTO `pms_project_dynamics` VALUES ('1798556832945184769', '385a77ec-934c-4176-b1bf-19e2e08920e6', '研发经理更新了项目进度,当前项目进度为86%', 'rd1', '2024-06-06 11:25:39', 'rd1', '2024-06-06 11:25:39');
INSERT INTO `pms_project_dynamics` VALUES ('1798556837898657794', '385a77ec-934c-4176-b1bf-19e2e08920e6', '研发经理更新了项目进度,当前项目进度为86%', 'rd1', '2024-06-06 11:25:40', 'rd1', '2024-06-06 11:25:40');
INSERT INTO `pms_project_dynamics` VALUES ('1798556859935531010', '385a77ec-934c-4176-b1bf-19e2e08920e6', '研发经理更新了项目进度,当前项目进度为86%', 'rd1', '2024-06-06 11:25:46', 'rd1', '2024-06-06 11:25:46');
INSERT INTO `pms_project_dynamics` VALUES ('1798608509371281410', '460c907f-3130-4e44-848e-4f4b73d40c6d', 'Jiangjn任务分配给Jiangjn', 'jiangjn', '2024-06-06 14:51:00', 'jiangjn', '2024-06-06 14:51:00');
INSERT INTO `pms_project_dynamics` VALUES ('1798608522625282050', '460c907f-3130-4e44-848e-4f4b73d40c6d', 'Jiangjn任务分配给Jiangjn', 'jiangjn', '2024-06-06 14:51:03', 'jiangjn', '2024-06-06 14:51:03');
INSERT INTO `pms_project_dynamics` VALUES ('1798608646696988674', '460c907f-3130-4e44-848e-4f4b73d40c6d', 'Jiangjn任务分配给Linmz', 'jiangjn', '2024-06-06 14:51:33', 'jiangjn', '2024-06-06 14:51:33');
INSERT INTO `pms_project_dynamics` VALUES ('1798608663860080642', '460c907f-3130-4e44-848e-4f4b73d40c6d', 'Jiangjn任务分配给Lid', 'jiangjn', '2024-06-06 14:51:37', 'jiangjn', '2024-06-06 14:51:37');
INSERT INTO `pms_project_dynamics` VALUES ('1798608670243811330', '460c907f-3130-4e44-848e-4f4b73d40c6d', 'Jiangjn任务分配给Lid', 'jiangjn', '2024-06-06 14:51:38', 'jiangjn', '2024-06-06 14:51:38');
INSERT INTO `pms_project_dynamics` VALUES ('1798608676300386305', '460c907f-3130-4e44-848e-4f4b73d40c6d', 'Jiangjn任务分配给Lid', 'jiangjn', '2024-06-06 14:51:40', 'jiangjn', '2024-06-06 14:51:40');
INSERT INTO `pms_project_dynamics` VALUES ('1798608684085014529', '460c907f-3130-4e44-848e-4f4b73d40c6d', 'Jiangjn任务分配给Lid', 'jiangjn', '2024-06-06 14:51:41', 'jiangjn', '2024-06-06 14:51:41');
INSERT INTO `pms_project_dynamics` VALUES ('1798608688392564737', '460c907f-3130-4e44-848e-4f4b73d40c6d', 'Jiangjn任务分配给Lid', 'jiangjn', '2024-06-06 14:51:43', 'jiangjn', '2024-06-06 14:51:43');
INSERT INTO `pms_project_dynamics` VALUES ('1798608694470111233', '460c907f-3130-4e44-848e-4f4b73d40c6d', 'Jiangjn任务分配给Lid', 'jiangjn', '2024-06-06 14:51:44', 'jiangjn', '2024-06-06 14:51:44');
INSERT INTO `pms_project_dynamics` VALUES ('1798608711591260161', '460c907f-3130-4e44-848e-4f4b73d40c6d', 'Jiangjn任务分配给Linmz', 'jiangjn', '2024-06-06 14:51:48', 'jiangjn', '2024-06-06 14:51:48');
INSERT INTO `pms_project_dynamics` VALUES ('1798608718847406082', '460c907f-3130-4e44-848e-4f4b73d40c6d', 'Jiangjn任务分配给Linmz', 'jiangjn', '2024-06-06 14:51:50', 'jiangjn', '2024-06-06 14:51:50');
INSERT INTO `pms_project_dynamics` VALUES ('1798608727034687490', '460c907f-3130-4e44-848e-4f4b73d40c6d', 'Jiangjn任务分配给Linmz', 'jiangjn', '2024-06-06 14:51:52', 'jiangjn', '2024-06-06 14:51:52');
INSERT INTO `pms_project_dynamics` VALUES ('1798608757720215553', '460c907f-3130-4e44-848e-4f4b73d40c6d', 'Jiangjn任务分配给Lisf', 'jiangjn', '2024-06-06 14:51:59', 'jiangjn', '2024-06-06 14:51:59');
INSERT INTO `pms_project_dynamics` VALUES ('1798608786270842882', '460c907f-3130-4e44-848e-4f4b73d40c6d', 'Jiangjn任务分配给Zhengxh', 'jiangjn', '2024-06-06 14:52:06', 'jiangjn', '2024-06-06 14:52:06');
INSERT INTO `pms_project_dynamics` VALUES ('1798608794411986946', '460c907f-3130-4e44-848e-4f4b73d40c6d', 'Jiangjn任务分配给Zhengxh', 'jiangjn', '2024-06-06 14:52:08', 'jiangjn', '2024-06-06 14:52:08');
INSERT INTO `pms_project_dynamics` VALUES ('1798608803069030401', '460c907f-3130-4e44-848e-4f4b73d40c6d', 'Jiangjn任务分配给Zhengxh', 'jiangjn', '2024-06-06 14:52:10', 'jiangjn', '2024-06-06 14:52:10');
INSERT INTO `pms_project_dynamics` VALUES ('1798608810300010498', '460c907f-3130-4e44-848e-4f4b73d40c6d', 'Jiangjn任务分配给Zhengxh', 'jiangjn', '2024-06-06 14:52:12', 'jiangjn', '2024-06-06 14:52:12');
INSERT INTO `pms_project_dynamics` VALUES ('1798608818499874818', '460c907f-3130-4e44-848e-4f4b73d40c6d', 'Jiangjn任务分配给Zhengxh', 'jiangjn', '2024-06-06 14:52:14', 'jiangjn', '2024-06-06 14:52:14');
INSERT INTO `pms_project_dynamics` VALUES ('1798608825277870082', '460c907f-3130-4e44-848e-4f4b73d40c6d', 'Jiangjn任务分配给Zhengxh', 'jiangjn', '2024-06-06 14:52:15', 'jiangjn', '2024-06-06 14:52:15');
INSERT INTO `pms_project_dynamics` VALUES ('1798608988566319106', '460c907f-3130-4e44-848e-4f4b73d40c6d', 'Jiangjn任务分配给Linmz', 'jiangjn', '2024-06-06 14:52:54', 'jiangjn', '2024-06-06 14:52:54');
INSERT INTO `pms_project_dynamics` VALUES ('1798609111228739585', '460c907f-3130-4e44-848e-4f4b73d40c6d', 'Jiangjn任务分配给Lisf', 'jiangjn', '2024-06-06 14:53:23', 'jiangjn', '2024-06-06 14:53:23');
INSERT INTO `pms_project_dynamics` VALUES ('1798615226548826114', '460c907f-3130-4e44-848e-4f4b73d40c6d', 'Jiangjn更新了项目进度,当前项目进度为0%', 'jiangjn', '2024-06-06 15:17:41', 'jiangjn', '2024-06-06 15:17:41');
INSERT INTO `pms_project_dynamics` VALUES ('1798615387207446529', '460c907f-3130-4e44-848e-4f4b73d40c6d', 'Jiangjn更新了项目进度,当前项目进度为0%', 'jiangjn', '2024-06-06 15:18:20', 'jiangjn', '2024-06-06 15:18:20');
INSERT INTO `pms_project_dynamics` VALUES ('1798615429041434625', '460c907f-3130-4e44-848e-4f4b73d40c6d', 'Jiangjn更新了项目进度,当前项目进度为0%', 'jiangjn', '2024-06-06 15:18:30', 'jiangjn', '2024-06-06 15:18:30');
INSERT INTO `pms_project_dynamics` VALUES ('1798634919422980098', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 'Jiangjn更新了项目进度,当前项目进度为100%', 'jiangjn', '2024-06-06 16:35:56', 'jiangjn', '2024-06-06 16:35:56');
INSERT INTO `pms_project_dynamics` VALUES ('1798634932291104769', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 'Jiangjn更新了项目进度,当前项目进度为93%', 'jiangjn', '2024-06-06 16:36:00', 'jiangjn', '2024-06-06 16:36:00');
INSERT INTO `pms_project_dynamics` VALUES ('1798642463415595010', '460c907f-3130-4e44-848e-4f4b73d40c6d', 'Jiangjn更新了项目进度,当前项目进度为0%', 'jiangjn', '2024-06-06 17:05:55', 'jiangjn', '2024-06-06 17:05:55');
INSERT INTO `pms_project_dynamics` VALUES ('1798642473930715138', '460c907f-3130-4e44-848e-4f4b73d40c6d', 'Jiangjn更新了项目进度,当前项目进度为0%', 'jiangjn', '2024-06-06 17:05:58', 'jiangjn', '2024-06-06 17:05:58');
INSERT INTO `pms_project_dynamics` VALUES ('1798642520315523074', '460c907f-3130-4e44-848e-4f4b73d40c6d', 'Jiangjn更新了项目进度,当前项目进度为0%', 'jiangjn', '2024-06-06 17:06:09', 'jiangjn', '2024-06-06 17:06:09');
INSERT INTO `pms_project_dynamics` VALUES ('1798642601915707394', '460c907f-3130-4e44-848e-4f4b73d40c6d', 'Jiangjn更新了项目进度,当前项目进度为0%', 'jiangjn', '2024-06-06 17:06:28', 'jiangjn', '2024-06-06 17:06:28');
INSERT INTO `pms_project_dynamics` VALUES ('1798642608106500097', '460c907f-3130-4e44-848e-4f4b73d40c6d', 'Jiangjn更新了项目进度,当前项目进度为0%', 'jiangjn', '2024-06-06 17:06:30', 'jiangjn', '2024-06-06 17:06:30');
INSERT INTO `pms_project_dynamics` VALUES ('1798643016384245762', '460c907f-3130-4e44-848e-4f4b73d40c6d', 'Jiangjn更新了项目进度,当前项目进度为0%', 'jiangjn', '2024-06-06 17:08:07', 'jiangjn', '2024-06-06 17:08:07');
INSERT INTO `pms_project_dynamics` VALUES ('1798966228406104066', '460c907f-3130-4e44-848e-4f4b73d40c6d', 'Jiangjn更新了项目进度,当前项目进度为15%', 'jiangjn', '2024-06-07 14:32:27', 'jiangjn', '2024-06-07 14:32:27');
INSERT INTO `pms_project_dynamics` VALUES ('1798967273786044417', '460c907f-3130-4e44-848e-4f4b73d40c6d', 'Jiangjn更新了项目进度,当前项目进度为5%', 'jiangjn', '2024-06-07 14:36:36', 'jiangjn', '2024-06-07 14:36:36');
INSERT INTO `pms_project_dynamics` VALUES ('1798967378312294401', '460c907f-3130-4e44-848e-4f4b73d40c6d', 'Jiangjn更新了项目进度,当前项目进度为5%', 'jiangjn', '2024-06-07 14:37:01', 'jiangjn', '2024-06-07 14:37:01');
INSERT INTO `pms_project_dynamics` VALUES ('1798967509673701378', '460c907f-3130-4e44-848e-4f4b73d40c6d', 'Jiangjn更新了项目进度,当前项目进度为5%', 'jiangjn', '2024-06-07 14:37:32', 'jiangjn', '2024-06-07 14:37:32');
INSERT INTO `pms_project_dynamics` VALUES ('1798967526140538882', '460c907f-3130-4e44-848e-4f4b73d40c6d', 'Jiangjn更新了项目进度,当前项目进度为5%', 'jiangjn', '2024-06-07 14:37:36', 'jiangjn', '2024-06-07 14:37:36');
INSERT INTO `pms_project_dynamics` VALUES ('1798973256126033921', '945ce344-18b7-4768-b8ec-b9cef51eab5b', '研发经理更新了项目进度,当前项目进度为2%', 'rd1', '2024-06-07 15:00:22', 'rd1', '2024-06-07 15:00:22');
INSERT INTO `pms_project_dynamics` VALUES ('1798973270126620673', '945ce344-18b7-4768-b8ec-b9cef51eab5b', '研发经理更新了项目进度,当前项目进度为2%', 'rd1', '2024-06-07 15:00:26', 'rd1', '2024-06-07 15:00:26');
INSERT INTO `pms_project_dynamics` VALUES ('1798973296907251713', '945ce344-18b7-4768-b8ec-b9cef51eab5b', '研发经理更新了项目进度,当前项目进度为2%', 'rd1', '2024-06-07 15:00:32', 'rd1', '2024-06-07 15:00:32');
INSERT INTO `pms_project_dynamics` VALUES ('1798973338787377154', '945ce344-18b7-4768-b8ec-b9cef51eab5b', '研发经理更新了项目进度,当前项目进度为2%', 'rd1', '2024-06-07 15:00:42', 'rd1', '2024-06-07 15:00:42');
INSERT INTO `pms_project_dynamics` VALUES ('1798973346718806017', '945ce344-18b7-4768-b8ec-b9cef51eab5b', '研发经理任务分配给研发经理', 'rd1', '2024-06-07 15:00:44', 'rd1', '2024-06-07 15:00:44');

-- ----------------------------
-- Table structure for pms_project_progress
-- ----------------------------
DROP TABLE IF EXISTS `pms_project_progress`;
CREATE TABLE `pms_project_progress`  (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `progress` tinyint(1) NOT NULL,
  `progress_update_time` datetime(0) NULL DEFAULT NULL,
  `task_update_time` datetime(0) NULL,
  `start_date` datetime(0) NULL DEFAULT NULL,
  `end_date` datetime(0) NULL DEFAULT NULL,
  `duration` double(9, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_project_progress
-- ----------------------------
INSERT INTO `pms_project_progress` VALUES ('088dbd65-daac-4885-9b36-e6ad75ed0964', 82, '2024-05-11 15:13:34', '2024-05-11 11:58:05', '2024-05-01 00:00:00', '2024-05-13 00:00:00', 2);
INSERT INTO `pms_project_progress` VALUES ('1793897920370094082', 0, '2024-05-24 14:52:48', '2024-05-24 14:52:48', NULL, NULL, 0);
INSERT INTO `pms_project_progress` VALUES ('1795000113338109954', 0, '2024-05-27 15:52:31', '2024-05-27 15:52:31', NULL, NULL, 0);
INSERT INTO `pms_project_progress` VALUES ('1798253318000209921', 0, '2024-06-05 15:19:36', '2024-06-05 15:19:36', NULL, NULL, 0);
INSERT INTO `pms_project_progress` VALUES ('1798560708314656770', 0, '2024-06-06 11:41:03', '2024-06-06 11:41:03', NULL, NULL, 0);
INSERT INTO `pms_project_progress` VALUES ('1798972431223877633', 0, '2024-06-07 14:57:06', '2024-06-07 14:57:06', NULL, NULL, 0);
INSERT INTO `pms_project_progress` VALUES ('1799000825701462018', 0, '2024-06-07 16:49:55', '2024-06-07 16:49:55', NULL, NULL, 0);
INSERT INTO `pms_project_progress` VALUES ('385a77ec-934c-4176-b1bf-19e2e08920e6', 86, '2024-06-06 11:25:45', '2024-06-06 11:25:45', '2024-04-19 00:00:00', '2025-06-13 17:00:00', 83);
INSERT INTO `pms_project_progress` VALUES ('460c907f-3130-4e44-848e-4f4b73d40c6d', 5, '2024-06-07 14:37:36', '2024-06-07 14:37:36', '2024-06-12 00:00:00', '2024-07-08 18:00:00', 35);
INSERT INTO `pms_project_progress` VALUES ('5510a444-2789-4db1-9357-4f45c04a294e', 98, '2024-05-19 10:06:33', '2024-05-19 10:06:33', '2024-04-19 00:00:00', '2024-06-04 14:00:00', 27);
INSERT INTO `pms_project_progress` VALUES ('5ebcbbed-68cb-47f6-b57b-397c86835769', 0, '2024-05-27 16:56:00', '2024-05-27 16:56:00', '2024-05-27 00:00:00', '2024-06-11 18:00:00', 12);
INSERT INTO `pms_project_progress` VALUES ('89d1e170-ca60-45d4-bc17-b3c3f0577917', 93, '2024-06-06 16:35:59', '2024-06-06 16:35:59', '2024-05-20 00:00:00', '2024-06-12 14:00:00', 49);
INSERT INTO `pms_project_progress` VALUES ('945ce344-18b7-4768-b8ec-b9cef51eab5b', 2, '2024-06-07 15:00:42', '2024-06-07 15:00:42', '3899-02-01 00:00:00', '3899-02-03 18:00:00', 3);
INSERT INTO `pms_project_progress` VALUES ('9bd0bfdc-46a6-4550-abf3-a45f023b74a8', 55, '2024-05-12 22:27:02', '2024-05-12 22:27:02', '2024-04-18 00:00:00', '2024-04-18 00:00:00', 1);
INSERT INTO `pms_project_progress` VALUES ('a372fca9-f45b-439a-97cf-6cb6bb0afd87', 0, '2024-06-07 15:01:16', '2024-06-07 15:01:16', NULL, NULL, 0);

-- ----------------------------
-- Table structure for pms_project_progress_daily
-- ----------------------------
DROP TABLE IF EXISTS `pms_project_progress_daily`;
CREATE TABLE `pms_project_progress_daily`  (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `daily` date NOT NULL COMMENT '日期',
  `progress` tinyint(1) NOT NULL COMMENT '进度',
  `quota` int(255) NOT NULL COMMENT '任务',
  `project_id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_project_progress_daily
-- ----------------------------
INSERT INTO `pms_project_progress_daily` VALUES ('13d74504-03ba-4770-b1cd-f7609fa935b0', '2024-05-29', 61, 33, '89d1e170-ca60-45d4-bc17-b3c3f0577917');
INSERT INTO `pms_project_progress_daily` VALUES ('13d9cc0e-4eb5-40b7-bda7-5ca824e9fda1', '2024-06-07', 2, 0, '945ce344-18b7-4768-b8ec-b9cef51eab5b');
INSERT INTO `pms_project_progress_daily` VALUES ('2cda8863-0310-486e-8850-73d68f20db8d', '2024-05-27', 50, 28, '89d1e170-ca60-45d4-bc17-b3c3f0577917');
INSERT INTO `pms_project_progress_daily` VALUES ('2df83476-401f-47d4-a4ed-1c9cd5e560c1', '2024-06-04', 93, 59, '89d1e170-ca60-45d4-bc17-b3c3f0577917');
INSERT INTO `pms_project_progress_daily` VALUES ('3cf88cf0-ed2c-441b-a9a0-430dbaf5df9d', '2024-05-25', 45, 27, '89d1e170-ca60-45d4-bc17-b3c3f0577917');
INSERT INTO `pms_project_progress_daily` VALUES ('49e7c85d-e550-432e-86e8-208a75cd8037', '2024-05-27', 0, 0, '5ebcbbed-68cb-47f6-b57b-397c86835769');
INSERT INTO `pms_project_progress_daily` VALUES ('4b1c4217-c62c-464f-9e94-9fcb696963ae', '2024-06-06', 0, 0, '460c907f-3130-4e44-848e-4f4b73d40c6d');
INSERT INTO `pms_project_progress_daily` VALUES ('5869fd39-0298-46de-ba82-1fbf3100f410', '2024-04-21', 3, 0, '5510a444-2789-4db1-9357-4f45c04a294e');
INSERT INTO `pms_project_progress_daily` VALUES ('5869fd39-0298-46de-ba82-1fbf3100f411', '2024-04-22', 5, 0, '5510a444-2789-4db1-9357-4f45c04a294e');
INSERT INTO `pms_project_progress_daily` VALUES ('5869fd39-0298-46de-ba82-1fbf3100f412', '2024-04-23', 7, 0, '5510a444-2789-4db1-9357-4f45c04a294e');
INSERT INTO `pms_project_progress_daily` VALUES ('5869fd39-0298-46de-ba82-1fbf3100f413', '2024-04-24', 9, 0, '5510a444-2789-4db1-9357-4f45c04a294e');
INSERT INTO `pms_project_progress_daily` VALUES ('5869fd39-0298-46de-ba82-1fbf3100f414', '2024-04-25', 10, 0, '5510a444-2789-4db1-9357-4f45c04a294e');
INSERT INTO `pms_project_progress_daily` VALUES ('5869fd39-0298-46de-ba82-1fbf3100f415', '2024-04-26', 12, 0, '5510a444-2789-4db1-9357-4f45c04a294e');
INSERT INTO `pms_project_progress_daily` VALUES ('5869fd39-0298-46de-ba82-1fbf3100f416', '2024-04-27', 14, 0, '5510a444-2789-4db1-9357-4f45c04a294e');
INSERT INTO `pms_project_progress_daily` VALUES ('5869fd39-0298-46de-ba82-1fbf3100f417', '2024-04-28', 15, 0, '5510a444-2789-4db1-9357-4f45c04a294e');
INSERT INTO `pms_project_progress_daily` VALUES ('5869fd39-0298-46de-ba82-1fbf3100f418', '2024-04-29', 16, 0, '5510a444-2789-4db1-9357-4f45c04a294e');
INSERT INTO `pms_project_progress_daily` VALUES ('5869fd39-0298-46de-ba82-1fbf3100f419', '2024-04-30', 18, 0, '5510a444-2789-4db1-9357-4f45c04a294e');
INSERT INTO `pms_project_progress_daily` VALUES ('5869fd39-0298-46de-ba82-1fbf3100f420', '2024-05-01', 20, 0, '5510a444-2789-4db1-9357-4f45c04a294e');
INSERT INTO `pms_project_progress_daily` VALUES ('5869fd39-0298-46de-ba82-1fbf3100f421', '2024-05-02', 22, 0, '5510a444-2789-4db1-9357-4f45c04a294e');
INSERT INTO `pms_project_progress_daily` VALUES ('5869fd39-0298-46de-ba82-1fbf3100f422', '2024-05-03', 24, 0, '5510a444-2789-4db1-9357-4f45c04a294e');
INSERT INTO `pms_project_progress_daily` VALUES ('5869fd39-0298-46de-ba82-1fbf3100f423', '2024-05-04', 26, 0, '5510a444-2789-4db1-9357-4f45c04a294e');
INSERT INTO `pms_project_progress_daily` VALUES ('5869fd39-0298-46de-ba82-1fbf3100f424', '2024-05-05', 28, 0, '5510a444-2789-4db1-9357-4f45c04a294e');
INSERT INTO `pms_project_progress_daily` VALUES ('5869fd39-0298-46de-ba82-1fbf3100f4a8', '2024-04-19', 0, 0, '5510a444-2789-4db1-9357-4f45c04a294e');
INSERT INTO `pms_project_progress_daily` VALUES ('5869fd39-0298-46de-ba82-1fbf3100f4a9', '2024-04-20', 1, 0, '5510a444-2789-4db1-9357-4f45c04a294e');
INSERT INTO `pms_project_progress_daily` VALUES ('64c1f22d-9180-47f1-8cae-499553f924b1', '2024-05-24', 28, 10, '89d1e170-ca60-45d4-bc17-b3c3f0577917');
INSERT INTO `pms_project_progress_daily` VALUES ('7a2ec9f1-a5a7-47e1-b426-60f5dddcc1fc', '2024-05-17', 63, 18, '385a77ec-934c-4176-b1bf-19e2e08920e6');
INSERT INTO `pms_project_progress_daily` VALUES ('7b477399-8e38-4503-9c89-6845cde6c6ff', '2024-06-07', 5, 1, '460c907f-3130-4e44-848e-4f4b73d40c6d');
INSERT INTO `pms_project_progress_daily` VALUES ('922e1973-281a-41b7-ac09-2564bbb44b47', '2024-05-28', 56, 31, '89d1e170-ca60-45d4-bc17-b3c3f0577917');
INSERT INTO `pms_project_progress_daily` VALUES ('c495ae98-d349-4d2d-bbbb-decb672326fa', '2024-05-30', 77, 40, '89d1e170-ca60-45d4-bc17-b3c3f0577917');
INSERT INTO `pms_project_progress_daily` VALUES ('c879f84e-7327-42ed-a0f0-b8d6ce13af50', '2024-06-06', 86, 13, '385a77ec-934c-4176-b1bf-19e2e08920e6');
INSERT INTO `pms_project_progress_daily` VALUES ('c8cb1f06-78da-470b-ae1a-efbd90dbc7ee', '2024-05-31', 87, 52, '89d1e170-ca60-45d4-bc17-b3c3f0577917');
INSERT INTO `pms_project_progress_daily` VALUES ('c9a870ed-ce90-4c0c-8617-da2788e24561', '2024-05-28', 86, 13, '385a77ec-934c-4176-b1bf-19e2e08920e6');
INSERT INTO `pms_project_progress_daily` VALUES ('d31d7c1b-c44e-446f-96a5-41bad1b06974', '2024-06-06', 93, 59, '89d1e170-ca60-45d4-bc17-b3c3f0577917');
INSERT INTO `pms_project_progress_daily` VALUES ('d5d0d3a5-563a-4588-abfa-4f0fb0a513c1', '2024-05-19', 98, 6, '5510a444-2789-4db1-9357-4f45c04a294e');
INSERT INTO `pms_project_progress_daily` VALUES ('eeaad394-ddff-4adb-a601-632fd65aa380', '2024-05-17', 99, 7, '5510a444-2789-4db1-9357-4f45c04a294e');

-- ----------------------------
-- Table structure for pms_project_resources
-- ----------------------------
DROP TABLE IF EXISTS `pms_project_resources`;
CREATE TABLE `pms_project_resources`  (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `project_id` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '项目ID',
  `user_id` bigint(20) NOT NULL COMMENT '创建者ID',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `is_manager` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否管理员',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_project_resources
-- ----------------------------
INSERT INTO `pms_project_resources` VALUES ('08541131-1998-4224-a59d-f110c43d121c', '945ce344-18b7-4768-b8ec-b9cef51eab5b', 9, 'rd1', '2024-06-07 14:59:31', 'rd1', '2024-06-07 14:59:31', '1');
INSERT INTO `pms_project_resources` VALUES ('1dab0feb-0f05-410f-9f6a-09b2b9636340', '385a77ec-934c-4176-b1bf-19e2e08920e6', 1, 'admin', '2024-05-28 09:38:25', 'admin', '2024-05-28 09:38:25', '1');
INSERT INTO `pms_project_resources` VALUES ('409ac488-fe51-415c-b0e5-d01d7c375513', '945ce344-18b7-4768-b8ec-b9cef51eab5b', 4, 'rd1', '2024-06-07 14:59:16', 'rd1', '2024-06-07 14:59:16', '1');
INSERT INTO `pms_project_resources` VALUES ('4130e233-2866-4279-860f-54227da33db3', '5510a444-2789-4db1-9357-4f45c04a294e', 2, 'admin', '2024-05-05 22:40:20', 'admin', '2024-05-05 22:40:20', '1');
INSERT INTO `pms_project_resources` VALUES ('4d7c9e94-8c70-49b6-bd99-762821bf7592', '9bd0bfdc-46a6-4550-abf3-a45f023b74a8', 2, 'admin', '2024-05-04 05:49:16', 'admin', '2024-05-04 05:49:16', '1');
INSERT INTO `pms_project_resources` VALUES ('5de3b3da-8ee1-491e-97df-389c273e012a', '385a77ec-934c-4176-b1bf-19e2e08920e6', 1, 'admin', '2024-05-04 05:48:57', 'admin', '2024-05-04 05:48:57', '1');
INSERT INTO `pms_project_resources` VALUES ('6af9a7a3-c686-48bd-9b3f-3dce9c76b5b7', '5f7ca606-a33f-41d9-80fa-8a2b613a9471', 1, 'admin', '2024-05-04 05:49:10', 'admin', '2024-05-04 05:49:10', '1');
INSERT INTO `pms_project_resources` VALUES ('7d3f7e84-4168-48f8-99b8-db214d5cfee3', '945ce344-18b7-4768-b8ec-b9cef51eab5b', 4, 'rd1', '2024-06-07 14:57:06', 'rd1', '2024-06-07 14:57:06', '1');
INSERT INTO `pms_project_resources` VALUES ('82d506ec-9aeb-45e0-89d0-4d24a107168f', '385a77ec-934c-4176-b1bf-19e2e08920e6', 1, 'admin', '2024-05-28 09:38:31', 'admin', '2024-05-28 09:38:31', '1');
INSERT INTO `pms_project_resources` VALUES ('82d96c4d-06cd-4d9d-841e-8e4ea4f3cc3f', '945ce344-18b7-4768-b8ec-b9cef51eab5b', 7, 'rd1', '2024-06-07 14:59:20', 'rd1', '2024-06-07 14:59:20', '1');
INSERT INTO `pms_project_resources` VALUES ('88f7b4bd-20a2-4c31-9244-8a802d31e9c7', '5510a444-2789-4db1-9357-4f45c04a294e', 1, 'admin', '2024-05-04 05:49:04', 'admin', '2024-05-04 05:49:04', '1');
INSERT INTO `pms_project_resources` VALUES ('8cb32b02-8f18-47e3-8d83-1c0308927b31', '460c907f-3130-4e44-848e-4f4b73d40c6d', 7, 'jiangjn', '2024-06-06 11:41:03', 'jiangjn', '2024-06-06 11:41:03', '1');
INSERT INTO `pms_project_resources` VALUES ('8fe667fc-d0ec-4fc6-a04f-e572570ea53b', '385a77ec-934c-4176-b1bf-19e2e08920e6', 2, 'admin', '2024-05-28 09:38:28', 'admin', '2024-05-28 09:38:28', '1');
INSERT INTO `pms_project_resources` VALUES ('91e9b518-058b-417d-b85c-ffcf75b91feb', 'a372fca9-f45b-439a-97cf-6cb6bb0afd87', 2, 'rd1', '2024-06-07 14:58:55', 'rd1', '2024-06-07 14:58:55', '1');
INSERT INTO `pms_project_resources` VALUES ('94402af5-7697-4181-a2a7-f50209885fea', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 7, 'rd1', '2024-06-06 15:42:05', 'rd1', '2024-06-06 15:42:05', '1');
INSERT INTO `pms_project_resources` VALUES ('94a7bad2-2fd2-4094-961d-79d91c7f18b9', '5ebcbbed-68cb-47f6-b57b-397c86835769', 4, 'rd1', '2024-05-27 15:52:31', 'rd1', '2024-05-27 15:52:31', '1');
INSERT INTO `pms_project_resources` VALUES ('9fa53a8b-4ddf-4b3d-ab94-0feca1a05e39', '385a77ec-934c-4176-b1bf-19e2e08920e6', 4, 'admin', '2024-05-28 09:38:17', 'admin', '2024-05-28 09:38:17', '1');
INSERT INTO `pms_project_resources` VALUES ('a214d759-b4c1-4ad6-9f68-65f3186ef238', 'fce10486-94e9-4215-9287-d34a31bd4edb', 1, 'admin', '2024-05-04 05:49:21', 'admin', '2024-05-04 05:49:21', '1');
INSERT INTO `pms_project_resources` VALUES ('d0cdaa77-7e25-46fb-b26c-25e9343e89a9', '088dbd65-daac-4885-9b36-e6ad75ed0964', 1, 'admin', '2024-05-04 05:47:36', 'admin', '2024-05-04 05:47:36', '1');
INSERT INTO `pms_project_resources` VALUES ('ec5362da-a8d0-4ab9-9c59-fd23e16ded1b', 'a372fca9-f45b-439a-97cf-6cb6bb0afd87', 4, 'rd1', '2024-06-05 15:19:36', 'rd1', '2024-06-05 15:19:36', '1');
INSERT INTO `pms_project_resources` VALUES ('f671476e-f31c-485c-9466-25a6cafdc712', '1a00e73c-aaec-453b-98d3-c81ec02faaac', 8, 'rd1', '2024-06-07 16:50:04', 'rd1', '2024-06-07 16:50:04', '1');
INSERT INTO `pms_project_resources` VALUES ('fd200f0a-c721-4c89-966b-7f21ecee9111', '1a00e73c-aaec-453b-98d3-c81ec02faaac', 4, 'rd1', '2024-06-07 16:49:55', 'rd1', '2024-06-07 16:49:55', '1');
INSERT INTO `pms_project_resources` VALUES ('fe543045-dfb4-48a5-b806-a4aa93d599ab', '945ce344-18b7-4768-b8ec-b9cef51eab5b', 4, 'rd1', '2024-06-07 14:59:15', 'rd1', '2024-06-07 14:59:15', '1');

-- ----------------------------
-- Table structure for pms_project_task
-- ----------------------------
DROP TABLE IF EXISTS `pms_project_task`;
CREATE TABLE `pms_project_task`  (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目ID',
  `project_id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务Id',
  `sort_num` double(11, 0) NULL DEFAULT NULL COMMENT '排序号',
  `task_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '项目名称',
  `user_id` bigint(20) NOT NULL COMMENT '创建者ID',
  `assign_user_id` bigint(20) NULL DEFAULT NULL COMMENT '指派用户',
  `task_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目类型',
  `task_status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务状态  0:待 1：确定 3：完成',
  `start_date` datetime(0) NULL DEFAULT NULL COMMENT '开始日期',
  `end_date` datetime(0) NULL DEFAULT NULL COMMENT '结束日期',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述',
  `p_id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '前置任务Id',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `predecessor_id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '前置任务',
  `duration` double(9, 2) NULL DEFAULT NULL COMMENT '工期',
  `visibility` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '可见性',
  `progress` tinyint(1) NULL DEFAULT NULL COMMENT '进度',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `project_id`(`project_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_project_task
-- ----------------------------
INSERT INTO `pms_project_task` VALUES ('008987c1-016a-4513-92c4-96643604aa42', '5510a444-2789-4db1-9357-4f45c04a294e', 10, '用户列表', 1, 2, '0', NULL, '2024-05-15 18:00:00', '2024-05-29 18:00:00', NULL, '56f9f4ac-0b6b-4cc7-b48a-0b62b7c30120', 'admin', '2024-04-18 13:56:04', 'admin', '2024-04-18 13:56:04', '1c45df32-499e-4fdc-aea9-8ea44b1d67aa', 10.00, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('00c9ab74-4357-4fa4-9948-2a4379a57588', '9bd0bfdc-46a6-4550-abf3-a45f023b74a8', 4, '222', 1, NULL, '1', NULL, '2024-04-18 00:00:00', '2024-04-18 00:00:00', NULL, '690c4da4-3fd7-43f6-b928-e3d1e3285dde', 'admin', '2024-04-18 13:45:15', 'admin', '2024-04-18 13:45:15', NULL, 1.00, NULL, 55);
INSERT INTO `pms_project_task` VALUES ('0104ff26-c232-463a-ae23-310e2ae0dbad', '945ce344-18b7-4768-b8ec-b9cef51eab5b', 0, '11', 4, 2, '0', NULL, '3899-02-01 00:00:00', '3899-02-02 00:00:00', NULL, NULL, 'rd1', '2024-06-07 15:00:15', 'rd1', '2024-06-07 15:00:15', NULL, 1.00, NULL, 6);
INSERT INTO `pms_project_task` VALUES ('032fa7ef-7a83-4f0d-b2a3-aeb499bbcf60', '385a77ec-934c-4176-b1bf-19e2e08920e6', 19, '删除系统', 1, 2, '0', NULL, '2025-07-14 17:00:00', '2025-07-15 17:00:00', NULL, '834dcf52-e0b1-4e3b-8823-a82818eb6488', 'admin', '2024-04-19 18:03:33', 'admin', '2024-04-19 18:03:33', '8240c9f0-f369-46d3-96a7-309044a7820e', 1.00, NULL, 55);
INSERT INTO `pms_project_task` VALUES ('036fa3c2-5e58-46e5-a6ec-69cdf3abe174', '385a77ec-934c-4176-b1bf-19e2e08920e6', 13, '修改用户', 1, 2, '0', NULL, '2025-06-11 17:00:00', '2025-06-12 17:00:00', '修改用户', '4e11d6ce-c8f0-4e6a-8e29-4ab3ae96e077', 'admin', '2024-04-16 11:47:15', 'admin', '2024-04-16 11:47:15', 'dc23cfc2-4138-4fa5-aecc-029cf756fb72', 1.00, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('03e355de-756f-4854-924c-c4198de8b6d5', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 13, '中医辨证分布', 4, NULL, '0', NULL, '2024-05-30 14:00:00', '2024-05-30 18:00:00', NULL, '5daff8f0-056c-4d02-8cc4-265d4cc4991d', 'rd1', '2024-05-24 14:58:23', 'rd1', '2024-05-24 14:58:23', 'f29b048a-c596-41c5-b406-929aa854f51a', 0.50, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('06c96943-ece0-437a-86e7-7242f228de1c', '385a77ec-934c-4176-b1bf-19e2e08920e6', 2, '计划', 1, 2, '1', NULL, '2024-04-19 00:00:00', '2024-04-26 00:00:00', NULL, 'f459591d-b8dc-4cb2-80a6-d948e4bdaef1', 'admin', '2024-04-19 18:03:45', 'admin', '2024-04-19 18:03:45', NULL, 6.00, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('0cc12189-9102-4b19-930c-1908275ecde7', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 26, '科研课题列表', 4, NULL, '0', NULL, '2024-05-22 08:00:00', '2024-05-22 18:00:00', NULL, 'c7fc2739-8b5b-4436-827d-4c05655fc216', 'rd1', '2024-05-24 16:32:44', 'rd1', '2024-05-24 16:32:44', '85da914c-88f5-4ff5-88a1-b5ada6bdc714', 1.00, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('0dfadfc2-e88d-4b6d-9104-5cfbb983142e', 'fce10486-94e9-4215-9287-d34a31bd4edb', 2, '2.2', 1, NULL, '1', NULL, '2024-04-19 00:00:00', '2024-04-19 00:00:00', NULL, 'ff578ae2-8ddd-471e-bfde-6deb87700b2f', 'admin', '2024-04-19 11:01:30', 'admin', '2024-04-19 11:01:30', NULL, NULL, NULL, 55);
INSERT INTO `pms_project_task` VALUES ('0dfae859-6d16-4e58-b619-dda0b5fa9b32', '5510a444-2789-4db1-9357-4f45c04a294e', 10, '3', 1, NULL, '0', NULL, '2024-09-11 18:00:00', '2024-09-12 18:00:00', NULL, 'eccecd34-e26d-43ed-be72-e54a7370620f', 'admin', '2024-05-11 22:59:22', 'admin', '2024-05-11 22:59:22', NULL, 1.00, NULL, 0);
INSERT INTO `pms_project_task` VALUES ('104b6c11-2282-464e-bb69-c3ab94f96eeb', '5ebcbbed-68cb-47f6-b57b-397c86835769', 2, '产品', 4, NULL, '0', NULL, '2024-05-28 08:00:00', '2024-05-28 18:00:00', NULL, NULL, 'rd1', '2024-05-27 16:21:47', 'rd1', '2024-05-27 16:21:47', NULL, 1.00, NULL, 0);
INSERT INTO `pms_project_task` VALUES ('114166bd-4a24-45db-98af-e367a6478e97', '9bd0bfdc-46a6-4550-abf3-a45f023b74a8', 1, '11', 1, NULL, '0', NULL, '2024-04-18 00:00:00', '2024-04-18 00:00:00', NULL, NULL, 'admin', '2024-04-18 13:41:13', 'admin', '2024-04-18 13:41:13', NULL, 1.00, NULL, 55);
INSERT INTO `pms_project_task` VALUES ('12ab2039-27af-477f-af93-1d4d17200722', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 45, '病性病位分布', 4, NULL, '0', NULL, '2024-05-31 14:00:00', '2024-05-31 16:00:00', NULL, '95ea2855-8b57-451c-b4d1-2ff537715840', 'rd1', '2024-05-24 16:41:04', 'rd1', '2024-05-24 16:41:04', '6bca97f7-7693-4cdc-b7b2-ce1a64a11d9e', 0.25, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('12f76643-e3d5-4895-be46-5ec9f43120ab', '2c6fae55-c62b-45a6-8623-cb037e7ddafa', 1, '计划', 1, 2, '1', NULL, '2024-04-28 00:00:00', '2024-04-28 00:00:00', NULL, NULL, 'admin', '2024-04-30 21:14:15', 'admin', '2024-04-30 21:14:15', NULL, 1.00, NULL, 55);
INSERT INTO `pms_project_task` VALUES ('13e37820-565c-4ada-b99a-e7a756b79454', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 37, '原生医案筛选，存入缓存', 4, NULL, '0', NULL, '2024-05-27 18:00:00', '2024-05-29 14:00:00', NULL, '1e5764c6-d7d4-402d-a229-b76e092acc2a', 'rd1', '2024-05-24 16:38:56', 'rd1', '2024-05-24 16:38:56', 'dcb98d19-bb00-4a6f-b25d-d9307fc19b9b', 1.50, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('15ac5d49-cba7-4308-b747-b1cc78c69473', '385a77ec-934c-4176-b1bf-19e2e08920e6', 4, '增加菜单', 1, 2, '0', NULL, '2024-04-29 08:00:00', '2024-04-29 17:00:00', NULL, 'ab568557-c228-4adc-876d-327aafc1d7d4', 'admin', '2024-04-16 22:54:25', 'admin', '2024-04-16 22:54:25', '06c96943-ece0-437a-86e7-7242f228de1c', 1.00, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('15d0a088-247f-425d-a5fd-50d8c1c870cd', '5510a444-2789-4db1-9357-4f45c04a294e', 1, '项目', 1, 2, '0', NULL, '2024-04-19 00:00:00', '2024-06-04 14:00:00', NULL, NULL, 'admin', '2024-04-18 13:34:00', 'admin', '2024-04-18 13:34:00', NULL, 27.50, NULL, 98);
INSERT INTO `pms_project_task` VALUES ('16dd4565-a6bf-4515-bcef-4566f2086b35', '385a77ec-934c-4176-b1bf-19e2e08920e6', 5, '修改菜单', 1, 2, '0', NULL, '2025-05-08 17:00:00', '2025-05-09 17:00:00', NULL, 'ab568557-c228-4adc-876d-327aafc1d7d4', 'admin', '2024-04-16 22:54:38', 'admin', '2024-04-16 22:54:38', 'ab568557-c228-4adc-876d-327aafc1d7d4', 1.00, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('19f961af-f920-474e-adad-f3edc5dbba5a', '460c907f-3130-4e44-848e-4f4b73d40c6d', 3, '前端', 7, NULL, '0', NULL, '2024-06-14 08:00:00', '2024-06-24 18:00:00', NULL, '5d01090c-65ff-4416-8570-0130516bee77', 'jiangjn', '2024-06-06 11:41:45', 'jiangjn', '2024-06-06 11:41:45', NULL, 13.00, NULL, 0);
INSERT INTO `pms_project_task` VALUES ('1b095402-40d4-4677-8647-3f8a46dd83ce', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 14, '中药处方分布', 4, NULL, '0', NULL, '2024-05-30 18:00:00', '2024-05-31 14:00:00', NULL, '5daff8f0-056c-4d02-8cc4-265d4cc4991d', 'rd1', '2024-05-24 14:58:30', 'rd1', '2024-05-24 14:58:30', '03e355de-756f-4854-924c-c4198de8b6d5', 0.50, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('1c45df32-499e-4fdc-aea9-8ea44b1d67aa', '5510a444-2789-4db1-9357-4f45c04a294e', 9, '保存用户', 1, 2, '0', NULL, '2024-04-24 18:00:00', '2024-05-15 18:00:00', NULL, '56f9f4ac-0b6b-4cc7-b48a-0b62b7c30120', 'admin', '2024-04-18 13:56:13', 'admin', '2024-04-18 13:56:13', '71e51519-04fd-45af-acb4-ceb4e9490c9c', 10.00, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('1d145c46-7e3b-4abd-a092-e24396f84e3f', '9bd0bfdc-46a6-4550-abf3-a45f023b74a8', 7, '555', 1, NULL, '1', NULL, '2024-04-18 00:00:00', '2024-04-18 00:00:00', NULL, '00c9ab74-4357-4fa4-9948-2a4379a57588', 'admin', '2024-04-18 13:52:10', 'admin', '2024-04-18 13:52:10', NULL, 1.00, NULL, 55);
INSERT INTO `pms_project_task` VALUES ('1dcaef4f-321c-4366-9c94-c64c16ba6553', '385a77ec-934c-4176-b1bf-19e2e08920e6', 10, '增加用户', 1, 2, '0', NULL, '2025-05-12 17:00:00', '2025-05-22 17:00:00', '增加用户', '760bd3a9-14f6-4be0-b19b-69302094b7ad', 'admin', '2024-04-16 10:44:10', 'admin', '2024-04-16 10:44:10', '760bd3a9-14f6-4be0-b19b-69302094b7ad', 8.00, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('1e5764c6-d7d4-402d-a229-b76e092acc2a', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 33, '筛选医案', 4, NULL, '0', NULL, '2024-05-22 18:00:00', '2024-06-05 11:00:00', NULL, '27238f7d-bed1-4a15-8edd-6e607fd4fbe9', 'rd1', '2024-05-24 16:38:16', 'rd1', '2024-05-24 16:38:16', NULL, 9.50, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('1f553a03-6d61-4dc8-bc0d-81ceb0cb06ba', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 65, '经验医案', 4, NULL, '0', NULL, '2024-05-22 18:00:00', '2024-05-27 18:00:00', NULL, '432d9559-a129-4bf6-9a58-6199d8934274', 'rd1', '2024-05-24 16:45:29', 'rd1', '2024-05-24 16:45:29', NULL, 3.00, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('213ab4df-9104-47d4-948b-16568048f063', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 48, '疗效分布', 4, NULL, '0', NULL, '2024-06-03 11:00:00', '2024-06-03 14:00:00', NULL, '95ea2855-8b57-451c-b4d1-2ff537715840', 'rd1', '2024-05-24 16:41:12', 'rd1', '2024-05-24 16:41:12', '89c4e3dc-478a-4e5b-ab66-7bc1d5d2ac12', 0.25, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('24f3ba39-b85a-4895-9127-c3ee0934f852', '460c907f-3130-4e44-848e-4f4b73d40c6d', 12, '生成表格', 7, 6, '0', NULL, '2024-06-14 08:00:00', '2024-06-14 18:00:00', NULL, '9b0f0cf1-be20-423a-b28f-0ab3cbe08497', 'jiangjn', '2024-06-06 14:45:58', 'jiangjn', '2024-06-06 14:45:58', 'f50213ab-5053-4eae-91e9-998d93b3a80e', 1.00, NULL, 0);
INSERT INTO `pms_project_task` VALUES ('27238f7d-bed1-4a15-8edd-6e607fd4fbe9', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 32, '临床科研', 4, NULL, '0', NULL, '2024-05-22 18:00:00', '2024-06-05 11:00:00', NULL, '432d9559-a129-4bf6-9a58-6199d8934274', 'rd1', '2024-05-24 16:38:01', 'rd1', '2024-05-24 16:38:01', NULL, 18.50, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('2a2b9a3d-6a32-4e41-b07c-91c8f4e7f808', '460c907f-3130-4e44-848e-4f4b73d40c6d', 18, '后端', 7, NULL, '0', NULL, '2024-06-14 08:00:00', '2024-06-21 18:00:00', NULL, '5d01090c-65ff-4416-8570-0130516bee77', 'jiangjn', '2024-06-06 11:41:52', 'jiangjn', '2024-06-06 11:41:52', NULL, 9.00, NULL, 0);
INSERT INTO `pms_project_task` VALUES ('2a638ab7-e04c-47d2-b829-1a240c22cf0b', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 29, '编辑医案详情&新增统计域', 4, NULL, '0', NULL, '2024-05-28 18:00:00', '2024-05-29 18:00:00', NULL, 'c7fc2739-8b5b-4436-827d-4c05655fc216', 'rd1', '2024-05-24 16:33:22', 'rd1', '2024-05-24 16:33:22', 'ad45841f-a5b5-40aa-aae4-f28eddee780a', 1.00, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('2aaa4e94-b5b6-4439-8286-df7a41d17661', '385a77ec-934c-4176-b1bf-19e2e08920e6', 9, '用户列表', 1, 2, '0', NULL, '2025-06-09 17:00:00', '2025-06-10 17:00:00', '用户列表', '760bd3a9-14f6-4be0-b19b-69302094b7ad', 'admin', '2024-04-15 18:26:48', 'admin', '2024-04-15 18:26:48', '3d36036d-1bdc-4e31-b037-a55f5fd9f8ed', 1.00, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('2b762f37-60a9-446a-b323-09e7f1893572', '460c907f-3130-4e44-848e-4f4b73d40c6d', 8, '医籍转案 中医诊断、中医证型、西医诊断处理', 7, 8, '0', NULL, '2024-06-18 18:00:00', '2024-06-20 14:00:00', '<p>医籍转案后，如果某诊没有中医诊断、中医证型、西医诊断、治则治法信息的，需要延续前诊的内容</p>', '9dd76598-1190-465b-b51b-5783b216ba1a', 'jiangjn', '2024-06-06 14:42:43', 'jiangjn', '2024-06-06 14:42:43', 'f0d0266c-5ccd-4516-8f36-95e8e6721ea0', 1.50, NULL, 0);
INSERT INTO `pms_project_task` VALUES ('2c964434-22a7-4d54-994d-01b45b1558e9', '460c907f-3130-4e44-848e-4f4b73d40c6d', 20, '疗程视图接口', 7, 10, '0', NULL, '2024-06-14 08:00:00', '2024-06-14 18:00:00', NULL, 'dec93e12-f421-4232-9b92-3126a1033fa6', 'jiangjn', '2024-06-06 14:45:17', 'jiangjn', '2024-06-06 14:45:17', 'f50213ab-5053-4eae-91e9-998d93b3a80e', 1.00, NULL, 0);
INSERT INTO `pms_project_task` VALUES ('2ddd89d6-c752-4afb-ad6c-be687dccf88e', '460c907f-3130-4e44-848e-4f4b73d40c6d', 4, '原生医案', 7, NULL, '0', NULL, '2024-06-14 08:00:00', '2024-06-18 18:00:00', NULL, '19f961af-f920-474e-adad-f3edc5dbba5a', 'jiangjn', '2024-06-06 11:54:03', 'jiangjn', '2024-06-06 11:54:03', NULL, 3.00, NULL, 0);
INSERT INTO `pms_project_task` VALUES ('2f8460aa-6089-4e44-a3a0-17d45c64f9e4', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 70, '预分词逻辑调整', 4, NULL, '0', NULL, '2024-05-27 18:00:00', '2024-05-28 18:00:00', NULL, '5a8824be-1c1d-4a88-93e3-19be0c7f8473', 'rd1', '2024-05-24 16:45:45', 'rd1', '2024-05-24 16:45:45', 'e0389fcf-4eb2-4e16-9d13-32c22dabe3b2', 1.00, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('2f92ee29-3f70-42ab-8195-0e4a6b4d844d', '460c907f-3130-4e44-848e-4f4b73d40c6d', 17, '导出EXCEL', 7, 6, '0', NULL, '2024-06-19 18:00:00', '2024-06-20 18:00:00', NULL, '9b0f0cf1-be20-423a-b28f-0ab3cbe08497', 'jiangjn', '2024-06-06 14:48:33', 'jiangjn', '2024-06-06 14:48:33', '66669f52-9e24-4259-ab10-d2e9d7a641bd', 1.00, NULL, 0);
INSERT INTO `pms_project_task` VALUES ('30b1a790-cdce-4196-8944-14c46952c0a1', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 66, '保存逻辑调整-保存新增表', 4, NULL, '0', NULL, '2024-05-22 18:00:00', '2024-05-23 18:00:00', NULL, '1f553a03-6d61-4dc8-bc0d-81ceb0cb06ba', 'rd1', '2024-05-24 16:46:46', 'rd1', '2024-05-24 16:46:46', 'b80ffed5-9577-487e-b610-efe9badb0b3d', 1.00, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('338fc888-1e1d-4620-a989-9a780f25fda0', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 46, '四性分布', 4, NULL, '0', NULL, '2024-05-31 16:00:00', '2024-05-31 18:00:00', NULL, '95ea2855-8b57-451c-b4d1-2ff537715840', 'rd1', '2024-05-24 16:40:50', 'rd1', '2024-05-24 16:40:50', '12ab2039-27af-477f-af93-1d4d17200722', 0.25, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('3658621e-b4d2-4784-9658-785ebb67b210', '460c907f-3130-4e44-848e-4f4b73d40c6d', 21, '疗程视图连案详细', 7, 10, '0', NULL, '2024-06-14 18:00:00', '2024-06-17 18:00:00', NULL, 'dec93e12-f421-4232-9b92-3126a1033fa6', 'jiangjn', '2024-06-06 14:53:19', 'jiangjn', '2024-06-06 14:53:19', '2c964434-22a7-4d54-994d-01b45b1558e9', 1.00, NULL, 0);
INSERT INTO `pms_project_task` VALUES ('3841ef13-f9b2-4883-9017-d251c74ced8c', '9bd0bfdc-46a6-4550-abf3-a45f023b74a8', 5, '444', 1, NULL, '1', NULL, '2024-04-18 00:00:00', '2024-04-18 00:00:00', NULL, 'b22af257-6381-4e68-9d02-7c0227f47ac4', 'admin', '2024-04-18 13:48:59', 'admin', '2024-04-18 13:48:59', NULL, 1.00, NULL, 55);
INSERT INTO `pms_project_task` VALUES ('38ecb8e5-f12c-40ff-b112-336882b2d9e6', '460c907f-3130-4e44-848e-4f4b73d40c6d', 13, '关联分析', 7, 6, '0', NULL, '2024-06-14 18:00:00', '2024-06-17 18:00:00', NULL, '9b0f0cf1-be20-423a-b28f-0ab3cbe08497', 'jiangjn', '2024-06-06 14:46:20', 'jiangjn', '2024-06-06 14:46:20', '24f3ba39-b85a-4895-9127-c3ee0934f852', 1.00, NULL, 0);
INSERT INTO `pms_project_task` VALUES ('39431a72-a4a6-46a3-ae98-6ccf74e43ad4', '5ebcbbed-68cb-47f6-b57b-397c86835769', 1, '计划', 4, NULL, '1', NULL, '2024-05-27 00:00:00', '2024-05-27 00:00:00', NULL, NULL, 'rd1', '2024-05-27 15:53:06', 'rd1', '2024-05-27 15:53:06', NULL, 1.00, NULL, 0);
INSERT INTO `pms_project_task` VALUES ('3d36036d-1bdc-4e31-b037-a55f5fd9f8ed', '385a77ec-934c-4176-b1bf-19e2e08920e6', 7, '删除菜单', 1, 2, '0', NULL, '2025-05-23 17:00:00', '2025-06-09 17:00:00', NULL, 'ab568557-c228-4adc-876d-327aafc1d7d4', 'admin', '2024-04-16 22:55:12', 'admin', '2024-04-16 22:55:12', '5bc930b7-6440-4b5d-bbc5-f5fa75f688d6', 11.00, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('40b3c43c-e9b3-4306-a466-e3d8753646e1', 'fce10486-94e9-4215-9287-d34a31bd4edb', 3, '2', 1, NULL, '1', NULL, '2024-04-19 00:00:00', '2024-04-19 00:00:00', NULL, 'ff578ae2-8ddd-471e-bfde-6deb87700b2f', 'admin', '2024-04-19 11:01:20', 'admin', '2024-04-19 11:01:20', NULL, NULL, NULL, 55);
INSERT INTO `pms_project_task` VALUES ('4158bd74-fe04-4bee-990f-85cc37e2b8d2', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 50, '中医辨证分布数据修改', 4, NULL, '0', NULL, '2024-06-03 16:00:00', '2024-06-03 18:00:00', NULL, '95ea2855-8b57-451c-b4d1-2ff537715840', 'rd1', '2024-05-24 16:41:36', 'rd1', '2024-05-24 16:41:36', 'f1fbd55e-6573-41a8-b744-766f53dc2f91', 0.25, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('432d9559-a129-4bf6-9a58-6199d8934274', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 30, '后端', 4, NULL, '0', NULL, '2024-05-22 08:00:00', '2024-06-05 11:00:00', NULL, '668bc26a-3804-44a2-b0d0-0bc5508de34a', 'rd1', '2024-05-24 14:53:27', 'rd1', '2024-05-24 14:53:27', NULL, 25.50, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('43692ebf-5f2c-4626-be07-8df447d4b6f2', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 6, '新建&修改筛选策略', 4, NULL, '0', NULL, '2024-05-22 08:00:00', '2024-05-23 18:00:00', NULL, 'a801af81-8cfa-4172-82f6-22cd999f0551', 'rd1', '2024-05-24 14:56:09', 'rd1', '2024-05-24 14:56:09', '85da914c-88f5-4ff5-88a1-b5ada6bdc714', 2.00, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('440c702f-0f18-42db-817a-84d4c3b02610', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 44, '中医辨证分布', 4, NULL, '0', NULL, '2024-05-31 14:00:00', '2024-05-31 16:00:00', NULL, '95ea2855-8b57-451c-b4d1-2ff537715840', 'rd1', '2024-05-24 16:40:38', 'rd1', '2024-05-24 16:40:38', '6bca97f7-7693-4cdc-b7b2-ce1a64a11d9e', 0.25, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('45ff7a38-a18d-4e0a-934e-49b54d5612f2', '2c6fae55-c62b-45a6-8623-cb037e7ddafa', 2, '11', 1, NULL, '0', NULL, '2024-04-29 08:00:00', '2024-05-06 17:00:00', NULL, NULL, 'admin', '2024-04-30 21:14:08', 'admin', '2024-04-30 21:14:08', '12f76643-e3d5-4895-be46-5ec9f43120ab', 6.00, NULL, 55);
INSERT INTO `pms_project_task` VALUES ('46c9415f-578a-4bf0-b4f9-ebb4bee50e1c', '385a77ec-934c-4176-b1bf-19e2e08920e6', 15, '角色列表', 1, 2, '0', NULL, '2025-07-01 17:00:00', '2025-07-02 17:00:00', NULL, '4e11d6ce-c8f0-4e6a-8e29-4ab3ae96e077', 'admin', '2024-04-16 13:58:01', 'admin', '2024-04-16 13:58:01', 'c04d7115-3cdf-4acf-a4bc-73e9c0866c65', 1.00, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('484c76e3-b388-4370-8e2d-807762de8cc5', '460c907f-3130-4e44-848e-4f4b73d40c6d', 5, '增加疗程视图与列表视图切换', 7, 8, '0', NULL, '2024-06-14 08:00:00', '2024-06-17 14:00:00', NULL, '2ddd89d6-c752-4afb-ad6c-be687dccf88e', 'jiangjn', '2024-06-06 14:44:52', 'jiangjn', '2024-06-06 14:44:52', 'f50213ab-5053-4eae-91e9-998d93b3a80e', 1.50, NULL, 0);
INSERT INTO `pms_project_task` VALUES ('49aa2b25-9d00-4f57-9bac-500aa56369ff', '945ce344-18b7-4768-b8ec-b9cef51eab5b', 1000000, '11', 4, 4, '0', NULL, '3899-02-02 00:00:00', '3899-02-02 18:00:00', NULL, NULL, 'rd1', '2024-06-07 15:00:11', 'rd1', '2024-06-07 15:00:11', NULL, 1.00, NULL, 0);
INSERT INTO `pms_project_task` VALUES ('49f155e5-9fbe-4ec7-9d7e-107983deec79', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 3, '前端', 4, NULL, '0', NULL, '2024-05-22 08:00:00', '2024-06-07 14:00:00', NULL, '668bc26a-3804-44a2-b0d0-0bc5508de34a', 'rd1', '2024-05-24 14:53:19', 'rd1', '2024-05-24 14:53:19', NULL, 18.50, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('4b79bd81-a148-4dc6-b20a-4304b41e157b', '385a77ec-934c-4176-b1bf-19e2e08920e6', 16, '删除角色', 1, 2, '0', NULL, '2025-07-02 17:00:00', '2025-07-03 17:00:00', NULL, '4e11d6ce-c8f0-4e6a-8e29-4ab3ae96e077', 'admin', '2024-04-16 13:59:22', 'admin', '2024-04-16 13:59:22', '46c9415f-578a-4bf0-b4f9-ebb4bee50e1c', 1.00, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('4b937d76-b77d-4f5d-b9ae-e134816dade0', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 67, '预分词逻辑调整', 4, NULL, '0', NULL, '2024-05-23 18:00:00', '2024-05-24 18:00:00', NULL, '1f553a03-6d61-4dc8-bc0d-81ceb0cb06ba', 'rd1', '2024-05-24 16:46:53', 'rd1', '2024-05-24 16:46:53', '30b1a790-cdce-4196-8944-14c46952c0a1', 1.00, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('4d4f302d-a148-48bc-8ff8-ae4717e82e97', '5510a444-2789-4db1-9357-4f45c04a294e', 5, '角色', 1, 2, '0', NULL, '2024-04-23 08:00:00', '2024-04-23 18:00:00', NULL, '92d24c98-16c7-4858-a907-238b3a963763', 'admin', '2024-05-11 22:58:27', 'admin', '2024-05-11 22:58:27', 'e43f3945-c5de-4769-a476-d4d85fcf70d1', 1.00, NULL, 94);
INSERT INTO `pms_project_task` VALUES ('4e11d6ce-c8f0-4e6a-8e29-4ab3ae96e077', '385a77ec-934c-4176-b1bf-19e2e08920e6', 12, '角色管理', 1, 1, '0', NULL, '2025-05-12 17:00:00', '2025-06-12 17:00:00', NULL, 'f459591d-b8dc-4cb2-80a6-d948e4bdaef1', 'admin', '2024-04-16 13:37:34', 'admin', '2024-04-16 13:37:34', NULL, 23.00, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('5007a52f-442d-4d06-b81d-f99bac9a4560', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 7, '筛选策略管理', 4, NULL, '0', NULL, '2024-05-23 18:00:00', '2024-05-24 18:00:00', NULL, 'a801af81-8cfa-4172-82f6-22cd999f0551', 'rd1', '2024-05-24 14:56:25', 'rd1', '2024-05-24 14:56:25', '43692ebf-5f2c-4626-be07-8df447d4b6f2', 1.00, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('50349705-9a97-4957-b9ac-17871ff5583f', '5510a444-2789-4db1-9357-4f45c04a294e', 15, '用户列表接口', 1, 2, '0', NULL, '2024-05-31 18:00:00', '2024-06-04 14:00:00', NULL, 'ac9108c6-3daa-4e2b-a83f-b8d5bf92f823', 'admin', '2024-04-18 13:59:15', 'admin', '2024-04-18 13:59:15', '7f99b26c-b24a-4536-afe1-1a9426514bcb', 1.50, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('50dde894-7b7d-44f9-9381-c59cb6a522f6', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 18, '打印&导出', 4, NULL, '0', NULL, '2024-06-03 18:00:00', '2024-06-04 14:00:00', NULL, '5daff8f0-056c-4d02-8cc4-265d4cc4991d', 'rd1', '2024-05-24 14:59:15', 'rd1', '2024-05-24 14:59:15', 'e8655d17-e76d-43be-84fd-adf788b3d929', 0.50, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('5390ed47-e884-4e6a-b9e1-268fd8eaa408', '460c907f-3130-4e44-848e-4f4b73d40c6d', 31, '客户端', 7, NULL, '0', NULL, '2024-06-14 18:00:00', '2024-06-17 18:00:00', NULL, '5d01090c-65ff-4416-8570-0130516bee77', 'jiangjn', '2024-06-06 11:55:22', 'jiangjn', '2024-06-06 11:55:22', NULL, 1.00, NULL, 0);
INSERT INTO `pms_project_task` VALUES ('557b70dd-d88b-4b55-8785-6e12bd553563', '5510a444-2789-4db1-9357-4f45c04a294e', 12, '保存用户接口', 1, 2, '0', NULL, '2024-05-29 18:00:00', '2024-05-30 18:00:00', NULL, 'a7cfcb04-48de-4a37-a1bd-80ab886499d8', 'admin', '2024-04-18 13:59:26', 'admin', '2024-04-18 13:59:26', '008987c1-016a-4513-92c4-96643604aa42', 1.00, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('56a35e75-6783-4b65-bb72-bd18bd6c71f1', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 15, '病性病位分布', 4, NULL, '0', NULL, '2024-05-31 14:00:00', '2024-05-31 18:00:00', NULL, '5daff8f0-056c-4d02-8cc4-265d4cc4991d', 'rd1', '2024-05-24 14:58:54', 'rd1', '2024-05-24 14:58:54', '1b095402-40d4-4677-8647-3f8a46dd83ce', 0.50, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('56f9f4ac-0b6b-4cc7-b48a-0b62b7c30120', '5510a444-2789-4db1-9357-4f45c04a294e', 8, '用户管理', 1, NULL, '0', NULL, '2024-04-24 18:00:00', '2024-05-29 18:00:00', NULL, 'd502f0cf-c12c-49ef-902d-9e8bc1d7bd7f', 'admin', '2024-04-18 13:55:48', 'admin', '2024-04-18 13:55:48', NULL, 20.00, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('5a8824be-1c1d-4a88-93e3-19be0c7f8473', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 69, '原生医案', 4, NULL, '0', NULL, '2024-05-27 18:00:00', '2024-05-30 18:00:00', NULL, '432d9559-a129-4bf6-9a58-6199d8934274', 'rd1', '2024-05-24 16:45:18', 'rd1', '2024-05-24 16:45:18', NULL, 3.00, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('5bc930b7-6440-4b5d-bbc5-f5fa75f688d6', '385a77ec-934c-4176-b1bf-19e2e08920e6', 6, '菜单列表', 1, 2, '0', NULL, '2025-05-09 17:00:00', '2025-05-23 17:00:00', NULL, 'ab568557-c228-4adc-876d-327aafc1d7d4', 'admin', '2024-04-16 22:54:55', 'admin', '2024-04-16 22:54:55', '16dd4565-a6bf-4515-bcef-4566f2086b35', 10.00, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('5d01090c-65ff-4416-8570-0130516bee77', '460c907f-3130-4e44-848e-4f4b73d40c6d', 1, 'ROOT', 7, NULL, '0', NULL, '2024-06-12 00:00:00', '2024-07-08 18:00:00', NULL, NULL, 'jiangjn', '2024-06-06 11:41:39', 'jiangjn', '2024-06-06 11:41:39', NULL, 35.00, NULL, 5);
INSERT INTO `pms_project_task` VALUES ('5daff8f0-056c-4d02-8cc4-265d4cc4991d', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 11, '快速透视', 4, NULL, '0', NULL, '2024-05-29 18:00:00', '2024-06-07 14:00:00', NULL, 'a801af81-8cfa-4172-82f6-22cd999f0551', 'rd1', '2024-05-24 14:57:56', 'rd1', '2024-05-24 14:57:56', NULL, 6.50, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('5f35fb48-8b1e-415c-90f2-77a92f469782', '460c907f-3130-4e44-848e-4f4b73d40c6d', 25, '卡方检验', 7, 11, '0', NULL, '2024-06-17 18:00:00', '2024-06-18 18:00:00', NULL, 'fa16158f-8a3b-4ea6-b578-ed3298c89b4b', 'jiangjn', '2024-06-06 14:47:35', 'jiangjn', '2024-06-06 14:47:35', '7d4aed36-fe4e-4f1d-be3a-de030de0c923', 1.00, NULL, 0);
INSERT INTO `pms_project_task` VALUES ('5f5fb4eb-4e2a-48e2-8b81-97d76af4c7e4', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 16, '四性分布', 4, NULL, '0', NULL, '2024-05-31 18:00:00', '2024-06-03 14:00:00', NULL, '5daff8f0-056c-4d02-8cc4-265d4cc4991d', 'rd1', '2024-05-24 14:58:39', 'rd1', '2024-05-24 14:58:39', '56a35e75-6783-4b65-bb72-bd18bd6c71f1', 0.50, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('6090a022-2126-4b0b-8324-dc0617baf72d', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 10, '医案详情', 4, NULL, '0', NULL, '2024-05-28 18:00:00', '2024-05-29 18:00:00', NULL, 'a801af81-8cfa-4172-82f6-22cd999f0551', 'rd1', '2024-05-24 14:57:26', 'rd1', '2024-05-24 14:57:26', '91975970-88af-4b19-84b2-1f7d107432bc', 1.00, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('624c42ab-e37d-48e5-b21b-539a5f34d055', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 40, '医案详情', 4, NULL, '0', NULL, '2024-05-30 14:00:00', '2024-05-30 18:00:00', NULL, '1e5764c6-d7d4-402d-a229-b76e092acc2a', 'rd1', '2024-05-24 16:39:40', 'rd1', '2024-05-24 16:39:40', 'b8f2e9bc-2f07-4c40-8880-9e165563e990', 0.50, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('65855035-34b7-4cdd-a243-5474a6b787e7', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 23, '四性分布数据修改', 4, NULL, '0', NULL, '2024-06-06 14:00:00', '2024-06-06 18:00:00', NULL, '5daff8f0-056c-4d02-8cc4-265d4cc4991d', 'rd1', '2024-05-24 14:59:54', 'rd1', '2024-05-24 14:59:54', 'e7ef9909-9bad-4646-adea-0ab21536fab6', 0.50, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('66669f52-9e24-4259-ab10-d2e9d7a641bd', '460c907f-3130-4e44-848e-4f4b73d40c6d', 15, '聚类分析', 7, 6, '0', NULL, '2024-06-18 18:00:00', '2024-06-19 18:00:00', NULL, '9b0f0cf1-be20-423a-b28f-0ab3cbe08497', 'jiangjn', '2024-06-06 14:46:34', 'jiangjn', '2024-06-06 14:46:34', '68e3c992-2724-43a5-9bfe-c0734ff009aa', 1.00, NULL, 0);
INSERT INTO `pms_project_task` VALUES ('668bc26a-3804-44a2-b0d0-0bc5508de34a', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 1, '科研模块', 4, NULL, '0', NULL, '2024-05-20 00:00:00', '2024-06-12 14:00:00', NULL, NULL, 'rd1', '2024-05-24 21:05:04', 'rd1', '2024-05-24 21:05:04', NULL, 49.00, NULL, 93);
INSERT INTO `pms_project_task` VALUES ('68e3c992-2724-43a5-9bfe-c0734ff009aa', '460c907f-3130-4e44-848e-4f4b73d40c6d', 14, '卡方检验', 7, 6, '0', NULL, '2024-06-17 18:00:00', '2024-06-18 18:00:00', NULL, '9b0f0cf1-be20-423a-b28f-0ab3cbe08497', 'jiangjn', '2024-06-06 14:46:27', 'jiangjn', '2024-06-06 14:46:27', '38ecb8e5-f12c-40ff-b112-336882b2d9e6', 1.00, NULL, 0);
INSERT INTO `pms_project_task` VALUES ('690c4da4-3fd7-43f6-b928-e3d1e3285dde', '9bd0bfdc-46a6-4550-abf3-a45f023b74a8', 3, '22', 1, NULL, '1', NULL, '2024-04-18 00:00:00', '2024-04-18 00:00:00', NULL, 'd62cd6fd-0375-4814-927d-88f6ae8e2bd8', 'admin', '2024-04-18 13:45:10', 'admin', '2024-04-18 13:45:10', NULL, 1.00, NULL, 55);
INSERT INTO `pms_project_task` VALUES ('6a84c474-d8f0-4f9d-b2f7-752d1e2d4698', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 59, '医案详情', 4, NULL, '0', NULL, '2024-05-24 18:00:00', '2024-05-27 18:00:00', NULL, 'e66394bb-03e0-48a4-a117-52deb05f1031', 'rd1', '2024-05-24 16:43:20', 'rd1', '2024-05-24 16:43:20', '8e6113ad-d641-4a99-b940-d2f20d026b71', 1.00, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('6bca97f7-7693-4cdc-b7b2-ce1a64a11d9e', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 43, '中药处方分布', 4, NULL, '0', NULL, '2024-05-31 11:00:00', '2024-05-31 14:00:00', NULL, '95ea2855-8b57-451c-b4d1-2ff537715840', 'rd1', '2024-05-24 16:40:44', 'rd1', '2024-05-24 16:40:44', 'a82cc78e-7417-41e8-8aeb-8082f7634ce6', 0.25, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('6f20a19a-e78c-4acf-9723-40900b42c9f6', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 73, '提测', 4, NULL, '0', NULL, '2024-06-07 14:00:00', '2024-06-12 14:00:00', NULL, '668bc26a-3804-44a2-b0d0-0bc5508de34a', 'rd1', '2024-05-24 14:53:34', 'rd1', '2024-05-24 14:53:34', '49f155e5-9fbe-4ec7-9d7e-107983deec79', 3.00, NULL, 0);
INSERT INTO `pms_project_task` VALUES ('7015244c-965a-45df-9d47-04ee361c1dc1', '385a77ec-934c-4176-b1bf-19e2e08920e6', 21, '增加系统', 1, 2, '0', NULL, '2024-04-29 17:00:00', '2024-04-30 17:00:00', NULL, '834dcf52-e0b1-4e3b-8823-a82818eb6488', 'admin', '2024-04-19 18:03:16', 'admin', '2024-04-19 18:03:16', '15ac5d49-cba7-4308-b747-b1cc78c69473', 1.00, NULL, 55);
INSERT INTO `pms_project_task` VALUES ('71e51519-04fd-45af-acb4-ceb4e9490c9c', '5510a444-2789-4db1-9357-4f45c04a294e', 6, '用户', 1, 2, '0', NULL, '2024-04-23 18:00:00', '2024-04-24 18:00:00', NULL, '92d24c98-16c7-4858-a907-238b3a963763', 'admin', '2024-05-11 22:58:20', 'admin', '2024-05-11 22:58:20', '4d4f302d-a148-48bc-8ff8-ae4717e82e97', 1.00, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('760bd3a9-14f6-4be0-b19b-69302094b7ad', '385a77ec-934c-4176-b1bf-19e2e08920e6', 8, '用户管理', 1, 1, '0', NULL, '2025-04-10 17:00:00', '2025-05-12 17:00:00', '用户管理', 'f459591d-b8dc-4cb2-80a6-d948e4bdaef1', 'admin', '2024-04-16 13:24:39', 'admin', '2024-04-16 13:24:39', NULL, 10.00, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('76d3ee54-7171-4758-9b3d-800fb7061328', '5510a444-2789-4db1-9357-4f45c04a294e', 11, '4', 1, NULL, '0', NULL, '2024-09-13 18:00:00', '2024-09-16 18:00:00', NULL, 'eccecd34-e26d-43ed-be72-e54a7370620f', 'admin', '2024-05-11 22:59:26', 'admin', '2024-05-11 22:59:26', NULL, 1.00, NULL, 0);
INSERT INTO `pms_project_task` VALUES ('79462ce5-bebe-48d1-b846-103b8ec24fb7', '5ebcbbed-68cb-47f6-b57b-397c86835769', 4, '用户管理', 4, NULL, '0', NULL, '2024-05-28 18:00:00', '2024-06-07 18:00:00', NULL, 'c6a4e852-f794-4df1-977b-1800ef70bb33', 'rd1', '2024-05-27 15:53:43', 'rd1', '2024-05-27 15:53:43', 'eeeb490f-fa6a-40b0-bb37-9c62821c4614', 8.00, NULL, 0);
INSERT INTO `pms_project_task` VALUES ('79685166-a684-4450-ac6e-a4524c008de8', '460c907f-3130-4e44-848e-4f4b73d40c6d', 28, '导出EXCEL', 7, 11, '0', NULL, '2024-06-20 18:00:00', '2024-06-21 18:00:00', NULL, 'fa16158f-8a3b-4ea6-b578-ed3298c89b4b', 'jiangjn', '2024-06-06 14:48:22', 'jiangjn', '2024-06-06 14:48:22', 'ccce02c9-a3e3-4ba7-b750-0b485f9e4619', 1.00, NULL, 0);
INSERT INTO `pms_project_task` VALUES ('7d4aed36-fe4e-4f1d-be3a-de030de0c923', '460c907f-3130-4e44-848e-4f4b73d40c6d', 24, '统计分析', 7, 11, '0', NULL, '2024-06-14 18:00:00', '2024-06-17 18:00:00', NULL, 'fa16158f-8a3b-4ea6-b578-ed3298c89b4b', 'jiangjn', '2024-06-06 14:47:21', 'jiangjn', '2024-06-06 14:47:21', '8dbb1ce0-ec74-4834-a9c4-7612cfd22b46', 1.00, NULL, 0);
INSERT INTO `pms_project_task` VALUES ('7f99b26c-b24a-4536-afe1-1a9426514bcb', '5510a444-2789-4db1-9357-4f45c04a294e', 14, '11', 1, NULL, '0', NULL, '2024-05-30 18:00:00', '2024-05-31 18:00:00', NULL, 'ac9108c6-3daa-4e2b-a83f-b8d5bf92f823', 'admin', '2024-05-12 09:26:55', 'admin', '2024-05-12 09:26:55', '557b70dd-d88b-4b55-8785-6e12bd553563', 1.00, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('806f4a21-2e5f-4fd6-a1d5-1e5c5c26bef2', '088dbd65-daac-4885-9b36-e6ad75ed0964', 100, '计划', 1, 2, '1', NULL, '2024-05-01 00:00:00', '2024-05-13 00:00:00', '<p>121212</p><p><br></p><p><br></p><p><br></p>', NULL, 'admin', '2024-05-03 18:51:57', 'admin', '2024-05-03 18:51:57', NULL, 1.00, NULL, 82);
INSERT INTO `pms_project_task` VALUES ('8240c9f0-f369-46d3-96a7-309044a7820e', '385a77ec-934c-4176-b1bf-19e2e08920e6', 17, '修改角色', 1, 2, '0', NULL, '2025-07-03 17:00:00', '2025-07-14 17:00:00', NULL, '4e11d6ce-c8f0-4e6a-8e29-4ab3ae96e077', 'admin', '2024-04-16 13:59:05', 'admin', '2024-04-16 13:59:05', '4b79bd81-a148-4dc6-b20a-4304b41e157b', 7.00, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('834dcf52-e0b1-4e3b-8823-a82818eb6488', '385a77ec-934c-4176-b1bf-19e2e08920e6', 18, '系统管理', 1, NULL, '0', NULL, '2024-04-29 17:00:00', '2025-06-13 17:00:00', NULL, 'f459591d-b8dc-4cb2-80a6-d948e4bdaef1', 'admin', '2024-04-19 18:02:48', 'admin', '2024-04-19 18:02:48', NULL, 18.00, NULL, 55);
INSERT INTO `pms_project_task` VALUES ('85da914c-88f5-4ff5-88a1-b5ada6bdc714', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 2, '计划', 4, NULL, '1', NULL, '2024-05-20 00:00:00', '2024-05-21 00:00:00', NULL, '668bc26a-3804-44a2-b0d0-0bc5508de34a', 'rd1', '2024-05-24 14:53:14', 'rd1', '2024-05-24 14:53:14', NULL, 2.00, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('868a6dfd-8892-483b-8acd-643b52e87c31', 'fce10486-94e9-4215-9287-d34a31bd4edb', 4, '2.1', 1, NULL, '1', NULL, '2024-04-19 00:00:00', '2024-04-19 00:00:00', NULL, 'ff578ae2-8ddd-471e-bfde-6deb87700b2f', 'admin', '2024-04-19 11:01:25', 'admin', '2024-04-19 11:01:25', NULL, NULL, NULL, 55);
INSERT INTO `pms_project_task` VALUES ('86e2a74f-daf1-4414-b9c9-2e7c99696168', '460c907f-3130-4e44-848e-4f4b73d40c6d', 26, '关联分析', 7, 11, '0', NULL, '2024-06-18 18:00:00', '2024-06-19 18:00:00', NULL, 'fa16158f-8a3b-4ea6-b578-ed3298c89b4b', 'jiangjn', '2024-06-06 14:47:28', 'jiangjn', '2024-06-06 14:47:28', '5f35fb48-8b1e-415c-90f2-77a92f469782', 1.00, NULL, 0);
INSERT INTO `pms_project_task` VALUES ('89c4e3dc-478a-4e5b-ab66-7bc1d5d2ac12', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 47, '五味分布', 4, NULL, '0', NULL, '2024-05-31 18:00:00', '2024-06-03 11:00:00', NULL, '95ea2855-8b57-451c-b4d1-2ff537715840', 'rd1', '2024-05-24 16:40:58', 'rd1', '2024-05-24 16:40:58', '338fc888-1e1d-4620-a989-9a780f25fda0', 0.25, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('8dbb1ce0-ec74-4834-a9c4-7612cfd22b46', '460c907f-3130-4e44-848e-4f4b73d40c6d', 23, '生成表格', 7, 11, '0', NULL, '2024-06-14 08:00:00', '2024-06-14 18:00:00', NULL, 'fa16158f-8a3b-4ea6-b578-ed3298c89b4b', 'jiangjn', '2024-06-06 14:47:11', 'jiangjn', '2024-06-06 14:47:11', 'f50213ab-5053-4eae-91e9-998d93b3a80e', 1.00, NULL, 0);
INSERT INTO `pms_project_task` VALUES ('8e6113ad-d641-4a99-b940-d2f20d026b71', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 58, '接收课题医案', 4, NULL, '0', NULL, '2024-05-23 18:00:00', '2024-05-24 18:00:00', NULL, 'e66394bb-03e0-48a4-a117-52deb05f1031', 'rd1', '2024-05-24 22:52:02', 'rd1', '2024-05-24 22:52:02', 'cf83ac6c-e07c-45ee-b343-7da6e24a6153', 1.00, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('8fdef2c8-cded-4399-95db-5768b91f84c8', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 24, '五味分布数据修改', 4, NULL, '0', NULL, '2024-06-06 18:00:00', '2024-06-07 14:00:00', NULL, '5daff8f0-056c-4d02-8cc4-265d4cc4991d', 'rd1', '2024-05-24 14:59:59', 'rd1', '2024-05-24 14:59:59', '65855035-34b7-4cdd-a243-5474a6b787e7', 0.50, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('91975970-88af-4b19-84b2-1f7d107432bc', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 9, '存入课题', 4, NULL, '0', NULL, '2024-05-28 14:00:00', '2024-05-28 18:00:00', NULL, 'a801af81-8cfa-4172-82f6-22cd999f0551', 'rd1', '2024-05-24 14:56:39', 'rd1', '2024-05-24 14:56:39', 'e06783e2-afc3-45ff-877d-16f81a4a6c6a', 0.50, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('92d24c98-16c7-4858-a907-238b3a963763', '5510a444-2789-4db1-9357-4f45c04a294e', 4, '客户端', 1, NULL, '0', NULL, '2024-04-23 08:00:00', '2024-04-24 18:00:00', NULL, 'd8dabe8b-ee7d-4daa-b231-c8cb34b90426', 'admin', '2024-05-11 22:58:08', 'admin', '2024-05-11 22:58:08', NULL, 2.00, NULL, 97);
INSERT INTO `pms_project_task` VALUES ('95ea2855-8b57-451c-b4d1-2ff537715840', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 41, '快速度透视', 4, NULL, '0', NULL, '2024-05-30 18:00:00', '2024-06-05 11:00:00', NULL, '1e5764c6-d7d4-402d-a229-b76e092acc2a', 'rd1', '2024-05-24 16:40:21', 'rd1', '2024-05-24 16:40:21', NULL, 3.50, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('9834e51f-c20a-423c-99c9-9dc4181c244a', '9bd0bfdc-46a6-4550-abf3-a45f023b74a8', 6, '11', 1, 2, '1', NULL, '2024-04-18 00:00:00', '2024-04-18 00:00:00', NULL, '00c9ab74-4357-4fa4-9948-2a4379a57588', 'admin', '2024-04-18 13:52:40', 'admin', '2024-04-18 13:52:40', NULL, 1.00, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('984c4ae5-0a00-4831-b571-c18fcea4bd68', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 52, '病性病位分布数据修改', 4, NULL, '0', NULL, '2024-06-04 11:00:00', '2024-06-04 14:00:00', NULL, '95ea2855-8b57-451c-b4d1-2ff537715840', 'rd1', '2024-05-24 16:42:04', 'rd1', '2024-05-24 16:42:04', 'e15b0db5-de20-4c6d-bd2f-b38b136c9f67', 0.25, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('9b0f0cf1-be20-423a-b28f-0ab3cbe08497', '460c907f-3130-4e44-848e-4f4b73d40c6d', 11, '科研课题', 7, NULL, '0', NULL, '2024-06-14 08:00:00', '2024-06-21 18:00:00', NULL, '19f961af-f920-474e-adad-f3edc5dbba5a', 'jiangjn', '2024-06-06 11:54:13', 'jiangjn', '2024-06-06 11:54:13', NULL, 6.00, NULL, 0);
INSERT INTO `pms_project_task` VALUES ('9dd76598-1190-465b-b51b-5783b216ba1a', '460c907f-3130-4e44-848e-4f4b73d40c6d', 7, '经验医案', 7, NULL, '0', NULL, '2024-06-18 18:00:00', '2024-06-24 18:00:00', NULL, '19f961af-f920-474e-adad-f3edc5dbba5a', 'jiangjn', '2024-06-06 11:55:06', 'jiangjn', '2024-06-06 11:55:06', NULL, 4.00, NULL, 0);
INSERT INTO `pms_project_task` VALUES ('a1f8632e-5531-4631-b909-cc2aadd4a6e8', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 35, '筛选结果&筛选策略', 4, NULL, '0', NULL, '2024-05-23 14:00:00', '2024-05-24 14:00:00', NULL, '1e5764c6-d7d4-402d-a229-b76e092acc2a', 'rd1', '2024-05-24 16:38:48', 'rd1', '2024-05-24 16:38:48', 'e100f3fe-87af-46b2-a548-e36dbf9b3797', 1.00, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('a6a1762d-2c97-45e5-89a5-0d0810b00368', '5f7ca606-a33f-41d9-80fa-8a2b613a9471', 1, '1', 1, NULL, '1', NULL, '2024-04-30 00:00:00', '2024-04-30 00:00:00', NULL, NULL, 'admin', '2024-04-30 10:39:37', 'admin', '2024-04-30 10:39:37', NULL, NULL, NULL, 55);
INSERT INTO `pms_project_task` VALUES ('a7cfcb04-48de-4a37-a1bd-80ab886499d8', '5510a444-2789-4db1-9357-4f45c04a294e', 11, '用户管理', 1, NULL, '0', NULL, '2024-05-29 18:00:00', '2024-06-04 14:00:00', NULL, 'd8dabe8b-ee7d-4daa-b231-c8cb34b90426', 'admin', '2024-04-18 13:58:33', 'admin', '2024-04-18 13:58:33', NULL, 3.50, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('a801af81-8cfa-4172-82f6-22cd999f0551', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 5, '筛选医案', 4, NULL, '0', NULL, '2024-05-22 08:00:00', '2024-06-07 14:00:00', NULL, 'b775a5fe-8671-4f80-b01f-84e90385b665', 'rd1', '2024-05-24 14:55:47', 'rd1', '2024-05-24 14:55:47', NULL, 12.50, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('a82cc78e-7417-41e8-8aeb-8082f7634ce6', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 42, '中医诊断分布', 4, NULL, '0', NULL, '2024-05-30 18:00:00', '2024-05-31 11:00:00', NULL, '95ea2855-8b57-451c-b4d1-2ff537715840', 'rd1', '2024-05-24 16:40:29', 'rd1', '2024-05-24 16:40:29', '624c42ab-e37d-48e5-b21b-539a5f34d055', 0.25, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('ab568557-c228-4adc-876d-327aafc1d7d4', '385a77ec-934c-4176-b1bf-19e2e08920e6', 3, '菜单管理', 1, 1, '0', NULL, '2024-04-29 08:00:00', '2025-05-08 17:00:00', NULL, 'f459591d-b8dc-4cb2-80a6-d948e4bdaef1', 'admin', '2024-04-16 22:54:11', 'admin', '2024-04-16 22:54:11', NULL, 23.00, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('ab7f2e48-35f1-406a-a1ab-06cf540842bb', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 27, '医案列表', 4, NULL, '0', NULL, '2024-05-22 18:00:00', '2024-05-24 18:00:00', NULL, 'c7fc2739-8b5b-4436-827d-4c05655fc216', 'rd1', '2024-05-24 16:32:55', 'rd1', '2024-05-24 16:32:55', '0cc12189-9102-4b19-930c-1908275ecde7', 2.00, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('ac9108c6-3daa-4e2b-a83f-b8d5bf92f823', '5510a444-2789-4db1-9357-4f45c04a294e', 13, '后端', 1, NULL, '0', NULL, '2024-05-30 18:00:00', '2024-06-04 14:00:00', NULL, 'a7cfcb04-48de-4a37-a1bd-80ab886499d8', 'admin', '2024-04-18 13:37:27', 'admin', '2024-04-18 13:37:27', NULL, 2.50, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('ad45841f-a5b5-40aa-aae4-f28eddee780a', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 28, '医案详情&对比', 4, NULL, '0', NULL, '2024-05-24 18:00:00', '2024-05-28 18:00:00', NULL, 'c7fc2739-8b5b-4436-827d-4c05655fc216', 'rd1', '2024-05-24 16:33:13', 'rd1', '2024-05-24 16:33:13', 'ab7f2e48-35f1-406a-a1ab-06cf540842bb', 2.00, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('afead2f4-9875-4125-9da4-4e5798e90b4e', '385a77ec-934c-4176-b1bf-19e2e08920e6', 22, '测试', 4, 5, '0', NULL, '2025-06-13 17:00:00', '2025-06-18 17:00:00', NULL, 'f459591d-b8dc-4cb2-80a6-d948e4bdaef1', 'rd1', '2024-05-28 10:54:22', 'rd1', '2024-05-28 10:54:22', '834dcf52-e0b1-4e3b-8823-a82818eb6488', 3.00, NULL, 0);
INSERT INTO `pms_project_task` VALUES ('b0f0058e-69b5-4c49-b442-3682d1d154f4', '9bd0bfdc-46a6-4550-abf3-a45f023b74a8', 8, '00', 1, NULL, '1', NULL, '2024-04-18 00:00:00', '2024-04-18 00:00:00', NULL, '00c9ab74-4357-4fa4-9948-2a4379a57588', 'admin', '2024-04-18 13:54:01', 'admin', '2024-04-18 13:54:01', NULL, 1.00, NULL, 55);
INSERT INTO `pms_project_task` VALUES ('b229633a-aa83-4219-8123-ba1439a722a9', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 38, '筛选策略管理', 4, NULL, '0', NULL, '2024-05-29 14:00:00', '2024-05-29 18:00:00', NULL, '1e5764c6-d7d4-402d-a229-b76e092acc2a', 'rd1', '2024-05-24 16:39:09', 'rd1', '2024-05-24 16:39:09', '13e37820-565c-4ada-b99a-e7a756b79454', 0.50, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('b22af257-6381-4e68-9d02-7c0227f47ac4', '9bd0bfdc-46a6-4550-abf3-a45f023b74a8', 10, '333', 1, NULL, '1', NULL, '2024-04-18 00:00:00', '2024-04-18 00:00:00', NULL, '00c9ab74-4357-4fa4-9948-2a4379a57588', 'admin', '2024-04-18 13:46:54', 'admin', '2024-04-18 13:46:54', NULL, 1.00, NULL, 55);
INSERT INTO `pms_project_task` VALUES ('b504276a-98e7-4080-bc87-f86b83d7afde', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 21, '中药处方分布数据修改', 4, NULL, '0', NULL, '2024-06-05 14:00:00', '2024-06-05 18:00:00', NULL, '5daff8f0-056c-4d02-8cc4-265d4cc4991d', 'rd1', '2024-05-24 14:59:48', 'rd1', '2024-05-24 14:59:48', 'df84c854-9d93-4de4-9441-aac1ecaae6be', 0.50, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('b6303df5-e73e-489e-a5c5-b3e48deb1976', '9bd0bfdc-46a6-4550-abf3-a45f023b74a8', 9, '32', 1, NULL, '1', NULL, '2024-04-18 00:00:00', '2024-04-18 00:00:00', NULL, 'b22af257-6381-4e68-9d02-7c0227f47ac4', 'admin', '2024-04-18 13:52:30', 'admin', '2024-04-18 13:52:30', NULL, 1.00, NULL, 55);
INSERT INTO `pms_project_task` VALUES ('b775a5fe-8671-4f80-b01f-84e90385b665', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 4, '临床科研', 4, NULL, '0', NULL, '2024-05-22 08:00:00', '2024-06-07 14:00:00', NULL, '49f155e5-9fbe-4ec7-9d7e-107983deec79', 'rd1', '2024-05-24 14:55:31', 'rd1', '2024-05-24 14:55:31', NULL, 18.50, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('b80ffed5-9577-487e-b610-efe9badb0b3d', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 31, '数据库设计', 4, NULL, '0', NULL, '2024-05-22 08:00:00', '2024-05-22 18:00:00', NULL, '432d9559-a129-4bf6-9a58-6199d8934274', 'rd1', '2024-05-24 16:37:29', 'rd1', '2024-05-24 16:37:29', '85da914c-88f5-4ff5-88a1-b5ada6bdc714', 1.00, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('b8f2e9bc-2f07-4c40-8880-9e165563e990', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 39, '存入课题', 4, NULL, '0', NULL, '2024-05-29 18:00:00', '2024-05-30 14:00:00', NULL, '1e5764c6-d7d4-402d-a229-b76e092acc2a', 'rd1', '2024-05-24 16:39:32', 'rd1', '2024-05-24 16:39:32', 'b229633a-aa83-4219-8123-ba1439a722a9', 0.50, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('be9d5bb2-5986-4e99-a568-016eb55d5d97', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 63, 'JavaScript处理数据', 4, NULL, '0', NULL, '2024-05-31 18:00:00', '2024-06-03 18:00:00', NULL, 'e66394bb-03e0-48a4-a117-52deb05f1031', 'rd1', '2024-05-24 16:43:35', 'rd1', '2024-05-24 16:43:35', 'd84e750b-0cca-41de-aa3d-397c39b86dbb', 1.00, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('c04d7115-3cdf-4acf-a4bc-73e9c0866c65', '385a77ec-934c-4176-b1bf-19e2e08920e6', 14, '增加角色', 1, 2, '0', NULL, '2025-06-12 17:00:00', '2025-07-01 17:00:00', NULL, '4e11d6ce-c8f0-4e6a-8e29-4ab3ae96e077', 'admin', '2024-04-16 13:58:22', 'admin', '2024-04-16 13:58:22', '036fa3c2-5e58-46e5-a6ec-69cdf3abe174', 13.00, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('c4fbc182-9d8c-482f-ad0f-eb48c981049f', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 53, '四性分布数据修改', 4, NULL, '0', NULL, '2024-06-04 14:00:00', '2024-06-04 16:00:00', NULL, '95ea2855-8b57-451c-b4d1-2ff537715840', 'rd1', '2024-05-24 16:41:50', 'rd1', '2024-05-24 16:41:50', '984c4ae5-0a00-4831-b571-c18fcea4bd68', 0.25, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('c6a4e852-f794-4df1-977b-1800ef70bb33', '5ebcbbed-68cb-47f6-b57b-397c86835769', 3, '研发', 4, NULL, '0', NULL, '2024-05-28 18:00:00', '2024-06-07 18:00:00', NULL, NULL, 'rd1', '2024-05-27 15:53:11', 'rd1', '2024-05-27 15:53:11', '39431a72-a4a6-46a3-ae98-6ccf74e43ad4', 8.00, NULL, 0);
INSERT INTO `pms_project_task` VALUES ('c7fc2739-8b5b-4436-827d-4c05655fc216', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 25, '科研课题', 4, NULL, '0', NULL, '2024-05-22 08:00:00', '2024-05-29 18:00:00', NULL, 'b775a5fe-8671-4f80-b01f-84e90385b665', 'rd1', '2024-05-24 14:55:59', 'rd1', '2024-05-24 14:55:59', NULL, 6.00, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('c86a4cb8-a8f9-4edf-bde6-a63bd56a0200', '460c907f-3130-4e44-848e-4f4b73d40c6d', 9, '某诊干预措施转化后覆盖这诊之前数据', 7, 8, '0', NULL, '2024-06-20 14:00:00', '2024-06-21 18:00:00', '<p><br></p>', '9dd76598-1190-465b-b51b-5783b216ba1a', 'jiangjn', '2024-06-06 14:42:59', 'jiangjn', '2024-06-06 14:42:59', '2b762f37-60a9-446a-b323-09e7f1893572', 1.50, NULL, 0);
INSERT INTO `pms_project_task` VALUES ('c8730496-f10a-4743-bdbb-b9cc9ea7a95a', '945ce344-18b7-4768-b8ec-b9cef51eab5b', 1000000, '11', 4, 2, '0', NULL, '3899-02-02 18:00:00', '3899-02-03 18:00:00', NULL, NULL, 'rd1', '2024-06-07 15:00:15', 'rd1', '2024-06-07 15:00:15', NULL, 1.00, NULL, 0);
INSERT INTO `pms_project_task` VALUES ('ccce02c9-a3e3-4ba7-b750-0b485f9e4619', '460c907f-3130-4e44-848e-4f4b73d40c6d', 27, '聚类分析', 7, 11, '0', NULL, '2024-06-19 18:00:00', '2024-06-20 18:00:00', NULL, 'fa16158f-8a3b-4ea6-b578-ed3298c89b4b', 'jiangjn', '2024-06-06 14:47:45', 'jiangjn', '2024-06-06 14:47:45', '86e2a74f-daf1-4414-b9c9-2e7c99696168', 1.00, NULL, 0);
INSERT INTO `pms_project_task` VALUES ('cf83ac6c-e07c-45ee-b343-7da6e24a6153', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 57, '科研课题列表', 4, NULL, '0', NULL, '2024-05-22 18:00:00', '2024-05-23 18:00:00', NULL, 'e66394bb-03e0-48a4-a117-52deb05f1031', 'rd1', '2024-05-24 16:43:06', 'rd1', '2024-05-24 16:43:06', 'b80ffed5-9577-487e-b610-efe9badb0b3d', 1.00, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('cfae3de0-fa01-40ff-8166-2344442dc12c', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 71, '清洗原生医案数据到新表', 4, NULL, '0', NULL, '2024-05-28 18:00:00', '2024-05-29 18:00:00', NULL, '5a8824be-1c1d-4a88-93e3-19be0c7f8473', 'rd1', '2024-05-24 16:45:51', 'rd1', '2024-05-24 16:45:51', '2f8460aa-6089-4e44-a3a0-17d45c64f9e4', 1.00, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('cfda87d9-a699-46a8-adde-6c94eeb80cab', '460c907f-3130-4e44-848e-4f4b73d40c6d', 33, '测试', 7, NULL, '0', NULL, '2024-06-24 18:00:00', '2024-07-08 18:00:00', NULL, '5d01090c-65ff-4416-8570-0130516bee77', 'jiangjn', '2024-06-06 11:57:24', 'jiangjn', '2024-06-06 11:57:24', NULL, 10.00, NULL, 0);
INSERT INTO `pms_project_task` VALUES ('cfeb29c0-55d3-47f6-a216-c56f4e10b23b', '5510a444-2789-4db1-9357-4f45c04a294e', 9, 'RRRR', 1, NULL, '0', NULL, '2024-09-09 18:00:00', '2024-09-10 18:00:00', NULL, 'cfeb29c0-55d3-47f6-a216-c56f4e10b23b', 'admin', '2024-05-12 09:30:37', 'admin', '2024-05-12 09:30:37', NULL, 1.00, NULL, 0);
INSERT INTO `pms_project_task` VALUES ('d06fdb47-7a13-4750-b48f-a14042bd60ea', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 60, '动态行转列处理', 4, NULL, '0', NULL, '2024-05-27 18:00:00', '2024-05-29 18:00:00', NULL, 'e66394bb-03e0-48a4-a117-52deb05f1031', 'rd1', '2024-05-24 16:43:57', 'rd1', '2024-05-24 16:43:57', '6a84c474-d8f0-4f9d-b2f7-752d1e2d4698', 2.00, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('d14abda2-b85c-4a4e-8c78-81b852009baa', '460c907f-3130-4e44-848e-4f4b73d40c6d', 34, '第一轮测试', 7, NULL, '0', NULL, '2024-06-27 18:00:00', '2024-07-08 18:00:00', NULL, 'cfda87d9-a699-46a8-adde-6c94eeb80cab', 'jiangjn', '2024-06-06 11:57:36', 'jiangjn', '2024-06-06 11:57:36', 'df887e15-747c-4df6-bd76-f59f00717b16', 7.00, NULL, 0);
INSERT INTO `pms_project_task` VALUES ('d502f0cf-c12c-49ef-902d-9e8bc1d7bd7f', '5510a444-2789-4db1-9357-4f45c04a294e', 7, '前端', 1, NULL, '0', NULL, '2024-04-24 18:00:00', '2024-05-29 18:00:00', NULL, 'd8dabe8b-ee7d-4daa-b231-c8cb34b90426', 'admin', '2024-04-18 13:34:57', 'admin', '2024-04-18 13:34:57', NULL, 20.00, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('d5784f92-54b3-44e0-9c99-61dcda486a2a', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 55, '疗效分布数据修改', 4, NULL, '0', NULL, '2024-06-04 18:00:00', '2024-06-05 11:00:00', NULL, '95ea2855-8b57-451c-b4d1-2ff537715840', 'rd1', '2024-05-24 16:42:12', 'rd1', '2024-05-24 16:42:12', 'df681563-45ea-4b42-8670-05fc69dd7522', 0.25, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('d62cd6fd-0375-4814-927d-88f6ae8e2bd8', '9bd0bfdc-46a6-4550-abf3-a45f023b74a8', 2, '11', 1, NULL, '1', NULL, '2024-04-18 00:00:00', '2024-04-18 00:00:00', NULL, '114166bd-4a24-45db-98af-e367a6478e97', 'admin', '2024-04-18 13:45:05', 'admin', '2024-04-18 13:45:05', NULL, 1.00, NULL, 55);
INSERT INTO `pms_project_task` VALUES ('d84e750b-0cca-41de-aa3d-397c39b86dbb', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 62, 'Api处理数据', 4, NULL, '0', NULL, '2024-05-30 18:00:00', '2024-05-31 18:00:00', NULL, 'e66394bb-03e0-48a4-a117-52deb05f1031', 'rd1', '2024-05-24 16:43:50', 'rd1', '2024-05-24 16:43:50', 'e7e03f1b-75e3-4a7b-a65e-69251d7d6b43', 1.00, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('d8dabe8b-ee7d-4daa-b231-c8cb34b90426', '5510a444-2789-4db1-9357-4f45c04a294e', 3, '研发', 1, NULL, '0', NULL, '2024-04-23 08:00:00', '2024-06-04 14:00:00', NULL, '15d0a088-247f-425d-a5fd-50d8c1c870cd', 'admin', '2024-04-18 13:34:11', 'admin', '2024-04-18 13:34:11', NULL, 25.50, NULL, 99);
INSERT INTO `pms_project_task` VALUES ('dc23cfc2-4138-4fa5-aecc-029cf756fb72', '385a77ec-934c-4176-b1bf-19e2e08920e6', 11, '删除用户', 1, 2, '0', NULL, '2025-06-10 17:00:00', '2025-06-11 17:00:00', '删除用户', '760bd3a9-14f6-4be0-b19b-69302094b7ad', 'admin', '2024-04-16 11:07:13', 'admin', '2024-04-16 11:07:13', '2aaa4e94-b5b6-4439-8286-df7a41d17661', 1.00, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('dcb98d19-bb00-4a6f-b25d-d9307fc19b9b', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 36, '经验医案筛选，存入缓存', 4, NULL, '0', NULL, '2024-05-24 14:00:00', '2024-05-27 18:00:00', NULL, '1e5764c6-d7d4-402d-a229-b76e092acc2a', 'rd1', '2024-05-24 16:39:03', 'rd1', '2024-05-24 16:39:03', 'a1f8632e-5531-4631-b909-cc2aadd4a6e8', 1.50, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('dec93e12-f421-4232-9b92-3126a1033fa6', '460c907f-3130-4e44-848e-4f4b73d40c6d', 19, '原生医案', 7, NULL, '0', NULL, '2024-06-14 08:00:00', '2024-06-17 18:00:00', NULL, '2a2b9a3d-6a32-4e41-b07c-91c8f4e7f808', 'jiangjn', '2024-06-06 11:54:53', 'jiangjn', '2024-06-06 11:54:53', NULL, 2.00, NULL, 0);
INSERT INTO `pms_project_task` VALUES ('df681563-45ea-4b42-8670-05fc69dd7522', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 54, '五味分布数据修改', 4, NULL, '0', NULL, '2024-06-04 16:00:00', '2024-06-04 18:00:00', NULL, '95ea2855-8b57-451c-b4d1-2ff537715840', 'rd1', '2024-05-24 16:41:56', 'rd1', '2024-05-24 16:41:56', 'c4fbc182-9d8c-482f-ad0f-eb48c981049f', 0.25, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('df84c854-9d93-4de4-9441-aac1ecaae6be', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 20, '中医辨证分布数据修改', 4, NULL, '0', NULL, '2024-06-04 18:00:00', '2024-06-05 14:00:00', NULL, '5daff8f0-056c-4d02-8cc4-265d4cc4991d', 'rd1', '2024-05-24 14:59:41', 'rd1', '2024-05-24 14:59:41', 'e1212840-edd1-493a-974d-7722c737d473', 0.50, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('df887e15-747c-4df6-bd76-f59f00717b16', '460c907f-3130-4e44-848e-4f4b73d40c6d', 33, '提测', 7, NULL, '0', NULL, '2024-06-24 18:00:00', '2024-06-27 18:00:00', NULL, 'cfda87d9-a699-46a8-adde-6c94eeb80cab', 'jiangjn', '2024-06-06 11:57:31', 'jiangjn', '2024-06-06 11:57:31', '19f961af-f920-474e-adad-f3edc5dbba5a', 3.00, NULL, 0);
INSERT INTO `pms_project_task` VALUES ('e00373d7-f179-438f-9cc6-98db1b2444a6', '460c907f-3130-4e44-848e-4f4b73d40c6d', 10, '列表页查询范围加入作者和编辑', 7, 8, '0', NULL, '2024-06-21 18:00:00', '2024-06-24 18:00:00', NULL, '9dd76598-1190-465b-b51b-5783b216ba1a', 'jiangjn', '2024-06-06 14:43:07', 'jiangjn', '2024-06-06 14:43:07', 'c86a4cb8-a8f9-4edf-bde6-a63bd56a0200', 1.00, NULL, 0);
INSERT INTO `pms_project_task` VALUES ('e0389fcf-4eb2-4e16-9d13-32c22dabe3b2', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 68, '清洗经验医案数据到新表', 4, NULL, '0', NULL, '2024-05-24 18:00:00', '2024-05-27 18:00:00', NULL, '1f553a03-6d61-4dc8-bc0d-81ceb0cb06ba', 'rd1', '2024-05-24 16:47:04', 'rd1', '2024-05-24 16:47:04', '4b937d76-b77d-4f5d-b9ae-e134816dade0', 1.00, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('e06783e2-afc3-45ff-877d-16f81a4a6c6a', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 8, '筛选结果', 4, NULL, '0', NULL, '2024-05-24 18:00:00', '2024-05-28 14:00:00', NULL, 'a801af81-8cfa-4172-82f6-22cd999f0551', 'rd1', '2024-05-24 14:56:18', 'rd1', '2024-05-24 14:56:18', '5007a52f-442d-4d06-b81d-f99bac9a4560', 1.50, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('e100f3fe-87af-46b2-a548-e36dbf9b3797', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 34, '新建&修改筛选策略', 4, NULL, '0', NULL, '2024-05-22 18:00:00', '2024-05-23 14:00:00', NULL, '1e5764c6-d7d4-402d-a229-b76e092acc2a', 'rd1', '2024-05-24 16:38:40', 'rd1', '2024-05-24 16:38:40', 'b80ffed5-9577-487e-b610-efe9badb0b3d', 0.50, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('e1212840-edd1-493a-974d-7722c737d473', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 19, '中医诊断分布数据修改', 4, NULL, '0', NULL, '2024-06-04 14:00:00', '2024-06-04 18:00:00', NULL, '5daff8f0-056c-4d02-8cc4-265d4cc4991d', 'rd1', '2024-05-24 14:59:33', 'rd1', '2024-05-24 14:59:33', '50dde894-7b7d-44f9-9381-c59cb6a522f6', 0.50, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('e15b0db5-de20-4c6d-bd2f-b38b136c9f67', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 51, '中药处方分布数据修改', 4, NULL, '0', NULL, '2024-06-03 18:00:00', '2024-06-04 11:00:00', NULL, '95ea2855-8b57-451c-b4d1-2ff537715840', 'rd1', '2024-05-24 16:41:43', 'rd1', '2024-05-24 16:41:43', '4158bd74-fe04-4bee-990f-85cc37e2b8d2', 0.25, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('e1d643a5-8dfe-452a-a082-f0eb70ee6657', '385a77ec-934c-4176-b1bf-19e2e08920e6', 20, '修改系统', 1, 2, '0', NULL, '2024-04-29 17:00:00', '2024-05-23 17:00:00', NULL, '834dcf52-e0b1-4e3b-8823-a82818eb6488', 'admin', '2024-04-19 18:03:26', 'admin', '2024-04-19 18:03:26', '15ac5d49-cba7-4308-b747-b1cc78c69473', 15.00, NULL, 55);
INSERT INTO `pms_project_task` VALUES ('e43f3945-c5de-4769-a476-d4d85fcf70d1', '5510a444-2789-4db1-9357-4f45c04a294e', 2, '计划', 1, 2, '1', NULL, '2024-04-19 00:00:00', '2024-04-22 00:00:00', '<p><span class=\"ql-size-huge\">dsfsdfadsfasdfasdf</span></p><p><span class=\"ql-size-huge\">﻿</span><img src=\"/dev-api/profile/upload/2024/05/09/2_20240509211302A001.png\" width=\"793\"></p><p><br></p><p><br></p>', '15d0a088-247f-425d-a5fd-50d8c1c870cd', 'admin', '2024-04-18 14:19:50', 'admin', '2024-04-18 14:19:50', NULL, 2.00, NULL, 90);
INSERT INTO `pms_project_task` VALUES ('e4699954-5499-4c38-9a32-6c17331afb30', '5510a444-2789-4db1-9357-4f45c04a294e', 8, 'R1', 1, NULL, '0', NULL, '2024-09-05 18:00:00', '2024-09-06 18:00:00', NULL, 'cfeb29c0-55d3-47f6-a216-c56f4e10b23b', 'admin', '2024-05-12 09:30:50', 'admin', '2024-05-12 09:30:50', NULL, 1.00, NULL, 0);
INSERT INTO `pms_project_task` VALUES ('e522073b-b257-42db-99bc-4416f52893cf', '5510a444-2789-4db1-9357-4f45c04a294e', 8, '2', 1, NULL, '0', NULL, '2024-09-06 18:00:00', '2024-09-09 18:00:00', NULL, 'eccecd34-e26d-43ed-be72-e54a7370620f', 'admin', '2024-05-11 22:59:18', 'admin', '2024-05-11 22:59:18', NULL, 1.00, NULL, 0);
INSERT INTO `pms_project_task` VALUES ('e6057db7-a868-4120-b3b6-6d8c6d6f5b88', '460c907f-3130-4e44-848e-4f4b73d40c6d', 30, '模型匹配只拿中医诊断前五名显示', 7, 7, '0', NULL, '2024-06-14 08:00:00', '2024-06-14 18:00:00', NULL, 'f157a6f1-bb9c-4bb3-a0f0-cc2efe10b38d', 'jiangjn', '2024-06-06 14:44:12', 'jiangjn', '2024-06-06 14:44:12', 'f50213ab-5053-4eae-91e9-998d93b3a80e', 1.00, NULL, 0);
INSERT INTO `pms_project_task` VALUES ('e66394bb-03e0-48a4-a117-52deb05f1031', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 56, '科研课题', 4, NULL, '0', NULL, '2024-05-22 18:00:00', '2024-06-04 18:00:00', NULL, '27238f7d-bed1-4a15-8edd-6e607fd4fbe9', 'rd1', '2024-05-24 16:38:30', 'rd1', '2024-05-24 16:38:30', NULL, 9.00, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('e7e03f1b-75e3-4a7b-a65e-69251d7d6b43', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 61, '编辑医案详情&新增统计域', 4, NULL, '0', NULL, '2024-05-29 18:00:00', '2024-05-30 18:00:00', NULL, 'e66394bb-03e0-48a4-a117-52deb05f1031', 'rd1', '2024-05-24 16:43:27', 'rd1', '2024-05-24 16:43:27', 'd06fdb47-7a13-4750-b48f-a14042bd60ea', 1.00, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('e7ef9909-9bad-4646-adea-0ab21536fab6', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 22, '病性病位分布数据修改', 4, NULL, '0', NULL, '2024-06-05 18:00:00', '2024-06-06 14:00:00', NULL, '5daff8f0-056c-4d02-8cc4-265d4cc4991d', 'rd1', '2024-05-24 15:00:17', 'rd1', '2024-05-24 15:00:17', 'b504276a-98e7-4080-bc87-f86b83d7afde', 0.50, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('e8655d17-e76d-43be-84fd-adf788b3d929', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 17, '五味分布', 4, NULL, '0', NULL, '2024-06-03 14:00:00', '2024-06-03 18:00:00', NULL, '5daff8f0-056c-4d02-8cc4-265d4cc4991d', 'rd1', '2024-05-24 14:58:47', 'rd1', '2024-05-24 14:58:47', '5f5fb4eb-4e2a-48e2-8b81-97d76af4c7e4', 0.50, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('e8711a5d-c82b-4d6c-8c43-117dfd23ca76', '460c907f-3130-4e44-848e-4f4b73d40c6d', 16, '统计分析', 7, 6, '0', NULL, '2024-06-20 18:00:00', '2024-06-21 18:00:00', NULL, '9b0f0cf1-be20-423a-b28f-0ab3cbe08497', 'jiangjn', '2024-06-06 14:46:12', 'jiangjn', '2024-06-06 14:46:12', '2f92ee29-3f70-42ab-8195-0e4a6b4d844d', 1.00, NULL, 0);
INSERT INTO `pms_project_task` VALUES ('eb17d29d-faa6-4fca-93c2-b121d304d375', '5ebcbbed-68cb-47f6-b57b-397c86835769', 5, '测试', 4, NULL, '0', NULL, '2024-06-07 18:00:00', '2024-06-11 18:00:00', NULL, NULL, 'rd1', '2024-05-27 15:53:15', 'rd1', '2024-05-27 15:53:15', 'c6a4e852-f794-4df1-977b-1800ef70bb33', 2.00, NULL, 0);
INSERT INTO `pms_project_task` VALUES ('eccecd34-e26d-43ed-be72-e54a7370620f', '5510a444-2789-4db1-9357-4f45c04a294e', 12, 'TTT', 1, NULL, '0', NULL, '2024-09-20 14:00:00', '2024-09-25 14:00:00', NULL, 'eccecd34-e26d-43ed-be72-e54a7370620f', 'admin', '2024-05-11 22:59:39', 'admin', '2024-05-11 22:59:39', NULL, 3.00, NULL, 0);
INSERT INTO `pms_project_task` VALUES ('eeeb490f-fa6a-40b0-bb37-9c62821c4614', '5ebcbbed-68cb-47f6-b57b-397c86835769', 2, '制作', 4, NULL, '0', NULL, '2024-05-28 08:00:00', '2024-05-28 18:00:00', NULL, '104b6c11-2282-464e-bb69-c3ab94f96eeb', 'rd1', '2024-05-27 16:21:59', 'rd1', '2024-05-27 16:21:59', '39431a72-a4a6-46a3-ae98-6ccf74e43ad4', 1.00, NULL, 0);
INSERT INTO `pms_project_task` VALUES ('effe04cf-52d0-4f34-8996-aad02d6aaa03', '385a77ec-934c-4176-b1bf-19e2e08920e6', 22, '系统列表', 1, 2, '0', NULL, '2024-04-29 17:00:00', '2024-04-30 17:00:00', NULL, '834dcf52-e0b1-4e3b-8823-a82818eb6488', 'admin', '2024-04-19 18:03:09', 'admin', '2024-04-19 18:03:09', '15ac5d49-cba7-4308-b747-b1cc78c69473', 1.00, NULL, 55);
INSERT INTO `pms_project_task` VALUES ('f00f61d4-e770-4fed-9e40-240ffcf9e02b', '5510a444-2789-4db1-9357-4f45c04a294e', 10, 'R2', 1, NULL, '0', NULL, '2024-09-12 18:00:00', '2024-09-13 18:00:00', NULL, 'cfeb29c0-55d3-47f6-a216-c56f4e10b23b', 'admin', '2024-05-12 09:31:02', 'admin', '2024-05-12 09:31:02', NULL, 1.00, NULL, 0);
INSERT INTO `pms_project_task` VALUES ('f0d0266c-5ccd-4516-8f36-95e8e6721ea0', '460c907f-3130-4e44-848e-4f4b73d40c6d', 6, '疗程视图连按详细', 7, 8, '0', NULL, '2024-06-17 14:00:00', '2024-06-18 18:00:00', NULL, '2ddd89d6-c752-4afb-ad6c-be687dccf88e', 'jiangjn', '2024-06-06 14:52:48', 'jiangjn', '2024-06-06 14:52:48', '484c76e3-b388-4370-8e2d-807762de8cc5', 1.50, NULL, 0);
INSERT INTO `pms_project_task` VALUES ('f157a6f1-bb9c-4bb3-a0f0-cc2efe10b38d', '460c907f-3130-4e44-848e-4f4b73d40c6d', 29, 'CDS', 7, NULL, '0', NULL, '2024-06-14 08:00:00', '2024-06-14 18:00:00', NULL, '2a2b9a3d-6a32-4e41-b07c-91c8f4e7f808', 'jiangjn', '2024-06-06 14:44:04', 'jiangjn', '2024-06-06 14:44:04', NULL, 1.00, NULL, 0);
INSERT INTO `pms_project_task` VALUES ('f1fbd55e-6573-41a8-b744-766f53dc2f91', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 49, '中医诊断分布数据修改', 4, NULL, '0', NULL, '2024-06-03 14:00:00', '2024-06-03 16:00:00', NULL, '95ea2855-8b57-451c-b4d1-2ff537715840', 'rd1', '2024-05-24 16:41:28', 'rd1', '2024-05-24 16:41:28', '213ab4df-9104-47d4-948b-16568048f063', 0.25, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('f29b048a-c596-41c5-b406-929aa854f51a', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 12, '中医诊断分布', 4, NULL, '0', NULL, '2024-05-29 18:00:00', '2024-05-30 14:00:00', NULL, '5daff8f0-056c-4d02-8cc4-265d4cc4991d', 'rd1', '2024-05-24 14:58:12', 'rd1', '2024-05-24 14:58:12', '6090a022-2126-4b0b-8324-dc0617baf72d', 0.50, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('f459591d-b8dc-4cb2-80a6-d948e4bdaef1', '385a77ec-934c-4176-b1bf-19e2e08920e6', 1, '信息系统', 1, NULL, '0', NULL, '2024-04-19 00:00:00', '2025-06-13 17:00:00', NULL, NULL, 'admin', '2024-04-30 20:25:12', 'admin', '2024-04-30 20:25:12', NULL, 83.00, NULL, 86);
INSERT INTO `pms_project_task` VALUES ('f50213ab-5053-4eae-91e9-998d93b3a80e', '460c907f-3130-4e44-848e-4f4b73d40c6d', 1, '计划', 7, 7, '1', NULL, '2024-06-12 00:00:00', '2024-06-13 00:00:00', NULL, '5d01090c-65ff-4416-8570-0130516bee77', 'jiangjn', '2024-06-06 11:45:23', 'jiangjn', '2024-06-06 11:45:23', NULL, 2.00, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('f94e826b-4a23-4f68-8b29-dd7d6084fb6a', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 72, '归档逻辑调整-保存新增表', 4, NULL, '0', NULL, '2024-05-29 18:00:00', '2024-05-30 18:00:00', NULL, '5a8824be-1c1d-4a88-93e3-19be0c7f8473', 'rd1', '2024-05-24 16:45:37', 'rd1', '2024-05-24 16:45:37', 'cfae3de0-fa01-40ff-8166-2344442dc12c', 1.00, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('fa16158f-8a3b-4ea6-b578-ed3298c89b4b', '460c907f-3130-4e44-848e-4f4b73d40c6d', 22, '科研课题', 7, NULL, '0', NULL, '2024-06-14 08:00:00', '2024-06-21 18:00:00', NULL, '2a2b9a3d-6a32-4e41-b07c-91c8f4e7f808', 'jiangjn', '2024-06-06 11:54:59', 'jiangjn', '2024-06-06 11:54:59', NULL, 6.00, NULL, 0);
INSERT INTO `pms_project_task` VALUES ('fc2bf29e-b50c-425a-a3fa-c735956f992e', '5510a444-2789-4db1-9357-4f45c04a294e', 9, '1', 1, NULL, '0', NULL, '2024-09-10 18:00:00', '2024-09-11 18:00:00', NULL, 'eccecd34-e26d-43ed-be72-e54a7370620f', 'admin', '2024-05-11 22:59:14', 'admin', '2024-05-11 22:59:14', NULL, 1.00, NULL, 0);
INSERT INTO `pms_project_task` VALUES ('fd2fe656-7511-481a-ae69-d723160ca34b', '89d1e170-ca60-45d4-bc17-b3c3f0577917', 64, 'JavaBean处理数据', 4, NULL, '0', NULL, '2024-06-03 18:00:00', '2024-06-04 18:00:00', NULL, 'e66394bb-03e0-48a4-a117-52deb05f1031', 'rd1', '2024-05-24 16:43:42', 'rd1', '2024-05-24 16:43:42', 'be9d5bb2-5986-4e99-a568-016eb55d5d97', 1.00, NULL, 100);
INSERT INTO `pms_project_task` VALUES ('fd81b9d0-96b3-4665-97dd-d03b8a2727ea', '460c907f-3130-4e44-848e-4f4b73d40c6d', 32, '采集舌象', 7, 7, '0', NULL, '2024-06-14 18:00:00', '2024-06-17 18:00:00', NULL, '5390ed47-e884-4e6a-b9e1-268fd8eaa408', 'jiangjn', '2024-06-06 11:57:08', 'jiangjn', '2024-06-06 11:57:08', 'e6057db7-a868-4120-b3b6-6d8c6d6f5b88', 1.00, NULL, 0);
INSERT INTO `pms_project_task` VALUES ('ff578ae2-8ddd-471e-bfde-6deb87700b2f', 'fce10486-94e9-4215-9287-d34a31bd4edb', 1, '1', 1, NULL, '1', NULL, '2024-04-19 00:00:00', '2024-04-19 00:00:00', NULL, NULL, 'admin', '2024-04-19 11:01:17', 'admin', '2024-04-19 11:01:17', NULL, NULL, NULL, 55);

-- ----------------------------
-- Table structure for pms_project_task_collaborator
-- ----------------------------
DROP TABLE IF EXISTS `pms_project_task_collaborator`;
CREATE TABLE `pms_project_task_collaborator`  (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `task_id` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '项目ID',
  `user_id` bigint(20) NOT NULL COMMENT '创建者ID',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '协作人' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_project_task_collaborator
-- ----------------------------
INSERT INTO `pms_project_task_collaborator` VALUES ('0c08182d-0124-4033-9333-b8f09fc82ef2', 'e43f3945-c5de-4769-a476-d4d85fcf70d1', 1, 'ry', '2024-05-11 10:51:57', 'ry', '2024-05-11 10:51:57');
INSERT INTO `pms_project_task_collaborator` VALUES ('19a6aec6-d494-4dd4-a827-0660889c3367', 'e43f3945-c5de-4769-a476-d4d85fcf70d1', 2, 'ry', '2024-05-11 10:51:57', 'ry', '2024-05-11 10:51:57');
INSERT INTO `pms_project_task_collaborator` VALUES ('208698e9-c2ec-4a67-a445-dcabeea82772', '12f76643-e3d5-4895-be46-5ec9f43120ab', 2, 'admin', '2024-05-08 11:10:08', 'admin', '2024-05-08 11:10:08');
INSERT INTO `pms_project_task_collaborator` VALUES ('8abb3df9-d700-4aef-aa53-4cd5318e1f4c', '12f76643-e3d5-4895-be46-5ec9f43120ab', 1, 'admin', '2024-05-08 11:10:08', 'admin', '2024-05-08 11:10:08');
INSERT INTO `pms_project_task_collaborator` VALUES ('90a1ec93-79d7-4139-8351-fe51a14861cc', '806f4a21-2e5f-4fd6-a1d5-1e5c5c26bef2', 1, 'admin', '2024-05-11 11:57:59', 'admin', '2024-05-11 11:57:59');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-04-07 12:42:12', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-04-07 12:42:12', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-light', 'Y', 'admin', '2024-04-07 12:42:12', 'admin', '2024-06-06 03:30:35', '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2024-04-07 12:42:12', 'admin', '2024-04-20 14:25:00', '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2024-04-07 12:42:12', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-04-07 12:42:12', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', 'XX集团', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-04-07 12:41:56', 'admin', '2024-05-17 16:18:05');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '广州分公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-04-07 12:41:56', 'admin', '2024-05-17 16:18:18');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-04-07 12:41:56', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-04-07 12:41:56', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '项目部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-04-07 12:41:56', 'admin', '2024-05-17 16:17:24');
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-04-07 12:41:56', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-04-07 12:41:56', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-04-07 12:41:56', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-04-07 12:41:56', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-04-07 12:41:56', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-04-07 12:42:10', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-04-07 12:42:10', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-04-07 12:42:10', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-04-07 12:42:10', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-04-07 12:42:10', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-04-07 12:42:10', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-04-07 12:42:10', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-04-07 12:42:10', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-04-07 12:42:10', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-04-07 12:42:10', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-04-07 12:42:10', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-04-07 12:42:10', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-04-07 12:42:10', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-04-07 12:42:10', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-04-07 12:42:10', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-04-07 12:42:10', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-04-07 12:42:10', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-04-07 12:42:10', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-04-07 12:42:10', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-04-07 12:42:10', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-04-07 12:42:10', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-04-07 12:42:10', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-04-07 12:42:10', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-04-07 12:42:10', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-04-07 12:42:10', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-04-07 12:42:10', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-04-07 12:42:10', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-04-07 12:42:10', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-04-07 12:42:10', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-04-07 12:42:09', 'admin', '2024-04-15 15:13:11', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-04-07 12:42:09', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-04-07 12:42:09', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-04-07 12:42:09', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-04-07 12:42:09', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-04-07 12:42:09', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-04-07 12:42:09', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-04-07 12:42:09', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-04-07 12:42:09', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-04-07 12:42:09', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '0 0/15 * * * ?', '1', '1', '0', 'admin', '2024-04-07 12:42:14', 'admin', '2024-05-11 07:12:21', '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '1', '1', '1', 'admin', '2024-04-07 12:42:14', 'admin', '2024-05-11 07:12:00', '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-04-07 12:42:14', '', '2024-05-03 12:14:58', '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2263 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
INSERT INTO `sys_job_log` VALUES (1, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '系统默认（有参） 总共耗时：3毫秒', '0', '', '2024-05-11 07:07:30');
INSERT INTO `sys_job_log` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2024-05-11 07:07:45');
INSERT INTO `sys_job_log` VALUES (3, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '系统默认（有参） 总共耗时：2毫秒', '0', '', '2024-05-11 07:08:00');
INSERT INTO `sys_job_log` VALUES (4, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2024-05-11 07:08:15');
INSERT INTO `sys_job_log` VALUES (5, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2024-05-11 07:08:30');
INSERT INTO `sys_job_log` VALUES (6, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2024-05-11 07:08:45');
INSERT INTO `sys_job_log` VALUES (7, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '系统默认（有参） 总共耗时：1毫秒', '0', '', '2024-05-11 07:09:00');
INSERT INTO `sys_job_log` VALUES (8, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2024-05-11 07:09:15');
INSERT INTO `sys_job_log` VALUES (9, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2024-05-11 07:09:30');
INSERT INTO `sys_job_log` VALUES (10, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2024-05-11 07:09:45');
INSERT INTO `sys_job_log` VALUES (11, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2024-05-11 07:10:00');
INSERT INTO `sys_job_log` VALUES (12, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2024-05-11 07:10:54');
INSERT INTO `sys_job_log` VALUES (13, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '系统默认（有参） 总共耗时：2毫秒', '0', '', '2024-05-11 07:11:15');
INSERT INTO `sys_job_log` VALUES (14, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2024-05-11 07:11:30');
INSERT INTO `sys_job_log` VALUES (15, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2024-05-11 07:11:45');
INSERT INTO `sys_job_log` VALUES (16, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '系统默认（有参） 总共耗时：1毫秒', '0', '', '2024-05-11 07:12:00');
INSERT INTO `sys_job_log` VALUES (17, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：56995毫秒', '0', '', '2024-05-11 07:14:23');
INSERT INTO `sys_job_log` VALUES (18, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：19776毫秒', '0', '', '2024-05-11 07:15:19');
INSERT INTO `sys_job_log` VALUES (19, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：7毫秒', '0', '', '2024-05-11 07:15:19');
INSERT INTO `sys_job_log` VALUES (20, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：4201毫秒', '0', '', '2024-05-11 07:15:29');
INSERT INTO `sys_job_log` VALUES (21, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：72413毫秒', '0', '', '2024-05-11 07:17:08');
INSERT INTO `sys_job_log` VALUES (22, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：3653毫秒', '0', '', '2024-05-11 07:17:31');
INSERT INTO `sys_job_log` VALUES (23, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：9054毫秒', '0', '', '2024-05-11 07:17:54');
INSERT INTO `sys_job_log` VALUES (24, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：16112毫秒', '0', '', '2024-05-11 07:18:37');
INSERT INTO `sys_job_log` VALUES (25, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：6030毫秒', '0', '', '2024-05-11 07:23:15');
INSERT INTO `sys_job_log` VALUES (26, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：57毫秒', '0', '', '2024-05-11 07:30:00');
INSERT INTO `sys_job_log` VALUES (27, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：16毫秒', '0', '', '2024-05-11 07:45:00');
INSERT INTO `sys_job_log` VALUES (28, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：3906毫秒', '0', '', '2024-05-11 08:00:03');
INSERT INTO `sys_job_log` VALUES (29, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：162毫秒', '0', '', '2024-05-11 12:00:00');
INSERT INTO `sys_job_log` VALUES (30, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：36毫秒', '0', '', '2024-05-11 12:15:00');
INSERT INTO `sys_job_log` VALUES (31, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：19毫秒', '0', '', '2024-05-11 12:30:00');
INSERT INTO `sys_job_log` VALUES (32, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：23毫秒', '0', '', '2024-05-11 12:45:00');
INSERT INTO `sys_job_log` VALUES (33, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：49毫秒', '0', '', '2024-05-11 13:00:00');
INSERT INTO `sys_job_log` VALUES (34, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：34毫秒', '0', '', '2024-05-11 13:15:00');
INSERT INTO `sys_job_log` VALUES (35, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-11 13:30:00');
INSERT INTO `sys_job_log` VALUES (36, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-11 13:45:00');
INSERT INTO `sys_job_log` VALUES (37, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-11 14:00:00');
INSERT INTO `sys_job_log` VALUES (38, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-11 14:15:00');
INSERT INTO `sys_job_log` VALUES (39, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-11 14:30:00');
INSERT INTO `sys_job_log` VALUES (40, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-11 14:45:00');
INSERT INTO `sys_job_log` VALUES (41, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：2毫秒', '0', '', '2024-05-11 15:00:00');
INSERT INTO `sys_job_log` VALUES (42, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-12 01:29:59');
INSERT INTO `sys_job_log` VALUES (43, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-12 01:44:59');
INSERT INTO `sys_job_log` VALUES (44, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-12 01:59:59');
INSERT INTO `sys_job_log` VALUES (45, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-12 02:14:59');
INSERT INTO `sys_job_log` VALUES (46, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-12 02:29:59');
INSERT INTO `sys_job_log` VALUES (47, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-12 02:44:59');
INSERT INTO `sys_job_log` VALUES (48, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-12 02:59:59');
INSERT INTO `sys_job_log` VALUES (49, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-12 03:14:59');
INSERT INTO `sys_job_log` VALUES (50, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-12 03:29:59');
INSERT INTO `sys_job_log` VALUES (51, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-12 03:44:59');
INSERT INTO `sys_job_log` VALUES (52, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：2毫秒', '0', '', '2024-05-12 03:59:59');
INSERT INTO `sys_job_log` VALUES (53, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-12 04:14:59');
INSERT INTO `sys_job_log` VALUES (54, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-12 04:29:59');
INSERT INTO `sys_job_log` VALUES (55, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：2毫秒', '0', '', '2024-05-12 13:00:00');
INSERT INTO `sys_job_log` VALUES (56, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-12 13:15:00');
INSERT INTO `sys_job_log` VALUES (57, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-12 13:30:00');
INSERT INTO `sys_job_log` VALUES (58, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-12 13:45:00');
INSERT INTO `sys_job_log` VALUES (59, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-12 14:00:00');
INSERT INTO `sys_job_log` VALUES (60, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-12 14:15:00');
INSERT INTO `sys_job_log` VALUES (61, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：2毫秒', '0', '', '2024-05-14 11:45:00');
INSERT INTO `sys_job_log` VALUES (62, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-14 12:00:00');
INSERT INTO `sys_job_log` VALUES (63, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-14 12:15:00');
INSERT INTO `sys_job_log` VALUES (64, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-14 12:30:00');
INSERT INTO `sys_job_log` VALUES (65, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-14 12:45:00');
INSERT INTO `sys_job_log` VALUES (66, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-14 13:00:00');
INSERT INTO `sys_job_log` VALUES (67, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-14 13:15:00');
INSERT INTO `sys_job_log` VALUES (68, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：3毫秒', '0', '', '2024-05-14 13:30:01');
INSERT INTO `sys_job_log` VALUES (69, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-14 13:45:00');
INSERT INTO `sys_job_log` VALUES (70, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-14 14:00:00');
INSERT INTO `sys_job_log` VALUES (71, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-14 14:15:01');
INSERT INTO `sys_job_log` VALUES (72, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-14 14:47:36');
INSERT INTO `sys_job_log` VALUES (73, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-14 14:47:36');
INSERT INTO `sys_job_log` VALUES (74, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：3毫秒', '0', '', '2024-05-16 09:29:57');
INSERT INTO `sys_job_log` VALUES (75, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：3毫秒', '0', '', '2024-05-16 09:49:28');
INSERT INTO `sys_job_log` VALUES (76, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-16 09:59:57');
INSERT INTO `sys_job_log` VALUES (77, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：3毫秒', '0', '', '2024-05-17 05:44:59');
INSERT INTO `sys_job_log` VALUES (78, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-17 08:27:11');
INSERT INTO `sys_job_log` VALUES (79, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-17 08:36:40');
INSERT INTO `sys_job_log` VALUES (80, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-17 09:01:45');
INSERT INTO `sys_job_log` VALUES (81, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：2毫秒', '0', '', '2024-05-17 09:17:13');
INSERT INTO `sys_job_log` VALUES (82, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：3毫秒', '0', '', '2024-05-17 09:29:59');
INSERT INTO `sys_job_log` VALUES (83, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-17 10:00:26');
INSERT INTO `sys_job_log` VALUES (84, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：2毫秒', '0', '', '2024-05-17 12:00:00');
INSERT INTO `sys_job_log` VALUES (85, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：2毫秒', '0', '', '2024-05-17 12:15:00');
INSERT INTO `sys_job_log` VALUES (86, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：2毫秒', '0', '', '2024-05-17 12:30:00');
INSERT INTO `sys_job_log` VALUES (87, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-17 12:45:00');
INSERT INTO `sys_job_log` VALUES (88, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：2毫秒', '0', '', '2024-05-17 13:00:00');
INSERT INTO `sys_job_log` VALUES (89, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-17 13:15:00');
INSERT INTO `sys_job_log` VALUES (90, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-17 13:30:00');
INSERT INTO `sys_job_log` VALUES (91, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-17 13:45:00');
INSERT INTO `sys_job_log` VALUES (92, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-17 14:00:00');
INSERT INTO `sys_job_log` VALUES (93, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：7毫秒', '0', '', '2024-05-17 14:15:13');
INSERT INTO `sys_job_log` VALUES (94, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-17 14:30:00');
INSERT INTO `sys_job_log` VALUES (95, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-17 14:45:00');
INSERT INTO `sys_job_log` VALUES (96, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-17 15:00:00');
INSERT INTO `sys_job_log` VALUES (97, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-17 15:15:00');
INSERT INTO `sys_job_log` VALUES (98, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-17 15:37:11');
INSERT INTO `sys_job_log` VALUES (99, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-17 15:45:01');
INSERT INTO `sys_job_log` VALUES (100, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-17 16:00:01');
INSERT INTO `sys_job_log` VALUES (101, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-17 16:15:01');
INSERT INTO `sys_job_log` VALUES (102, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：5毫秒', '0', '', '2024-05-18 02:44:58');
INSERT INTO `sys_job_log` VALUES (103, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-18 02:59:58');
INSERT INTO `sys_job_log` VALUES (104, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-18 03:14:58');
INSERT INTO `sys_job_log` VALUES (105, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-18 03:29:58');
INSERT INTO `sys_job_log` VALUES (106, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：3毫秒', '0', '', '2024-05-18 08:44:57');
INSERT INTO `sys_job_log` VALUES (107, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-18 08:59:57');
INSERT INTO `sys_job_log` VALUES (108, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-18 09:14:57');
INSERT INTO `sys_job_log` VALUES (109, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-18 09:29:57');
INSERT INTO `sys_job_log` VALUES (110, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-18 09:44:58');
INSERT INTO `sys_job_log` VALUES (111, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-18 09:59:57');
INSERT INTO `sys_job_log` VALUES (112, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-18 10:14:57');
INSERT INTO `sys_job_log` VALUES (113, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-18 10:29:57');
INSERT INTO `sys_job_log` VALUES (114, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：2毫秒', '0', '', '2024-05-18 12:00:00');
INSERT INTO `sys_job_log` VALUES (115, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-18 12:15:00');
INSERT INTO `sys_job_log` VALUES (116, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-18 12:30:00');
INSERT INTO `sys_job_log` VALUES (117, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：2毫秒', '0', '', '2024-05-18 12:45:01');
INSERT INTO `sys_job_log` VALUES (118, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-18 13:00:01');
INSERT INTO `sys_job_log` VALUES (119, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-18 13:15:01');
INSERT INTO `sys_job_log` VALUES (120, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-18 13:30:01');
INSERT INTO `sys_job_log` VALUES (121, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：16毫秒', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'pmsTask\' available\n	at org.springframework.beans.factory.support.DefaultListableBeanFactory.getBeanDefinition(DefaultListableBeanFactory.java:874)\n	at org.springframework.beans.factory.support.AbstractBeanFactory.getMergedLocalBeanDefinition(AbstractBeanFactory.java:1358)\n	at org.springframework.beans.factory.support.AbstractBeanFactory.doGetBean(AbstractBeanFactory.java:309)\n	at org.springframework.beans.factory.support.AbstractBeanFactory.getBean(AbstractBeanFactory.java:208)\n	at com.ruoyi.common.utils.spring.SpringUtils.getBean(SpringUtils.java:49)\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:32)\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\n', '2024-05-18 13:45:00');
INSERT INTO `sys_job_log` VALUES (122, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-18 13:45:01');
INSERT INTO `sys_job_log` VALUES (123, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：22毫秒', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'pmsTask\' available\n	at org.springframework.beans.factory.support.DefaultListableBeanFactory.getBeanDefinition(DefaultListableBeanFactory.java:874)\n	at org.springframework.beans.factory.support.AbstractBeanFactory.getMergedLocalBeanDefinition(AbstractBeanFactory.java:1358)\n	at org.springframework.beans.factory.support.AbstractBeanFactory.doGetBean(AbstractBeanFactory.java:309)\n	at org.springframework.beans.factory.support.AbstractBeanFactory.getBean(AbstractBeanFactory.java:208)\n	at com.ruoyi.common.utils.spring.SpringUtils.getBean(SpringUtils.java:49)\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:32)\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\n', '2024-05-18 14:00:00');
INSERT INTO `sys_job_log` VALUES (124, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：2毫秒', '0', '', '2024-05-18 14:00:01');
INSERT INTO `sys_job_log` VALUES (125, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'pmsTask\' available\n	at org.springframework.beans.factory.support.DefaultListableBeanFactory.getBeanDefinition(DefaultListableBeanFactory.java:874)\n	at org.springframework.beans.factory.support.AbstractBeanFactory.getMergedLocalBeanDefinition(AbstractBeanFactory.java:1358)\n	at org.springframework.beans.factory.support.AbstractBeanFactory.doGetBean(AbstractBeanFactory.java:309)\n	at org.springframework.beans.factory.support.AbstractBeanFactory.getBean(AbstractBeanFactory.java:208)\n	at com.ruoyi.common.utils.spring.SpringUtils.getBean(SpringUtils.java:49)\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:32)\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\n', '2024-05-18 14:15:00');
INSERT INTO `sys_job_log` VALUES (126, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-18 14:15:01');
INSERT INTO `sys_job_log` VALUES (127, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：2毫秒', '1', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'pmsTask\' available\n	at org.springframework.beans.factory.support.DefaultListableBeanFactory.getBeanDefinition(DefaultListableBeanFactory.java:874)\n	at org.springframework.beans.factory.support.AbstractBeanFactory.getMergedLocalBeanDefinition(AbstractBeanFactory.java:1358)\n	at org.springframework.beans.factory.support.AbstractBeanFactory.doGetBean(AbstractBeanFactory.java:309)\n	at org.springframework.beans.factory.support.AbstractBeanFactory.getBean(AbstractBeanFactory.java:208)\n	at com.ruoyi.common.utils.spring.SpringUtils.getBean(SpringUtils.java:49)\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:32)\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\n', '2024-05-18 14:30:00');
INSERT INTO `sys_job_log` VALUES (128, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：2毫秒', '0', '', '2024-05-18 14:30:01');
INSERT INTO `sys_job_log` VALUES (129, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：8毫秒', '0', '', '2024-05-18 14:45:00');
INSERT INTO `sys_job_log` VALUES (130, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-18 14:45:01');
INSERT INTO `sys_job_log` VALUES (131, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-18 15:00:00');
INSERT INTO `sys_job_log` VALUES (132, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-18 15:00:01');
INSERT INTO `sys_job_log` VALUES (133, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-18 15:15:00');
INSERT INTO `sys_job_log` VALUES (134, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-18 15:15:01');
INSERT INTO `sys_job_log` VALUES (135, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-18 15:30:00');
INSERT INTO `sys_job_log` VALUES (136, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-18 15:45:00');
INSERT INTO `sys_job_log` VALUES (137, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-18 16:00:00');
INSERT INTO `sys_job_log` VALUES (138, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-18 16:15:00');
INSERT INTO `sys_job_log` VALUES (139, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-18 16:30:00');
INSERT INTO `sys_job_log` VALUES (140, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-18 16:45:00');
INSERT INTO `sys_job_log` VALUES (141, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-18 17:00:00');
INSERT INTO `sys_job_log` VALUES (142, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-18 17:15:00');
INSERT INTO `sys_job_log` VALUES (143, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-18 17:30:00');
INSERT INTO `sys_job_log` VALUES (144, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-18 17:45:00');
INSERT INTO `sys_job_log` VALUES (145, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-18 18:00:00');
INSERT INTO `sys_job_log` VALUES (146, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-18 18:15:00');
INSERT INTO `sys_job_log` VALUES (147, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-18 18:30:00');
INSERT INTO `sys_job_log` VALUES (148, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-18 18:45:00');
INSERT INTO `sys_job_log` VALUES (149, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-18 19:00:00');
INSERT INTO `sys_job_log` VALUES (150, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-18 19:15:00');
INSERT INTO `sys_job_log` VALUES (151, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-18 19:30:00');
INSERT INTO `sys_job_log` VALUES (152, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-18 19:45:00');
INSERT INTO `sys_job_log` VALUES (153, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-18 20:00:00');
INSERT INTO `sys_job_log` VALUES (154, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-18 20:15:00');
INSERT INTO `sys_job_log` VALUES (155, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-18 20:30:00');
INSERT INTO `sys_job_log` VALUES (156, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-18 20:45:00');
INSERT INTO `sys_job_log` VALUES (157, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-18 21:00:00');
INSERT INTO `sys_job_log` VALUES (158, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-18 21:15:00');
INSERT INTO `sys_job_log` VALUES (159, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-18 21:30:00');
INSERT INTO `sys_job_log` VALUES (160, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-18 21:45:00');
INSERT INTO `sys_job_log` VALUES (161, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-18 22:00:00');
INSERT INTO `sys_job_log` VALUES (162, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-18 22:15:00');
INSERT INTO `sys_job_log` VALUES (163, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-18 22:30:00');
INSERT INTO `sys_job_log` VALUES (164, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-18 22:45:00');
INSERT INTO `sys_job_log` VALUES (165, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-18 23:00:00');
INSERT INTO `sys_job_log` VALUES (166, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-18 23:15:00');
INSERT INTO `sys_job_log` VALUES (167, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-18 23:30:00');
INSERT INTO `sys_job_log` VALUES (168, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-18 23:45:00');
INSERT INTO `sys_job_log` VALUES (169, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-19 00:00:00');
INSERT INTO `sys_job_log` VALUES (170, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 00:15:00');
INSERT INTO `sys_job_log` VALUES (171, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 00:30:00');
INSERT INTO `sys_job_log` VALUES (172, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 00:45:00');
INSERT INTO `sys_job_log` VALUES (173, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 01:00:00');
INSERT INTO `sys_job_log` VALUES (174, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 01:15:00');
INSERT INTO `sys_job_log` VALUES (175, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 01:30:00');
INSERT INTO `sys_job_log` VALUES (176, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 01:45:00');
INSERT INTO `sys_job_log` VALUES (177, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：3毫秒', '0', '', '2024-05-19 01:45:01');
INSERT INTO `sys_job_log` VALUES (178, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 02:00:00');
INSERT INTO `sys_job_log` VALUES (179, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：26毫秒', '0', '', '2024-05-19 02:00:01');
INSERT INTO `sys_job_log` VALUES (180, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 02:15:00');
INSERT INTO `sys_job_log` VALUES (181, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 02:15:01');
INSERT INTO `sys_job_log` VALUES (182, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 02:30:00');
INSERT INTO `sys_job_log` VALUES (183, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 02:30:01');
INSERT INTO `sys_job_log` VALUES (184, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 02:45:00');
INSERT INTO `sys_job_log` VALUES (185, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 02:45:01');
INSERT INTO `sys_job_log` VALUES (186, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 03:00:00');
INSERT INTO `sys_job_log` VALUES (187, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 03:00:01');
INSERT INTO `sys_job_log` VALUES (188, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 03:15:00');
INSERT INTO `sys_job_log` VALUES (189, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 03:15:01');
INSERT INTO `sys_job_log` VALUES (190, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 03:30:00');
INSERT INTO `sys_job_log` VALUES (191, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 03:45:00');
INSERT INTO `sys_job_log` VALUES (192, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 04:00:00');
INSERT INTO `sys_job_log` VALUES (193, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 04:15:00');
INSERT INTO `sys_job_log` VALUES (194, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 04:30:00');
INSERT INTO `sys_job_log` VALUES (195, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 04:45:00');
INSERT INTO `sys_job_log` VALUES (196, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 05:00:00');
INSERT INTO `sys_job_log` VALUES (197, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 05:15:00');
INSERT INTO `sys_job_log` VALUES (198, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 05:30:00');
INSERT INTO `sys_job_log` VALUES (199, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 05:45:00');
INSERT INTO `sys_job_log` VALUES (200, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 06:00:00');
INSERT INTO `sys_job_log` VALUES (201, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 06:15:00');
INSERT INTO `sys_job_log` VALUES (202, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 06:30:00');
INSERT INTO `sys_job_log` VALUES (203, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 06:45:00');
INSERT INTO `sys_job_log` VALUES (204, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 07:00:00');
INSERT INTO `sys_job_log` VALUES (205, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 07:15:00');
INSERT INTO `sys_job_log` VALUES (206, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 07:30:00');
INSERT INTO `sys_job_log` VALUES (207, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 07:45:00');
INSERT INTO `sys_job_log` VALUES (208, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 08:00:00');
INSERT INTO `sys_job_log` VALUES (209, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 08:15:00');
INSERT INTO `sys_job_log` VALUES (210, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 08:30:00');
INSERT INTO `sys_job_log` VALUES (211, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 08:45:00');
INSERT INTO `sys_job_log` VALUES (212, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 09:00:00');
INSERT INTO `sys_job_log` VALUES (213, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 09:15:00');
INSERT INTO `sys_job_log` VALUES (214, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 09:30:00');
INSERT INTO `sys_job_log` VALUES (215, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 09:45:00');
INSERT INTO `sys_job_log` VALUES (216, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 10:00:00');
INSERT INTO `sys_job_log` VALUES (217, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 10:15:00');
INSERT INTO `sys_job_log` VALUES (218, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 10:30:00');
INSERT INTO `sys_job_log` VALUES (219, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 10:45:00');
INSERT INTO `sys_job_log` VALUES (220, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 11:00:00');
INSERT INTO `sys_job_log` VALUES (221, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 11:15:00');
INSERT INTO `sys_job_log` VALUES (222, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 11:30:00');
INSERT INTO `sys_job_log` VALUES (223, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-19 11:45:00');
INSERT INTO `sys_job_log` VALUES (224, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 12:00:00');
INSERT INTO `sys_job_log` VALUES (225, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 12:15:00');
INSERT INTO `sys_job_log` VALUES (226, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 12:30:00');
INSERT INTO `sys_job_log` VALUES (227, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 12:45:00');
INSERT INTO `sys_job_log` VALUES (228, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-19 13:00:00');
INSERT INTO `sys_job_log` VALUES (229, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 13:15:00');
INSERT INTO `sys_job_log` VALUES (230, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 13:30:00');
INSERT INTO `sys_job_log` VALUES (231, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 13:45:00');
INSERT INTO `sys_job_log` VALUES (232, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-19 14:00:00');
INSERT INTO `sys_job_log` VALUES (233, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 14:15:00');
INSERT INTO `sys_job_log` VALUES (234, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 14:30:00');
INSERT INTO `sys_job_log` VALUES (235, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 14:45:00');
INSERT INTO `sys_job_log` VALUES (236, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 15:00:00');
INSERT INTO `sys_job_log` VALUES (237, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 15:15:00');
INSERT INTO `sys_job_log` VALUES (238, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 15:30:00');
INSERT INTO `sys_job_log` VALUES (239, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 15:45:00');
INSERT INTO `sys_job_log` VALUES (240, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 16:00:00');
INSERT INTO `sys_job_log` VALUES (241, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 16:15:00');
INSERT INTO `sys_job_log` VALUES (242, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 16:30:00');
INSERT INTO `sys_job_log` VALUES (243, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-19 16:45:00');
INSERT INTO `sys_job_log` VALUES (244, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 17:00:00');
INSERT INTO `sys_job_log` VALUES (245, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 17:15:00');
INSERT INTO `sys_job_log` VALUES (246, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 17:30:00');
INSERT INTO `sys_job_log` VALUES (247, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 17:45:00');
INSERT INTO `sys_job_log` VALUES (248, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-19 18:00:00');
INSERT INTO `sys_job_log` VALUES (249, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 18:15:00');
INSERT INTO `sys_job_log` VALUES (250, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 18:30:00');
INSERT INTO `sys_job_log` VALUES (251, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 18:45:00');
INSERT INTO `sys_job_log` VALUES (252, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 19:00:00');
INSERT INTO `sys_job_log` VALUES (253, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 19:15:00');
INSERT INTO `sys_job_log` VALUES (254, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 19:30:00');
INSERT INTO `sys_job_log` VALUES (255, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 19:45:00');
INSERT INTO `sys_job_log` VALUES (256, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 20:00:00');
INSERT INTO `sys_job_log` VALUES (257, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 20:15:00');
INSERT INTO `sys_job_log` VALUES (258, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 20:30:00');
INSERT INTO `sys_job_log` VALUES (259, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 20:45:00');
INSERT INTO `sys_job_log` VALUES (260, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 21:00:00');
INSERT INTO `sys_job_log` VALUES (261, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 21:15:00');
INSERT INTO `sys_job_log` VALUES (262, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 21:30:00');
INSERT INTO `sys_job_log` VALUES (263, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 21:45:00');
INSERT INTO `sys_job_log` VALUES (264, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-19 22:00:00');
INSERT INTO `sys_job_log` VALUES (265, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 22:15:00');
INSERT INTO `sys_job_log` VALUES (266, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 22:30:00');
INSERT INTO `sys_job_log` VALUES (267, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 23:30:00');
INSERT INTO `sys_job_log` VALUES (268, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-19 23:45:00');
INSERT INTO `sys_job_log` VALUES (269, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 00:00:00');
INSERT INTO `sys_job_log` VALUES (270, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 00:15:00');
INSERT INTO `sys_job_log` VALUES (271, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 00:30:00');
INSERT INTO `sys_job_log` VALUES (272, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 00:45:00');
INSERT INTO `sys_job_log` VALUES (273, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 01:00:00');
INSERT INTO `sys_job_log` VALUES (274, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 01:15:00');
INSERT INTO `sys_job_log` VALUES (275, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 01:30:00');
INSERT INTO `sys_job_log` VALUES (276, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 01:45:00');
INSERT INTO `sys_job_log` VALUES (277, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 02:00:00');
INSERT INTO `sys_job_log` VALUES (278, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 02:15:00');
INSERT INTO `sys_job_log` VALUES (279, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 02:30:00');
INSERT INTO `sys_job_log` VALUES (280, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 02:45:00');
INSERT INTO `sys_job_log` VALUES (281, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 03:00:00');
INSERT INTO `sys_job_log` VALUES (282, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 03:15:00');
INSERT INTO `sys_job_log` VALUES (283, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 03:30:00');
INSERT INTO `sys_job_log` VALUES (284, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 03:45:00');
INSERT INTO `sys_job_log` VALUES (285, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 04:00:00');
INSERT INTO `sys_job_log` VALUES (286, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 04:15:00');
INSERT INTO `sys_job_log` VALUES (287, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 04:30:00');
INSERT INTO `sys_job_log` VALUES (288, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 04:45:00');
INSERT INTO `sys_job_log` VALUES (289, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 05:00:00');
INSERT INTO `sys_job_log` VALUES (290, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 05:15:00');
INSERT INTO `sys_job_log` VALUES (291, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 05:30:00');
INSERT INTO `sys_job_log` VALUES (292, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 05:45:00');
INSERT INTO `sys_job_log` VALUES (293, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 06:00:00');
INSERT INTO `sys_job_log` VALUES (294, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 06:15:00');
INSERT INTO `sys_job_log` VALUES (295, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 06:30:00');
INSERT INTO `sys_job_log` VALUES (296, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 06:45:00');
INSERT INTO `sys_job_log` VALUES (297, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 07:00:00');
INSERT INTO `sys_job_log` VALUES (298, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 07:15:00');
INSERT INTO `sys_job_log` VALUES (299, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 07:30:00');
INSERT INTO `sys_job_log` VALUES (300, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 07:45:00');
INSERT INTO `sys_job_log` VALUES (301, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 08:00:00');
INSERT INTO `sys_job_log` VALUES (302, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 08:15:00');
INSERT INTO `sys_job_log` VALUES (303, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 08:30:00');
INSERT INTO `sys_job_log` VALUES (304, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 08:45:00');
INSERT INTO `sys_job_log` VALUES (305, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 09:00:00');
INSERT INTO `sys_job_log` VALUES (306, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-20 09:15:00');
INSERT INTO `sys_job_log` VALUES (307, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 09:30:00');
INSERT INTO `sys_job_log` VALUES (308, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 09:45:00');
INSERT INTO `sys_job_log` VALUES (309, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-20 10:00:00');
INSERT INTO `sys_job_log` VALUES (310, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 10:15:00');
INSERT INTO `sys_job_log` VALUES (311, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 10:30:00');
INSERT INTO `sys_job_log` VALUES (312, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 10:45:00');
INSERT INTO `sys_job_log` VALUES (313, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 11:00:00');
INSERT INTO `sys_job_log` VALUES (314, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 11:15:00');
INSERT INTO `sys_job_log` VALUES (315, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 11:30:00');
INSERT INTO `sys_job_log` VALUES (316, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 11:45:00');
INSERT INTO `sys_job_log` VALUES (317, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 12:00:00');
INSERT INTO `sys_job_log` VALUES (318, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 12:15:00');
INSERT INTO `sys_job_log` VALUES (319, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 12:30:00');
INSERT INTO `sys_job_log` VALUES (320, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 12:45:00');
INSERT INTO `sys_job_log` VALUES (321, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-20 13:00:00');
INSERT INTO `sys_job_log` VALUES (322, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 13:15:00');
INSERT INTO `sys_job_log` VALUES (323, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 13:30:00');
INSERT INTO `sys_job_log` VALUES (324, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-20 13:45:00');
INSERT INTO `sys_job_log` VALUES (325, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 14:00:00');
INSERT INTO `sys_job_log` VALUES (326, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 14:15:00');
INSERT INTO `sys_job_log` VALUES (327, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 14:30:00');
INSERT INTO `sys_job_log` VALUES (328, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 14:45:00');
INSERT INTO `sys_job_log` VALUES (329, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 15:00:00');
INSERT INTO `sys_job_log` VALUES (330, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 15:15:00');
INSERT INTO `sys_job_log` VALUES (331, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 15:30:00');
INSERT INTO `sys_job_log` VALUES (332, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 15:45:00');
INSERT INTO `sys_job_log` VALUES (333, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 16:00:00');
INSERT INTO `sys_job_log` VALUES (334, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 16:15:00');
INSERT INTO `sys_job_log` VALUES (335, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 16:30:00');
INSERT INTO `sys_job_log` VALUES (336, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 16:45:00');
INSERT INTO `sys_job_log` VALUES (337, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 17:00:00');
INSERT INTO `sys_job_log` VALUES (338, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 17:15:00');
INSERT INTO `sys_job_log` VALUES (339, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 17:30:00');
INSERT INTO `sys_job_log` VALUES (340, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 17:45:00');
INSERT INTO `sys_job_log` VALUES (341, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 18:00:00');
INSERT INTO `sys_job_log` VALUES (342, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 18:15:00');
INSERT INTO `sys_job_log` VALUES (343, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 18:30:00');
INSERT INTO `sys_job_log` VALUES (344, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 18:45:00');
INSERT INTO `sys_job_log` VALUES (345, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 19:00:00');
INSERT INTO `sys_job_log` VALUES (346, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 19:15:00');
INSERT INTO `sys_job_log` VALUES (347, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 19:30:00');
INSERT INTO `sys_job_log` VALUES (348, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 19:45:00');
INSERT INTO `sys_job_log` VALUES (349, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 20:00:00');
INSERT INTO `sys_job_log` VALUES (350, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 20:15:00');
INSERT INTO `sys_job_log` VALUES (351, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 20:30:00');
INSERT INTO `sys_job_log` VALUES (352, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 20:45:00');
INSERT INTO `sys_job_log` VALUES (353, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 21:00:00');
INSERT INTO `sys_job_log` VALUES (354, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 21:15:00');
INSERT INTO `sys_job_log` VALUES (355, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 21:30:00');
INSERT INTO `sys_job_log` VALUES (356, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 21:45:00');
INSERT INTO `sys_job_log` VALUES (357, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 22:00:00');
INSERT INTO `sys_job_log` VALUES (358, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 22:15:00');
INSERT INTO `sys_job_log` VALUES (359, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 22:30:00');
INSERT INTO `sys_job_log` VALUES (360, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 22:45:00');
INSERT INTO `sys_job_log` VALUES (361, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 23:00:00');
INSERT INTO `sys_job_log` VALUES (362, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 23:15:00');
INSERT INTO `sys_job_log` VALUES (363, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 23:30:00');
INSERT INTO `sys_job_log` VALUES (364, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-20 23:45:00');
INSERT INTO `sys_job_log` VALUES (365, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 00:00:00');
INSERT INTO `sys_job_log` VALUES (366, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 00:15:00');
INSERT INTO `sys_job_log` VALUES (367, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 00:30:00');
INSERT INTO `sys_job_log` VALUES (368, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 00:45:00');
INSERT INTO `sys_job_log` VALUES (369, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 01:00:00');
INSERT INTO `sys_job_log` VALUES (370, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 01:15:00');
INSERT INTO `sys_job_log` VALUES (371, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 01:30:00');
INSERT INTO `sys_job_log` VALUES (372, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 01:45:00');
INSERT INTO `sys_job_log` VALUES (373, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 02:00:00');
INSERT INTO `sys_job_log` VALUES (374, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 02:15:00');
INSERT INTO `sys_job_log` VALUES (375, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 02:30:00');
INSERT INTO `sys_job_log` VALUES (376, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 02:45:00');
INSERT INTO `sys_job_log` VALUES (377, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 03:00:00');
INSERT INTO `sys_job_log` VALUES (378, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 03:15:00');
INSERT INTO `sys_job_log` VALUES (379, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 03:30:00');
INSERT INTO `sys_job_log` VALUES (380, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 03:45:00');
INSERT INTO `sys_job_log` VALUES (381, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 04:00:00');
INSERT INTO `sys_job_log` VALUES (382, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 04:15:00');
INSERT INTO `sys_job_log` VALUES (383, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 04:30:00');
INSERT INTO `sys_job_log` VALUES (384, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 04:45:00');
INSERT INTO `sys_job_log` VALUES (385, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 05:00:00');
INSERT INTO `sys_job_log` VALUES (386, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 05:15:00');
INSERT INTO `sys_job_log` VALUES (387, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 05:30:00');
INSERT INTO `sys_job_log` VALUES (388, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-21 05:45:00');
INSERT INTO `sys_job_log` VALUES (389, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 06:00:00');
INSERT INTO `sys_job_log` VALUES (390, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 06:15:00');
INSERT INTO `sys_job_log` VALUES (391, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 06:30:00');
INSERT INTO `sys_job_log` VALUES (392, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 06:45:00');
INSERT INTO `sys_job_log` VALUES (393, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 07:00:00');
INSERT INTO `sys_job_log` VALUES (394, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 07:15:00');
INSERT INTO `sys_job_log` VALUES (395, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 07:30:00');
INSERT INTO `sys_job_log` VALUES (396, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-21 07:45:00');
INSERT INTO `sys_job_log` VALUES (397, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 08:00:00');
INSERT INTO `sys_job_log` VALUES (398, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 08:15:00');
INSERT INTO `sys_job_log` VALUES (399, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 08:30:00');
INSERT INTO `sys_job_log` VALUES (400, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 08:45:00');
INSERT INTO `sys_job_log` VALUES (401, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 09:00:00');
INSERT INTO `sys_job_log` VALUES (402, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 09:15:00');
INSERT INTO `sys_job_log` VALUES (403, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 09:30:00');
INSERT INTO `sys_job_log` VALUES (404, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 09:45:00');
INSERT INTO `sys_job_log` VALUES (405, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-21 10:00:00');
INSERT INTO `sys_job_log` VALUES (406, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 10:15:00');
INSERT INTO `sys_job_log` VALUES (407, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-21 10:30:00');
INSERT INTO `sys_job_log` VALUES (408, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 10:45:00');
INSERT INTO `sys_job_log` VALUES (409, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 11:00:00');
INSERT INTO `sys_job_log` VALUES (410, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 11:15:00');
INSERT INTO `sys_job_log` VALUES (411, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 11:30:00');
INSERT INTO `sys_job_log` VALUES (412, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 11:45:00');
INSERT INTO `sys_job_log` VALUES (413, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 12:00:00');
INSERT INTO `sys_job_log` VALUES (414, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 12:15:00');
INSERT INTO `sys_job_log` VALUES (415, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 12:30:00');
INSERT INTO `sys_job_log` VALUES (416, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 12:45:00');
INSERT INTO `sys_job_log` VALUES (417, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-21 13:00:00');
INSERT INTO `sys_job_log` VALUES (418, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 13:15:00');
INSERT INTO `sys_job_log` VALUES (419, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 13:30:00');
INSERT INTO `sys_job_log` VALUES (420, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 13:45:00');
INSERT INTO `sys_job_log` VALUES (421, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 14:00:00');
INSERT INTO `sys_job_log` VALUES (422, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 14:15:00');
INSERT INTO `sys_job_log` VALUES (423, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 14:30:00');
INSERT INTO `sys_job_log` VALUES (424, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 14:45:00');
INSERT INTO `sys_job_log` VALUES (425, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 15:00:00');
INSERT INTO `sys_job_log` VALUES (426, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 15:15:00');
INSERT INTO `sys_job_log` VALUES (427, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 15:30:00');
INSERT INTO `sys_job_log` VALUES (428, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 15:45:00');
INSERT INTO `sys_job_log` VALUES (429, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-21 16:00:00');
INSERT INTO `sys_job_log` VALUES (430, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 16:15:00');
INSERT INTO `sys_job_log` VALUES (431, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 16:30:00');
INSERT INTO `sys_job_log` VALUES (432, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 16:45:00');
INSERT INTO `sys_job_log` VALUES (433, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 17:00:00');
INSERT INTO `sys_job_log` VALUES (434, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 17:15:00');
INSERT INTO `sys_job_log` VALUES (435, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 17:30:00');
INSERT INTO `sys_job_log` VALUES (436, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 17:45:00');
INSERT INTO `sys_job_log` VALUES (437, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-21 18:00:00');
INSERT INTO `sys_job_log` VALUES (438, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 18:15:00');
INSERT INTO `sys_job_log` VALUES (439, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 18:30:00');
INSERT INTO `sys_job_log` VALUES (440, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 18:45:00');
INSERT INTO `sys_job_log` VALUES (441, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-21 19:00:00');
INSERT INTO `sys_job_log` VALUES (442, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-21 19:15:00');
INSERT INTO `sys_job_log` VALUES (443, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 19:30:00');
INSERT INTO `sys_job_log` VALUES (444, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 19:45:00');
INSERT INTO `sys_job_log` VALUES (445, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 20:00:00');
INSERT INTO `sys_job_log` VALUES (446, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 20:15:00');
INSERT INTO `sys_job_log` VALUES (447, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 20:30:00');
INSERT INTO `sys_job_log` VALUES (448, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 20:45:00');
INSERT INTO `sys_job_log` VALUES (449, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 21:00:00');
INSERT INTO `sys_job_log` VALUES (450, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 21:15:00');
INSERT INTO `sys_job_log` VALUES (451, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 21:30:00');
INSERT INTO `sys_job_log` VALUES (452, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 21:45:00');
INSERT INTO `sys_job_log` VALUES (453, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 22:00:00');
INSERT INTO `sys_job_log` VALUES (454, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 22:15:00');
INSERT INTO `sys_job_log` VALUES (455, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 22:30:00');
INSERT INTO `sys_job_log` VALUES (456, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 22:45:00');
INSERT INTO `sys_job_log` VALUES (457, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-21 23:00:00');
INSERT INTO `sys_job_log` VALUES (458, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 23:15:00');
INSERT INTO `sys_job_log` VALUES (459, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 23:30:00');
INSERT INTO `sys_job_log` VALUES (460, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-21 23:45:00');
INSERT INTO `sys_job_log` VALUES (461, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 00:00:00');
INSERT INTO `sys_job_log` VALUES (462, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 00:15:00');
INSERT INTO `sys_job_log` VALUES (463, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-22 00:30:00');
INSERT INTO `sys_job_log` VALUES (464, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 00:45:00');
INSERT INTO `sys_job_log` VALUES (465, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 01:00:00');
INSERT INTO `sys_job_log` VALUES (466, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 01:15:00');
INSERT INTO `sys_job_log` VALUES (467, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 01:30:00');
INSERT INTO `sys_job_log` VALUES (468, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 01:45:00');
INSERT INTO `sys_job_log` VALUES (469, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 02:00:00');
INSERT INTO `sys_job_log` VALUES (470, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 02:15:00');
INSERT INTO `sys_job_log` VALUES (471, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 02:30:00');
INSERT INTO `sys_job_log` VALUES (472, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 02:45:00');
INSERT INTO `sys_job_log` VALUES (473, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 03:00:00');
INSERT INTO `sys_job_log` VALUES (474, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 03:15:00');
INSERT INTO `sys_job_log` VALUES (475, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 03:30:00');
INSERT INTO `sys_job_log` VALUES (476, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 03:45:00');
INSERT INTO `sys_job_log` VALUES (477, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 04:00:00');
INSERT INTO `sys_job_log` VALUES (478, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 04:15:00');
INSERT INTO `sys_job_log` VALUES (479, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 04:30:00');
INSERT INTO `sys_job_log` VALUES (480, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 04:45:00');
INSERT INTO `sys_job_log` VALUES (481, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 05:00:00');
INSERT INTO `sys_job_log` VALUES (482, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 05:15:00');
INSERT INTO `sys_job_log` VALUES (483, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 05:30:00');
INSERT INTO `sys_job_log` VALUES (484, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 05:45:00');
INSERT INTO `sys_job_log` VALUES (485, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 06:00:00');
INSERT INTO `sys_job_log` VALUES (486, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 06:15:00');
INSERT INTO `sys_job_log` VALUES (487, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 06:30:00');
INSERT INTO `sys_job_log` VALUES (488, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 06:45:00');
INSERT INTO `sys_job_log` VALUES (489, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 07:00:00');
INSERT INTO `sys_job_log` VALUES (490, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-22 07:15:00');
INSERT INTO `sys_job_log` VALUES (491, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 07:30:00');
INSERT INTO `sys_job_log` VALUES (492, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 07:45:00');
INSERT INTO `sys_job_log` VALUES (493, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 08:00:00');
INSERT INTO `sys_job_log` VALUES (494, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 08:15:00');
INSERT INTO `sys_job_log` VALUES (495, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 08:30:00');
INSERT INTO `sys_job_log` VALUES (496, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 08:45:00');
INSERT INTO `sys_job_log` VALUES (497, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 09:00:00');
INSERT INTO `sys_job_log` VALUES (498, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 09:15:00');
INSERT INTO `sys_job_log` VALUES (499, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 09:30:00');
INSERT INTO `sys_job_log` VALUES (500, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 09:45:00');
INSERT INTO `sys_job_log` VALUES (501, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 10:00:00');
INSERT INTO `sys_job_log` VALUES (502, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 10:15:00');
INSERT INTO `sys_job_log` VALUES (503, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-22 10:30:00');
INSERT INTO `sys_job_log` VALUES (504, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 10:45:00');
INSERT INTO `sys_job_log` VALUES (505, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 11:00:00');
INSERT INTO `sys_job_log` VALUES (506, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 11:15:00');
INSERT INTO `sys_job_log` VALUES (507, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 11:30:00');
INSERT INTO `sys_job_log` VALUES (508, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 11:45:00');
INSERT INTO `sys_job_log` VALUES (509, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 12:00:00');
INSERT INTO `sys_job_log` VALUES (510, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 12:15:00');
INSERT INTO `sys_job_log` VALUES (511, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 12:30:00');
INSERT INTO `sys_job_log` VALUES (512, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 12:45:00');
INSERT INTO `sys_job_log` VALUES (513, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 13:00:00');
INSERT INTO `sys_job_log` VALUES (514, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 13:15:00');
INSERT INTO `sys_job_log` VALUES (515, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 13:30:00');
INSERT INTO `sys_job_log` VALUES (516, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 13:45:00');
INSERT INTO `sys_job_log` VALUES (517, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 14:00:00');
INSERT INTO `sys_job_log` VALUES (518, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 14:15:00');
INSERT INTO `sys_job_log` VALUES (519, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 14:30:00');
INSERT INTO `sys_job_log` VALUES (520, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 14:45:00');
INSERT INTO `sys_job_log` VALUES (521, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 15:00:00');
INSERT INTO `sys_job_log` VALUES (522, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 15:15:00');
INSERT INTO `sys_job_log` VALUES (523, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 15:30:00');
INSERT INTO `sys_job_log` VALUES (524, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 15:45:00');
INSERT INTO `sys_job_log` VALUES (525, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 16:00:00');
INSERT INTO `sys_job_log` VALUES (526, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 16:15:00');
INSERT INTO `sys_job_log` VALUES (527, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 16:30:00');
INSERT INTO `sys_job_log` VALUES (528, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 16:45:00');
INSERT INTO `sys_job_log` VALUES (529, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 17:00:00');
INSERT INTO `sys_job_log` VALUES (530, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-22 17:15:00');
INSERT INTO `sys_job_log` VALUES (531, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 17:30:00');
INSERT INTO `sys_job_log` VALUES (532, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 17:45:00');
INSERT INTO `sys_job_log` VALUES (533, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 18:00:00');
INSERT INTO `sys_job_log` VALUES (534, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 18:15:00');
INSERT INTO `sys_job_log` VALUES (535, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 18:30:00');
INSERT INTO `sys_job_log` VALUES (536, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 18:45:00');
INSERT INTO `sys_job_log` VALUES (537, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 19:00:00');
INSERT INTO `sys_job_log` VALUES (538, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 19:15:00');
INSERT INTO `sys_job_log` VALUES (539, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 19:30:00');
INSERT INTO `sys_job_log` VALUES (540, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 19:45:00');
INSERT INTO `sys_job_log` VALUES (541, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 20:00:00');
INSERT INTO `sys_job_log` VALUES (542, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 20:15:00');
INSERT INTO `sys_job_log` VALUES (543, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 20:30:00');
INSERT INTO `sys_job_log` VALUES (544, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 20:45:00');
INSERT INTO `sys_job_log` VALUES (545, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 21:00:00');
INSERT INTO `sys_job_log` VALUES (546, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-22 21:15:00');
INSERT INTO `sys_job_log` VALUES (547, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 21:30:00');
INSERT INTO `sys_job_log` VALUES (548, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 21:45:00');
INSERT INTO `sys_job_log` VALUES (549, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 22:00:00');
INSERT INTO `sys_job_log` VALUES (550, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 22:15:00');
INSERT INTO `sys_job_log` VALUES (551, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 22:30:00');
INSERT INTO `sys_job_log` VALUES (552, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-22 22:45:00');
INSERT INTO `sys_job_log` VALUES (553, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 23:00:00');
INSERT INTO `sys_job_log` VALUES (554, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 23:15:00');
INSERT INTO `sys_job_log` VALUES (555, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 23:30:00');
INSERT INTO `sys_job_log` VALUES (556, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-22 23:45:00');
INSERT INTO `sys_job_log` VALUES (557, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 00:00:00');
INSERT INTO `sys_job_log` VALUES (558, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 00:15:00');
INSERT INTO `sys_job_log` VALUES (559, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-23 00:30:00');
INSERT INTO `sys_job_log` VALUES (560, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 00:45:00');
INSERT INTO `sys_job_log` VALUES (561, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 01:00:00');
INSERT INTO `sys_job_log` VALUES (562, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 01:15:00');
INSERT INTO `sys_job_log` VALUES (563, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 01:30:00');
INSERT INTO `sys_job_log` VALUES (564, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 01:45:00');
INSERT INTO `sys_job_log` VALUES (565, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 02:00:00');
INSERT INTO `sys_job_log` VALUES (566, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 02:15:00');
INSERT INTO `sys_job_log` VALUES (567, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 02:30:00');
INSERT INTO `sys_job_log` VALUES (568, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 02:45:00');
INSERT INTO `sys_job_log` VALUES (569, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 03:00:00');
INSERT INTO `sys_job_log` VALUES (570, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 03:15:00');
INSERT INTO `sys_job_log` VALUES (571, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 03:30:00');
INSERT INTO `sys_job_log` VALUES (572, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 03:45:00');
INSERT INTO `sys_job_log` VALUES (573, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-23 04:00:00');
INSERT INTO `sys_job_log` VALUES (574, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 04:15:00');
INSERT INTO `sys_job_log` VALUES (575, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-23 04:30:00');
INSERT INTO `sys_job_log` VALUES (576, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 04:45:00');
INSERT INTO `sys_job_log` VALUES (577, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 05:00:00');
INSERT INTO `sys_job_log` VALUES (578, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 05:15:00');
INSERT INTO `sys_job_log` VALUES (579, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 05:30:00');
INSERT INTO `sys_job_log` VALUES (580, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 05:45:00');
INSERT INTO `sys_job_log` VALUES (581, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 06:00:00');
INSERT INTO `sys_job_log` VALUES (582, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 06:15:00');
INSERT INTO `sys_job_log` VALUES (583, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 06:30:00');
INSERT INTO `sys_job_log` VALUES (584, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 06:45:00');
INSERT INTO `sys_job_log` VALUES (585, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 07:00:00');
INSERT INTO `sys_job_log` VALUES (586, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 07:15:00');
INSERT INTO `sys_job_log` VALUES (587, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 07:30:00');
INSERT INTO `sys_job_log` VALUES (588, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 07:45:00');
INSERT INTO `sys_job_log` VALUES (589, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 08:00:00');
INSERT INTO `sys_job_log` VALUES (590, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 08:15:00');
INSERT INTO `sys_job_log` VALUES (591, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 08:30:00');
INSERT INTO `sys_job_log` VALUES (592, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 08:45:00');
INSERT INTO `sys_job_log` VALUES (593, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 09:00:00');
INSERT INTO `sys_job_log` VALUES (594, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 09:15:00');
INSERT INTO `sys_job_log` VALUES (595, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 09:30:00');
INSERT INTO `sys_job_log` VALUES (596, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-23 09:45:00');
INSERT INTO `sys_job_log` VALUES (597, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 10:00:00');
INSERT INTO `sys_job_log` VALUES (598, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 10:15:00');
INSERT INTO `sys_job_log` VALUES (599, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 10:30:00');
INSERT INTO `sys_job_log` VALUES (600, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 10:45:00');
INSERT INTO `sys_job_log` VALUES (601, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 11:00:00');
INSERT INTO `sys_job_log` VALUES (602, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-23 11:15:00');
INSERT INTO `sys_job_log` VALUES (603, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 11:30:00');
INSERT INTO `sys_job_log` VALUES (604, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 11:45:00');
INSERT INTO `sys_job_log` VALUES (605, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 12:00:00');
INSERT INTO `sys_job_log` VALUES (606, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 12:15:00');
INSERT INTO `sys_job_log` VALUES (607, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 12:30:00');
INSERT INTO `sys_job_log` VALUES (608, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 12:45:00');
INSERT INTO `sys_job_log` VALUES (609, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 13:00:00');
INSERT INTO `sys_job_log` VALUES (610, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 13:15:00');
INSERT INTO `sys_job_log` VALUES (611, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 13:30:00');
INSERT INTO `sys_job_log` VALUES (612, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-23 13:45:00');
INSERT INTO `sys_job_log` VALUES (613, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 14:00:00');
INSERT INTO `sys_job_log` VALUES (614, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 14:15:00');
INSERT INTO `sys_job_log` VALUES (615, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 14:30:00');
INSERT INTO `sys_job_log` VALUES (616, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 14:45:00');
INSERT INTO `sys_job_log` VALUES (617, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 15:00:00');
INSERT INTO `sys_job_log` VALUES (618, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 15:15:00');
INSERT INTO `sys_job_log` VALUES (619, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 15:30:00');
INSERT INTO `sys_job_log` VALUES (620, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 15:45:00');
INSERT INTO `sys_job_log` VALUES (621, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 16:00:00');
INSERT INTO `sys_job_log` VALUES (622, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 16:15:00');
INSERT INTO `sys_job_log` VALUES (623, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 16:30:00');
INSERT INTO `sys_job_log` VALUES (624, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 16:45:00');
INSERT INTO `sys_job_log` VALUES (625, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 17:00:00');
INSERT INTO `sys_job_log` VALUES (626, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 17:15:00');
INSERT INTO `sys_job_log` VALUES (627, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 17:30:00');
INSERT INTO `sys_job_log` VALUES (628, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 17:45:00');
INSERT INTO `sys_job_log` VALUES (629, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 18:00:00');
INSERT INTO `sys_job_log` VALUES (630, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 18:15:00');
INSERT INTO `sys_job_log` VALUES (631, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 18:30:00');
INSERT INTO `sys_job_log` VALUES (632, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 18:45:00');
INSERT INTO `sys_job_log` VALUES (633, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 19:00:00');
INSERT INTO `sys_job_log` VALUES (634, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 19:15:00');
INSERT INTO `sys_job_log` VALUES (635, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 19:30:00');
INSERT INTO `sys_job_log` VALUES (636, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 19:45:00');
INSERT INTO `sys_job_log` VALUES (637, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 20:00:00');
INSERT INTO `sys_job_log` VALUES (638, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 20:15:00');
INSERT INTO `sys_job_log` VALUES (639, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-23 20:30:00');
INSERT INTO `sys_job_log` VALUES (640, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 20:45:00');
INSERT INTO `sys_job_log` VALUES (641, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 21:00:00');
INSERT INTO `sys_job_log` VALUES (642, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 21:15:00');
INSERT INTO `sys_job_log` VALUES (643, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 21:30:00');
INSERT INTO `sys_job_log` VALUES (644, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 21:45:00');
INSERT INTO `sys_job_log` VALUES (645, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 22:00:00');
INSERT INTO `sys_job_log` VALUES (646, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 22:15:00');
INSERT INTO `sys_job_log` VALUES (647, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 22:30:00');
INSERT INTO `sys_job_log` VALUES (648, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 22:45:00');
INSERT INTO `sys_job_log` VALUES (649, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 23:00:00');
INSERT INTO `sys_job_log` VALUES (650, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-23 23:15:00');
INSERT INTO `sys_job_log` VALUES (651, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 23:30:00');
INSERT INTO `sys_job_log` VALUES (652, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-23 23:45:00');
INSERT INTO `sys_job_log` VALUES (653, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 00:00:00');
INSERT INTO `sys_job_log` VALUES (654, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 00:15:00');
INSERT INTO `sys_job_log` VALUES (655, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 00:30:00');
INSERT INTO `sys_job_log` VALUES (656, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 00:45:00');
INSERT INTO `sys_job_log` VALUES (657, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 01:00:00');
INSERT INTO `sys_job_log` VALUES (658, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 01:15:00');
INSERT INTO `sys_job_log` VALUES (659, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 01:30:00');
INSERT INTO `sys_job_log` VALUES (660, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 01:45:00');
INSERT INTO `sys_job_log` VALUES (661, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 02:00:00');
INSERT INTO `sys_job_log` VALUES (662, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 02:15:00');
INSERT INTO `sys_job_log` VALUES (663, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 02:30:00');
INSERT INTO `sys_job_log` VALUES (664, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 02:45:00');
INSERT INTO `sys_job_log` VALUES (665, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 03:00:00');
INSERT INTO `sys_job_log` VALUES (666, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 03:15:00');
INSERT INTO `sys_job_log` VALUES (667, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 03:30:00');
INSERT INTO `sys_job_log` VALUES (668, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 03:45:00');
INSERT INTO `sys_job_log` VALUES (669, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 04:00:00');
INSERT INTO `sys_job_log` VALUES (670, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 04:15:00');
INSERT INTO `sys_job_log` VALUES (671, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 04:30:00');
INSERT INTO `sys_job_log` VALUES (672, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 04:45:00');
INSERT INTO `sys_job_log` VALUES (673, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 05:00:00');
INSERT INTO `sys_job_log` VALUES (674, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 05:15:00');
INSERT INTO `sys_job_log` VALUES (675, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 05:30:00');
INSERT INTO `sys_job_log` VALUES (676, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 05:45:00');
INSERT INTO `sys_job_log` VALUES (677, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 06:00:00');
INSERT INTO `sys_job_log` VALUES (678, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 06:15:00');
INSERT INTO `sys_job_log` VALUES (679, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 06:30:00');
INSERT INTO `sys_job_log` VALUES (680, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 06:45:00');
INSERT INTO `sys_job_log` VALUES (681, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：8毫秒', '0', '', '2024-05-24 07:00:00');
INSERT INTO `sys_job_log` VALUES (682, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 07:15:00');
INSERT INTO `sys_job_log` VALUES (683, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 07:30:00');
INSERT INTO `sys_job_log` VALUES (684, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 07:45:00');
INSERT INTO `sys_job_log` VALUES (685, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 08:00:00');
INSERT INTO `sys_job_log` VALUES (686, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-24 08:15:00');
INSERT INTO `sys_job_log` VALUES (687, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 08:30:00');
INSERT INTO `sys_job_log` VALUES (688, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 08:45:00');
INSERT INTO `sys_job_log` VALUES (689, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 09:00:00');
INSERT INTO `sys_job_log` VALUES (690, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：3毫秒', '0', '', '2024-05-24 09:00:00');
INSERT INTO `sys_job_log` VALUES (691, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 09:15:00');
INSERT INTO `sys_job_log` VALUES (692, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-24 09:15:00');
INSERT INTO `sys_job_log` VALUES (693, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 09:30:00');
INSERT INTO `sys_job_log` VALUES (694, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 09:30:00');
INSERT INTO `sys_job_log` VALUES (695, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 09:45:00');
INSERT INTO `sys_job_log` VALUES (696, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：2毫秒', '0', '', '2024-05-24 09:45:00');
INSERT INTO `sys_job_log` VALUES (697, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 10:00:00');
INSERT INTO `sys_job_log` VALUES (698, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：2毫秒', '0', '', '2024-05-24 10:00:00');
INSERT INTO `sys_job_log` VALUES (699, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 10:15:00');
INSERT INTO `sys_job_log` VALUES (700, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：4毫秒', '0', '', '2024-05-24 10:15:00');
INSERT INTO `sys_job_log` VALUES (701, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 10:30:00');
INSERT INTO `sys_job_log` VALUES (702, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 10:30:00');
INSERT INTO `sys_job_log` VALUES (703, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-24 10:45:00');
INSERT INTO `sys_job_log` VALUES (704, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 10:45:00');
INSERT INTO `sys_job_log` VALUES (705, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 11:00:00');
INSERT INTO `sys_job_log` VALUES (706, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-24 11:15:00');
INSERT INTO `sys_job_log` VALUES (707, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 11:30:00');
INSERT INTO `sys_job_log` VALUES (708, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 11:45:00');
INSERT INTO `sys_job_log` VALUES (709, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-24 11:45:02');
INSERT INTO `sys_job_log` VALUES (710, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 12:00:00');
INSERT INTO `sys_job_log` VALUES (711, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 12:00:02');
INSERT INTO `sys_job_log` VALUES (712, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 12:15:00');
INSERT INTO `sys_job_log` VALUES (713, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：10毫秒', '0', '', '2024-05-24 12:15:02');
INSERT INTO `sys_job_log` VALUES (714, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 12:30:00');
INSERT INTO `sys_job_log` VALUES (715, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 12:30:02');
INSERT INTO `sys_job_log` VALUES (716, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-24 12:45:00');
INSERT INTO `sys_job_log` VALUES (717, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 12:45:02');
INSERT INTO `sys_job_log` VALUES (718, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 13:00:00');
INSERT INTO `sys_job_log` VALUES (719, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 13:15:00');
INSERT INTO `sys_job_log` VALUES (720, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-24 13:15:02');
INSERT INTO `sys_job_log` VALUES (721, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 13:30:00');
INSERT INTO `sys_job_log` VALUES (722, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 13:30:02');
INSERT INTO `sys_job_log` VALUES (723, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 13:45:00');
INSERT INTO `sys_job_log` VALUES (724, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 13:45:02');
INSERT INTO `sys_job_log` VALUES (725, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 14:00:00');
INSERT INTO `sys_job_log` VALUES (726, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 14:00:02');
INSERT INTO `sys_job_log` VALUES (727, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 14:15:00');
INSERT INTO `sys_job_log` VALUES (728, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 14:15:02');
INSERT INTO `sys_job_log` VALUES (729, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 14:30:00');
INSERT INTO `sys_job_log` VALUES (730, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 14:30:52');
INSERT INTO `sys_job_log` VALUES (731, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 14:45:00');
INSERT INTO `sys_job_log` VALUES (732, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 14:45:02');
INSERT INTO `sys_job_log` VALUES (733, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 15:00:00');
INSERT INTO `sys_job_log` VALUES (734, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 15:00:02');
INSERT INTO `sys_job_log` VALUES (735, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 15:15:00');
INSERT INTO `sys_job_log` VALUES (736, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 15:15:02');
INSERT INTO `sys_job_log` VALUES (737, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 15:30:00');
INSERT INTO `sys_job_log` VALUES (738, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 15:32:04');
INSERT INTO `sys_job_log` VALUES (739, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 15:45:00');
INSERT INTO `sys_job_log` VALUES (740, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 15:45:02');
INSERT INTO `sys_job_log` VALUES (741, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 16:00:00');
INSERT INTO `sys_job_log` VALUES (742, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 16:15:00');
INSERT INTO `sys_job_log` VALUES (743, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 16:30:00');
INSERT INTO `sys_job_log` VALUES (744, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 16:45:00');
INSERT INTO `sys_job_log` VALUES (745, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 17:00:00');
INSERT INTO `sys_job_log` VALUES (746, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 17:15:00');
INSERT INTO `sys_job_log` VALUES (747, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-24 17:30:00');
INSERT INTO `sys_job_log` VALUES (748, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 17:45:00');
INSERT INTO `sys_job_log` VALUES (749, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 18:00:00');
INSERT INTO `sys_job_log` VALUES (750, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 18:15:00');
INSERT INTO `sys_job_log` VALUES (751, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 18:30:00');
INSERT INTO `sys_job_log` VALUES (752, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 18:45:00');
INSERT INTO `sys_job_log` VALUES (753, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 19:00:00');
INSERT INTO `sys_job_log` VALUES (754, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 19:15:00');
INSERT INTO `sys_job_log` VALUES (755, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 19:30:00');
INSERT INTO `sys_job_log` VALUES (756, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 19:45:00');
INSERT INTO `sys_job_log` VALUES (757, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 20:00:00');
INSERT INTO `sys_job_log` VALUES (758, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 20:15:00');
INSERT INTO `sys_job_log` VALUES (759, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 20:30:00');
INSERT INTO `sys_job_log` VALUES (760, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-24 20:45:00');
INSERT INTO `sys_job_log` VALUES (761, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 21:00:00');
INSERT INTO `sys_job_log` VALUES (762, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 21:15:00');
INSERT INTO `sys_job_log` VALUES (763, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 21:30:00');
INSERT INTO `sys_job_log` VALUES (764, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 21:45:00');
INSERT INTO `sys_job_log` VALUES (765, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 22:00:00');
INSERT INTO `sys_job_log` VALUES (766, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 22:15:00');
INSERT INTO `sys_job_log` VALUES (767, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 22:30:00');
INSERT INTO `sys_job_log` VALUES (768, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 22:45:00');
INSERT INTO `sys_job_log` VALUES (769, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 23:00:00');
INSERT INTO `sys_job_log` VALUES (770, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 23:15:00');
INSERT INTO `sys_job_log` VALUES (771, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-24 23:30:00');
INSERT INTO `sys_job_log` VALUES (772, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-24 23:45:00');
INSERT INTO `sys_job_log` VALUES (773, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 00:00:00');
INSERT INTO `sys_job_log` VALUES (774, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 00:15:00');
INSERT INTO `sys_job_log` VALUES (775, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 00:30:00');
INSERT INTO `sys_job_log` VALUES (776, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 00:45:00');
INSERT INTO `sys_job_log` VALUES (777, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 01:00:00');
INSERT INTO `sys_job_log` VALUES (778, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 01:15:00');
INSERT INTO `sys_job_log` VALUES (779, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 01:30:00');
INSERT INTO `sys_job_log` VALUES (780, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：9毫秒', '0', '', '2024-05-25 01:45:00');
INSERT INTO `sys_job_log` VALUES (781, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 02:00:00');
INSERT INTO `sys_job_log` VALUES (782, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：3毫秒', '0', '', '2024-05-25 02:00:00');
INSERT INTO `sys_job_log` VALUES (783, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 02:15:00');
INSERT INTO `sys_job_log` VALUES (784, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：9毫秒', '0', '', '2024-05-25 02:15:00');
INSERT INTO `sys_job_log` VALUES (785, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 02:30:00');
INSERT INTO `sys_job_log` VALUES (786, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 02:45:00');
INSERT INTO `sys_job_log` VALUES (787, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：10毫秒', '0', '', '2024-05-25 03:00:00');
INSERT INTO `sys_job_log` VALUES (788, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 03:15:00');
INSERT INTO `sys_job_log` VALUES (789, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 03:30:00');
INSERT INTO `sys_job_log` VALUES (790, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 03:45:00');
INSERT INTO `sys_job_log` VALUES (791, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 04:00:00');
INSERT INTO `sys_job_log` VALUES (792, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 04:15:00');
INSERT INTO `sys_job_log` VALUES (793, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 04:30:00');
INSERT INTO `sys_job_log` VALUES (794, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 04:45:00');
INSERT INTO `sys_job_log` VALUES (795, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 05:00:00');
INSERT INTO `sys_job_log` VALUES (796, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-25 05:15:00');
INSERT INTO `sys_job_log` VALUES (797, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 05:30:00');
INSERT INTO `sys_job_log` VALUES (798, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 05:45:00');
INSERT INTO `sys_job_log` VALUES (799, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 06:00:00');
INSERT INTO `sys_job_log` VALUES (800, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 06:15:00');
INSERT INTO `sys_job_log` VALUES (801, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 06:30:00');
INSERT INTO `sys_job_log` VALUES (802, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-25 06:45:00');
INSERT INTO `sys_job_log` VALUES (803, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 07:00:00');
INSERT INTO `sys_job_log` VALUES (804, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 07:15:00');
INSERT INTO `sys_job_log` VALUES (805, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-25 07:30:00');
INSERT INTO `sys_job_log` VALUES (806, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 07:45:00');
INSERT INTO `sys_job_log` VALUES (807, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 08:00:00');
INSERT INTO `sys_job_log` VALUES (808, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 08:15:00');
INSERT INTO `sys_job_log` VALUES (809, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 08:30:00');
INSERT INTO `sys_job_log` VALUES (810, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 08:45:00');
INSERT INTO `sys_job_log` VALUES (811, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 09:00:00');
INSERT INTO `sys_job_log` VALUES (812, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 09:15:00');
INSERT INTO `sys_job_log` VALUES (813, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：13毫秒', '0', '', '2024-05-25 09:15:00');
INSERT INTO `sys_job_log` VALUES (814, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 09:30:00');
INSERT INTO `sys_job_log` VALUES (815, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-25 09:30:00');
INSERT INTO `sys_job_log` VALUES (816, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 09:45:00');
INSERT INTO `sys_job_log` VALUES (817, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 09:45:00');
INSERT INTO `sys_job_log` VALUES (818, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 10:00:00');
INSERT INTO `sys_job_log` VALUES (819, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 10:00:00');
INSERT INTO `sys_job_log` VALUES (820, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 10:15:00');
INSERT INTO `sys_job_log` VALUES (821, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 10:15:00');
INSERT INTO `sys_job_log` VALUES (822, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 10:30:00');
INSERT INTO `sys_job_log` VALUES (823, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 10:30:00');
INSERT INTO `sys_job_log` VALUES (824, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 10:45:00');
INSERT INTO `sys_job_log` VALUES (825, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-25 10:45:00');
INSERT INTO `sys_job_log` VALUES (826, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 11:00:00');
INSERT INTO `sys_job_log` VALUES (827, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 11:00:00');
INSERT INTO `sys_job_log` VALUES (828, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 11:15:00');
INSERT INTO `sys_job_log` VALUES (829, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 11:15:00');
INSERT INTO `sys_job_log` VALUES (830, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 11:30:00');
INSERT INTO `sys_job_log` VALUES (831, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 11:30:00');
INSERT INTO `sys_job_log` VALUES (832, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 11:45:00');
INSERT INTO `sys_job_log` VALUES (833, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 11:45:00');
INSERT INTO `sys_job_log` VALUES (834, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 12:00:00');
INSERT INTO `sys_job_log` VALUES (835, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 12:00:00');
INSERT INTO `sys_job_log` VALUES (836, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 12:15:00');
INSERT INTO `sys_job_log` VALUES (837, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 12:15:00');
INSERT INTO `sys_job_log` VALUES (838, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 12:30:00');
INSERT INTO `sys_job_log` VALUES (839, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-25 12:30:00');
INSERT INTO `sys_job_log` VALUES (840, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-25 12:45:00');
INSERT INTO `sys_job_log` VALUES (841, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 12:45:00');
INSERT INTO `sys_job_log` VALUES (842, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-25 12:45:02');
INSERT INTO `sys_job_log` VALUES (843, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 13:00:00');
INSERT INTO `sys_job_log` VALUES (844, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 13:00:00');
INSERT INTO `sys_job_log` VALUES (845, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：3毫秒', '0', '', '2024-05-25 13:00:02');
INSERT INTO `sys_job_log` VALUES (846, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 13:15:00');
INSERT INTO `sys_job_log` VALUES (847, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 13:15:00');
INSERT INTO `sys_job_log` VALUES (848, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：2毫秒', '0', '', '2024-05-25 13:15:02');
INSERT INTO `sys_job_log` VALUES (849, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 13:30:00');
INSERT INTO `sys_job_log` VALUES (850, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 13:30:00');
INSERT INTO `sys_job_log` VALUES (851, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 13:45:00');
INSERT INTO `sys_job_log` VALUES (852, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 13:45:00');
INSERT INTO `sys_job_log` VALUES (853, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-25 13:45:02');
INSERT INTO `sys_job_log` VALUES (854, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 14:00:00');
INSERT INTO `sys_job_log` VALUES (855, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 14:00:00');
INSERT INTO `sys_job_log` VALUES (856, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 14:00:02');
INSERT INTO `sys_job_log` VALUES (857, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 14:15:00');
INSERT INTO `sys_job_log` VALUES (858, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 14:15:00');
INSERT INTO `sys_job_log` VALUES (859, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 14:15:02');
INSERT INTO `sys_job_log` VALUES (860, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 14:30:00');
INSERT INTO `sys_job_log` VALUES (861, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 14:30:00');
INSERT INTO `sys_job_log` VALUES (862, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 14:30:02');
INSERT INTO `sys_job_log` VALUES (863, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 14:45:00');
INSERT INTO `sys_job_log` VALUES (864, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 14:45:00');
INSERT INTO `sys_job_log` VALUES (865, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 14:45:02');
INSERT INTO `sys_job_log` VALUES (866, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 15:00:00');
INSERT INTO `sys_job_log` VALUES (867, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 15:00:00');
INSERT INTO `sys_job_log` VALUES (868, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 15:00:02');
INSERT INTO `sys_job_log` VALUES (869, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 15:15:00');
INSERT INTO `sys_job_log` VALUES (870, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 15:15:00');
INSERT INTO `sys_job_log` VALUES (871, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 15:30:00');
INSERT INTO `sys_job_log` VALUES (872, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 15:30:00');
INSERT INTO `sys_job_log` VALUES (873, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 15:45:00');
INSERT INTO `sys_job_log` VALUES (874, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 15:45:00');
INSERT INTO `sys_job_log` VALUES (875, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 16:00:00');
INSERT INTO `sys_job_log` VALUES (876, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 16:00:00');
INSERT INTO `sys_job_log` VALUES (877, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 16:15:00');
INSERT INTO `sys_job_log` VALUES (878, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 16:15:00');
INSERT INTO `sys_job_log` VALUES (879, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 16:30:00');
INSERT INTO `sys_job_log` VALUES (880, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 16:30:00');
INSERT INTO `sys_job_log` VALUES (881, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 16:45:00');
INSERT INTO `sys_job_log` VALUES (882, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 16:45:00');
INSERT INTO `sys_job_log` VALUES (883, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 17:00:00');
INSERT INTO `sys_job_log` VALUES (884, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 17:00:00');
INSERT INTO `sys_job_log` VALUES (885, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 17:15:00');
INSERT INTO `sys_job_log` VALUES (886, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 17:15:00');
INSERT INTO `sys_job_log` VALUES (887, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 17:30:00');
INSERT INTO `sys_job_log` VALUES (888, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-25 17:30:00');
INSERT INTO `sys_job_log` VALUES (889, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 17:45:00');
INSERT INTO `sys_job_log` VALUES (890, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 17:45:00');
INSERT INTO `sys_job_log` VALUES (891, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 18:00:00');
INSERT INTO `sys_job_log` VALUES (892, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 18:00:00');
INSERT INTO `sys_job_log` VALUES (893, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 18:15:00');
INSERT INTO `sys_job_log` VALUES (894, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-25 18:15:00');
INSERT INTO `sys_job_log` VALUES (895, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 18:30:00');
INSERT INTO `sys_job_log` VALUES (896, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 18:30:00');
INSERT INTO `sys_job_log` VALUES (897, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-25 18:45:00');
INSERT INTO `sys_job_log` VALUES (898, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 18:45:00');
INSERT INTO `sys_job_log` VALUES (899, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 19:00:00');
INSERT INTO `sys_job_log` VALUES (900, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-25 19:00:00');
INSERT INTO `sys_job_log` VALUES (901, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 19:15:00');
INSERT INTO `sys_job_log` VALUES (902, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 19:15:00');
INSERT INTO `sys_job_log` VALUES (903, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 19:30:00');
INSERT INTO `sys_job_log` VALUES (904, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 19:30:00');
INSERT INTO `sys_job_log` VALUES (905, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 19:45:00');
INSERT INTO `sys_job_log` VALUES (906, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 19:45:00');
INSERT INTO `sys_job_log` VALUES (907, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 20:00:00');
INSERT INTO `sys_job_log` VALUES (908, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 20:00:00');
INSERT INTO `sys_job_log` VALUES (909, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-25 20:15:00');
INSERT INTO `sys_job_log` VALUES (910, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 20:15:00');
INSERT INTO `sys_job_log` VALUES (911, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-25 20:30:00');
INSERT INTO `sys_job_log` VALUES (912, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 20:30:00');
INSERT INTO `sys_job_log` VALUES (913, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 20:45:00');
INSERT INTO `sys_job_log` VALUES (914, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 20:45:00');
INSERT INTO `sys_job_log` VALUES (915, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 21:00:00');
INSERT INTO `sys_job_log` VALUES (916, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 21:00:00');
INSERT INTO `sys_job_log` VALUES (917, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-25 21:15:00');
INSERT INTO `sys_job_log` VALUES (918, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 21:15:00');
INSERT INTO `sys_job_log` VALUES (919, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 21:30:00');
INSERT INTO `sys_job_log` VALUES (920, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-25 21:30:00');
INSERT INTO `sys_job_log` VALUES (921, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 21:45:00');
INSERT INTO `sys_job_log` VALUES (922, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 21:45:00');
INSERT INTO `sys_job_log` VALUES (923, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 22:00:00');
INSERT INTO `sys_job_log` VALUES (924, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 22:00:00');
INSERT INTO `sys_job_log` VALUES (925, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 22:15:00');
INSERT INTO `sys_job_log` VALUES (926, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 22:15:00');
INSERT INTO `sys_job_log` VALUES (927, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 22:30:00');
INSERT INTO `sys_job_log` VALUES (928, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 22:30:00');
INSERT INTO `sys_job_log` VALUES (929, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 22:45:00');
INSERT INTO `sys_job_log` VALUES (930, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 22:45:00');
INSERT INTO `sys_job_log` VALUES (931, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 23:00:00');
INSERT INTO `sys_job_log` VALUES (932, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 23:00:00');
INSERT INTO `sys_job_log` VALUES (933, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-25 23:15:00');
INSERT INTO `sys_job_log` VALUES (934, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 23:15:00');
INSERT INTO `sys_job_log` VALUES (935, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 23:30:00');
INSERT INTO `sys_job_log` VALUES (936, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 23:30:00');
INSERT INTO `sys_job_log` VALUES (937, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 23:45:00');
INSERT INTO `sys_job_log` VALUES (938, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-25 23:45:00');
INSERT INTO `sys_job_log` VALUES (939, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 00:00:00');
INSERT INTO `sys_job_log` VALUES (940, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 00:00:00');
INSERT INTO `sys_job_log` VALUES (941, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 00:15:00');
INSERT INTO `sys_job_log` VALUES (942, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 00:15:00');
INSERT INTO `sys_job_log` VALUES (943, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 00:30:00');
INSERT INTO `sys_job_log` VALUES (944, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 00:30:00');
INSERT INTO `sys_job_log` VALUES (945, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 00:45:00');
INSERT INTO `sys_job_log` VALUES (946, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 00:45:00');
INSERT INTO `sys_job_log` VALUES (947, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 01:00:00');
INSERT INTO `sys_job_log` VALUES (948, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 01:00:00');
INSERT INTO `sys_job_log` VALUES (949, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 01:15:00');
INSERT INTO `sys_job_log` VALUES (950, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 01:15:00');
INSERT INTO `sys_job_log` VALUES (951, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 01:30:00');
INSERT INTO `sys_job_log` VALUES (952, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 01:30:00');
INSERT INTO `sys_job_log` VALUES (953, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 01:45:00');
INSERT INTO `sys_job_log` VALUES (954, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 01:45:00');
INSERT INTO `sys_job_log` VALUES (955, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 02:00:00');
INSERT INTO `sys_job_log` VALUES (956, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 02:00:00');
INSERT INTO `sys_job_log` VALUES (957, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 02:15:00');
INSERT INTO `sys_job_log` VALUES (958, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 02:15:00');
INSERT INTO `sys_job_log` VALUES (959, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 02:30:00');
INSERT INTO `sys_job_log` VALUES (960, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 02:30:00');
INSERT INTO `sys_job_log` VALUES (961, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 02:45:00');
INSERT INTO `sys_job_log` VALUES (962, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 02:45:00');
INSERT INTO `sys_job_log` VALUES (963, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 03:00:00');
INSERT INTO `sys_job_log` VALUES (964, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-26 03:00:00');
INSERT INTO `sys_job_log` VALUES (965, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 03:15:00');
INSERT INTO `sys_job_log` VALUES (966, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 03:15:00');
INSERT INTO `sys_job_log` VALUES (967, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 03:30:00');
INSERT INTO `sys_job_log` VALUES (968, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 03:30:00');
INSERT INTO `sys_job_log` VALUES (969, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 03:45:00');
INSERT INTO `sys_job_log` VALUES (970, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 03:45:00');
INSERT INTO `sys_job_log` VALUES (971, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 04:00:00');
INSERT INTO `sys_job_log` VALUES (972, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 04:00:00');
INSERT INTO `sys_job_log` VALUES (973, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 04:15:03');
INSERT INTO `sys_job_log` VALUES (974, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 04:15:03');
INSERT INTO `sys_job_log` VALUES (975, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 04:30:00');
INSERT INTO `sys_job_log` VALUES (976, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 04:30:00');
INSERT INTO `sys_job_log` VALUES (977, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 04:45:00');
INSERT INTO `sys_job_log` VALUES (978, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-26 04:45:00');
INSERT INTO `sys_job_log` VALUES (979, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 05:00:00');
INSERT INTO `sys_job_log` VALUES (980, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 05:00:00');
INSERT INTO `sys_job_log` VALUES (981, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 05:15:00');
INSERT INTO `sys_job_log` VALUES (982, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 05:15:00');
INSERT INTO `sys_job_log` VALUES (983, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 05:30:00');
INSERT INTO `sys_job_log` VALUES (984, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 05:30:00');
INSERT INTO `sys_job_log` VALUES (985, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 05:45:00');
INSERT INTO `sys_job_log` VALUES (986, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 05:45:00');
INSERT INTO `sys_job_log` VALUES (987, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 06:00:00');
INSERT INTO `sys_job_log` VALUES (988, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 06:00:00');
INSERT INTO `sys_job_log` VALUES (989, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 06:15:00');
INSERT INTO `sys_job_log` VALUES (990, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 06:15:00');
INSERT INTO `sys_job_log` VALUES (991, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 06:30:00');
INSERT INTO `sys_job_log` VALUES (992, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 06:30:00');
INSERT INTO `sys_job_log` VALUES (993, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 06:45:00');
INSERT INTO `sys_job_log` VALUES (994, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 06:45:00');
INSERT INTO `sys_job_log` VALUES (995, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 07:00:00');
INSERT INTO `sys_job_log` VALUES (996, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-26 07:00:00');
INSERT INTO `sys_job_log` VALUES (997, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 07:15:00');
INSERT INTO `sys_job_log` VALUES (998, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-26 07:15:00');
INSERT INTO `sys_job_log` VALUES (999, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-26 07:30:00');
INSERT INTO `sys_job_log` VALUES (1000, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-26 07:30:00');
INSERT INTO `sys_job_log` VALUES (1001, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 07:45:00');
INSERT INTO `sys_job_log` VALUES (1002, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 07:45:00');
INSERT INTO `sys_job_log` VALUES (1003, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 08:00:00');
INSERT INTO `sys_job_log` VALUES (1004, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 08:00:00');
INSERT INTO `sys_job_log` VALUES (1005, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 08:15:00');
INSERT INTO `sys_job_log` VALUES (1006, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 08:15:00');
INSERT INTO `sys_job_log` VALUES (1007, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 08:30:00');
INSERT INTO `sys_job_log` VALUES (1008, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 08:30:00');
INSERT INTO `sys_job_log` VALUES (1009, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 08:45:00');
INSERT INTO `sys_job_log` VALUES (1010, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 08:45:00');
INSERT INTO `sys_job_log` VALUES (1011, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 09:00:00');
INSERT INTO `sys_job_log` VALUES (1012, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 09:00:00');
INSERT INTO `sys_job_log` VALUES (1013, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-26 09:15:00');
INSERT INTO `sys_job_log` VALUES (1014, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 09:15:00');
INSERT INTO `sys_job_log` VALUES (1015, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 09:30:00');
INSERT INTO `sys_job_log` VALUES (1016, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 09:30:00');
INSERT INTO `sys_job_log` VALUES (1017, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 09:45:00');
INSERT INTO `sys_job_log` VALUES (1018, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 09:45:00');
INSERT INTO `sys_job_log` VALUES (1019, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 10:00:00');
INSERT INTO `sys_job_log` VALUES (1020, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 10:00:00');
INSERT INTO `sys_job_log` VALUES (1021, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 10:15:00');
INSERT INTO `sys_job_log` VALUES (1022, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 10:15:00');
INSERT INTO `sys_job_log` VALUES (1023, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 10:30:00');
INSERT INTO `sys_job_log` VALUES (1024, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-26 10:30:00');
INSERT INTO `sys_job_log` VALUES (1025, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 10:45:00');
INSERT INTO `sys_job_log` VALUES (1026, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 10:45:00');
INSERT INTO `sys_job_log` VALUES (1027, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 11:00:00');
INSERT INTO `sys_job_log` VALUES (1028, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 11:00:00');
INSERT INTO `sys_job_log` VALUES (1029, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 11:15:00');
INSERT INTO `sys_job_log` VALUES (1030, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 11:15:00');
INSERT INTO `sys_job_log` VALUES (1031, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 11:30:00');
INSERT INTO `sys_job_log` VALUES (1032, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 11:30:00');
INSERT INTO `sys_job_log` VALUES (1033, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 11:45:00');
INSERT INTO `sys_job_log` VALUES (1034, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 11:45:00');
INSERT INTO `sys_job_log` VALUES (1035, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 12:00:00');
INSERT INTO `sys_job_log` VALUES (1036, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 12:00:00');
INSERT INTO `sys_job_log` VALUES (1037, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 12:15:00');
INSERT INTO `sys_job_log` VALUES (1038, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 12:15:00');
INSERT INTO `sys_job_log` VALUES (1039, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 12:30:00');
INSERT INTO `sys_job_log` VALUES (1040, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 12:30:00');
INSERT INTO `sys_job_log` VALUES (1041, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 12:45:00');
INSERT INTO `sys_job_log` VALUES (1042, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 12:45:00');
INSERT INTO `sys_job_log` VALUES (1043, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 13:00:00');
INSERT INTO `sys_job_log` VALUES (1044, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 13:00:00');
INSERT INTO `sys_job_log` VALUES (1045, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 13:15:00');
INSERT INTO `sys_job_log` VALUES (1046, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 13:15:00');
INSERT INTO `sys_job_log` VALUES (1047, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 13:30:00');
INSERT INTO `sys_job_log` VALUES (1048, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 13:30:00');
INSERT INTO `sys_job_log` VALUES (1049, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 13:45:00');
INSERT INTO `sys_job_log` VALUES (1050, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 13:45:00');
INSERT INTO `sys_job_log` VALUES (1051, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 14:00:00');
INSERT INTO `sys_job_log` VALUES (1052, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-26 14:00:00');
INSERT INTO `sys_job_log` VALUES (1053, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 14:15:00');
INSERT INTO `sys_job_log` VALUES (1054, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 14:15:00');
INSERT INTO `sys_job_log` VALUES (1055, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 14:30:00');
INSERT INTO `sys_job_log` VALUES (1056, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 14:30:00');
INSERT INTO `sys_job_log` VALUES (1057, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 14:45:00');
INSERT INTO `sys_job_log` VALUES (1058, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 14:45:00');
INSERT INTO `sys_job_log` VALUES (1059, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-26 15:00:00');
INSERT INTO `sys_job_log` VALUES (1060, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 15:00:00');
INSERT INTO `sys_job_log` VALUES (1061, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 15:15:00');
INSERT INTO `sys_job_log` VALUES (1062, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 15:15:00');
INSERT INTO `sys_job_log` VALUES (1063, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 15:30:00');
INSERT INTO `sys_job_log` VALUES (1064, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 15:30:00');
INSERT INTO `sys_job_log` VALUES (1065, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 15:45:00');
INSERT INTO `sys_job_log` VALUES (1066, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 15:45:00');
INSERT INTO `sys_job_log` VALUES (1067, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 16:00:00');
INSERT INTO `sys_job_log` VALUES (1068, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 16:00:00');
INSERT INTO `sys_job_log` VALUES (1069, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 16:15:00');
INSERT INTO `sys_job_log` VALUES (1070, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 16:15:00');
INSERT INTO `sys_job_log` VALUES (1071, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-26 16:30:00');
INSERT INTO `sys_job_log` VALUES (1072, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 16:30:00');
INSERT INTO `sys_job_log` VALUES (1073, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 16:45:00');
INSERT INTO `sys_job_log` VALUES (1074, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 16:45:00');
INSERT INTO `sys_job_log` VALUES (1075, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 17:00:00');
INSERT INTO `sys_job_log` VALUES (1076, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 17:00:00');
INSERT INTO `sys_job_log` VALUES (1077, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 17:15:00');
INSERT INTO `sys_job_log` VALUES (1078, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 17:15:00');
INSERT INTO `sys_job_log` VALUES (1079, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 17:30:00');
INSERT INTO `sys_job_log` VALUES (1080, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 17:30:00');
INSERT INTO `sys_job_log` VALUES (1081, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 17:45:00');
INSERT INTO `sys_job_log` VALUES (1082, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 17:45:00');
INSERT INTO `sys_job_log` VALUES (1083, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 18:00:00');
INSERT INTO `sys_job_log` VALUES (1084, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-26 18:00:00');
INSERT INTO `sys_job_log` VALUES (1085, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 18:15:00');
INSERT INTO `sys_job_log` VALUES (1086, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 18:15:00');
INSERT INTO `sys_job_log` VALUES (1087, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 18:30:00');
INSERT INTO `sys_job_log` VALUES (1088, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 18:30:00');
INSERT INTO `sys_job_log` VALUES (1089, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-26 18:45:00');
INSERT INTO `sys_job_log` VALUES (1090, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-26 18:45:00');
INSERT INTO `sys_job_log` VALUES (1091, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 19:00:00');
INSERT INTO `sys_job_log` VALUES (1092, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 19:00:00');
INSERT INTO `sys_job_log` VALUES (1093, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 19:15:00');
INSERT INTO `sys_job_log` VALUES (1094, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 19:15:00');
INSERT INTO `sys_job_log` VALUES (1095, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 19:30:00');
INSERT INTO `sys_job_log` VALUES (1096, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-26 19:30:00');
INSERT INTO `sys_job_log` VALUES (1097, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 19:45:00');
INSERT INTO `sys_job_log` VALUES (1098, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 19:45:00');
INSERT INTO `sys_job_log` VALUES (1099, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 20:00:00');
INSERT INTO `sys_job_log` VALUES (1100, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 20:00:00');
INSERT INTO `sys_job_log` VALUES (1101, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 20:15:00');
INSERT INTO `sys_job_log` VALUES (1102, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 20:15:00');
INSERT INTO `sys_job_log` VALUES (1103, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 20:30:00');
INSERT INTO `sys_job_log` VALUES (1104, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 20:30:00');
INSERT INTO `sys_job_log` VALUES (1105, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 20:45:00');
INSERT INTO `sys_job_log` VALUES (1106, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 20:45:00');
INSERT INTO `sys_job_log` VALUES (1107, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 21:00:00');
INSERT INTO `sys_job_log` VALUES (1108, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 21:00:00');
INSERT INTO `sys_job_log` VALUES (1109, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 21:15:00');
INSERT INTO `sys_job_log` VALUES (1110, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 21:15:00');
INSERT INTO `sys_job_log` VALUES (1111, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 21:30:00');
INSERT INTO `sys_job_log` VALUES (1112, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-26 21:30:00');
INSERT INTO `sys_job_log` VALUES (1113, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 21:45:00');
INSERT INTO `sys_job_log` VALUES (1114, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-26 21:45:00');
INSERT INTO `sys_job_log` VALUES (1115, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 22:00:00');
INSERT INTO `sys_job_log` VALUES (1116, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 22:00:00');
INSERT INTO `sys_job_log` VALUES (1117, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 22:15:00');
INSERT INTO `sys_job_log` VALUES (1118, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 22:15:00');
INSERT INTO `sys_job_log` VALUES (1119, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 22:30:00');
INSERT INTO `sys_job_log` VALUES (1120, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 22:30:00');
INSERT INTO `sys_job_log` VALUES (1121, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 22:45:00');
INSERT INTO `sys_job_log` VALUES (1122, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 22:45:00');
INSERT INTO `sys_job_log` VALUES (1123, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 23:00:00');
INSERT INTO `sys_job_log` VALUES (1124, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 23:00:00');
INSERT INTO `sys_job_log` VALUES (1125, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 23:15:00');
INSERT INTO `sys_job_log` VALUES (1126, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 23:15:00');
INSERT INTO `sys_job_log` VALUES (1127, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 23:30:00');
INSERT INTO `sys_job_log` VALUES (1128, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 23:30:00');
INSERT INTO `sys_job_log` VALUES (1129, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 23:45:00');
INSERT INTO `sys_job_log` VALUES (1130, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-26 23:45:00');
INSERT INTO `sys_job_log` VALUES (1131, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 00:00:00');
INSERT INTO `sys_job_log` VALUES (1132, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 00:00:00');
INSERT INTO `sys_job_log` VALUES (1133, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-27 00:15:00');
INSERT INTO `sys_job_log` VALUES (1134, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 00:15:00');
INSERT INTO `sys_job_log` VALUES (1135, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 00:30:00');
INSERT INTO `sys_job_log` VALUES (1136, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 00:30:00');
INSERT INTO `sys_job_log` VALUES (1137, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 00:45:00');
INSERT INTO `sys_job_log` VALUES (1138, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 00:45:00');
INSERT INTO `sys_job_log` VALUES (1139, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 01:00:00');
INSERT INTO `sys_job_log` VALUES (1140, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 01:00:00');
INSERT INTO `sys_job_log` VALUES (1141, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 01:15:00');
INSERT INTO `sys_job_log` VALUES (1142, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 01:15:00');
INSERT INTO `sys_job_log` VALUES (1143, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 01:30:00');
INSERT INTO `sys_job_log` VALUES (1144, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 01:30:00');
INSERT INTO `sys_job_log` VALUES (1145, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 01:45:00');
INSERT INTO `sys_job_log` VALUES (1146, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 01:45:00');
INSERT INTO `sys_job_log` VALUES (1147, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 02:00:00');
INSERT INTO `sys_job_log` VALUES (1148, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 02:00:00');
INSERT INTO `sys_job_log` VALUES (1149, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 02:15:00');
INSERT INTO `sys_job_log` VALUES (1150, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 02:15:00');
INSERT INTO `sys_job_log` VALUES (1151, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 02:30:00');
INSERT INTO `sys_job_log` VALUES (1152, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 02:30:00');
INSERT INTO `sys_job_log` VALUES (1153, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-27 02:45:00');
INSERT INTO `sys_job_log` VALUES (1154, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 02:45:00');
INSERT INTO `sys_job_log` VALUES (1155, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 03:00:00');
INSERT INTO `sys_job_log` VALUES (1156, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 03:00:00');
INSERT INTO `sys_job_log` VALUES (1157, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 03:15:00');
INSERT INTO `sys_job_log` VALUES (1158, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 03:15:00');
INSERT INTO `sys_job_log` VALUES (1159, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-27 03:30:00');
INSERT INTO `sys_job_log` VALUES (1160, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-27 03:30:00');
INSERT INTO `sys_job_log` VALUES (1161, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：8毫秒', '0', '', '2024-05-27 03:45:00');
INSERT INTO `sys_job_log` VALUES (1162, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 04:00:00');
INSERT INTO `sys_job_log` VALUES (1163, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 04:15:00');
INSERT INTO `sys_job_log` VALUES (1164, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 04:30:00');
INSERT INTO `sys_job_log` VALUES (1165, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 04:45:00');
INSERT INTO `sys_job_log` VALUES (1166, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 05:00:00');
INSERT INTO `sys_job_log` VALUES (1167, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-27 05:15:00');
INSERT INTO `sys_job_log` VALUES (1168, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 05:30:00');
INSERT INTO `sys_job_log` VALUES (1169, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 05:45:00');
INSERT INTO `sys_job_log` VALUES (1170, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-27 06:00:00');
INSERT INTO `sys_job_log` VALUES (1171, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 06:15:00');
INSERT INTO `sys_job_log` VALUES (1172, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 06:30:00');
INSERT INTO `sys_job_log` VALUES (1173, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 06:45:00');
INSERT INTO `sys_job_log` VALUES (1174, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 07:00:00');
INSERT INTO `sys_job_log` VALUES (1175, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 07:15:00');
INSERT INTO `sys_job_log` VALUES (1176, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-27 07:30:00');
INSERT INTO `sys_job_log` VALUES (1177, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 07:45:00');
INSERT INTO `sys_job_log` VALUES (1178, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：2毫秒', '0', '', '2024-05-27 07:45:00');
INSERT INTO `sys_job_log` VALUES (1179, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 08:00:00');
INSERT INTO `sys_job_log` VALUES (1180, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 08:00:00');
INSERT INTO `sys_job_log` VALUES (1181, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 08:15:00');
INSERT INTO `sys_job_log` VALUES (1182, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 08:15:00');
INSERT INTO `sys_job_log` VALUES (1183, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 08:30:00');
INSERT INTO `sys_job_log` VALUES (1184, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：2毫秒', '0', '', '2024-05-27 08:30:00');
INSERT INTO `sys_job_log` VALUES (1185, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 08:45:00');
INSERT INTO `sys_job_log` VALUES (1186, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：2毫秒', '0', '', '2024-05-27 08:45:00');
INSERT INTO `sys_job_log` VALUES (1187, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：7毫秒', '0', '', '2024-05-27 09:00:00');
INSERT INTO `sys_job_log` VALUES (1188, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 09:15:00');
INSERT INTO `sys_job_log` VALUES (1189, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 09:30:00');
INSERT INTO `sys_job_log` VALUES (1190, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 09:45:00');
INSERT INTO `sys_job_log` VALUES (1191, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-27 10:00:00');
INSERT INTO `sys_job_log` VALUES (1192, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 10:15:00');
INSERT INTO `sys_job_log` VALUES (1193, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 10:30:00');
INSERT INTO `sys_job_log` VALUES (1194, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 10:45:00');
INSERT INTO `sys_job_log` VALUES (1195, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-27 11:00:00');
INSERT INTO `sys_job_log` VALUES (1196, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 11:15:00');
INSERT INTO `sys_job_log` VALUES (1197, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 11:30:00');
INSERT INTO `sys_job_log` VALUES (1198, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 11:45:00');
INSERT INTO `sys_job_log` VALUES (1199, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 12:00:00');
INSERT INTO `sys_job_log` VALUES (1200, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 12:15:00');
INSERT INTO `sys_job_log` VALUES (1201, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 12:30:00');
INSERT INTO `sys_job_log` VALUES (1202, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-27 12:45:00');
INSERT INTO `sys_job_log` VALUES (1203, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 13:00:00');
INSERT INTO `sys_job_log` VALUES (1204, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 13:15:00');
INSERT INTO `sys_job_log` VALUES (1205, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-27 13:30:00');
INSERT INTO `sys_job_log` VALUES (1206, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 13:45:00');
INSERT INTO `sys_job_log` VALUES (1207, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 14:00:00');
INSERT INTO `sys_job_log` VALUES (1208, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 14:15:00');
INSERT INTO `sys_job_log` VALUES (1209, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 14:30:00');
INSERT INTO `sys_job_log` VALUES (1210, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 14:45:00');
INSERT INTO `sys_job_log` VALUES (1211, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 15:00:00');
INSERT INTO `sys_job_log` VALUES (1212, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 15:15:00');
INSERT INTO `sys_job_log` VALUES (1213, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 15:30:00');
INSERT INTO `sys_job_log` VALUES (1214, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 15:45:00');
INSERT INTO `sys_job_log` VALUES (1215, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 16:00:00');
INSERT INTO `sys_job_log` VALUES (1216, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 16:15:00');
INSERT INTO `sys_job_log` VALUES (1217, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 16:30:00');
INSERT INTO `sys_job_log` VALUES (1218, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 16:45:00');
INSERT INTO `sys_job_log` VALUES (1219, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-27 17:00:00');
INSERT INTO `sys_job_log` VALUES (1220, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 17:15:00');
INSERT INTO `sys_job_log` VALUES (1221, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-27 17:30:00');
INSERT INTO `sys_job_log` VALUES (1222, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 17:45:00');
INSERT INTO `sys_job_log` VALUES (1223, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 18:00:00');
INSERT INTO `sys_job_log` VALUES (1224, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 18:15:00');
INSERT INTO `sys_job_log` VALUES (1225, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 18:30:00');
INSERT INTO `sys_job_log` VALUES (1226, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-27 18:45:00');
INSERT INTO `sys_job_log` VALUES (1227, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 19:00:00');
INSERT INTO `sys_job_log` VALUES (1228, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 19:15:00');
INSERT INTO `sys_job_log` VALUES (1229, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-27 19:30:00');
INSERT INTO `sys_job_log` VALUES (1230, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 19:45:00');
INSERT INTO `sys_job_log` VALUES (1231, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 20:00:00');
INSERT INTO `sys_job_log` VALUES (1232, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 20:15:00');
INSERT INTO `sys_job_log` VALUES (1233, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 20:30:00');
INSERT INTO `sys_job_log` VALUES (1234, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 20:45:00');
INSERT INTO `sys_job_log` VALUES (1235, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 21:00:00');
INSERT INTO `sys_job_log` VALUES (1236, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 21:15:00');
INSERT INTO `sys_job_log` VALUES (1237, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 21:30:00');
INSERT INTO `sys_job_log` VALUES (1238, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-27 21:45:00');
INSERT INTO `sys_job_log` VALUES (1239, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 22:00:00');
INSERT INTO `sys_job_log` VALUES (1240, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 22:15:00');
INSERT INTO `sys_job_log` VALUES (1241, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 22:30:00');
INSERT INTO `sys_job_log` VALUES (1242, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 22:45:00');
INSERT INTO `sys_job_log` VALUES (1243, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 23:00:00');
INSERT INTO `sys_job_log` VALUES (1244, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 23:15:00');
INSERT INTO `sys_job_log` VALUES (1245, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-27 23:30:00');
INSERT INTO `sys_job_log` VALUES (1246, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-27 23:45:00');
INSERT INTO `sys_job_log` VALUES (1247, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 00:00:00');
INSERT INTO `sys_job_log` VALUES (1248, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-28 00:15:00');
INSERT INTO `sys_job_log` VALUES (1249, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 00:30:00');
INSERT INTO `sys_job_log` VALUES (1250, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 00:45:00');
INSERT INTO `sys_job_log` VALUES (1251, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 01:00:00');
INSERT INTO `sys_job_log` VALUES (1252, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 01:15:00');
INSERT INTO `sys_job_log` VALUES (1253, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-28 01:30:00');
INSERT INTO `sys_job_log` VALUES (1254, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 01:45:00');
INSERT INTO `sys_job_log` VALUES (1255, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 02:00:00');
INSERT INTO `sys_job_log` VALUES (1256, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 02:15:00');
INSERT INTO `sys_job_log` VALUES (1257, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 02:30:00');
INSERT INTO `sys_job_log` VALUES (1258, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 02:45:00');
INSERT INTO `sys_job_log` VALUES (1259, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 03:00:00');
INSERT INTO `sys_job_log` VALUES (1260, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 03:15:00');
INSERT INTO `sys_job_log` VALUES (1261, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 03:30:00');
INSERT INTO `sys_job_log` VALUES (1262, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 03:45:00');
INSERT INTO `sys_job_log` VALUES (1263, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 04:00:00');
INSERT INTO `sys_job_log` VALUES (1264, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 04:15:00');
INSERT INTO `sys_job_log` VALUES (1265, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 04:30:00');
INSERT INTO `sys_job_log` VALUES (1266, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 04:45:00');
INSERT INTO `sys_job_log` VALUES (1267, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 05:00:00');
INSERT INTO `sys_job_log` VALUES (1268, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 05:15:00');
INSERT INTO `sys_job_log` VALUES (1269, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-28 05:30:00');
INSERT INTO `sys_job_log` VALUES (1270, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 05:45:00');
INSERT INTO `sys_job_log` VALUES (1271, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 06:00:00');
INSERT INTO `sys_job_log` VALUES (1272, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 06:15:00');
INSERT INTO `sys_job_log` VALUES (1273, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 06:30:00');
INSERT INTO `sys_job_log` VALUES (1274, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 06:45:00');
INSERT INTO `sys_job_log` VALUES (1275, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 07:00:00');
INSERT INTO `sys_job_log` VALUES (1276, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 07:15:00');
INSERT INTO `sys_job_log` VALUES (1277, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 07:30:00');
INSERT INTO `sys_job_log` VALUES (1278, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 07:45:00');
INSERT INTO `sys_job_log` VALUES (1279, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-28 08:00:00');
INSERT INTO `sys_job_log` VALUES (1280, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-28 08:15:00');
INSERT INTO `sys_job_log` VALUES (1281, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 08:30:00');
INSERT INTO `sys_job_log` VALUES (1282, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 08:45:00');
INSERT INTO `sys_job_log` VALUES (1283, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 09:00:00');
INSERT INTO `sys_job_log` VALUES (1284, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 09:15:00');
INSERT INTO `sys_job_log` VALUES (1285, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 09:30:00');
INSERT INTO `sys_job_log` VALUES (1286, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 09:45:00');
INSERT INTO `sys_job_log` VALUES (1287, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 10:00:00');
INSERT INTO `sys_job_log` VALUES (1288, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 10:15:00');
INSERT INTO `sys_job_log` VALUES (1289, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 10:30:00');
INSERT INTO `sys_job_log` VALUES (1290, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 10:45:00');
INSERT INTO `sys_job_log` VALUES (1291, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 11:00:00');
INSERT INTO `sys_job_log` VALUES (1292, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 11:15:00');
INSERT INTO `sys_job_log` VALUES (1293, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 11:30:00');
INSERT INTO `sys_job_log` VALUES (1294, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-28 11:45:00');
INSERT INTO `sys_job_log` VALUES (1295, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 12:00:00');
INSERT INTO `sys_job_log` VALUES (1296, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 12:15:00');
INSERT INTO `sys_job_log` VALUES (1297, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 12:30:00');
INSERT INTO `sys_job_log` VALUES (1298, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-28 12:45:00');
INSERT INTO `sys_job_log` VALUES (1299, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 13:00:00');
INSERT INTO `sys_job_log` VALUES (1300, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 13:15:00');
INSERT INTO `sys_job_log` VALUES (1301, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-28 13:30:00');
INSERT INTO `sys_job_log` VALUES (1302, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 13:45:00');
INSERT INTO `sys_job_log` VALUES (1303, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 14:00:00');
INSERT INTO `sys_job_log` VALUES (1304, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 14:15:00');
INSERT INTO `sys_job_log` VALUES (1305, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-28 14:30:00');
INSERT INTO `sys_job_log` VALUES (1306, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 14:45:00');
INSERT INTO `sys_job_log` VALUES (1307, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 15:00:00');
INSERT INTO `sys_job_log` VALUES (1308, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 15:15:00');
INSERT INTO `sys_job_log` VALUES (1309, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 15:30:00');
INSERT INTO `sys_job_log` VALUES (1310, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 15:45:00');
INSERT INTO `sys_job_log` VALUES (1311, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 16:00:00');
INSERT INTO `sys_job_log` VALUES (1312, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-28 16:15:00');
INSERT INTO `sys_job_log` VALUES (1313, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 16:30:00');
INSERT INTO `sys_job_log` VALUES (1314, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 16:45:00');
INSERT INTO `sys_job_log` VALUES (1315, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 17:00:00');
INSERT INTO `sys_job_log` VALUES (1316, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 17:15:00');
INSERT INTO `sys_job_log` VALUES (1317, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 17:30:00');
INSERT INTO `sys_job_log` VALUES (1318, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-28 17:45:00');
INSERT INTO `sys_job_log` VALUES (1319, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 18:00:00');
INSERT INTO `sys_job_log` VALUES (1320, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 18:15:00');
INSERT INTO `sys_job_log` VALUES (1321, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-28 18:30:00');
INSERT INTO `sys_job_log` VALUES (1322, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 18:45:00');
INSERT INTO `sys_job_log` VALUES (1323, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 19:00:00');
INSERT INTO `sys_job_log` VALUES (1324, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 19:15:00');
INSERT INTO `sys_job_log` VALUES (1325, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 19:30:00');
INSERT INTO `sys_job_log` VALUES (1326, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 19:45:00');
INSERT INTO `sys_job_log` VALUES (1327, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 20:00:00');
INSERT INTO `sys_job_log` VALUES (1328, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 20:15:00');
INSERT INTO `sys_job_log` VALUES (1329, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-28 20:30:00');
INSERT INTO `sys_job_log` VALUES (1330, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 20:45:00');
INSERT INTO `sys_job_log` VALUES (1331, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 21:00:00');
INSERT INTO `sys_job_log` VALUES (1332, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 21:15:00');
INSERT INTO `sys_job_log` VALUES (1333, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 21:30:00');
INSERT INTO `sys_job_log` VALUES (1334, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 21:45:00');
INSERT INTO `sys_job_log` VALUES (1335, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 22:00:00');
INSERT INTO `sys_job_log` VALUES (1336, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 22:15:00');
INSERT INTO `sys_job_log` VALUES (1337, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 22:30:00');
INSERT INTO `sys_job_log` VALUES (1338, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 22:45:00');
INSERT INTO `sys_job_log` VALUES (1339, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 23:00:00');
INSERT INTO `sys_job_log` VALUES (1340, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-28 23:15:00');
INSERT INTO `sys_job_log` VALUES (1341, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-28 23:30:00');
INSERT INTO `sys_job_log` VALUES (1342, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-28 23:45:00');
INSERT INTO `sys_job_log` VALUES (1343, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 00:00:00');
INSERT INTO `sys_job_log` VALUES (1344, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 00:15:00');
INSERT INTO `sys_job_log` VALUES (1345, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 00:30:00');
INSERT INTO `sys_job_log` VALUES (1346, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 00:45:00');
INSERT INTO `sys_job_log` VALUES (1347, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 01:00:00');
INSERT INTO `sys_job_log` VALUES (1348, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 01:15:00');
INSERT INTO `sys_job_log` VALUES (1349, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 01:30:00');
INSERT INTO `sys_job_log` VALUES (1350, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 01:45:00');
INSERT INTO `sys_job_log` VALUES (1351, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 02:00:00');
INSERT INTO `sys_job_log` VALUES (1352, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 02:15:00');
INSERT INTO `sys_job_log` VALUES (1353, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 02:30:00');
INSERT INTO `sys_job_log` VALUES (1354, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 02:45:00');
INSERT INTO `sys_job_log` VALUES (1355, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 03:00:00');
INSERT INTO `sys_job_log` VALUES (1356, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 03:15:00');
INSERT INTO `sys_job_log` VALUES (1357, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-29 03:30:00');
INSERT INTO `sys_job_log` VALUES (1358, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 03:45:00');
INSERT INTO `sys_job_log` VALUES (1359, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 04:00:00');
INSERT INTO `sys_job_log` VALUES (1360, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 04:15:00');
INSERT INTO `sys_job_log` VALUES (1361, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-29 04:30:00');
INSERT INTO `sys_job_log` VALUES (1362, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-29 04:45:00');
INSERT INTO `sys_job_log` VALUES (1363, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 05:00:00');
INSERT INTO `sys_job_log` VALUES (1364, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 05:15:00');
INSERT INTO `sys_job_log` VALUES (1365, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 05:30:00');
INSERT INTO `sys_job_log` VALUES (1366, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 05:45:00');
INSERT INTO `sys_job_log` VALUES (1367, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 06:00:00');
INSERT INTO `sys_job_log` VALUES (1368, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 06:15:00');
INSERT INTO `sys_job_log` VALUES (1369, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 06:30:00');
INSERT INTO `sys_job_log` VALUES (1370, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 06:45:00');
INSERT INTO `sys_job_log` VALUES (1371, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 07:00:00');
INSERT INTO `sys_job_log` VALUES (1372, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-29 07:15:00');
INSERT INTO `sys_job_log` VALUES (1373, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 07:30:00');
INSERT INTO `sys_job_log` VALUES (1374, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 07:45:00');
INSERT INTO `sys_job_log` VALUES (1375, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 08:00:00');
INSERT INTO `sys_job_log` VALUES (1376, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 08:15:00');
INSERT INTO `sys_job_log` VALUES (1377, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 08:30:00');
INSERT INTO `sys_job_log` VALUES (1378, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 08:45:00');
INSERT INTO `sys_job_log` VALUES (1379, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 09:00:00');
INSERT INTO `sys_job_log` VALUES (1380, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-29 09:15:00');
INSERT INTO `sys_job_log` VALUES (1381, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 09:30:00');
INSERT INTO `sys_job_log` VALUES (1382, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 09:45:00');
INSERT INTO `sys_job_log` VALUES (1383, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 10:00:00');
INSERT INTO `sys_job_log` VALUES (1384, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 10:15:00');
INSERT INTO `sys_job_log` VALUES (1385, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-29 10:30:00');
INSERT INTO `sys_job_log` VALUES (1386, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-29 10:45:00');
INSERT INTO `sys_job_log` VALUES (1387, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 11:00:00');
INSERT INTO `sys_job_log` VALUES (1388, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 11:15:00');
INSERT INTO `sys_job_log` VALUES (1389, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 11:30:00');
INSERT INTO `sys_job_log` VALUES (1390, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 11:45:00');
INSERT INTO `sys_job_log` VALUES (1391, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 12:00:00');
INSERT INTO `sys_job_log` VALUES (1392, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 12:15:00');
INSERT INTO `sys_job_log` VALUES (1393, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 12:30:00');
INSERT INTO `sys_job_log` VALUES (1394, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 12:45:00');
INSERT INTO `sys_job_log` VALUES (1395, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 13:00:00');
INSERT INTO `sys_job_log` VALUES (1396, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 13:15:00');
INSERT INTO `sys_job_log` VALUES (1397, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 13:30:00');
INSERT INTO `sys_job_log` VALUES (1398, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 13:45:00');
INSERT INTO `sys_job_log` VALUES (1399, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 14:00:00');
INSERT INTO `sys_job_log` VALUES (1400, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-29 14:15:00');
INSERT INTO `sys_job_log` VALUES (1401, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 14:30:00');
INSERT INTO `sys_job_log` VALUES (1402, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-29 14:45:00');
INSERT INTO `sys_job_log` VALUES (1403, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 15:00:00');
INSERT INTO `sys_job_log` VALUES (1404, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 15:15:00');
INSERT INTO `sys_job_log` VALUES (1405, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 15:30:00');
INSERT INTO `sys_job_log` VALUES (1406, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 15:45:00');
INSERT INTO `sys_job_log` VALUES (1407, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-29 16:00:00');
INSERT INTO `sys_job_log` VALUES (1408, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 16:15:00');
INSERT INTO `sys_job_log` VALUES (1409, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 16:30:00');
INSERT INTO `sys_job_log` VALUES (1410, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 16:45:00');
INSERT INTO `sys_job_log` VALUES (1411, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 17:00:00');
INSERT INTO `sys_job_log` VALUES (1412, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 17:15:00');
INSERT INTO `sys_job_log` VALUES (1413, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 17:30:00');
INSERT INTO `sys_job_log` VALUES (1414, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 17:45:00');
INSERT INTO `sys_job_log` VALUES (1415, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 18:00:00');
INSERT INTO `sys_job_log` VALUES (1416, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 18:15:00');
INSERT INTO `sys_job_log` VALUES (1417, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 18:30:00');
INSERT INTO `sys_job_log` VALUES (1418, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 18:45:00');
INSERT INTO `sys_job_log` VALUES (1419, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-29 19:00:00');
INSERT INTO `sys_job_log` VALUES (1420, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 19:15:00');
INSERT INTO `sys_job_log` VALUES (1421, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 19:30:00');
INSERT INTO `sys_job_log` VALUES (1422, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 19:45:00');
INSERT INTO `sys_job_log` VALUES (1423, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 20:00:00');
INSERT INTO `sys_job_log` VALUES (1424, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 20:15:00');
INSERT INTO `sys_job_log` VALUES (1425, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 20:30:00');
INSERT INTO `sys_job_log` VALUES (1426, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 20:45:00');
INSERT INTO `sys_job_log` VALUES (1427, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 21:00:00');
INSERT INTO `sys_job_log` VALUES (1428, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 21:15:00');
INSERT INTO `sys_job_log` VALUES (1429, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 21:30:00');
INSERT INTO `sys_job_log` VALUES (1430, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 21:45:00');
INSERT INTO `sys_job_log` VALUES (1431, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 22:00:00');
INSERT INTO `sys_job_log` VALUES (1432, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 22:15:00');
INSERT INTO `sys_job_log` VALUES (1433, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 22:30:00');
INSERT INTO `sys_job_log` VALUES (1434, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-29 22:45:00');
INSERT INTO `sys_job_log` VALUES (1435, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 23:00:00');
INSERT INTO `sys_job_log` VALUES (1436, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 23:15:00');
INSERT INTO `sys_job_log` VALUES (1437, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-29 23:30:00');
INSERT INTO `sys_job_log` VALUES (1438, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-29 23:45:00');
INSERT INTO `sys_job_log` VALUES (1439, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 00:00:00');
INSERT INTO `sys_job_log` VALUES (1440, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 00:15:00');
INSERT INTO `sys_job_log` VALUES (1441, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 00:30:00');
INSERT INTO `sys_job_log` VALUES (1442, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 00:45:00');
INSERT INTO `sys_job_log` VALUES (1443, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-30 01:00:00');
INSERT INTO `sys_job_log` VALUES (1444, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 01:15:00');
INSERT INTO `sys_job_log` VALUES (1445, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 01:30:00');
INSERT INTO `sys_job_log` VALUES (1446, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 01:45:00');
INSERT INTO `sys_job_log` VALUES (1447, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 02:00:00');
INSERT INTO `sys_job_log` VALUES (1448, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 02:15:00');
INSERT INTO `sys_job_log` VALUES (1449, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 02:30:00');
INSERT INTO `sys_job_log` VALUES (1450, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 02:45:00');
INSERT INTO `sys_job_log` VALUES (1451, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 03:00:00');
INSERT INTO `sys_job_log` VALUES (1452, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 03:15:00');
INSERT INTO `sys_job_log` VALUES (1453, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 03:30:00');
INSERT INTO `sys_job_log` VALUES (1454, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-30 03:45:00');
INSERT INTO `sys_job_log` VALUES (1455, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 04:00:00');
INSERT INTO `sys_job_log` VALUES (1456, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 04:15:00');
INSERT INTO `sys_job_log` VALUES (1457, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 04:30:00');
INSERT INTO `sys_job_log` VALUES (1458, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 04:45:00');
INSERT INTO `sys_job_log` VALUES (1459, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 05:00:00');
INSERT INTO `sys_job_log` VALUES (1460, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 05:15:00');
INSERT INTO `sys_job_log` VALUES (1461, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 05:30:00');
INSERT INTO `sys_job_log` VALUES (1462, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 05:45:00');
INSERT INTO `sys_job_log` VALUES (1463, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 06:00:00');
INSERT INTO `sys_job_log` VALUES (1464, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 06:15:00');
INSERT INTO `sys_job_log` VALUES (1465, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 06:30:00');
INSERT INTO `sys_job_log` VALUES (1466, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-30 06:45:00');
INSERT INTO `sys_job_log` VALUES (1467, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 07:00:00');
INSERT INTO `sys_job_log` VALUES (1468, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 07:15:00');
INSERT INTO `sys_job_log` VALUES (1469, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 07:30:00');
INSERT INTO `sys_job_log` VALUES (1470, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 07:45:00');
INSERT INTO `sys_job_log` VALUES (1471, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 08:00:00');
INSERT INTO `sys_job_log` VALUES (1472, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 08:15:00');
INSERT INTO `sys_job_log` VALUES (1473, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 08:30:00');
INSERT INTO `sys_job_log` VALUES (1474, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 08:45:00');
INSERT INTO `sys_job_log` VALUES (1475, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-30 09:00:00');
INSERT INTO `sys_job_log` VALUES (1476, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-30 09:15:00');
INSERT INTO `sys_job_log` VALUES (1477, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 09:30:00');
INSERT INTO `sys_job_log` VALUES (1478, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 09:45:00');
INSERT INTO `sys_job_log` VALUES (1479, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：7毫秒', '0', '', '2024-05-30 10:00:00');
INSERT INTO `sys_job_log` VALUES (1480, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 10:15:00');
INSERT INTO `sys_job_log` VALUES (1481, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 10:30:00');
INSERT INTO `sys_job_log` VALUES (1482, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 10:45:00');
INSERT INTO `sys_job_log` VALUES (1483, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 11:00:00');
INSERT INTO `sys_job_log` VALUES (1484, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 11:15:00');
INSERT INTO `sys_job_log` VALUES (1485, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 11:30:00');
INSERT INTO `sys_job_log` VALUES (1486, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 11:45:00');
INSERT INTO `sys_job_log` VALUES (1487, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 12:00:00');
INSERT INTO `sys_job_log` VALUES (1488, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 12:15:00');
INSERT INTO `sys_job_log` VALUES (1489, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 12:30:00');
INSERT INTO `sys_job_log` VALUES (1490, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 12:45:00');
INSERT INTO `sys_job_log` VALUES (1491, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 13:00:00');
INSERT INTO `sys_job_log` VALUES (1492, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 13:15:00');
INSERT INTO `sys_job_log` VALUES (1493, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 13:30:00');
INSERT INTO `sys_job_log` VALUES (1494, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-30 13:45:00');
INSERT INTO `sys_job_log` VALUES (1495, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 14:00:00');
INSERT INTO `sys_job_log` VALUES (1496, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 14:15:00');
INSERT INTO `sys_job_log` VALUES (1497, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-30 14:30:00');
INSERT INTO `sys_job_log` VALUES (1498, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 14:45:00');
INSERT INTO `sys_job_log` VALUES (1499, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-30 15:00:00');
INSERT INTO `sys_job_log` VALUES (1500, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 15:15:00');
INSERT INTO `sys_job_log` VALUES (1501, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 15:30:00');
INSERT INTO `sys_job_log` VALUES (1502, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-30 15:45:00');
INSERT INTO `sys_job_log` VALUES (1503, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 16:00:00');
INSERT INTO `sys_job_log` VALUES (1504, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-30 16:15:00');
INSERT INTO `sys_job_log` VALUES (1505, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 16:30:00');
INSERT INTO `sys_job_log` VALUES (1506, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 16:45:00');
INSERT INTO `sys_job_log` VALUES (1507, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 17:00:00');
INSERT INTO `sys_job_log` VALUES (1508, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 17:15:00');
INSERT INTO `sys_job_log` VALUES (1509, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 17:30:00');
INSERT INTO `sys_job_log` VALUES (1510, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 17:45:00');
INSERT INTO `sys_job_log` VALUES (1511, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 18:00:00');
INSERT INTO `sys_job_log` VALUES (1512, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-30 18:15:00');
INSERT INTO `sys_job_log` VALUES (1513, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 18:30:00');
INSERT INTO `sys_job_log` VALUES (1514, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 18:45:00');
INSERT INTO `sys_job_log` VALUES (1515, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 19:00:00');
INSERT INTO `sys_job_log` VALUES (1516, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 19:15:00');
INSERT INTO `sys_job_log` VALUES (1517, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 19:30:00');
INSERT INTO `sys_job_log` VALUES (1518, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 19:45:00');
INSERT INTO `sys_job_log` VALUES (1519, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 20:00:00');
INSERT INTO `sys_job_log` VALUES (1520, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 20:15:00');
INSERT INTO `sys_job_log` VALUES (1521, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-30 20:30:00');
INSERT INTO `sys_job_log` VALUES (1522, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 20:45:00');
INSERT INTO `sys_job_log` VALUES (1523, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 21:00:00');
INSERT INTO `sys_job_log` VALUES (1524, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 21:15:00');
INSERT INTO `sys_job_log` VALUES (1525, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 21:30:00');
INSERT INTO `sys_job_log` VALUES (1526, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 21:45:00');
INSERT INTO `sys_job_log` VALUES (1527, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 22:00:00');
INSERT INTO `sys_job_log` VALUES (1528, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 22:15:00');
INSERT INTO `sys_job_log` VALUES (1529, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 22:30:00');
INSERT INTO `sys_job_log` VALUES (1530, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 22:45:00');
INSERT INTO `sys_job_log` VALUES (1531, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 23:00:00');
INSERT INTO `sys_job_log` VALUES (1532, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 23:15:00');
INSERT INTO `sys_job_log` VALUES (1533, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 23:30:00');
INSERT INTO `sys_job_log` VALUES (1534, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-30 23:45:00');
INSERT INTO `sys_job_log` VALUES (1535, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 00:00:00');
INSERT INTO `sys_job_log` VALUES (1536, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 00:15:00');
INSERT INTO `sys_job_log` VALUES (1537, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 00:30:00');
INSERT INTO `sys_job_log` VALUES (1538, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 00:45:00');
INSERT INTO `sys_job_log` VALUES (1539, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 01:00:00');
INSERT INTO `sys_job_log` VALUES (1540, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 01:15:00');
INSERT INTO `sys_job_log` VALUES (1541, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-31 01:30:00');
INSERT INTO `sys_job_log` VALUES (1542, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 01:45:00');
INSERT INTO `sys_job_log` VALUES (1543, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 02:00:00');
INSERT INTO `sys_job_log` VALUES (1544, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 02:15:00');
INSERT INTO `sys_job_log` VALUES (1545, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-31 02:30:00');
INSERT INTO `sys_job_log` VALUES (1546, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 02:45:00');
INSERT INTO `sys_job_log` VALUES (1547, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 03:00:00');
INSERT INTO `sys_job_log` VALUES (1548, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 03:15:00');
INSERT INTO `sys_job_log` VALUES (1549, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 03:30:00');
INSERT INTO `sys_job_log` VALUES (1550, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 03:45:00');
INSERT INTO `sys_job_log` VALUES (1551, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 04:00:00');
INSERT INTO `sys_job_log` VALUES (1552, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 04:15:00');
INSERT INTO `sys_job_log` VALUES (1553, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 04:30:00');
INSERT INTO `sys_job_log` VALUES (1554, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 04:45:00');
INSERT INTO `sys_job_log` VALUES (1555, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-31 05:00:00');
INSERT INTO `sys_job_log` VALUES (1556, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 05:15:00');
INSERT INTO `sys_job_log` VALUES (1557, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 05:30:00');
INSERT INTO `sys_job_log` VALUES (1558, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 05:45:00');
INSERT INTO `sys_job_log` VALUES (1559, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 06:00:00');
INSERT INTO `sys_job_log` VALUES (1560, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 06:15:00');
INSERT INTO `sys_job_log` VALUES (1561, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 06:30:00');
INSERT INTO `sys_job_log` VALUES (1562, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-31 06:45:00');
INSERT INTO `sys_job_log` VALUES (1563, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 07:00:00');
INSERT INTO `sys_job_log` VALUES (1564, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 07:15:00');
INSERT INTO `sys_job_log` VALUES (1565, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 07:30:00');
INSERT INTO `sys_job_log` VALUES (1566, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-31 07:45:00');
INSERT INTO `sys_job_log` VALUES (1567, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 08:00:00');
INSERT INTO `sys_job_log` VALUES (1568, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 08:15:00');
INSERT INTO `sys_job_log` VALUES (1569, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 08:30:00');
INSERT INTO `sys_job_log` VALUES (1570, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 08:45:00');
INSERT INTO `sys_job_log` VALUES (1571, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 09:00:00');
INSERT INTO `sys_job_log` VALUES (1572, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 09:15:00');
INSERT INTO `sys_job_log` VALUES (1573, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 09:30:00');
INSERT INTO `sys_job_log` VALUES (1574, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-31 09:45:00');
INSERT INTO `sys_job_log` VALUES (1575, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 10:00:00');
INSERT INTO `sys_job_log` VALUES (1576, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 10:15:00');
INSERT INTO `sys_job_log` VALUES (1577, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 10:30:00');
INSERT INTO `sys_job_log` VALUES (1578, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 10:45:00');
INSERT INTO `sys_job_log` VALUES (1579, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 11:00:00');
INSERT INTO `sys_job_log` VALUES (1580, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 11:15:00');
INSERT INTO `sys_job_log` VALUES (1581, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 11:30:00');
INSERT INTO `sys_job_log` VALUES (1582, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 11:45:00');
INSERT INTO `sys_job_log` VALUES (1583, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 12:00:00');
INSERT INTO `sys_job_log` VALUES (1584, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 12:15:00');
INSERT INTO `sys_job_log` VALUES (1585, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 12:30:00');
INSERT INTO `sys_job_log` VALUES (1586, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 12:45:00');
INSERT INTO `sys_job_log` VALUES (1587, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 13:00:00');
INSERT INTO `sys_job_log` VALUES (1588, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 13:15:00');
INSERT INTO `sys_job_log` VALUES (1589, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-31 13:30:00');
INSERT INTO `sys_job_log` VALUES (1590, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 13:45:00');
INSERT INTO `sys_job_log` VALUES (1591, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 14:00:00');
INSERT INTO `sys_job_log` VALUES (1592, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-31 14:15:00');
INSERT INTO `sys_job_log` VALUES (1593, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 14:30:00');
INSERT INTO `sys_job_log` VALUES (1594, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 14:45:00');
INSERT INTO `sys_job_log` VALUES (1595, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 15:00:00');
INSERT INTO `sys_job_log` VALUES (1596, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 15:15:00');
INSERT INTO `sys_job_log` VALUES (1597, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 15:30:00');
INSERT INTO `sys_job_log` VALUES (1598, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 15:45:00');
INSERT INTO `sys_job_log` VALUES (1599, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 16:00:00');
INSERT INTO `sys_job_log` VALUES (1600, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 16:15:00');
INSERT INTO `sys_job_log` VALUES (1601, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 16:30:00');
INSERT INTO `sys_job_log` VALUES (1602, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-31 16:45:00');
INSERT INTO `sys_job_log` VALUES (1603, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 17:00:00');
INSERT INTO `sys_job_log` VALUES (1604, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 17:15:00');
INSERT INTO `sys_job_log` VALUES (1605, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 17:30:00');
INSERT INTO `sys_job_log` VALUES (1606, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 17:45:00');
INSERT INTO `sys_job_log` VALUES (1607, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 18:00:00');
INSERT INTO `sys_job_log` VALUES (1608, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 18:15:00');
INSERT INTO `sys_job_log` VALUES (1609, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-31 18:30:00');
INSERT INTO `sys_job_log` VALUES (1610, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 18:45:00');
INSERT INTO `sys_job_log` VALUES (1611, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 19:00:00');
INSERT INTO `sys_job_log` VALUES (1612, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 19:15:00');
INSERT INTO `sys_job_log` VALUES (1613, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 19:30:00');
INSERT INTO `sys_job_log` VALUES (1614, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 19:45:00');
INSERT INTO `sys_job_log` VALUES (1615, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 20:00:00');
INSERT INTO `sys_job_log` VALUES (1616, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 20:15:00');
INSERT INTO `sys_job_log` VALUES (1617, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 20:30:00');
INSERT INTO `sys_job_log` VALUES (1618, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 20:45:00');
INSERT INTO `sys_job_log` VALUES (1619, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 21:00:00');
INSERT INTO `sys_job_log` VALUES (1620, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-05-31 21:15:00');
INSERT INTO `sys_job_log` VALUES (1621, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 21:30:00');
INSERT INTO `sys_job_log` VALUES (1622, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 21:45:00');
INSERT INTO `sys_job_log` VALUES (1623, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 22:00:00');
INSERT INTO `sys_job_log` VALUES (1624, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 22:15:00');
INSERT INTO `sys_job_log` VALUES (1625, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 22:30:00');
INSERT INTO `sys_job_log` VALUES (1626, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 22:45:00');
INSERT INTO `sys_job_log` VALUES (1627, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 23:00:00');
INSERT INTO `sys_job_log` VALUES (1628, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 23:15:00');
INSERT INTO `sys_job_log` VALUES (1629, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 23:30:00');
INSERT INTO `sys_job_log` VALUES (1630, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-05-31 23:45:00');
INSERT INTO `sys_job_log` VALUES (1631, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 00:00:00');
INSERT INTO `sys_job_log` VALUES (1632, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 00:15:00');
INSERT INTO `sys_job_log` VALUES (1633, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 00:30:00');
INSERT INTO `sys_job_log` VALUES (1634, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-01 00:45:00');
INSERT INTO `sys_job_log` VALUES (1635, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 01:00:00');
INSERT INTO `sys_job_log` VALUES (1636, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 01:15:00');
INSERT INTO `sys_job_log` VALUES (1637, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 01:30:00');
INSERT INTO `sys_job_log` VALUES (1638, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 01:45:00');
INSERT INTO `sys_job_log` VALUES (1639, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 02:00:00');
INSERT INTO `sys_job_log` VALUES (1640, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 02:15:00');
INSERT INTO `sys_job_log` VALUES (1641, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 02:30:00');
INSERT INTO `sys_job_log` VALUES (1642, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 02:45:00');
INSERT INTO `sys_job_log` VALUES (1643, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-01 03:00:00');
INSERT INTO `sys_job_log` VALUES (1644, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 03:15:00');
INSERT INTO `sys_job_log` VALUES (1645, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 03:30:00');
INSERT INTO `sys_job_log` VALUES (1646, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 03:45:00');
INSERT INTO `sys_job_log` VALUES (1647, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 04:00:00');
INSERT INTO `sys_job_log` VALUES (1648, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 04:15:00');
INSERT INTO `sys_job_log` VALUES (1649, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 04:30:00');
INSERT INTO `sys_job_log` VALUES (1650, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 04:45:00');
INSERT INTO `sys_job_log` VALUES (1651, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 05:00:00');
INSERT INTO `sys_job_log` VALUES (1652, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-01 05:15:00');
INSERT INTO `sys_job_log` VALUES (1653, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 05:30:00');
INSERT INTO `sys_job_log` VALUES (1654, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 05:45:00');
INSERT INTO `sys_job_log` VALUES (1655, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-01 06:00:00');
INSERT INTO `sys_job_log` VALUES (1656, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 06:15:00');
INSERT INTO `sys_job_log` VALUES (1657, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 06:30:00');
INSERT INTO `sys_job_log` VALUES (1658, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 06:45:00');
INSERT INTO `sys_job_log` VALUES (1659, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-01 07:00:00');
INSERT INTO `sys_job_log` VALUES (1660, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 07:15:00');
INSERT INTO `sys_job_log` VALUES (1661, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 07:30:00');
INSERT INTO `sys_job_log` VALUES (1662, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-01 07:45:00');
INSERT INTO `sys_job_log` VALUES (1663, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 08:00:00');
INSERT INTO `sys_job_log` VALUES (1664, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 08:15:00');
INSERT INTO `sys_job_log` VALUES (1665, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 08:30:00');
INSERT INTO `sys_job_log` VALUES (1666, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 08:45:00');
INSERT INTO `sys_job_log` VALUES (1667, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 09:00:00');
INSERT INTO `sys_job_log` VALUES (1668, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-01 09:15:00');
INSERT INTO `sys_job_log` VALUES (1669, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 09:30:00');
INSERT INTO `sys_job_log` VALUES (1670, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 09:45:00');
INSERT INTO `sys_job_log` VALUES (1671, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 10:00:00');
INSERT INTO `sys_job_log` VALUES (1672, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 10:15:00');
INSERT INTO `sys_job_log` VALUES (1673, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 10:30:00');
INSERT INTO `sys_job_log` VALUES (1674, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 10:45:00');
INSERT INTO `sys_job_log` VALUES (1675, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 11:00:00');
INSERT INTO `sys_job_log` VALUES (1676, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 11:15:00');
INSERT INTO `sys_job_log` VALUES (1677, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 11:30:00');
INSERT INTO `sys_job_log` VALUES (1678, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 11:45:00');
INSERT INTO `sys_job_log` VALUES (1679, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 12:00:00');
INSERT INTO `sys_job_log` VALUES (1680, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 12:15:00');
INSERT INTO `sys_job_log` VALUES (1681, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 12:30:00');
INSERT INTO `sys_job_log` VALUES (1682, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 12:45:00');
INSERT INTO `sys_job_log` VALUES (1683, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 13:00:00');
INSERT INTO `sys_job_log` VALUES (1684, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 13:15:00');
INSERT INTO `sys_job_log` VALUES (1685, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 13:30:00');
INSERT INTO `sys_job_log` VALUES (1686, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 13:45:00');
INSERT INTO `sys_job_log` VALUES (1687, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-01 14:00:00');
INSERT INTO `sys_job_log` VALUES (1688, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 14:15:00');
INSERT INTO `sys_job_log` VALUES (1689, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 14:30:00');
INSERT INTO `sys_job_log` VALUES (1690, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 14:45:00');
INSERT INTO `sys_job_log` VALUES (1691, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 15:00:00');
INSERT INTO `sys_job_log` VALUES (1692, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 15:15:00');
INSERT INTO `sys_job_log` VALUES (1693, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 15:30:00');
INSERT INTO `sys_job_log` VALUES (1694, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 15:45:00');
INSERT INTO `sys_job_log` VALUES (1695, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 16:00:00');
INSERT INTO `sys_job_log` VALUES (1696, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 16:15:00');
INSERT INTO `sys_job_log` VALUES (1697, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 16:30:00');
INSERT INTO `sys_job_log` VALUES (1698, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 16:45:00');
INSERT INTO `sys_job_log` VALUES (1699, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 17:00:00');
INSERT INTO `sys_job_log` VALUES (1700, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 17:15:00');
INSERT INTO `sys_job_log` VALUES (1701, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 17:30:00');
INSERT INTO `sys_job_log` VALUES (1702, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 17:45:00');
INSERT INTO `sys_job_log` VALUES (1703, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 18:00:00');
INSERT INTO `sys_job_log` VALUES (1704, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 18:15:00');
INSERT INTO `sys_job_log` VALUES (1705, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-01 18:30:00');
INSERT INTO `sys_job_log` VALUES (1706, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 18:45:00');
INSERT INTO `sys_job_log` VALUES (1707, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 19:00:00');
INSERT INTO `sys_job_log` VALUES (1708, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 19:15:00');
INSERT INTO `sys_job_log` VALUES (1709, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 19:30:00');
INSERT INTO `sys_job_log` VALUES (1710, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 19:45:00');
INSERT INTO `sys_job_log` VALUES (1711, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 20:00:00');
INSERT INTO `sys_job_log` VALUES (1712, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 20:15:00');
INSERT INTO `sys_job_log` VALUES (1713, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 20:30:00');
INSERT INTO `sys_job_log` VALUES (1714, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 20:45:00');
INSERT INTO `sys_job_log` VALUES (1715, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 21:00:00');
INSERT INTO `sys_job_log` VALUES (1716, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 21:15:00');
INSERT INTO `sys_job_log` VALUES (1717, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 21:30:00');
INSERT INTO `sys_job_log` VALUES (1718, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 21:45:00');
INSERT INTO `sys_job_log` VALUES (1719, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-01 22:00:00');
INSERT INTO `sys_job_log` VALUES (1720, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 22:15:00');
INSERT INTO `sys_job_log` VALUES (1721, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 22:30:00');
INSERT INTO `sys_job_log` VALUES (1722, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 22:45:00');
INSERT INTO `sys_job_log` VALUES (1723, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 23:00:00');
INSERT INTO `sys_job_log` VALUES (1724, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-01 23:15:00');
INSERT INTO `sys_job_log` VALUES (1725, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 23:30:00');
INSERT INTO `sys_job_log` VALUES (1726, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-01 23:45:00');
INSERT INTO `sys_job_log` VALUES (1727, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 00:00:00');
INSERT INTO `sys_job_log` VALUES (1728, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 00:15:00');
INSERT INTO `sys_job_log` VALUES (1729, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 00:30:00');
INSERT INTO `sys_job_log` VALUES (1730, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 00:45:00');
INSERT INTO `sys_job_log` VALUES (1731, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-02 01:00:00');
INSERT INTO `sys_job_log` VALUES (1732, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 01:15:00');
INSERT INTO `sys_job_log` VALUES (1733, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 01:30:00');
INSERT INTO `sys_job_log` VALUES (1734, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 01:45:00');
INSERT INTO `sys_job_log` VALUES (1735, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-02 02:00:00');
INSERT INTO `sys_job_log` VALUES (1736, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 02:15:00');
INSERT INTO `sys_job_log` VALUES (1737, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 02:30:00');
INSERT INTO `sys_job_log` VALUES (1738, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 02:45:00');
INSERT INTO `sys_job_log` VALUES (1739, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 03:00:00');
INSERT INTO `sys_job_log` VALUES (1740, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 03:15:00');
INSERT INTO `sys_job_log` VALUES (1741, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 03:30:00');
INSERT INTO `sys_job_log` VALUES (1742, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 03:45:00');
INSERT INTO `sys_job_log` VALUES (1743, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 04:00:00');
INSERT INTO `sys_job_log` VALUES (1744, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-02 04:15:00');
INSERT INTO `sys_job_log` VALUES (1745, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 04:30:00');
INSERT INTO `sys_job_log` VALUES (1746, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 04:45:00');
INSERT INTO `sys_job_log` VALUES (1747, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 05:00:00');
INSERT INTO `sys_job_log` VALUES (1748, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 05:15:00');
INSERT INTO `sys_job_log` VALUES (1749, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 05:30:00');
INSERT INTO `sys_job_log` VALUES (1750, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 05:45:00');
INSERT INTO `sys_job_log` VALUES (1751, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 06:00:00');
INSERT INTO `sys_job_log` VALUES (1752, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 06:15:00');
INSERT INTO `sys_job_log` VALUES (1753, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 06:30:00');
INSERT INTO `sys_job_log` VALUES (1754, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 06:45:00');
INSERT INTO `sys_job_log` VALUES (1755, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 07:00:00');
INSERT INTO `sys_job_log` VALUES (1756, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 07:15:00');
INSERT INTO `sys_job_log` VALUES (1757, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-02 07:30:00');
INSERT INTO `sys_job_log` VALUES (1758, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 07:45:00');
INSERT INTO `sys_job_log` VALUES (1759, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 08:00:00');
INSERT INTO `sys_job_log` VALUES (1760, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 08:15:00');
INSERT INTO `sys_job_log` VALUES (1761, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 08:30:00');
INSERT INTO `sys_job_log` VALUES (1762, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 08:45:00');
INSERT INTO `sys_job_log` VALUES (1763, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 09:00:00');
INSERT INTO `sys_job_log` VALUES (1764, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 09:15:00');
INSERT INTO `sys_job_log` VALUES (1765, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 09:30:00');
INSERT INTO `sys_job_log` VALUES (1766, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 09:45:00');
INSERT INTO `sys_job_log` VALUES (1767, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 10:00:00');
INSERT INTO `sys_job_log` VALUES (1768, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 10:15:00');
INSERT INTO `sys_job_log` VALUES (1769, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 10:30:00');
INSERT INTO `sys_job_log` VALUES (1770, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 10:45:00');
INSERT INTO `sys_job_log` VALUES (1771, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 11:00:00');
INSERT INTO `sys_job_log` VALUES (1772, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 11:15:00');
INSERT INTO `sys_job_log` VALUES (1773, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-02 11:30:00');
INSERT INTO `sys_job_log` VALUES (1774, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 11:45:00');
INSERT INTO `sys_job_log` VALUES (1775, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 12:00:00');
INSERT INTO `sys_job_log` VALUES (1776, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 12:15:00');
INSERT INTO `sys_job_log` VALUES (1777, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 12:30:00');
INSERT INTO `sys_job_log` VALUES (1778, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 12:45:00');
INSERT INTO `sys_job_log` VALUES (1779, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 13:00:00');
INSERT INTO `sys_job_log` VALUES (1780, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 13:15:00');
INSERT INTO `sys_job_log` VALUES (1781, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 13:30:00');
INSERT INTO `sys_job_log` VALUES (1782, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 13:45:00');
INSERT INTO `sys_job_log` VALUES (1783, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 14:00:00');
INSERT INTO `sys_job_log` VALUES (1784, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 14:15:00');
INSERT INTO `sys_job_log` VALUES (1785, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 14:30:00');
INSERT INTO `sys_job_log` VALUES (1786, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 14:45:00');
INSERT INTO `sys_job_log` VALUES (1787, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 15:00:00');
INSERT INTO `sys_job_log` VALUES (1788, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 15:15:00');
INSERT INTO `sys_job_log` VALUES (1789, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 15:30:00');
INSERT INTO `sys_job_log` VALUES (1790, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 15:45:00');
INSERT INTO `sys_job_log` VALUES (1791, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 16:00:00');
INSERT INTO `sys_job_log` VALUES (1792, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 16:15:00');
INSERT INTO `sys_job_log` VALUES (1793, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 16:30:00');
INSERT INTO `sys_job_log` VALUES (1794, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 16:45:00');
INSERT INTO `sys_job_log` VALUES (1795, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-02 17:00:00');
INSERT INTO `sys_job_log` VALUES (1796, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 17:15:00');
INSERT INTO `sys_job_log` VALUES (1797, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 17:30:00');
INSERT INTO `sys_job_log` VALUES (1798, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-02 17:45:00');
INSERT INTO `sys_job_log` VALUES (1799, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 18:00:00');
INSERT INTO `sys_job_log` VALUES (1800, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 18:15:00');
INSERT INTO `sys_job_log` VALUES (1801, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 18:30:00');
INSERT INTO `sys_job_log` VALUES (1802, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 18:45:00');
INSERT INTO `sys_job_log` VALUES (1803, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 19:00:00');
INSERT INTO `sys_job_log` VALUES (1804, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-02 19:15:00');
INSERT INTO `sys_job_log` VALUES (1805, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 19:30:00');
INSERT INTO `sys_job_log` VALUES (1806, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 19:45:00');
INSERT INTO `sys_job_log` VALUES (1807, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 20:00:00');
INSERT INTO `sys_job_log` VALUES (1808, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 20:15:00');
INSERT INTO `sys_job_log` VALUES (1809, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-02 20:30:00');
INSERT INTO `sys_job_log` VALUES (1810, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 20:45:00');
INSERT INTO `sys_job_log` VALUES (1811, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 21:00:00');
INSERT INTO `sys_job_log` VALUES (1812, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 21:15:00');
INSERT INTO `sys_job_log` VALUES (1813, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 21:30:00');
INSERT INTO `sys_job_log` VALUES (1814, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 21:45:00');
INSERT INTO `sys_job_log` VALUES (1815, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 22:00:00');
INSERT INTO `sys_job_log` VALUES (1816, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-02 22:15:00');
INSERT INTO `sys_job_log` VALUES (1817, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 22:30:00');
INSERT INTO `sys_job_log` VALUES (1818, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 22:45:00');
INSERT INTO `sys_job_log` VALUES (1819, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 23:00:00');
INSERT INTO `sys_job_log` VALUES (1820, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-02 23:15:00');
INSERT INTO `sys_job_log` VALUES (1821, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 23:30:00');
INSERT INTO `sys_job_log` VALUES (1822, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-02 23:45:00');
INSERT INTO `sys_job_log` VALUES (1823, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 00:00:00');
INSERT INTO `sys_job_log` VALUES (1824, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 00:15:00');
INSERT INTO `sys_job_log` VALUES (1825, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 00:30:00');
INSERT INTO `sys_job_log` VALUES (1826, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 00:45:00');
INSERT INTO `sys_job_log` VALUES (1827, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 01:00:00');
INSERT INTO `sys_job_log` VALUES (1828, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 01:15:00');
INSERT INTO `sys_job_log` VALUES (1829, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-03 01:30:00');
INSERT INTO `sys_job_log` VALUES (1830, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 01:45:00');
INSERT INTO `sys_job_log` VALUES (1831, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 02:00:00');
INSERT INTO `sys_job_log` VALUES (1832, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 02:15:00');
INSERT INTO `sys_job_log` VALUES (1833, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 02:30:00');
INSERT INTO `sys_job_log` VALUES (1834, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 02:45:00');
INSERT INTO `sys_job_log` VALUES (1835, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 03:00:00');
INSERT INTO `sys_job_log` VALUES (1836, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 03:15:00');
INSERT INTO `sys_job_log` VALUES (1837, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 03:30:00');
INSERT INTO `sys_job_log` VALUES (1838, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-03 03:45:00');
INSERT INTO `sys_job_log` VALUES (1839, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 04:00:00');
INSERT INTO `sys_job_log` VALUES (1840, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 04:15:00');
INSERT INTO `sys_job_log` VALUES (1841, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 04:30:00');
INSERT INTO `sys_job_log` VALUES (1842, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 04:45:00');
INSERT INTO `sys_job_log` VALUES (1843, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-03 05:00:00');
INSERT INTO `sys_job_log` VALUES (1844, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 05:15:00');
INSERT INTO `sys_job_log` VALUES (1845, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 05:30:00');
INSERT INTO `sys_job_log` VALUES (1846, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 05:45:00');
INSERT INTO `sys_job_log` VALUES (1847, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 06:00:00');
INSERT INTO `sys_job_log` VALUES (1848, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 06:15:00');
INSERT INTO `sys_job_log` VALUES (1849, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 06:30:00');
INSERT INTO `sys_job_log` VALUES (1850, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 06:45:00');
INSERT INTO `sys_job_log` VALUES (1851, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 07:00:00');
INSERT INTO `sys_job_log` VALUES (1852, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 07:15:00');
INSERT INTO `sys_job_log` VALUES (1853, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 07:30:00');
INSERT INTO `sys_job_log` VALUES (1854, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 07:45:00');
INSERT INTO `sys_job_log` VALUES (1855, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 08:00:00');
INSERT INTO `sys_job_log` VALUES (1856, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 08:15:00');
INSERT INTO `sys_job_log` VALUES (1857, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 08:30:00');
INSERT INTO `sys_job_log` VALUES (1858, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 08:45:00');
INSERT INTO `sys_job_log` VALUES (1859, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-03 09:00:00');
INSERT INTO `sys_job_log` VALUES (1860, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 09:15:00');
INSERT INTO `sys_job_log` VALUES (1861, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 09:30:00');
INSERT INTO `sys_job_log` VALUES (1862, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 09:45:00');
INSERT INTO `sys_job_log` VALUES (1863, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 10:00:00');
INSERT INTO `sys_job_log` VALUES (1864, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 10:15:00');
INSERT INTO `sys_job_log` VALUES (1865, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 10:30:00');
INSERT INTO `sys_job_log` VALUES (1866, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 10:45:00');
INSERT INTO `sys_job_log` VALUES (1867, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 11:00:00');
INSERT INTO `sys_job_log` VALUES (1868, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 11:15:00');
INSERT INTO `sys_job_log` VALUES (1869, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 11:30:00');
INSERT INTO `sys_job_log` VALUES (1870, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-03 11:45:00');
INSERT INTO `sys_job_log` VALUES (1871, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 12:00:00');
INSERT INTO `sys_job_log` VALUES (1872, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 12:15:00');
INSERT INTO `sys_job_log` VALUES (1873, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 12:30:00');
INSERT INTO `sys_job_log` VALUES (1874, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-03 12:45:00');
INSERT INTO `sys_job_log` VALUES (1875, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-03 13:00:00');
INSERT INTO `sys_job_log` VALUES (1876, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 13:15:00');
INSERT INTO `sys_job_log` VALUES (1877, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 13:30:00');
INSERT INTO `sys_job_log` VALUES (1878, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-03 13:45:00');
INSERT INTO `sys_job_log` VALUES (1879, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 14:00:00');
INSERT INTO `sys_job_log` VALUES (1880, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 14:15:00');
INSERT INTO `sys_job_log` VALUES (1881, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 14:30:00');
INSERT INTO `sys_job_log` VALUES (1882, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 14:45:00');
INSERT INTO `sys_job_log` VALUES (1883, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 15:00:00');
INSERT INTO `sys_job_log` VALUES (1884, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 15:15:00');
INSERT INTO `sys_job_log` VALUES (1885, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 15:30:00');
INSERT INTO `sys_job_log` VALUES (1886, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 15:45:00');
INSERT INTO `sys_job_log` VALUES (1887, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 16:00:00');
INSERT INTO `sys_job_log` VALUES (1888, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 16:15:00');
INSERT INTO `sys_job_log` VALUES (1889, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 16:30:00');
INSERT INTO `sys_job_log` VALUES (1890, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 16:45:00');
INSERT INTO `sys_job_log` VALUES (1891, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-03 17:00:00');
INSERT INTO `sys_job_log` VALUES (1892, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 17:15:00');
INSERT INTO `sys_job_log` VALUES (1893, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 17:30:00');
INSERT INTO `sys_job_log` VALUES (1894, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 17:45:00');
INSERT INTO `sys_job_log` VALUES (1895, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 18:00:00');
INSERT INTO `sys_job_log` VALUES (1896, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 18:15:00');
INSERT INTO `sys_job_log` VALUES (1897, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 18:30:00');
INSERT INTO `sys_job_log` VALUES (1898, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 18:45:00');
INSERT INTO `sys_job_log` VALUES (1899, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 19:00:00');
INSERT INTO `sys_job_log` VALUES (1900, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 19:15:00');
INSERT INTO `sys_job_log` VALUES (1901, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 19:30:00');
INSERT INTO `sys_job_log` VALUES (1902, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 19:45:00');
INSERT INTO `sys_job_log` VALUES (1903, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 20:00:00');
INSERT INTO `sys_job_log` VALUES (1904, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 20:15:00');
INSERT INTO `sys_job_log` VALUES (1905, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 20:30:00');
INSERT INTO `sys_job_log` VALUES (1906, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 20:45:00');
INSERT INTO `sys_job_log` VALUES (1907, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 21:00:00');
INSERT INTO `sys_job_log` VALUES (1908, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-03 21:15:00');
INSERT INTO `sys_job_log` VALUES (1909, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 21:30:00');
INSERT INTO `sys_job_log` VALUES (1910, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-03 21:45:00');
INSERT INTO `sys_job_log` VALUES (1911, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 22:00:00');
INSERT INTO `sys_job_log` VALUES (1912, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 22:15:00');
INSERT INTO `sys_job_log` VALUES (1913, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 22:30:00');
INSERT INTO `sys_job_log` VALUES (1914, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 22:45:00');
INSERT INTO `sys_job_log` VALUES (1915, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-03 23:00:00');
INSERT INTO `sys_job_log` VALUES (1916, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 23:15:00');
INSERT INTO `sys_job_log` VALUES (1917, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 23:30:00');
INSERT INTO `sys_job_log` VALUES (1918, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-03 23:45:00');
INSERT INTO `sys_job_log` VALUES (1919, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 00:00:00');
INSERT INTO `sys_job_log` VALUES (1920, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 00:15:00');
INSERT INTO `sys_job_log` VALUES (1921, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 00:30:00');
INSERT INTO `sys_job_log` VALUES (1922, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 00:45:00');
INSERT INTO `sys_job_log` VALUES (1923, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-04 01:00:00');
INSERT INTO `sys_job_log` VALUES (1924, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 01:15:00');
INSERT INTO `sys_job_log` VALUES (1925, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 01:30:00');
INSERT INTO `sys_job_log` VALUES (1926, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-04 01:45:00');
INSERT INTO `sys_job_log` VALUES (1927, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 02:00:00');
INSERT INTO `sys_job_log` VALUES (1928, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 02:15:00');
INSERT INTO `sys_job_log` VALUES (1929, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 02:30:00');
INSERT INTO `sys_job_log` VALUES (1930, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 02:45:00');
INSERT INTO `sys_job_log` VALUES (1931, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 03:00:00');
INSERT INTO `sys_job_log` VALUES (1932, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-04 03:15:00');
INSERT INTO `sys_job_log` VALUES (1933, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 03:30:00');
INSERT INTO `sys_job_log` VALUES (1934, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 03:45:00');
INSERT INTO `sys_job_log` VALUES (1935, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 04:00:00');
INSERT INTO `sys_job_log` VALUES (1936, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 04:15:00');
INSERT INTO `sys_job_log` VALUES (1937, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 04:30:00');
INSERT INTO `sys_job_log` VALUES (1938, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 04:45:00');
INSERT INTO `sys_job_log` VALUES (1939, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 05:00:00');
INSERT INTO `sys_job_log` VALUES (1940, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 05:15:00');
INSERT INTO `sys_job_log` VALUES (1941, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 05:30:00');
INSERT INTO `sys_job_log` VALUES (1942, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 05:45:00');
INSERT INTO `sys_job_log` VALUES (1943, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 06:00:00');
INSERT INTO `sys_job_log` VALUES (1944, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 06:15:00');
INSERT INTO `sys_job_log` VALUES (1945, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 06:30:00');
INSERT INTO `sys_job_log` VALUES (1946, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 06:45:00');
INSERT INTO `sys_job_log` VALUES (1947, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-04 07:00:00');
INSERT INTO `sys_job_log` VALUES (1948, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 07:15:00');
INSERT INTO `sys_job_log` VALUES (1949, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 07:30:00');
INSERT INTO `sys_job_log` VALUES (1950, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：7毫秒', '0', '', '2024-06-04 07:45:00');
INSERT INTO `sys_job_log` VALUES (1951, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 08:00:00');
INSERT INTO `sys_job_log` VALUES (1952, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-04 08:15:00');
INSERT INTO `sys_job_log` VALUES (1953, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-04 08:30:00');
INSERT INTO `sys_job_log` VALUES (1954, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 08:45:00');
INSERT INTO `sys_job_log` VALUES (1955, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 09:00:00');
INSERT INTO `sys_job_log` VALUES (1956, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 09:15:00');
INSERT INTO `sys_job_log` VALUES (1957, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-04 09:30:00');
INSERT INTO `sys_job_log` VALUES (1958, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 09:45:00');
INSERT INTO `sys_job_log` VALUES (1959, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 10:00:00');
INSERT INTO `sys_job_log` VALUES (1960, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-04 10:15:00');
INSERT INTO `sys_job_log` VALUES (1961, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 10:30:00');
INSERT INTO `sys_job_log` VALUES (1962, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 10:45:00');
INSERT INTO `sys_job_log` VALUES (1963, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 11:00:00');
INSERT INTO `sys_job_log` VALUES (1964, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 11:15:00');
INSERT INTO `sys_job_log` VALUES (1965, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-04 11:30:00');
INSERT INTO `sys_job_log` VALUES (1966, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 11:45:00');
INSERT INTO `sys_job_log` VALUES (1967, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 12:00:00');
INSERT INTO `sys_job_log` VALUES (1968, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 12:15:00');
INSERT INTO `sys_job_log` VALUES (1969, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 12:30:00');
INSERT INTO `sys_job_log` VALUES (1970, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 12:45:00');
INSERT INTO `sys_job_log` VALUES (1971, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 13:00:00');
INSERT INTO `sys_job_log` VALUES (1972, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 13:15:00');
INSERT INTO `sys_job_log` VALUES (1973, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 13:30:00');
INSERT INTO `sys_job_log` VALUES (1974, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 13:45:00');
INSERT INTO `sys_job_log` VALUES (1975, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 14:00:00');
INSERT INTO `sys_job_log` VALUES (1976, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 14:15:00');
INSERT INTO `sys_job_log` VALUES (1977, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 14:30:00');
INSERT INTO `sys_job_log` VALUES (1978, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 14:45:00');
INSERT INTO `sys_job_log` VALUES (1979, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 15:00:00');
INSERT INTO `sys_job_log` VALUES (1980, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 15:15:00');
INSERT INTO `sys_job_log` VALUES (1981, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-04 15:30:00');
INSERT INTO `sys_job_log` VALUES (1982, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-04 15:45:00');
INSERT INTO `sys_job_log` VALUES (1983, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-04 16:00:00');
INSERT INTO `sys_job_log` VALUES (1984, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 16:15:00');
INSERT INTO `sys_job_log` VALUES (1985, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 16:30:00');
INSERT INTO `sys_job_log` VALUES (1986, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 16:45:00');
INSERT INTO `sys_job_log` VALUES (1987, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 17:00:00');
INSERT INTO `sys_job_log` VALUES (1988, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 17:15:00');
INSERT INTO `sys_job_log` VALUES (1989, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 17:30:00');
INSERT INTO `sys_job_log` VALUES (1990, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-04 17:45:00');
INSERT INTO `sys_job_log` VALUES (1991, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 18:00:00');
INSERT INTO `sys_job_log` VALUES (1992, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 18:15:00');
INSERT INTO `sys_job_log` VALUES (1993, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 18:30:00');
INSERT INTO `sys_job_log` VALUES (1994, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 18:45:00');
INSERT INTO `sys_job_log` VALUES (1995, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 19:00:00');
INSERT INTO `sys_job_log` VALUES (1996, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 19:15:00');
INSERT INTO `sys_job_log` VALUES (1997, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 19:30:00');
INSERT INTO `sys_job_log` VALUES (1998, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 19:45:00');
INSERT INTO `sys_job_log` VALUES (1999, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 20:00:00');
INSERT INTO `sys_job_log` VALUES (2000, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 20:15:00');
INSERT INTO `sys_job_log` VALUES (2001, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 20:30:00');
INSERT INTO `sys_job_log` VALUES (2002, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 20:45:00');
INSERT INTO `sys_job_log` VALUES (2003, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 21:00:00');
INSERT INTO `sys_job_log` VALUES (2004, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 21:15:00');
INSERT INTO `sys_job_log` VALUES (2005, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 21:30:00');
INSERT INTO `sys_job_log` VALUES (2006, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 21:45:00');
INSERT INTO `sys_job_log` VALUES (2007, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 22:00:00');
INSERT INTO `sys_job_log` VALUES (2008, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 22:15:00');
INSERT INTO `sys_job_log` VALUES (2009, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 22:30:00');
INSERT INTO `sys_job_log` VALUES (2010, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 22:45:00');
INSERT INTO `sys_job_log` VALUES (2011, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 23:00:00');
INSERT INTO `sys_job_log` VALUES (2012, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 23:15:00');
INSERT INTO `sys_job_log` VALUES (2013, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 23:30:00');
INSERT INTO `sys_job_log` VALUES (2014, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-04 23:45:00');
INSERT INTO `sys_job_log` VALUES (2015, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 00:00:00');
INSERT INTO `sys_job_log` VALUES (2016, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 00:15:00');
INSERT INTO `sys_job_log` VALUES (2017, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 00:30:00');
INSERT INTO `sys_job_log` VALUES (2018, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 00:45:00');
INSERT INTO `sys_job_log` VALUES (2019, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 01:00:00');
INSERT INTO `sys_job_log` VALUES (2020, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 01:15:00');
INSERT INTO `sys_job_log` VALUES (2021, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 01:30:00');
INSERT INTO `sys_job_log` VALUES (2022, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 01:45:00');
INSERT INTO `sys_job_log` VALUES (2023, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 02:00:00');
INSERT INTO `sys_job_log` VALUES (2024, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 02:15:00');
INSERT INTO `sys_job_log` VALUES (2025, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 02:30:00');
INSERT INTO `sys_job_log` VALUES (2026, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 02:45:00');
INSERT INTO `sys_job_log` VALUES (2027, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 03:00:00');
INSERT INTO `sys_job_log` VALUES (2028, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 03:15:00');
INSERT INTO `sys_job_log` VALUES (2029, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 03:30:00');
INSERT INTO `sys_job_log` VALUES (2030, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 03:45:00');
INSERT INTO `sys_job_log` VALUES (2031, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 04:00:00');
INSERT INTO `sys_job_log` VALUES (2032, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-05 04:15:00');
INSERT INTO `sys_job_log` VALUES (2033, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 04:30:00');
INSERT INTO `sys_job_log` VALUES (2034, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 04:45:00');
INSERT INTO `sys_job_log` VALUES (2035, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 05:00:00');
INSERT INTO `sys_job_log` VALUES (2036, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 05:15:00');
INSERT INTO `sys_job_log` VALUES (2037, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 05:30:00');
INSERT INTO `sys_job_log` VALUES (2038, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 05:45:00');
INSERT INTO `sys_job_log` VALUES (2039, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 06:00:00');
INSERT INTO `sys_job_log` VALUES (2040, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 06:15:00');
INSERT INTO `sys_job_log` VALUES (2041, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 06:30:00');
INSERT INTO `sys_job_log` VALUES (2042, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 06:45:00');
INSERT INTO `sys_job_log` VALUES (2043, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 07:00:00');
INSERT INTO `sys_job_log` VALUES (2044, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 07:15:00');
INSERT INTO `sys_job_log` VALUES (2045, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 07:30:00');
INSERT INTO `sys_job_log` VALUES (2046, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 07:45:00');
INSERT INTO `sys_job_log` VALUES (2047, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 08:00:00');
INSERT INTO `sys_job_log` VALUES (2048, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 08:15:00');
INSERT INTO `sys_job_log` VALUES (2049, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-05 08:30:00');
INSERT INTO `sys_job_log` VALUES (2050, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 08:45:00');
INSERT INTO `sys_job_log` VALUES (2051, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 09:00:00');
INSERT INTO `sys_job_log` VALUES (2052, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 09:15:00');
INSERT INTO `sys_job_log` VALUES (2053, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 09:30:00');
INSERT INTO `sys_job_log` VALUES (2054, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 09:45:00');
INSERT INTO `sys_job_log` VALUES (2055, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 10:00:00');
INSERT INTO `sys_job_log` VALUES (2056, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 10:15:00');
INSERT INTO `sys_job_log` VALUES (2057, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-05 10:30:00');
INSERT INTO `sys_job_log` VALUES (2058, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 10:45:00');
INSERT INTO `sys_job_log` VALUES (2059, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 11:00:00');
INSERT INTO `sys_job_log` VALUES (2060, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 11:15:00');
INSERT INTO `sys_job_log` VALUES (2061, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 11:30:00');
INSERT INTO `sys_job_log` VALUES (2062, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 11:45:00');
INSERT INTO `sys_job_log` VALUES (2063, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 12:00:00');
INSERT INTO `sys_job_log` VALUES (2064, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 12:15:00');
INSERT INTO `sys_job_log` VALUES (2065, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 12:30:00');
INSERT INTO `sys_job_log` VALUES (2066, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 12:45:00');
INSERT INTO `sys_job_log` VALUES (2067, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 13:00:00');
INSERT INTO `sys_job_log` VALUES (2068, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 13:15:00');
INSERT INTO `sys_job_log` VALUES (2069, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 13:30:00');
INSERT INTO `sys_job_log` VALUES (2070, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 13:45:00');
INSERT INTO `sys_job_log` VALUES (2071, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 14:00:00');
INSERT INTO `sys_job_log` VALUES (2072, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-05 14:15:00');
INSERT INTO `sys_job_log` VALUES (2073, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 14:30:00');
INSERT INTO `sys_job_log` VALUES (2074, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 14:45:00');
INSERT INTO `sys_job_log` VALUES (2075, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 15:00:00');
INSERT INTO `sys_job_log` VALUES (2076, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 15:15:00');
INSERT INTO `sys_job_log` VALUES (2077, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 15:30:00');
INSERT INTO `sys_job_log` VALUES (2078, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 15:45:00');
INSERT INTO `sys_job_log` VALUES (2079, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 16:00:00');
INSERT INTO `sys_job_log` VALUES (2080, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 16:15:00');
INSERT INTO `sys_job_log` VALUES (2081, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 16:30:00');
INSERT INTO `sys_job_log` VALUES (2082, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 16:45:00');
INSERT INTO `sys_job_log` VALUES (2083, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-05 17:00:00');
INSERT INTO `sys_job_log` VALUES (2084, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 17:15:00');
INSERT INTO `sys_job_log` VALUES (2085, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 17:30:00');
INSERT INTO `sys_job_log` VALUES (2086, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 17:45:00');
INSERT INTO `sys_job_log` VALUES (2087, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 18:00:00');
INSERT INTO `sys_job_log` VALUES (2088, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 18:15:00');
INSERT INTO `sys_job_log` VALUES (2089, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 18:30:00');
INSERT INTO `sys_job_log` VALUES (2090, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 18:45:00');
INSERT INTO `sys_job_log` VALUES (2091, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 19:00:00');
INSERT INTO `sys_job_log` VALUES (2092, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 19:15:00');
INSERT INTO `sys_job_log` VALUES (2093, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 19:30:00');
INSERT INTO `sys_job_log` VALUES (2094, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 19:45:00');
INSERT INTO `sys_job_log` VALUES (2095, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 20:00:00');
INSERT INTO `sys_job_log` VALUES (2096, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 20:15:00');
INSERT INTO `sys_job_log` VALUES (2097, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 20:30:00');
INSERT INTO `sys_job_log` VALUES (2098, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 20:45:00');
INSERT INTO `sys_job_log` VALUES (2099, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 21:00:00');
INSERT INTO `sys_job_log` VALUES (2100, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 21:15:00');
INSERT INTO `sys_job_log` VALUES (2101, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 21:30:00');
INSERT INTO `sys_job_log` VALUES (2102, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 21:45:00');
INSERT INTO `sys_job_log` VALUES (2103, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 22:00:00');
INSERT INTO `sys_job_log` VALUES (2104, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 22:15:00');
INSERT INTO `sys_job_log` VALUES (2105, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 22:30:00');
INSERT INTO `sys_job_log` VALUES (2106, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 22:45:00');
INSERT INTO `sys_job_log` VALUES (2107, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 23:00:00');
INSERT INTO `sys_job_log` VALUES (2108, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 23:15:00');
INSERT INTO `sys_job_log` VALUES (2109, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 23:30:00');
INSERT INTO `sys_job_log` VALUES (2110, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-05 23:45:00');
INSERT INTO `sys_job_log` VALUES (2111, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 00:00:00');
INSERT INTO `sys_job_log` VALUES (2112, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 00:15:00');
INSERT INTO `sys_job_log` VALUES (2113, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 00:30:00');
INSERT INTO `sys_job_log` VALUES (2114, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 00:45:00');
INSERT INTO `sys_job_log` VALUES (2115, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 01:00:00');
INSERT INTO `sys_job_log` VALUES (2116, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 01:15:00');
INSERT INTO `sys_job_log` VALUES (2117, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 01:30:00');
INSERT INTO `sys_job_log` VALUES (2118, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 01:45:00');
INSERT INTO `sys_job_log` VALUES (2119, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 02:00:00');
INSERT INTO `sys_job_log` VALUES (2120, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 02:15:00');
INSERT INTO `sys_job_log` VALUES (2121, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 02:30:00');
INSERT INTO `sys_job_log` VALUES (2122, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 02:45:00');
INSERT INTO `sys_job_log` VALUES (2123, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 03:00:00');
INSERT INTO `sys_job_log` VALUES (2124, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 03:15:00');
INSERT INTO `sys_job_log` VALUES (2125, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：6毫秒', '0', '', '2024-06-06 03:29:57');
INSERT INTO `sys_job_log` VALUES (2126, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 03:44:57');
INSERT INTO `sys_job_log` VALUES (2127, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：9毫秒', '0', '', '2024-06-06 03:45:00');
INSERT INTO `sys_job_log` VALUES (2128, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-06 03:59:57');
INSERT INTO `sys_job_log` VALUES (2129, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 04:00:00');
INSERT INTO `sys_job_log` VALUES (2130, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 04:14:57');
INSERT INTO `sys_job_log` VALUES (2131, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 04:15:00');
INSERT INTO `sys_job_log` VALUES (2132, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 04:29:57');
INSERT INTO `sys_job_log` VALUES (2133, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 04:30:00');
INSERT INTO `sys_job_log` VALUES (2134, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 04:44:57');
INSERT INTO `sys_job_log` VALUES (2135, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 04:45:00');
INSERT INTO `sys_job_log` VALUES (2136, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 04:59:57');
INSERT INTO `sys_job_log` VALUES (2137, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 05:00:00');
INSERT INTO `sys_job_log` VALUES (2138, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 05:14:57');
INSERT INTO `sys_job_log` VALUES (2139, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 05:15:00');
INSERT INTO `sys_job_log` VALUES (2140, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 05:29:57');
INSERT INTO `sys_job_log` VALUES (2141, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 05:30:00');
INSERT INTO `sys_job_log` VALUES (2142, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 05:44:57');
INSERT INTO `sys_job_log` VALUES (2143, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-06 05:45:00');
INSERT INTO `sys_job_log` VALUES (2144, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 05:59:57');
INSERT INTO `sys_job_log` VALUES (2145, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-06 06:00:00');
INSERT INTO `sys_job_log` VALUES (2146, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 06:14:57');
INSERT INTO `sys_job_log` VALUES (2147, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 06:15:00');
INSERT INTO `sys_job_log` VALUES (2148, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 06:29:57');
INSERT INTO `sys_job_log` VALUES (2149, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 06:30:00');
INSERT INTO `sys_job_log` VALUES (2150, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-06 06:44:57');
INSERT INTO `sys_job_log` VALUES (2151, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 06:45:00');
INSERT INTO `sys_job_log` VALUES (2152, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 06:59:57');
INSERT INTO `sys_job_log` VALUES (2153, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 07:00:00');
INSERT INTO `sys_job_log` VALUES (2154, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：2毫秒', '0', '', '2024-06-06 07:14:57');
INSERT INTO `sys_job_log` VALUES (2155, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 07:15:00');
INSERT INTO `sys_job_log` VALUES (2156, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：2毫秒', '0', '', '2024-06-06 07:29:57');
INSERT INTO `sys_job_log` VALUES (2157, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-06 07:30:00');
INSERT INTO `sys_job_log` VALUES (2158, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：3毫秒', '0', '', '2024-06-06 07:44:57');
INSERT INTO `sys_job_log` VALUES (2159, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 07:45:00');
INSERT INTO `sys_job_log` VALUES (2160, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：3毫秒', '0', '', '2024-06-06 07:59:57');
INSERT INTO `sys_job_log` VALUES (2161, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 08:00:00');
INSERT INTO `sys_job_log` VALUES (2162, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：5毫秒', '0', '', '2024-06-06 08:14:57');
INSERT INTO `sys_job_log` VALUES (2163, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 08:15:00');
INSERT INTO `sys_job_log` VALUES (2164, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：8毫秒', '0', '', '2024-06-06 08:30:00');
INSERT INTO `sys_job_log` VALUES (2165, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：12毫秒', '0', '', '2024-06-06 08:45:00');
INSERT INTO `sys_job_log` VALUES (2166, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 09:00:00');
INSERT INTO `sys_job_log` VALUES (2167, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 09:15:00');
INSERT INTO `sys_job_log` VALUES (2168, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 09:30:00');
INSERT INTO `sys_job_log` VALUES (2169, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 09:45:00');
INSERT INTO `sys_job_log` VALUES (2170, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-06 10:00:00');
INSERT INTO `sys_job_log` VALUES (2171, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 10:15:00');
INSERT INTO `sys_job_log` VALUES (2172, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 10:30:00');
INSERT INTO `sys_job_log` VALUES (2173, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 10:45:00');
INSERT INTO `sys_job_log` VALUES (2174, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 11:00:00');
INSERT INTO `sys_job_log` VALUES (2175, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 11:15:00');
INSERT INTO `sys_job_log` VALUES (2176, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 11:30:00');
INSERT INTO `sys_job_log` VALUES (2177, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-06 11:45:00');
INSERT INTO `sys_job_log` VALUES (2178, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 12:00:00');
INSERT INTO `sys_job_log` VALUES (2179, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 12:15:00');
INSERT INTO `sys_job_log` VALUES (2180, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 12:30:00');
INSERT INTO `sys_job_log` VALUES (2181, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 12:45:00');
INSERT INTO `sys_job_log` VALUES (2182, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-06 13:00:00');
INSERT INTO `sys_job_log` VALUES (2183, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 13:15:00');
INSERT INTO `sys_job_log` VALUES (2184, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 13:30:00');
INSERT INTO `sys_job_log` VALUES (2185, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 13:45:00');
INSERT INTO `sys_job_log` VALUES (2186, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 14:00:00');
INSERT INTO `sys_job_log` VALUES (2187, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 14:15:00');
INSERT INTO `sys_job_log` VALUES (2188, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 14:30:00');
INSERT INTO `sys_job_log` VALUES (2189, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 14:45:00');
INSERT INTO `sys_job_log` VALUES (2190, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 15:00:00');
INSERT INTO `sys_job_log` VALUES (2191, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 15:15:00');
INSERT INTO `sys_job_log` VALUES (2192, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 15:30:00');
INSERT INTO `sys_job_log` VALUES (2193, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 15:45:00');
INSERT INTO `sys_job_log` VALUES (2194, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 16:00:00');
INSERT INTO `sys_job_log` VALUES (2195, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 16:15:00');
INSERT INTO `sys_job_log` VALUES (2196, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 16:30:00');
INSERT INTO `sys_job_log` VALUES (2197, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 16:45:00');
INSERT INTO `sys_job_log` VALUES (2198, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 17:00:00');
INSERT INTO `sys_job_log` VALUES (2199, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 17:15:00');
INSERT INTO `sys_job_log` VALUES (2200, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 17:30:00');
INSERT INTO `sys_job_log` VALUES (2201, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 17:45:00');
INSERT INTO `sys_job_log` VALUES (2202, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 18:00:00');
INSERT INTO `sys_job_log` VALUES (2203, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 18:15:00');
INSERT INTO `sys_job_log` VALUES (2204, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 18:30:00');
INSERT INTO `sys_job_log` VALUES (2205, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 18:45:00');
INSERT INTO `sys_job_log` VALUES (2206, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 19:00:00');
INSERT INTO `sys_job_log` VALUES (2207, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 19:15:00');
INSERT INTO `sys_job_log` VALUES (2208, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-06 19:30:00');
INSERT INTO `sys_job_log` VALUES (2209, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 19:45:00');
INSERT INTO `sys_job_log` VALUES (2210, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 20:00:00');
INSERT INTO `sys_job_log` VALUES (2211, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 20:15:00');
INSERT INTO `sys_job_log` VALUES (2212, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 20:30:00');
INSERT INTO `sys_job_log` VALUES (2213, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 20:45:00');
INSERT INTO `sys_job_log` VALUES (2214, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 21:00:00');
INSERT INTO `sys_job_log` VALUES (2215, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 21:15:00');
INSERT INTO `sys_job_log` VALUES (2216, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-06 21:30:00');
INSERT INTO `sys_job_log` VALUES (2217, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 21:45:00');
INSERT INTO `sys_job_log` VALUES (2218, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 22:00:00');
INSERT INTO `sys_job_log` VALUES (2219, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 22:15:00');
INSERT INTO `sys_job_log` VALUES (2220, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 22:30:00');
INSERT INTO `sys_job_log` VALUES (2221, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 22:45:00');
INSERT INTO `sys_job_log` VALUES (2222, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 23:00:00');
INSERT INTO `sys_job_log` VALUES (2223, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 23:15:00');
INSERT INTO `sys_job_log` VALUES (2224, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 23:30:00');
INSERT INTO `sys_job_log` VALUES (2225, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-06 23:45:00');
INSERT INTO `sys_job_log` VALUES (2226, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-07 00:00:00');
INSERT INTO `sys_job_log` VALUES (2227, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-07 00:15:00');
INSERT INTO `sys_job_log` VALUES (2228, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：2毫秒', '0', '', '2024-06-07 00:30:00');
INSERT INTO `sys_job_log` VALUES (2229, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-07 00:45:00');
INSERT INTO `sys_job_log` VALUES (2230, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-07 01:00:00');
INSERT INTO `sys_job_log` VALUES (2231, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-07 01:15:00');
INSERT INTO `sys_job_log` VALUES (2232, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-07 01:30:00');
INSERT INTO `sys_job_log` VALUES (2233, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-07 01:45:00');
INSERT INTO `sys_job_log` VALUES (2234, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-07 02:00:00');
INSERT INTO `sys_job_log` VALUES (2235, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-07 02:15:00');
INSERT INTO `sys_job_log` VALUES (2236, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-07 02:30:00');
INSERT INTO `sys_job_log` VALUES (2237, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-07 02:45:00');
INSERT INTO `sys_job_log` VALUES (2238, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-07 03:00:00');
INSERT INTO `sys_job_log` VALUES (2239, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-07 03:15:00');
INSERT INTO `sys_job_log` VALUES (2240, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-07 03:30:00');
INSERT INTO `sys_job_log` VALUES (2241, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-07 03:45:00');
INSERT INTO `sys_job_log` VALUES (2242, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-07 04:00:00');
INSERT INTO `sys_job_log` VALUES (2243, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-07 04:15:00');
INSERT INTO `sys_job_log` VALUES (2244, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-07 04:30:00');
INSERT INTO `sys_job_log` VALUES (2245, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-07 04:45:00');
INSERT INTO `sys_job_log` VALUES (2246, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-07 05:00:00');
INSERT INTO `sys_job_log` VALUES (2247, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-07 05:15:00');
INSERT INTO `sys_job_log` VALUES (2248, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-07 05:30:00');
INSERT INTO `sys_job_log` VALUES (2249, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-07 05:45:00');
INSERT INTO `sys_job_log` VALUES (2250, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：7毫秒', '0', '', '2024-06-07 06:00:00');
INSERT INTO `sys_job_log` VALUES (2251, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-07 06:15:00');
INSERT INTO `sys_job_log` VALUES (2252, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-07 06:30:00');
INSERT INTO `sys_job_log` VALUES (2253, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-07 06:45:00');
INSERT INTO `sys_job_log` VALUES (2254, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-07 07:00:00');
INSERT INTO `sys_job_log` VALUES (2255, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-07 07:15:00');
INSERT INTO `sys_job_log` VALUES (2256, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：1毫秒', '0', '', '2024-06-07 07:30:00');
INSERT INTO `sys_job_log` VALUES (2257, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-07 07:45:00');
INSERT INTO `sys_job_log` VALUES (2258, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-07 08:00:00');
INSERT INTO `sys_job_log` VALUES (2259, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-07 08:15:00');
INSERT INTO `sys_job_log` VALUES (2260, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-07 08:30:00');
INSERT INTO `sys_job_log` VALUES (2261, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-07 08:45:00');
INSERT INTO `sys_job_log` VALUES (2262, '同步项目进度信息', 'DEFAULT', 'pmsTask.syncProjectProgress()', '同步项目进度信息 总共耗时：0毫秒', '0', '', '2024-06-07 09:00:00');

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 112 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (1, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-05-18 12:13:38');
INSERT INTO `sys_logininfor` VALUES (2, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-18 12:13:48');
INSERT INTO `sys_logininfor` VALUES (3, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-18 13:49:16');
INSERT INTO `sys_logininfor` VALUES (4, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-18 13:49:23');
INSERT INTO `sys_logininfor` VALUES (5, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-18 14:23:28');
INSERT INTO `sys_logininfor` VALUES (6, 'admin', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-18 14:35:08');
INSERT INTO `sys_logininfor` VALUES (7, 'admin', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-18 14:35:20');
INSERT INTO `sys_logininfor` VALUES (8, 'admin', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-05-18 14:48:47');
INSERT INTO `sys_logininfor` VALUES (9, 'admin', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-18 14:54:21');
INSERT INTO `sys_logininfor` VALUES (10, 'admin', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-05-18 14:54:25');
INSERT INTO `sys_logininfor` VALUES (11, 'admin', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-18 14:54:29');
INSERT INTO `sys_logininfor` VALUES (12, 'admin', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-18 14:54:37');
INSERT INTO `sys_logininfor` VALUES (13, 'admin', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-05-18 14:54:42');
INSERT INTO `sys_logininfor` VALUES (14, 'admin', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-18 14:54:45');
INSERT INTO `sys_logininfor` VALUES (15, 'admin', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-18 14:54:52');
INSERT INTO `sys_logininfor` VALUES (16, 'rd1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-18 15:07:20');
INSERT INTO `sys_logininfor` VALUES (17, 'rd1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-05-18 15:07:53');
INSERT INTO `sys_logininfor` VALUES (18, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-19 01:53:36');
INSERT INTO `sys_logininfor` VALUES (19, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-19 01:56:52');
INSERT INTO `sys_logininfor` VALUES (20, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-19 01:56:59');
INSERT INTO `sys_logininfor` VALUES (21, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-19 02:59:24');
INSERT INTO `sys_logininfor` VALUES (22, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-19 03:10:26');
INSERT INTO `sys_logininfor` VALUES (23, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-19 03:14:48');
INSERT INTO `sys_logininfor` VALUES (24, 'rd1', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-24 06:52:00');
INSERT INTO `sys_logininfor` VALUES (25, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-24 08:51:37');
INSERT INTO `sys_logininfor` VALUES (26, 'rd1', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-05-24 08:52:07');
INSERT INTO `sys_logininfor` VALUES (27, 'rd1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-24 08:52:17');
INSERT INTO `sys_logininfor` VALUES (28, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-05-24 11:44:35');
INSERT INTO `sys_logininfor` VALUES (29, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-24 11:44:41');
INSERT INTO `sys_logininfor` VALUES (30, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-05-24 11:46:38');
INSERT INTO `sys_logininfor` VALUES (31, 'rd1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-24 11:46:45');
INSERT INTO `sys_logininfor` VALUES (32, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-24 11:48:01');
INSERT INTO `sys_logininfor` VALUES (33, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-05-24 11:48:11');
INSERT INTO `sys_logininfor` VALUES (34, 'rd1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-24 11:48:17');
INSERT INTO `sys_logininfor` VALUES (35, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-24 11:48:30');
INSERT INTO `sys_logininfor` VALUES (36, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-05-24 11:48:41');
INSERT INTO `sys_logininfor` VALUES (37, 'rd1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-24 11:48:48');
INSERT INTO `sys_logininfor` VALUES (38, 'rd1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-24 11:55:39');
INSERT INTO `sys_logininfor` VALUES (39, 'rd1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-24 13:02:14');
INSERT INTO `sys_logininfor` VALUES (40, 'rd1', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-25 01:36:15');
INSERT INTO `sys_logininfor` VALUES (41, 'rd1', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-25 01:37:53');
INSERT INTO `sys_logininfor` VALUES (42, 'rd1', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-05-25 01:40:40');
INSERT INTO `sys_logininfor` VALUES (43, 'rd1', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-25 01:40:46');
INSERT INTO `sys_logininfor` VALUES (44, 'rd1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-25 01:56:39');
INSERT INTO `sys_logininfor` VALUES (45, 'rd1', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-25 07:54:36');
INSERT INTO `sys_logininfor` VALUES (46, 'rd1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-25 12:37:01');
INSERT INTO `sys_logininfor` VALUES (47, 'rd1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-25 12:46:15');
INSERT INTO `sys_logininfor` VALUES (48, 'rd1', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-25 14:35:19');
INSERT INTO `sys_logininfor` VALUES (49, 'rd1', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-27 03:40:45');
INSERT INTO `sys_logininfor` VALUES (50, 'rd1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-05-27 07:47:34');
INSERT INTO `sys_logininfor` VALUES (51, 'rd1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-05-27 07:47:37');
INSERT INTO `sys_logininfor` VALUES (52, 'rd1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-27 07:47:43');
INSERT INTO `sys_logininfor` VALUES (53, 'rd1', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-27 08:55:28');
INSERT INTO `sys_logininfor` VALUES (54, 'rd1', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-05-27 09:00:14');
INSERT INTO `sys_logininfor` VALUES (55, 'rd1', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-05-27 09:02:42');
INSERT INTO `sys_logininfor` VALUES (56, 'rd1', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-27 09:02:45');
INSERT INTO `sys_logininfor` VALUES (57, 'rd1', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-27 09:51:52');
INSERT INTO `sys_logininfor` VALUES (58, 'rd1', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-28 01:32:49');
INSERT INTO `sys_logininfor` VALUES (59, 'rd1', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-05-28 01:37:34');
INSERT INTO `sys_logininfor` VALUES (60, 'admin', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-28 01:37:43');
INSERT INTO `sys_logininfor` VALUES (61, 'admin', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-05-28 01:38:38');
INSERT INTO `sys_logininfor` VALUES (62, 'rd1', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-28 01:38:43');
INSERT INTO `sys_logininfor` VALUES (63, 'rd1', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-28 03:06:54');
INSERT INTO `sys_logininfor` VALUES (64, 'rd1', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-28 10:33:19');
INSERT INTO `sys_logininfor` VALUES (65, 'rd1', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-29 07:37:09');
INSERT INTO `sys_logininfor` VALUES (66, 'rd1', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-30 09:54:19');
INSERT INTO `sys_logininfor` VALUES (67, 'rd1', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-31 02:55:15');
INSERT INTO `sys_logininfor` VALUES (68, 'rd1', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-04 07:41:43');
INSERT INTO `sys_logininfor` VALUES (69, 'rd1', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-05 07:17:30');
INSERT INTO `sys_logininfor` VALUES (70, 'rd1', '172.17.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-06-05 12:04:49');
INSERT INTO `sys_logininfor` VALUES (71, 'rd1', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-06 03:21:45');
INSERT INTO `sys_logininfor` VALUES (72, 'rd1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-06 03:21:56');
INSERT INTO `sys_logininfor` VALUES (73, 'rd1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-06 03:29:54');
INSERT INTO `sys_logininfor` VALUES (74, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-06 03:30:04');
INSERT INTO `sys_logininfor` VALUES (75, 'rd1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-06 03:30:53');
INSERT INTO `sys_logininfor` VALUES (76, 'rd1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-06 03:31:16');
INSERT INTO `sys_logininfor` VALUES (77, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-06 03:31:23');
INSERT INTO `sys_logininfor` VALUES (78, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-06 03:36:19');
INSERT INTO `sys_logininfor` VALUES (79, 'jiangjn', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-06-06 03:36:43');
INSERT INTO `sys_logininfor` VALUES (80, 'jiangjn', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-06-06 03:36:51');
INSERT INTO `sys_logininfor` VALUES (81, 'Jiangjn', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-06-06 03:37:08');
INSERT INTO `sys_logininfor` VALUES (82, 'Jiangjn', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-06-06 03:37:12');
INSERT INTO `sys_logininfor` VALUES (83, 'admin', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-06 03:37:20');
INSERT INTO `sys_logininfor` VALUES (84, 'admin', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-06 03:39:02');
INSERT INTO `sys_logininfor` VALUES (85, 'jiangjn', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-06 03:39:08');
INSERT INTO `sys_logininfor` VALUES (86, 'jiangjn', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-06 03:39:19');
INSERT INTO `sys_logininfor` VALUES (87, 'lid', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-06 03:39:24');
INSERT INTO `sys_logininfor` VALUES (88, 'lid', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-06 03:39:32');
INSERT INTO `sys_logininfor` VALUES (89, 'jiangjn', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-06 03:39:38');
INSERT INTO `sys_logininfor` VALUES (90, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-06-06 03:44:47');
INSERT INTO `sys_logininfor` VALUES (91, 'jiangjn', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-06 06:59:26');
INSERT INTO `sys_logininfor` VALUES (92, 'jiangjn', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-06 07:40:15');
INSERT INTO `sys_logininfor` VALUES (93, 'rd1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-06 07:40:23');
INSERT INTO `sys_logininfor` VALUES (94, 'rd1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-06 07:41:08');
INSERT INTO `sys_logininfor` VALUES (95, 'jiangjn', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-06 07:41:14');
INSERT INTO `sys_logininfor` VALUES (96, 'jiangjn', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-06 07:41:34');
INSERT INTO `sys_logininfor` VALUES (97, 'rd1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-06 07:41:45');
INSERT INTO `sys_logininfor` VALUES (98, 'rd1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-06 07:42:21');
INSERT INTO `sys_logininfor` VALUES (99, 'jiangjn', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-06 07:42:28');
INSERT INTO `sys_logininfor` VALUES (100, 'jiangjn', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-06 09:30:36');
INSERT INTO `sys_logininfor` VALUES (101, 'rd1', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-06 09:30:43');
INSERT INTO `sys_logininfor` VALUES (102, 'rd1', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-06 09:44:04');
INSERT INTO `sys_logininfor` VALUES (103, 'jiangjn', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-06 09:44:10');
INSERT INTO `sys_logininfor` VALUES (104, 'jiangjn', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-07 05:58:45');
INSERT INTO `sys_logininfor` VALUES (105, 'rd1', '172.17.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-06-07 06:56:50');
INSERT INTO `sys_logininfor` VALUES (106, 'rd1', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-07 07:22:17');
INSERT INTO `sys_logininfor` VALUES (107, 'rd1', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-07 08:43:59');
INSERT INTO `sys_logininfor` VALUES (108, 'jiangjn', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-07 08:57:51');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-07 08:58:01');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-06-07 09:00:01');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '172.17.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-07 09:00:06');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2013 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2024-04-07 12:42:00', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2024-04-07 12:42:00', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2024-04-07 12:42:00', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2024-04-07 12:42:00', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2024-04-07 12:42:00', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2024-04-07 12:42:00', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2024-04-07 12:42:00', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2024-04-07 12:42:00', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2024-04-07 12:42:00', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2024-04-07 12:42:00', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2024-04-07 12:42:00', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2024-04-07 12:42:00', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2024-04-07 12:42:00', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2024-04-07 12:42:00', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2024-04-07 12:42:00', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2024-04-07 12:42:00', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2024-04-07 12:42:00', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2024-04-07 12:42:00', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2024-04-07 12:42:00', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2024-04-07 12:42:00', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2024-04-07 12:42:00', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2024-04-07 12:42:00', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2024-04-07 12:42:00', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2024-04-07 12:42:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '项目管理', 0, 4, 'pms', NULL, NULL, 1, 0, 'M', '0', '0', '', 'documentation', 'admin', '2024-04-13 12:02:33', 'admin', '2024-05-02 06:47:09', '');
INSERT INTO `sys_menu` VALUES (2001, '全部项目', 2000, 1, 'project/public', 'pms/project/index', '{\"type\":1}', 1, 0, 'C', '0', '0', 'pms:project:list', 'nested', 'admin', '2024-04-13 12:05:06', 'admin', '2024-05-17 14:56:06', '');
INSERT INTO `sys_menu` VALUES (2003, '我的项目', 2000, 2, 'project/private', 'pms/project/index', '{\"type\":2}', 1, 0, 'C', '0', '0', 'pms:project:list', 'user', 'admin', '2024-04-23 01:44:23', 'admin', '2024-05-17 14:56:13', '');
INSERT INTO `sys_menu` VALUES (2004, '已归档项目', 2000, 3, 'project/archived', 'pms/project/index', '{\"type\":3}', 1, 0, 'C', '0', '0', 'pms:project:list', 'lock', 'admin', '2024-04-23 01:47:02', 'admin', '2024-05-03 13:34:57', '');
INSERT INTO `sys_menu` VALUES (2005, '已删除项目', 2000, 4, 'project/deleted', 'pms/project/index', '{\"type\":4}', 1, 0, 'C', '0', '0', 'pms:project:list', 'guide', 'admin', '2024-04-23 01:48:15', 'admin', '2024-05-03 13:35:16', '');
INSERT INTO `sys_menu` VALUES (2008, '保存', 2001, 0, '', NULL, NULL, 1, 0, 'F', '0', '0', 'pms:project:save', '#', 'admin', '2024-05-03 22:41:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '详细', 2001, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'pms:project:detail', '#', 'admin', '2024-05-03 22:42:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '删除', 2001, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'pms:project:delete', '#', 'admin', '2024-05-03 22:47:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '工作台', 2000, 0, 'workstation', 'pms/project/workstation', NULL, 1, 0, 'C', '0', '0', 'pms:project:workstation', 'monitor', 'admin', '2024-05-17 14:55:47', 'admin', '2024-05-17 14:56:00', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20) NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1, '操作日志', 9, 'com.ruoyi.web.controller.monitor.SysOperlogController.clean()', 'DELETE', 1, 'admin', '研发部门', '/monitor/operlog/clean', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-18 12:04:20', 1073);
INSERT INTO `sys_oper_log` VALUES (2, '登录日志', 9, 'com.ruoyi.web.controller.monitor.SysLogininforController.clean()', 'DELETE', 1, 'admin', '研发部门', '/monitor/logininfor/clean', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-18 12:04:26', 766);
INSERT INTO `sys_oper_log` VALUES (3, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":103,\"nickName\":\"rd1\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":3,\"userName\":\"研发经理\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-18 12:07:56', 159);
INSERT INTO `sys_oper_log` VALUES (4, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-05-18 12:07:56\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":103,\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"研发经理\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":3,\"userName\":\"研发经理\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-18 12:08:12', 103);
INSERT INTO `sys_oper_log` VALUES (5, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/user/3', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-18 12:08:18', 91);
INSERT INTO `sys_oper_log` VALUES (6, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"研发经理\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":4,\"userName\":\"rd1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-18 12:08:51', 208);
INSERT INTO `sys_oper_log` VALUES (7, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-05-18 12:08:51\",\"delFlag\":\"0\",\"deptId\":103,\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"研发经理\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":4,\"userName\":\"rd1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-18 12:08:59', 100);
INSERT INTO `sys_oper_log` VALUES (8, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/user/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-18 12:09:09', 269);
INSERT INTO `sys_oper_log` VALUES (9, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":103,\"nickName\":\"研发\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":5,\"userName\":\"user1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-18 12:11:10', 156);
INSERT INTO `sys_oper_log` VALUES (10, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', '研发部门', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-18 12:12:02', 140);
INSERT INTO `sys_oper_log` VALUES (11, '角色管理', 4, 'com.ruoyi.web.controller.system.SysRoleController.selectAuthUserAll()', 'PUT', 1, 'admin', '研发部门', '/system/role/authUser/selectAll', '172.17.0.1', '内网IP', '{\"roleId\":\"2\",\"userIds\":\"4,5\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-18 14:56:14', 86);
INSERT INTO `sys_oper_log` VALUES (12, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":3,\"configKey\":\"sys.index.sideTheme\",\"configName\":\"主框架页-侧边栏主题\",\"configType\":\"Y\",\"configValue\":\"theme-light\",\"createBy\":\"admin\",\"createTime\":\"2024-04-07 12:42:12\",\"params\":{},\"remark\":\"深色主题theme-dark，浅色主题theme-light\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-06 03:30:35', 194);
INSERT INTO `sys_oper_log` VALUES (13, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"nickName\":\"Lid\",\"params\":{},\"postIds\":[5],\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userName\":\"lid\"}', '{\"msg\":\"新增用户\'lid\'失败，登录账号已存在\",\"code\":500}', 0, NULL, '2024-06-06 03:33:03', 12);
INSERT INTO `sys_oper_log` VALUES (14, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"Lid\",\"params\":{},\"postIds\":[5],\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userId\":6,\"userName\":\"lid\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-06 03:33:03', 549);
INSERT INTO `sys_oper_log` VALUES (15, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-06-06 03:33:03\",\"delFlag\":\"0\",\"deptId\":103,\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"Lid\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[5],\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":6,\"userName\":\"lid\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-06 03:33:24', 506);
INSERT INTO `sys_oper_log` VALUES (16, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":103,\"nickName\":\"Jiangjn\",\"params\":{},\"postIds\":[5],\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userId\":7,\"userName\":\"jiangjn\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-06 03:33:56', 563);
INSERT INTO `sys_oper_log` VALUES (17, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"deptId\":103,\"nickName\":\"Linmz\",\"params\":{},\"postIds\":[5],\"roleIds\":[2],\"sex\":\"1\",\"status\":\"0\",\"userName\":\"linmz\"}', '{\"msg\":\"新增用户\'linmz\'失败，登录账号已存在\",\"code\":500}', 0, NULL, '2024-06-06 03:34:32', 15);
INSERT INTO `sys_oper_log` VALUES (18, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":103,\"nickName\":\"Linmz\",\"params\":{},\"postIds\":[5],\"roleIds\":[2],\"sex\":\"1\",\"status\":\"0\",\"userId\":8,\"userName\":\"linmz\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-06 03:34:32', 653);
INSERT INTO `sys_oper_log` VALUES (19, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":103,\"nickName\":\"Wuyf\",\"params\":{},\"postIds\":[5],\"roleIds\":[2],\"sex\":\"1\",\"status\":\"0\",\"userId\":9,\"userName\":\"wuyf\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-06 03:34:59', 775);
INSERT INTO `sys_oper_log` VALUES (20, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":103,\"nickName\":\"Lisf\",\"params\":{},\"postIds\":[5],\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userId\":10,\"userName\":\"lisf\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-06 03:35:22', 634);
INSERT INTO `sys_oper_log` VALUES (21, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":103,\"nickName\":\"Zhengxh\",\"params\":{},\"postIds\":[5],\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userId\":11,\"userName\":\"zhengxh\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-06 03:35:52', 673);
INSERT INTO `sys_oper_log` VALUES (22, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', '研发部门', '/system/user/resetPwd', '172.17.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":7}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-06 03:38:19', 270);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2024-04-07 12:41:58', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2024-04-07 12:41:58', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2024-04-07 12:41:58', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2024-04-07 12:41:58', '', NULL, '');
INSERT INTO `sys_post` VALUES (5, 'dev', '研发', 0, '0', 'admin', '2024-05-17 16:18:54', '', NULL, NULL);
INSERT INTO `sys_post` VALUES (6, 'test', '测试', 0, '0', 'admin', '2024-05-17 16:19:04', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2024-04-07 12:41:59', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2024-04-07 12:41:59', 'admin', '2024-05-17 15:07:58', '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 2000);
INSERT INTO `sys_role_menu` VALUES (2, 2001);
INSERT INTO `sys_role_menu` VALUES (2, 2003);
INSERT INTO `sys_role_menu` VALUES (2, 2004);
INSERT INTO `sys_role_menu` VALUES (2, 2005);
INSERT INTO `sys_role_menu` VALUES (2, 2008);
INSERT INTO `sys_role_menu` VALUES (2, 2009);
INSERT INTO `sys_role_menu` VALUES (2, 2010);
INSERT INTO `sys_role_menu` VALUES (2, 2012);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '系统管理员', '00', '', '', '1', '', '$2a$10$c.XW7vaZItvc0UHHKgme9.L0JoZ3jm4/kGUG/reFV72MmDStXEKGW', '0', '0', '172.17.0.1', '2024-06-07 17:00:06', 'admin', '2024-04-07 12:41:57', '', '2024-06-07 09:00:06', '管理员');
INSERT INTO `sys_user` VALUES (2, 103, 'ry', '江小宁', '00', '', '', '0', '', '$2a$10$SWDGz5wwXDlkYH9Txe4D6uPqdOVsAkWAvLXegdl2VcWpsAjW/18by', '0', '2', '127.0.0.1', '2024-05-18 18:30:08', 'admin', '2024-04-07 12:41:57', 'admin', '2024-05-18 10:30:05', '测试员');
INSERT INTO `sys_user` VALUES (4, 103, 'rd1', '研发经理', '00', '', '', '0', '', '$2a$10$Jp/1if7qqCqKbbnyWH/MueT2mAb8i01.QhPY0APewOP05AsAZ4ypa', '0', '0', '172.17.0.1', '2024-06-07 16:43:59', 'admin', '2024-05-18 12:08:51', 'admin', '2024-06-07 08:43:59', NULL);
INSERT INTO `sys_user` VALUES (5, 103, 'user1', '研发', '00', '', '', '0', '', '$2a$10$9pAdRbp715/9leGLlE9v7eDnYp2wP1x3/ZE84bDCL7RyNDPVf7IA.', '0', '0', '', NULL, 'admin', '2024-05-18 12:11:10', 'admin', '2024-05-18 12:12:02', NULL);
INSERT INTO `sys_user` VALUES (6, 103, 'lid', 'Lid', '00', '', '', '0', '', '$2a$10$c639QExQkj28EBwsV7OFSO1c92ysWAEqxnG.dndqJJ7sEOZsapgSy', '0', '0', '172.17.0.1', '2024-06-06 11:39:25', 'admin', '2024-06-06 03:33:03', 'admin', '2024-06-06 03:39:24', NULL);
INSERT INTO `sys_user` VALUES (7, 103, 'jiangjn', 'Jiangjn', '00', '', '', '0', '', '$2a$10$c.XW7vaZItvc0UHHKgme9.L0JoZ3jm4/kGUG/reFV72MmDStXEKGW', '0', '0', '172.17.0.1', '2024-06-07 13:58:45', 'admin', '2024-06-06 03:33:55', 'admin', '2024-06-07 05:58:44', NULL);
INSERT INTO `sys_user` VALUES (8, 103, 'linmz', 'Linmz', '00', '', '', '1', '', '$2a$10$IAkQ6sMxpn8M6Lk4rOJ8yOvHVUfFBfTwHXtyWMdAjDC3VXq49VSBW', '0', '0', '', NULL, 'admin', '2024-06-06 03:34:31', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (9, 103, 'wuyf', 'Wuyf', '00', '', '', '1', '', '$2a$10$ZfDHwynx5F6H5AR7WqzdnectcTrlsrbQHYFS1Rd.0O5PyjSWPobWK', '0', '0', '', NULL, 'admin', '2024-06-06 03:34:58', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (10, 103, 'lisf', 'Lisf', '00', '', '', '0', '', '$2a$10$leIcJaoi2pAbyu53na36vOw/fTO7xeV3UqnNKpS9Au6vTjvKBt9Na', '0', '0', '', NULL, 'admin', '2024-06-06 03:35:22', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (11, 103, 'zhengxh', 'Zhengxh', '00', '', '', '0', '', '$2a$10$/cK7ozUdX/FUmaTNfO6aLeG2ICFTu1MdQ.XlS5O6j5wAkovW9XBtm', '0', '0', '', NULL, 'admin', '2024-06-06 03:35:52', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (6, 5);
INSERT INTO `sys_user_post` VALUES (7, 5);
INSERT INTO `sys_user_post` VALUES (8, 5);
INSERT INTO `sys_user_post` VALUES (9, 5);
INSERT INTO `sys_user_post` VALUES (10, 5);
INSERT INTO `sys_user_post` VALUES (11, 5);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (4, 2);
INSERT INTO `sys_user_role` VALUES (5, 2);
INSERT INTO `sys_user_role` VALUES (6, 2);
INSERT INTO `sys_user_role` VALUES (7, 2);
INSERT INTO `sys_user_role` VALUES (8, 2);
INSERT INTO `sys_user_role` VALUES (9, 2);
INSERT INTO `sys_user_role` VALUES (10, 2);
INSERT INTO `sys_user_role` VALUES (11, 2);

SET FOREIGN_KEY_CHECKS = 1;
