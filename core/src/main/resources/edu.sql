/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : edu

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 20/08/2019 23:28:17
*/


DROP DATABASE IF EXISTS edu;
CREATE DATABASE edu;
USE `edu`;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for activity
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity`
(
    `id`         varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号，主键（uuid机制）',
    `delFlag`    tinyint(1)                                             NOT NULL COMMENT '删除标记(0正常，1删除，默认0正常)',
    `createTime` datetime(0)                                            NULL DEFAULT NULL COMMENT '创建时间（新增数据的时间）',
    `createBy`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人（用户的id）',
    `updateTime` datetime(0)                                            NULL DEFAULT NULL COMMENT '更新时间（修改数据的时间）',
    `updateBy`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人（用户的id）',
    `title`      varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '题目',
    `content`    text CHARACTER SET utf8 COLLATE utf8_general_ci        NOT NULL COMMENT '内容（加图片一类的）',
    `schoolsId`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '校区ID',
    `userId`     varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人ID',
    `startTime`  datetime(0)                                            NULL DEFAULT NULL COMMENT '活动开始时间',
    `endTime`    datetime(0)                                            NULL DEFAULT NULL COMMENT '活动结束时间',
    `remark`     varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `title` (`title`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`
(
    `id`         varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '编号，主键（uuid机制）',
    `delFlag`    tinyint(4)                                              NOT NULL COMMENT '删除标记（0正常，1删除，默认0正常）',
    `createTime` datetime(0)                                             NULL DEFAULT NULL COMMENT '创建时间（新增数据的时间）',
    `createBy`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '创建人（用户的id）',
    `updateTime` datetime(0)                                             NULL DEFAULT NULL COMMENT '更新时间（修改数据的时间）',
    `updateBy`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '更新人（用户的id）',
    `name`       varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '账号',
    `password`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '密码',
    `realName`   varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '姓名',
    `gender`     tinyint(4)                                              NULL DEFAULT NULL COMMENT '性别（0男1女，性别一旦确定不可修改）',
    `provinceId` int(11)                                                 NULL DEFAULT NULL COMMENT '省ID（关联中国省市区表的id）',
    `cityId`     int(11)                                                 NULL DEFAULT NULL COMMENT '市ID（关联中国省市区表的id）',
    `districtId` int(11)                                                 NULL DEFAULT NULL COMMENT '区ID（关联中国省市区表的id）',
    `addr`       varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地址（街道门牌号）',
    `birthday`   date                                                    NULL DEFAULT NULL COMMENT '出生日期（年月日格式）',
    `phone`      varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '电话',
    `adminState` tinyint(4)                                              NOT NULL COMMENT '状态（0在职，1离职，默认0）',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `name` (`name`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for apply
-- ----------------------------
DROP TABLE IF EXISTS `apply`;
CREATE TABLE `apply`
(
    `id`         varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号，主键（uuid机制）',
    `delFlag`    tinyint(1)                                             NOT NULL COMMENT '删除标记(0正常，1删除，默认0正常)',
    `createTime` datetime(0)                                            NULL DEFAULT NULL COMMENT '创建时间（新增数据的时间）',
    `createBy`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人（用户的id）',
    `updateTime` datetime(0)                                            NULL DEFAULT NULL COMMENT '更新时间（修改数据的时间）',
    `updateBy`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人（用户的id）',
    `name`       varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
    `phone`      varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电话',
    `schoolsId`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '校区',
    `classId`    varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '班级ID',
    `applyTime`  datetime(0)                                            NULL DEFAULT NULL COMMENT '报名时间',
    `state`      tinyint(4)                                             NULL DEFAULT NULL COMMENT '状态（0已批，1未批，2拒绝，默认1）',
    `remark`     varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注（拒绝原因、指定某班或老师）',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for area
-- ----------------------------
DROP TABLE IF EXISTS `area`;
CREATE TABLE `area`
(
    `id`         int(50)                                                 NOT NULL COMMENT '编号，主键（uuid机制）',
    `delFlag`    tinyint(1)                                              NOT NULL COMMENT '删除标记(0正常，1删除，默认0正常)',
    `createTime` datetime(0)                                             NULL DEFAULT NULL COMMENT '创建时间（新增数据的时间）',
    `createBy`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '创建人（用户的id）',
    `updateTime` datetime(0)                                             NULL DEFAULT NULL COMMENT '更新时间（修改数据的时间）',
    `updateBy`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '更新人（用户的id）',
    `name`       varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '省市名称',
    `parentId`   int(50)                                                 NOT NULL COMMENT '直属上级ID',
    `parentIds`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所有上级ID',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for classes
-- ----------------------------
DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes`
(
    `id`          varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号，主键（uuid机制）',
    `delFlag`     tinyint(1)                                             NOT NULL COMMENT '删除标记(0正常，1删除，默认0正常)',
    `createTime`  datetime(0)                                            NULL DEFAULT NULL COMMENT '创建时间（新增数据的时间）',
    `createBy`    varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人（用户的id）',
    `updateTime`  datetime(0)                                            NULL DEFAULT NULL COMMENT '更新时间（修改数据的时间）',
    `updateBy`    varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人（用户的id）',
    `name`        varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '班级名称',
    `description` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '班级描述',
    `classRoomId` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教室ID',
    `gradeId`     varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年级名称',
    `state`       tinyint(4)                                             NULL DEFAULT NULL COMMENT '班级状态（0未开课，1是开课中，默认是0）',
    `remark`      varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `name` (`name`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for classroom
-- ----------------------------
DROP TABLE IF EXISTS `classroom`;
CREATE TABLE `classroom`
(
    `id`         varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '编号，主键（uuid机制）',
    `delFlag`    tinyint(1)                                              NOT NULL COMMENT '删除标记(0正常，1删除，默认0正常)',
    `createTime` datetime(0)                                             NULL DEFAULT NULL COMMENT '创建时间（新增数据的时间）',
    `createBy`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '创建人（用户的id）',
    `updateTime` datetime(0)                                             NULL DEFAULT NULL COMMENT '更新时间（修改数据的时间）',
    `updateBy`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '更新人（用户的id）',
    `name`       varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '名称（例:20160101班）',
    `location`   varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '例：12栋5层102室',
    `state`      tinyint(20)                                             NULL DEFAULT NULL COMMENT '使用状态（0未使用，1使用中）',
    `schoolsId`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '所在校区',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `name` (`name`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company`
(
    `id`          varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '编号，主键（uuid机制）',
    `delFlag`     tinyint(4)                                              NOT NULL COMMENT '删除标记（0正常，1删除，默认0正常）',
    `createTime`  datetime(0)                                             NULL DEFAULT NULL COMMENT '创建时间（新增数据的时间）',
    `createBy`    varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '创建人（用户的id）',
    `updateTime`  datetime(0)                                             NULL DEFAULT NULL COMMENT '更新时间（修改数据的时间）',
    `updateBy`    varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '更新人（用户的id）',
    `name`        varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '该教育网站的名称',
    `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '该教育网站的简介',
    `phone`       varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '公司电话',
    `provinceId`  int(11)                                                 NULL DEFAULT NULL COMMENT '省ID（关联中国省市区表的id）',
    `cityId`      int(11)                                                 NULL DEFAULT NULL COMMENT '市ID（关联中国省市区表的id）',
    `districtId`  int(11)                                                 NULL DEFAULT NULL COMMENT '区ID （关联中国省市区表的id）',
    `addr`        varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址（街道门牌号）',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `name` (`name`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`
(
    `id`         varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号，主键（uuid机制）',
    `delFlag`    tinyint(1)                                             NOT NULL COMMENT '删除标记(0正常，1删除，默认0正常)',
    `createTime` datetime(0)                                            NULL DEFAULT NULL COMMENT '创建时间（新增数据的时间）',
    `createBy`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人（用户的id）',
    `updateTime` datetime(0)                                            NULL DEFAULT NULL COMMENT '更新时间（修改数据的时间）',
    `updateBy`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人（用户的id）',
    `name`       varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程名称',
    `userId`     varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任课老师',
    `courseStat` tinyint(4)                                             NOT NULL COMMENT '开课状态（0未开课，1开课，默认为0）',
    `remark`     varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `name` (`name`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for desgincourse
-- ----------------------------
DROP TABLE IF EXISTS `designcourse`;
CREATE TABLE `designcourse`
(
    `id`         varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '编号，主键（uuid机制）',
    `delFlag`    tinyint(1)                                              NOT NULL COMMENT '删除标记(0正常，1删除，默认0正常)',
    `createTime` datetime(0)                                             NULL DEFAULT NULL COMMENT '创建时间（新增数据的时间）',
    `createBy`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '创建人（用户的id）',
    `updateTime` datetime(0)                                             NULL DEFAULT NULL COMMENT '更新时间（修改数据的时间）',
    `updateBy`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '更新人（用户的id）',
    `name`       varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '课程名称',
    `courseId`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '任课老师',
    `classesId`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '班级ID',
    `startDate`  date                                                    NULL DEFAULT NULL COMMENT '开课时间',
    `beginTime`  datetime(0)                                             NULL DEFAULT NULL COMMENT '上课时间',
    `endTime`    datetime(0)                                             NULL DEFAULT NULL COMMENT '下课时间',
    `classHour`  int(11)                                                 NULL DEFAULT NULL COMMENT '课时',
    `remark`     varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `name` (`name`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for development
-- ----------------------------
DROP TABLE IF EXISTS `development`;
CREATE TABLE `development`
(
    `id`          varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号，主键（uuid机制）',
    `delFlag`     tinyint(4)                                             NOT NULL COMMENT '删除标记（0正常，1删除，默认0正常）',
    `createTime`  datetime(0)                                            NULL DEFAULT NULL COMMENT '创建时间（新增数据时间）',
    `createBy`    varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人（用户的id）',
    `updateTime`  datetime(0)                                            NULL DEFAULT NULL COMMENT '跟新时间（修改数据的时间）',
    `updateBy`    varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '跟新人（用户的id）',
    `title`       varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '荣誉名称',
    `content`     text CHARACTER SET utf8 COLLATE utf8_general_ci        NULL COMMENT '荣誉内容（使用编辑出来的内容，包括图片）',
    `historyType` tinyint(4)                                             NOT NULL COMMENT '类型（0荣誉 1 历史）',
    `companyId`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '（公司ID）与公司关联',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `title` (`title`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file`
(
    `id`         varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号，主键（uuid机制）',
    `delFlag`    tinyint(1)                                             NOT NULL COMMENT '删除标记(0正常，1删除，默认0正常)',
    `createTime` datetime(0)                                            NULL DEFAULT NULL COMMENT '创建时间（新增数据的时间）',
    `createBy`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人（用户的id）',
    `updateTime` datetime(0)                                            NULL DEFAULT NULL COMMENT '更新时间（修改数据的时间）',
    `updateBy`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人（用户的id）',
    `title`      varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件名',
    `url`        varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件地址',
    `userId`     varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '上传者ID',
    `upTime`     datetime(0)                                            NOT NULL COMMENT '上传时间',
    `type`       tinyint(4)                                             NOT NULL COMMENT '类型（0学习资料 1公司文件）',
    `remark`     varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`
(
    `id`         varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '编号，主键（uuid机制）',
    `delFlag`    tinyint(1)                                              NOT NULL COMMENT '删除标记(0正常，1删除，默认0正常)',
    `createTime` datetime(0)                                             NULL DEFAULT NULL COMMENT '创建时间（新增数据的时间）',
    `createBy`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '创建人（用户的id）',
    `updateTime` datetime(0)                                             NULL DEFAULT NULL COMMENT '更新时间（修改数据的时间）',
    `updateBy`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '更新人（用户的id）',
    `name`       varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '名称',
    `score`      int(11)                                                 NULL DEFAULT NULL COMMENT '所需积分',
    `number`     int(11)                                                 NULL DEFAULT NULL COMMENT '数量',
    `photo`      varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '照片地址',
    `remark`     varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `name` (`name`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade`
(
    `id`         varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号，主键（uuid机制）',
    `delFlag`    tinyint(1)                                             NOT NULL COMMENT '删除标记(0正常，1删除，默认0正常)',
    `createTime` datetime(0)                                            NULL DEFAULT NULL COMMENT '创建时间（新增数据的时间）',
    `createBy`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人（用户的id）',
    `updateTime` datetime(0)                                            NULL DEFAULT NULL COMMENT '更新时间（修改数据的时间）',
    `updateBy`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人（用户的id）',
    `name`       varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '年级名称',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `name` (`name`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for joincompany
-- ----------------------------
DROP TABLE IF EXISTS `joincompany`;
CREATE TABLE `joincompany`
(
    `id`         varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '编号，主键（uuid机制）',
    `delFlag`    tinyint(1)                                              NOT NULL COMMENT '删除标记(0正常，1删除，默认0正常)',
    `createTime` datetime(0)                                             NULL DEFAULT NULL COMMENT '创建时间（新增数据的时间）',
    `createBy`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '创建人（用户的id）',
    `updateTime` datetime(0)                                             NULL DEFAULT NULL COMMENT '更新时间（修改数据的时间）',
    `updateBy`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '更新人（用户的id）',
    `name`       varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '加盟商名称',
    `phone`      varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '联系电话',
    `joinDate`   date                                                    NULL DEFAULT NULL COMMENT '加盟时间',
    `state`      tinyint(4)                                              NOT NULL COMMENT '状态（0已批准 1未批 2拒绝 默认1）',
    `remark`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`
(
    `id`         varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '编号，主键（uuid机制）',
    `delFlag`    tinyint(1)                                              NOT NULL COMMENT '删除标记(0正常，1删除，默认0正常)',
    `createTime` datetime(0)                                             NULL DEFAULT NULL COMMENT '创建时间（新增数据的时间）',
    `createBy`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '创建人（用户的id）',
    `updateTime` datetime(0)                                             NULL DEFAULT NULL COMMENT '更新时间（修改数据的时间）',
    `updateBy`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '更新人（用户的id）',
    `title`      varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '题目',
    `content`    text CHARACTER SET utf8 COLLATE utf8_general_ci         NOT NULL COMMENT '内容（使用编辑器）',
    `userId`     varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '用户ID（发布人）',
    `schoolsId`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '校区ID',
    `type`       tinyint(4)                                              NOT NULL COMMENT '类型（0企业1校区2活动3招生4加盟5招聘）',
    `remark`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `title` (`title`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for orderorders
-- ----------------------------
DROP TABLE IF EXISTS `orderorders`;
CREATE TABLE `orderorders`
(
    `id`         varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号，主键（uuid机制）',
    `delFlag`    tinyint(1)                                             NOT NULL COMMENT '删除标记(0正常，1删除，默认0正常)',
    `createTime` datetime(0)                                            NULL DEFAULT NULL COMMENT '创建时间（新增数据的时间）',
    `createBy`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人（用户的id）',
    `updateTime` datetime(0)                                            NULL DEFAULT NULL COMMENT '更新时间（修改数据的时间）',
    `updateBy`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人（用户的id）',
    `userName`   varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名称',
    `goodsName`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '奖品名称',
    `number`     int(11)                                                NULL DEFAULT NULL COMMENT '数量',
    `score`      int(11)                                                NULL DEFAULT NULL COMMENT '所用积分',
    `getTime`    datetime(0)                                            NULL DEFAULT NULL COMMENT '兑换时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record`
(
    `id`         varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '编号，主键（uuid机制）',
    `delFlag`    tinyint(1)                                              NOT NULL COMMENT '删除标记(0正常，1删除，默认0正常)',
    `createTime` datetime(0)                                             NULL DEFAULT NULL COMMENT '创建时间（新增数据的时间）',
    `createBy`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '创建人（用户的id）',
    `updateTime` datetime(0)                                             NULL DEFAULT NULL COMMENT '更新时间（修改数据的时间）',
    `updateBy`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '更新人（用户的id）',
    `type`       tinyint(4)                                              NULL DEFAULT NULL COMMENT '记录类型',
    `content`    varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '记录内容',
    `userName`   varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '用户名称',
    `getTime`    datetime(0)                                             NULL DEFAULT NULL COMMENT '得分时间',
    `score`      int(11)                                                 NULL DEFAULT NULL COMMENT '获得积分',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for schools
-- ----------------------------
DROP TABLE IF EXISTS `schools`;
CREATE TABLE `schools`
(
    `id`         varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '编号，主键（uuid机制）',
    `delFlag`    tinyint(1)                                              NOT NULL COMMENT '删除标记(0正常，1删除，默认0正常)',
    `createTime` datetime(0)                                             NULL DEFAULT NULL COMMENT '创建时间（新增数据的时间）',
    `createBy`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '创建人（用户的id）',
    `updateTime` datetime(0)                                             NULL DEFAULT NULL COMMENT '更新时间（修改数据的时间）',
    `updateBy`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '更新人（用户的id）',
    `name`       varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '名称',
    `provinceId` int(11)                                                 NULL DEFAULT NULL COMMENT '省ID（关联中国省市区表的id）',
    `cityId`     int(11)                                                 NULL DEFAULT NULL COMMENT '市ID（关联中国省市区表的id）',
    `districtId` int(11)                                                 NULL DEFAULT NULL COMMENT '区ID（关联中国省市区表的id）',
    `addr`       varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地址（街道门牌号）',
    `phone`      varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '电话（联系电话）',
    `remark`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `name` (`name`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`
(
    `id`         varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '编号，主键（uuid机制）',
    `delFlag`    tinyint(1)                                              NOT NULL COMMENT '删除标记(0正常，1删除，默认0正常)',
    `createTime` datetime(0)                                             NULL DEFAULT NULL COMMENT '创建时间（新增数据的时间）',
    `createBy`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '创建人（用户的id）',
    `updateTime` datetime(0)                                             NULL DEFAULT NULL COMMENT '更新时间（修改数据的时间）',
    `updateBy`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '更新人（用户的id）',
    `phone`      varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '电话（电话通过短信验证的方式修改[通过电话号码登录]）',
    `password`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '密码（MD5加密）',
    `name`       varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '姓名（真实姓名）',
    `nickname`   varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '昵称（用户可以修改的，昵称可以重复）',
    `birthday`   date                                                    NULL DEFAULT NULL COMMENT '出生日期（年月日格式）',
    `gender`     tinyint(4)                                              NULL DEFAULT NULL COMMENT '性别（0男1女，性别一旦确定不可修改）',
    `provinceId` int(11)                                                 NULL DEFAULT NULL COMMENT '省ID（关联中国省市区表的id）',
    `cityId`     int(11)                                                 NULL DEFAULT NULL COMMENT '市ID（关联中国省市区表的id）',
    `districtId` int(11)                                                 NULL DEFAULT NULL COMMENT '区ID （关联中国省市区表的id）',
    `addr`       varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '街道门牌号',
    `score`      int(11)                                                 NULL DEFAULT NULL COMMENT '积分（默认0）',
    `schoolsId`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '所在校区',
    `userType`   tinyint(4)                                              NULL DEFAULT NULL COMMENT '用户类型（0默认 1老师 默认学生）',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
