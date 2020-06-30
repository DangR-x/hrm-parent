/*
Navicat MySQL Data Transfer

Source Server         : 招商局新数据库
Source Server Version : 50730
Source Host           : 139.9.149.6:3306
Source Database       : attractinvestment

Target Server Type    : MYSQL
Target Server Version : 50730
File Encoding         : 65001

Date: 2020-06-30 19:29:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for activity_process
-- ----------------------------
DROP TABLE IF EXISTS `activity_process`;
CREATE TABLE `activity_process` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '编码',
  `type` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '流程类型：1-部门审批，2-成员审批',
  `status` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '状态：1-暂停，2-重启，3-终止',
  `dept_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '部门编码',
  `remarks` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人员',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '更新人员',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` varchar(2) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '是否删除：0-否，1-是',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`,`type`,`status`,`dept_id`,`del_flag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='流程设置';

-- ----------------------------
-- Records of activity_process
-- ----------------------------
INSERT INTO `activity_process` VALUES ('0f8395dc8bae4d648fd30ca4a7996176', '1', '2', '104', null, '3', '2020-06-01 17:25:48', '3', '2020-06-02 18:51:47', '0');
INSERT INTO `activity_process` VALUES ('7115d533b70d452fae623eae5cf1b24e', '1', '3', '104', null, '3', '2020-06-01 17:25:55', '3', '2020-06-02 18:51:52', '0');
INSERT INTO `activity_process` VALUES ('bc850361b0ce40ce9685fda2c3d33595', '1', '1', '104', null, '3', '2020-06-01 17:25:41', '3', '2020-06-02 18:51:39', '0');

-- ----------------------------
-- Table structure for activity_process_details
-- ----------------------------
DROP TABLE IF EXISTS `activity_process_details`;
CREATE TABLE `activity_process_details` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '编码',
  `process_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '流程编码',
  `user_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户编码',
  `user_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户姓名',
  `sort` int(10) DEFAULT '0' COMMENT '排序',
  `del_flag` varchar(2) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '是否删除：0-否，1-是',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`,`process_id`,`user_id`,`del_flag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='流程审批-成员审批';

-- ----------------------------
-- Records of activity_process_details
-- ----------------------------
INSERT INTO `activity_process_details` VALUES ('02646c72197143a98bfc1e34710b8da0', '0f8395dc8bae4d648fd30ca4a7996176', '3', 'admin', '1', '0');
INSERT INTO `activity_process_details` VALUES ('9d327796c7f14913beaf71d04235d7d1', '7115d533b70d452fae623eae5cf1b24e', '3', 'admin', '1', '0');
INSERT INTO `activity_process_details` VALUES ('f9e3fff3a45545dc9e9f481352bfbcfc', 'bc850361b0ce40ce9685fda2c3d33595', '3', 'admin', '1', '0');

-- ----------------------------
-- Table structure for cash_policy
-- ----------------------------
DROP TABLE IF EXISTS `cash_policy`;
CREATE TABLE `cash_policy` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ID',
  `construct_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '合同ID',
  `construct_text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '合同内容',
  `cash_terms` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否兑现条款  0为兑现 1为不兑现',
  `cash_policy` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否兑现政策  0为兑现 1为不兑现',
  `cash_text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '兑现内容',
  `cash_date` datetime DEFAULT NULL COMMENT '兑现时间',
  `cash_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '兑现人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '更新时间',
  `del_flag` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='政策兑现';

-- ----------------------------
-- Records of cash_policy
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES ('76', 'project_exchange', '项目-政策兑现', 'ProjectExchange', 'crud', 'com.highnes.attractinvestment', 'attractinvestment', 'exchange', '项目-政策兑现', 'fuly', null, 'loginName', '2020-06-04 10:18:30', '', null, null);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=697 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES ('684', '76', 'id', '编码', 'varchar(64)', 'String', 'id', '1', '0', null, null, null, null, null, 'EQ', 'input', '', '1', 'loginName', '2020-06-04 10:18:30', '', null);
INSERT INTO `gen_table_column` VALUES ('685', '76', 'project_id', '所属项目', 'varchar(64)', 'String', 'projectId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '2', 'loginName', '2020-06-04 10:18:30', '', null);
INSERT INTO `gen_table_column` VALUES ('686', '76', 'contract_code', '合同编号', 'varchar(255)', 'String', 'contractCode', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '3', 'loginName', '2020-06-04 10:18:30', '', null);
INSERT INTO `gen_table_column` VALUES ('687', '76', 'contract_items', '合同条款内容', 'text', 'String', 'contractItems', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '4', 'loginName', '2020-06-04 10:18:30', '', null);
INSERT INTO `gen_table_column` VALUES ('688', '76', 'pre_exchange_flag', '是否满足兑现条款', 'varchar(2)', 'String', 'preExchangeFlag', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '5', 'loginName', '2020-06-04 10:18:30', '', null);
INSERT INTO `gen_table_column` VALUES ('689', '76', 'exchanged_flag', '政策是否已兑现', 'varchar(2)', 'String', 'exchangedFlag', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '6', 'loginName', '2020-06-04 10:18:30', '', null);
INSERT INTO `gen_table_column` VALUES ('690', '76', 'exchange_items', '兑现内容', 'text', 'String', 'exchangeItems', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '7', 'loginName', '2020-06-04 10:18:30', '', null);
INSERT INTO `gen_table_column` VALUES ('691', '76', 'exchange_date', '兑现时间', 'datetime', 'Date', 'exchangeDate', '0', '0', null, '1', '1', '1', null, 'EQ', 'datetime', '', '8', 'loginName', '2020-06-04 10:18:30', '', null);
INSERT INTO `gen_table_column` VALUES ('692', '76', 'exchange_user_id', '政策兑现人编码', 'varchar(64)', 'String', 'exchangeUserId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '9', 'loginName', '2020-06-04 10:18:30', '', null);
INSERT INTO `gen_table_column` VALUES ('693', '76', 'exchange_user_name', '政策兑现人', 'varchar(255)', 'String', 'exchangeUserName', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '10', 'loginName', '2020-06-04 10:18:30', '', null);
INSERT INTO `gen_table_column` VALUES ('694', '76', 'create_date', '创建时间', 'datetime', 'Date', 'createDate', '0', '0', null, null, null, null, null, 'EQ', 'datetime', '', '11', 'loginName', '2020-06-04 10:18:30', '', null);
INSERT INTO `gen_table_column` VALUES ('695', '76', 'create_by', '创建人', 'varchar(255)', 'String', 'createBy', '0', '0', null, null, null, null, null, 'EQ', 'input', '', '12', 'loginName', '2020-06-04 10:18:30', '', null);
INSERT INTO `gen_table_column` VALUES ('696', '76', 'del_flag', '是否删除：0-否，1-是', 'varchar(2)', 'String', 'delFlag', '0', '0', null, null, null, null, null, 'EQ', 'input', '', '13', 'loginName', '2020-06-04 10:18:31', '', null);

-- ----------------------------
-- Table structure for industrial_images
-- ----------------------------
DROP TABLE IF EXISTS `industrial_images`;
CREATE TABLE `industrial_images` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `industrial_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '工商注册ID',
  `images` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '图片地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='工商执照';

-- ----------------------------
-- Records of industrial_images
-- ----------------------------

-- ----------------------------
-- Table structure for industrial_register
-- ----------------------------
DROP TABLE IF EXISTS `industrial_register`;
CREATE TABLE `industrial_register` (
  `id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `company_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '企业名称',
  `credit_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '信用代码',
  `trade_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属行业',
  `trade_id` varchar(0) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '行业ID',
  `register_capital` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '注册资本',
  `company_location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '企业注册地',
  `juridical_person` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '企业法人',
  `project_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属项目',
  `project_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属项目名称',
  `juridical_phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '法人电话',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人',
  `del_flag` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='工商注册';

-- ----------------------------
-- Records of industrial_register
-- ----------------------------

-- ----------------------------
-- Table structure for knowledge_manage
-- ----------------------------
DROP TABLE IF EXISTS `knowledge_manage`;
CREATE TABLE `knowledge_manage` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `knowledge_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '知识类别',
  `create_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '知识内容',
  `enclosure` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '附件',
  `del_flag` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否删除 0--保存 1--删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of knowledge_manage
-- ----------------------------

-- ----------------------------
-- Table structure for project_area_details
-- ----------------------------
DROP TABLE IF EXISTS `project_area_details`;
CREATE TABLE `project_area_details` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '编码',
  `project_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属项目',
  `area_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '空间类型',
  `area_count` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '空间数量',
  `del_flag` varchar(2) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '是否删除：0-否，1-是',
  `contain` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `project_id` (`project_id`,`del_flag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='空间需求';

-- ----------------------------
-- Records of project_area_details
-- ----------------------------
INSERT INTO `project_area_details` VALUES ('0f50d2ac8385439c87bece85ec43fbe3', '3ba6cfbbb4ab42b7bd5c7598fec2fd9b', null, null, '0', null);
INSERT INTO `project_area_details` VALUES ('1', '431', null, '亩', '0', '1200');
INSERT INTO `project_area_details` VALUES ('10', '440', null, '亩', '0', '28.5');
INSERT INTO `project_area_details` VALUES ('100', '545', null, '㎡', '0', '300 ');
INSERT INTO `project_area_details` VALUES ('101', '546', null, '㎡', '0', '300 ');
INSERT INTO `project_area_details` VALUES ('102', '547', null, '㎡', '0', '300 ');
INSERT INTO `project_area_details` VALUES ('103', '548', null, '㎡', '0', '400');
INSERT INTO `project_area_details` VALUES ('104', '549', null, '㎡', '0', '600.00 ');
INSERT INTO `project_area_details` VALUES ('105', '552', null, '㎡', '0', '4000.00 ');
INSERT INTO `project_area_details` VALUES ('106', '558', null, '亩', '0', '127');
INSERT INTO `project_area_details` VALUES ('107', '559', null, '亩', '0', '375');
INSERT INTO `project_area_details` VALUES ('108', '560', null, '亩', '0', '633');
INSERT INTO `project_area_details` VALUES ('109', '562', null, '㎡', '0', '800-1500');
INSERT INTO `project_area_details` VALUES ('11', '441', null, '亩', '0', '60');
INSERT INTO `project_area_details` VALUES ('110', '566', null, '㎡', '0', '27000');
INSERT INTO `project_area_details` VALUES ('111', '567', null, '亩', '0', '376');
INSERT INTO `project_area_details` VALUES ('112', '568', null, '亩', '0', '65');
INSERT INTO `project_area_details` VALUES ('113', '569', null, '㎡', '0', '2000');
INSERT INTO `project_area_details` VALUES ('12', '442', null, '亩', '0', '13');
INSERT INTO `project_area_details` VALUES ('13', '443', null, '亩', '0', '58');
INSERT INTO `project_area_details` VALUES ('14', '444', null, '亩', '0', '25');
INSERT INTO `project_area_details` VALUES ('15', '445', null, '亩', '0', '20');
INSERT INTO `project_area_details` VALUES ('16', '446', null, '亩', '0', '20');
INSERT INTO `project_area_details` VALUES ('18', '448', null, '亩', '0', '86');
INSERT INTO `project_area_details` VALUES ('2', '432', null, '亩', '0', '300');
INSERT INTO `project_area_details` VALUES ('26', '456', null, '㎡', '0', '500');
INSERT INTO `project_area_details` VALUES ('28', '458', null, '㎡', '0', '1500');
INSERT INTO `project_area_details` VALUES ('29', '459', null, '㎡+预留100亩', '0', '300');
INSERT INTO `project_area_details` VALUES ('30', '460', null, '', '0', '一期5500㎡+二期100亩');
INSERT INTO `project_area_details` VALUES ('36f715f98e6546fb838bff3f5e953946', '062aed93555d4fe8bfa9639856dd5385', null, null, '0', null);
INSERT INTO `project_area_details` VALUES ('37b1fc7f78f74d06abbd693185170aed', '6ab5a98f8f304207b28b6db8571f8d96', null, null, '0', null);
INSERT INTO `project_area_details` VALUES ('43', '473', null, '亩', '0', '45.00 ');
INSERT INTO `project_area_details` VALUES ('44', '474', null, '亩', '0', '109.6');
INSERT INTO `project_area_details` VALUES ('45', '475', null, '亩', '0', '191');
INSERT INTO `project_area_details` VALUES ('46', '476', null, '亩', '0', '308');
INSERT INTO `project_area_details` VALUES ('47ca4b7321cf49d0a489ec263607b688', '0d4027a148344550b4eb59ce4ee5af55', null, null, '0', null);
INSERT INTO `project_area_details` VALUES ('5', '435', null, '亩', '0', '55');
INSERT INTO `project_area_details` VALUES ('55', '485', null, '亩', '0', '298');
INSERT INTO `project_area_details` VALUES ('56', '486', null, '亩', '0', '175');
INSERT INTO `project_area_details` VALUES ('57', '487', null, '亩', '0', '325');
INSERT INTO `project_area_details` VALUES ('6', '436', null, '亩', '0', '270');
INSERT INTO `project_area_details` VALUES ('60', '490', null, '亩', '0', '30');
INSERT INTO `project_area_details` VALUES ('63', '493', null, '㎡', '0', '1200');
INSERT INTO `project_area_details` VALUES ('65', '495', null, '㎡', '0', '1500');
INSERT INTO `project_area_details` VALUES ('66', '501', null, '亩', '0', '200');
INSERT INTO `project_area_details` VALUES ('67', '502', null, '㎡', '0', '5800');
INSERT INTO `project_area_details` VALUES ('679aa847e9a04032ae96d0a5dd2216b9', 'c4f83d1736aa47d5a9f7c679db3d295c', null, null, '0', null);
INSERT INTO `project_area_details` VALUES ('67f46147a6bd40d7a6296460b6300f25', '98b3f44a382e4af884c39e7d03cc4381', '厂房', '平米', '0', null);
INSERT INTO `project_area_details` VALUES ('68', '503', null, '亩', '0', '200');
INSERT INTO `project_area_details` VALUES ('69', '504', null, '㎡', '0', '1000');
INSERT INTO `project_area_details` VALUES ('6e5794eb4bc0493e9afd4ea196f51ce5', '8365b232a13b4aaaa5b340d6ab7c72ca', null, null, '0', null);
INSERT INTO `project_area_details` VALUES ('7', '437', null, '亩', '0', '45');
INSERT INTO `project_area_details` VALUES ('70', '505', null, '亩', '0', '24');
INSERT INTO `project_area_details` VALUES ('71', '506', null, '亩', '0', '23.25');
INSERT INTO `project_area_details` VALUES ('72', '507', null, '亩', '0', '12.8');
INSERT INTO `project_area_details` VALUES ('73', '508', null, '亩', '0', '180');
INSERT INTO `project_area_details` VALUES ('74', '509', null, '亩', '0', '100');
INSERT INTO `project_area_details` VALUES ('75', '510', null, '㎡', '0', '2000');
INSERT INTO `project_area_details` VALUES ('76', '513', null, '㎡', '0', '36');
INSERT INTO `project_area_details` VALUES ('77', '515', null, '亩', '0', '300');
INSERT INTO `project_area_details` VALUES ('78', '516', null, '㎡', '0', '31000');
INSERT INTO `project_area_details` VALUES ('79', '517', null, '㎡', '0', '3000');
INSERT INTO `project_area_details` VALUES ('7ec261767f4846f7a746a67df1c66799', 'd8ecdb943aae4d31adc105299e847388', '厂房', '平米', '0', null);
INSERT INTO `project_area_details` VALUES ('8', '438', null, '亩', '0', '83');
INSERT INTO `project_area_details` VALUES ('80', '518', null, '㎡', '0', '1000');
INSERT INTO `project_area_details` VALUES ('81', '519', null, '㎡', '0', '3000');
INSERT INTO `project_area_details` VALUES ('82', '522', null, '㎡', '0', '15000');
INSERT INTO `project_area_details` VALUES ('83', '523', null, '亩', '0', '180');
INSERT INTO `project_area_details` VALUES ('84', '524', null, '㎡', '0', '1500');
INSERT INTO `project_area_details` VALUES ('85', '525', null, '㎡', '0', '500');
INSERT INTO `project_area_details` VALUES ('86', '528', null, '亩', '0', '30');
INSERT INTO `project_area_details` VALUES ('8666c3d77de54ef79f7dfa38c51e297b', '6ad218470b16444aa3698ebf4519b9af', null, null, '0', null);
INSERT INTO `project_area_details` VALUES ('87', '530', null, '㎡', '0', '15000');
INSERT INTO `project_area_details` VALUES ('88', '531', null, '㎡', '0', '3800');
INSERT INTO `project_area_details` VALUES ('89', '532', null, '㎡', '0', '2200');
INSERT INTO `project_area_details` VALUES ('89b46cda100e4f34819f515477a8eab7', 'f7d8c095a8ed428e877d2a0095786082', null, null, '0', null);
INSERT INTO `project_area_details` VALUES ('9', '439', null, '亩', '0', '80');
INSERT INTO `project_area_details` VALUES ('90', '535', null, '亩', '0', '1000');
INSERT INTO `project_area_details` VALUES ('91', '536', null, '㎡', '0', '10000');
INSERT INTO `project_area_details` VALUES ('92', '537', null, '㎡', '0', '1000');
INSERT INTO `project_area_details` VALUES ('92cdae9fae8347adbb659b3733c1e8a5', 'dcd1cb4e474f4306975be6d3ed811d16', '厂房', '亩', '0', null);
INSERT INTO `project_area_details` VALUES ('93', '538', null, '亩', '0', '200');
INSERT INTO `project_area_details` VALUES ('94', '539', null, '㎡', '0', '20000');
INSERT INTO `project_area_details` VALUES ('95', '540', null, '亩', '0', '80');
INSERT INTO `project_area_details` VALUES ('96', '541', null, '㎡', '0', '5000-10000');
INSERT INTO `project_area_details` VALUES ('97', '542', null, '㎡', '0', '3000-5000');
INSERT INTO `project_area_details` VALUES ('99', '544', null, '㎡', '0', '500');
INSERT INTO `project_area_details` VALUES ('af837597aa5644cc8b34a9f38adc59bc', '671cd237f7314bb28da3a5389676ac22', null, null, '0', null);
INSERT INTO `project_area_details` VALUES ('c215622bcc5348a085f943b1d1fc3dbe', '09457a763b384273832f767492d25210', '厂房', '亩', '0', null);

-- ----------------------------
-- Table structure for project_company_details
-- ----------------------------
DROP TABLE IF EXISTS `project_company_details`;
CREATE TABLE `project_company_details` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '编码',
  `project_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属单位',
  `company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '参与单位',
  `del_flag` varchar(2) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '是否删除：0-否，1-是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='主要参与单位';

-- ----------------------------
-- Records of project_company_details
-- ----------------------------
INSERT INTO `project_company_details` VALUES ('372221d1990a4d84bbe3b22415edc9a3', '98b3f44a382e4af884c39e7d03cc4381', '区住建委', '0');
INSERT INTO `project_company_details` VALUES ('3931ed39d6db466d96bee43fb4a1e5be', 'd8ecdb943aae4d31adc105299e847388', '区经信委', '0');
INSERT INTO `project_company_details` VALUES ('3f9546c2e564469aa9186dc7150eb5d3', 'd8ecdb943aae4d31adc105299e847388', '区科技局', '0');
INSERT INTO `project_company_details` VALUES ('51aa5e9791bc42c0b9e644f76a76a53b', '09457a763b384273832f767492d25210', '区科技局', '0');
INSERT INTO `project_company_details` VALUES ('a3486c4ae6f64efbb93f37782b65e89e', 'dcd1cb4e474f4306975be6d3ed811d16', '区住建委', '0');
INSERT INTO `project_company_details` VALUES ('ab63aaff69ee4607b862a3b904c34e71', '98b3f44a382e4af884c39e7d03cc4381', '区经信委', '0');
INSERT INTO `project_company_details` VALUES ('ba3740f164424adbb16c628c908885d2', '36d3a498aadb49519a848e5aacb9eeea', '区住建委', '0');
INSERT INTO `project_company_details` VALUES ('bb016149fb9d4ea3a3d8a242cccc8644', 'dcd1cb4e474f4306975be6d3ed811d16', '区商务委', '0');
INSERT INTO `project_company_details` VALUES ('c701e9925db64924b47a6a1cd510f6a0', '09457a763b384273832f767492d25210', '区经信委', '0');
INSERT INTO `project_company_details` VALUES ('cb82241fd9f7493ab016982827c3fa72', '36d3a498aadb49519a848e5aacb9eeea', '区政协', '0');
INSERT INTO `project_company_details` VALUES ('ff46bb4be7ef40928fd06fec960cc173', '98b3f44a382e4af884c39e7d03cc4381', '招商中心办公室', '0');

-- ----------------------------
-- Table structure for project_company_info
-- ----------------------------
DROP TABLE IF EXISTS `project_company_info`;
CREATE TABLE `project_company_info` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '编码',
  `project_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '企业名称',
  `company_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '社会统一信用代码',
  `classify_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属行业-门类',
  `classify_type_two` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属行业-大类',
  `register_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '企业注册地',
  `company_description` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '企业简介',
  `last_total_income` decimal(12,2) DEFAULT NULL COMMENT '上年度收入',
  `last_pay_taxes` decimal(12,2) DEFAULT NULL COMMENT '上年度纳税',
  `total_people` int(10) DEFAULT NULL COMMENT '员工数量',
  `company_source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '企业来源',
  `company_legal_person` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '企业法人',
  `company_mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '法人电话',
  `company_license` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '工商执照',
  `del_flag` varchar(2) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '是否删除：0-否，1-是',
  `industry` bigint(255) DEFAULT NULL,
  `industryname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`,`project_id`,`classify_type`,`classify_type_two`,`del_flag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='项目-公司信息';

-- ----------------------------
-- Records of project_company_info
-- ----------------------------
INSERT INTO `project_company_info` VALUES ('0a5dd34a5af14086912b9c06771618c5', 'c4f83d1736aa47d5a9f7c679db3d295c', null, null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('1', '1', '中电科技集团重庆声光电有限公司', '91500106671002744G', null, null, '', null, null, null, null, '', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('10', '10', '深圳普门科技股份有限公司', '91440300671851383C', null, null, '广东省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('100', '105', '四川达尔志信息技术有限公司', '91510107698852263G', null, null, '四川省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('101', '106', '重庆市浪尖至简物联网科技有限公司', '91500106MA5YURY19D', null, null, '重庆', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('102', '107', '中国航天科工集团第一研究院', '000000000000000000', null, null, '北京', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('103', '108', '中国地质装备集团有限公司 中国科学院地质与地球物理研究所', '12100000400002734J 91110000101743874P', null, null, '北京', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('104', '109', '中国航天科工集团有限公司', '000000000000000000', null, null, '北京', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('105', '110', '北京四维图新科技股份有限公司', '91110000745467123H', null, null, '北京', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('106', '111', '北京红正德科技有限公司', '91110108MA00ERKD0L', null, null, '北京', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('107', '112', '厦门易法通法务信息管理股份有限公司', '91350200671266897T', null, null, '福建省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('108', '113', '深圳市金三佳电子有限公司', '91440300783902309K', null, null, '广东省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('109', '114', '中电科投资控股有限公司', '9111000071783888XG', null, null, '北京', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('11', '11', '深圳市裕同包装科技股份有限公司', '914403007341708695', null, null, '广东省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('110', '115', '广州宏畅生物科技有限公司', '91440116581877889Q', null, null, '广东省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('111', '116', '四川六九一二科技有限公司', '91510600MA6ATY6D22', null, null, '四川省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('112', '117', '武汉无线飞翔科技有限公司', '91420100685441799W', null, null, '湖北省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('113', '118', '卓尔文旅集团有限公司', '914201163035142369', null, null, '', null, null, null, null, '', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('114', '119', '重庆小康工业集团股份有限公司', '915001066608898456', null, null, '重庆', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('115', '120', '重庆同弘股权投资基金管理有限公司', '9150022230507094XK', null, null, '重庆', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('116', '121', '真信投资有限公司', '91500108745306020R', null, null, '重庆', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('117', '122', '武汉光谷联合集团有限公司', '91420100722739130Y', null, null, '湖北省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('118', '124', '韵盛发科技（北京）股份有限公司', '91110105675061063J', null, null, '北京', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('119', '125', '合肥杰发科技有限公司深圳分公司', '913401000803315542', null, null, '安徽省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('12', '12', '旗探（重庆）智能科技研究院有限公司', '91500106MA60C8R58U', null, null, '重庆', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('120', '1', '中电科技集团重庆声光电有限公司', '91500106671002744G', null, null, '重庆', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('121', '127', '南京欧帝科技股份有限公司', '913201007621376527', null, null, '江苏省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('122', '128', '上海核工程研究设计院有限公司 上海空基信息科技有限公司', '91310104132672722W 91310112MA1GBAUNX7', null, null, '上海', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('123', '129', '深圳数位传媒科技有限公司', '914403003352047264', null, null, '广东省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('124', '130', '创业黑马科技集团股份有限公司', '91110105585848161G', null, null, '北京', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('125', '131', 'SAP', '', null, null, '德国', null, null, null, null, '境外', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('126', '132', '盛智易联重庆网约车项目', '91530121MA6N3KEW02', null, null, '浙江省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('127', '133', '华为技术有限公司', '914403001922038216', null, null, '广东省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('128', '134', '南京俊东机电设备有限公司', '913201147871166556', null, null, '江苏省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('129', '135', '广西南宁寰宇木业有限公司/重庆岭峰木业有限公司', '91450127MA5MW6UT5C', null, null, '广西壮族自治区', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('13', '13', '北京坤舆天信科技有限公司', '911101080592689411', null, null, '北京', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('130', '138', '中铁建川集团有限公司', '91510100MA61WLKC6D', null, null, '四川省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('131', '139', '汕头市联友投资有限责任公司 重庆国泰实业发展有限公司', '91440513688672795E 91500103202820701P', null, null, '广东省 重庆', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('132', '140', '重庆华润万家生活超市有限公司', '915001067094997506', null, null, '重庆', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('133', '141', '爱建证券有限责任公司', '91310000742693694J', null, null, '上海', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('134', '142', '北京高孚动力科技有限公司', '91110108MA01HPR94A', null, null, '北京', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('135', '143', '中国科学院广州能源研究所', '12100000455860816A', null, null, '广东省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('136', '145', '北京的卢深视科技有限公司', '91110108355235570N', null, null, '北京', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('137', '146', '北京索为系统技术股份有限公司', '91110105790696320H', null, null, '北京', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('138', '147', '北京中聚高科科技有限公司', '91110108MA00332R5U', null, null, '北京', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('139', '148', '北京派天下信息科技有限公司', '91110115MA00C80Q7K', null, null, '北京', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('14', '14', '天津捷嘉物流有限公司', '91120116797289525D', null, null, '天津', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('140', '149', '东莞市糖酒集团美宜佳便利店有限公司', '9144190028188709XF', null, null, '广东省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('141', '150', '宝能物流集团有限公司', '91440300306202158W', null, null, '广东省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('142', '151', '深圳市福马兴邦科技有限公司', '91440300360128470N', null, null, '广东省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('143', '152', '江苏华越医疗器械投资有限公司', '913212910869690300', null, null, '', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('144', '153', '威斯康星大学', '', null, null, '', null, null, null, null, '境外', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('145', '154', '重庆艾艺荷马教育科技股份有限公司', '91500107683920059E', null, null, '', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('146', '155', '广东维木网络科技有限公司', '91441900345362816Q', null, null, '广东省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('147', '156', '宝能百货零售有限公司', '91440300MA5EG3WLXK', null, null, '广东省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('148', '157', '北京建筑材料科学研究院总院及资本公司', '', null, null, '', null, null, null, null, '', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('149', '158', '重庆辰辉实业有限公司', '91500106MA602XX25G', null, null, '重庆', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('15', '15', '上海丰倚实业发展有限公司', '91310109MA1G55YK4T', null, null, '上海', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('150', '162', '浙江玉程机电制造有限公司', '91331004MA2DUQLP5J', null, null, '浙江省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('151', '163', '江苏丰泽汽车部件有限公司', '91321181MA1MJ0N5XJ', null, null, '江苏省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('152', '164', '香港波兹有限公司', '2839664', null, null, '香港', null, null, null, null, '境外', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('153', '165', '宁海精时模塑有限公司', '91330226591588802X', null, null, '浙江省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('154', '167', '贵阳哎哟大咖信息科技有限公司', '91520102MA6DL4GQXE', null, null, '贵州省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('155', '169', '翔羚影视文化传播有限公司', '91310115MA1K3RH99L', null, null, '上海', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('156', '170', '天津市康星计算机技术有限公司', '911201047128243077', null, null, '天津', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('157', '171', '中交未名环保有限公司', '91110112MA01FRYE4K', null, null, '北京', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('158', '172', '成都音像出版社有限公司（天府TV）', '91510100569674579D', null, null, '四川省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('159', '173', '重庆龙湖地产发展有限公司', '91500000202833449G', null, null, '重庆', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('16', '16', '摩尔装配建筑（湛江）有限公司', '91440804MA52HLA44N', null, null, '广东省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('160', '174', '北京北控智科能源互联网有限公司', '91110108MA009H010U', null, null, '北京', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('161', '175', '京东集团', '911103026605015136', null, null, '北京', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('162', '176', '重庆惠通陆华汽车销售服务有限公司', '91500112781564465H', null, null, '重庆', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('163', '177', '重庆博众汽车销售服务有限公司', '91500000768891808A', null, null, '重庆', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('164', '178', '北京中科环能投资有限公司', '911101086996119471', null, null, '北京', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('165', '179', '停开心', '913502000899183436', null, null, '福建省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('166', '180', '功夫动漫', '913505026765390490', null, null, '福建省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('167', '181', '黑龙江波罗的海进出口有限公司', '912310815881183408', null, null, '黑龙江省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('168', '182', '小米数字科技有限公司', '91110302089670122N', null, null, '北京', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('169', '183', '物产中大云商有限公司', '91330104MA2B21TX93', null, null, '浙江省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('17', '17', '中国和平石油能源发展集团有限公司', '2352886', null, null, '北京', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('170', '186', '天津航悦科技中心', '91120222MA06UFT287', null, null, '天津', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('171', '187', 'Bjørn-Thorsen A/S Group 重庆开物工业有限公司', '00000000000000000 91500106MA5UM87T7D', null, null, '丹麦 重庆', null, null, null, null, '境内 境外', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('172', '188', '天津天渝科技中心', '91120222MA06UGBJ5G', null, null, '天津', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('173', '189', '杭州盈火网络科技有限公司', '', null, null, '', null, null, null, null, '', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('174', '190', '中国地质科学研究院成都综合所', '', null, null, '', null, null, null, null, '', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('175', '191', '中冶同达（北京）投资有限公司 重庆辰辉实业有限公司', '91110108330307208X 91500106MA602XX25G', null, null, '', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('176', '192', '远洋阳光投资发展有限公司', '91110111MA018DH80U', null, null, '北京', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('177', '193', '中信数字技术有限责任公司', '9111010571093414XC', null, null, '北京', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('178', '194', '广州赛宝信息产业技术研究院', '914401011905230632', null, null, '广东省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('179', '195', '中国电子系统技术有限公司', '91110000100001553U', null, null, '北京', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('18', '18', '红星美凯龙（上海）企业管理有限公司', '91310115MA1H7R0Q9', null, null, '上海', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('180', '196', '北京九天龙航空科技有限公司', '915002220598700008', null, null, '北京', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('181', '107', '中国航天科工集团第一研究院', '91110000710925243K', null, null, '', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('182', '199', '普强信息技术（北京）有限公司', '91110108562062131H', null, null, '', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('183', '200', '新华金侨（厦门）能源科技有限公司 重庆非常规油气研究院有限公司', '91350211MA31J79E85 91500106MA602X5G1A', null, null, '', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('184', '201', '爱仁（苏州）医药科技有限公司', '91320505MA1TE4J892', null, null, '', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('185', '202', '武汉光电工业技术研究院有限公司', '914201000668432896', null, null, '', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('186', '203', '思坦德尔（重庆）医学科技有限公司', '91500106MA60C2CY31', null, null, '重庆', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('187', '204', '重庆点检生物科技有限公司', '915001050891271899', null, null, '重庆', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('187f564339d64b07b61e23c0229e2b0f', '5f5121866de24704b7d6e49a8749875d', '阿萨德', null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('188', '205', '北京御芯微科技有限公司', '91110108MA0189Y02C', null, null, '北京', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('189', '206', '东方石开（北京）地质科技有限公司 重庆非常规油气研究院有限公司', '91110108MA00HC977L 91500106MA602X5G1A', null, null, '', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('19', '19', '上海丰树管理有限公司', '913100007757520995', null, null, '上海', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('190', '207', '中国石油大学（北京） 重庆非常规油气研究院有限公司', '91500106MA602X5G1A', null, null, '', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('191', '208', '重庆医药(集团)股份有限公司', '915000002028293351', null, null, '', null, null, null, null, '', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('192', '209', '湖南中卓到家互联网科技有限公司', '91430100066392190C', null, null, '湖南省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('193', '210', '重庆市斌贸农业发展有限公司', '91500104073698956Y', null, null, '重庆', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('194', '211', '贵州茶协', '91522631MA6J4GEXXJ', null, null, '重庆', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('195', '212', '香港置地四川公司', '', null, null, '中国', null, null, null, null, '境外', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('196', '213', '同济智慧数字信息技术有限公司', '91500000MA60NU0C3G', null, null, '重庆', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('197', '214', '时空电动汽车股份有限公司', '91330103079308349D', null, null, '重庆', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('198', '215', '上海依图网络科技有限公司', '9131011205506145X2', null, null, '', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('199', '216', '传化物流集团有限公司', '91330109560589212Y', null, null, '浙江省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('2', '2', '中国电科集团', '91110000710929498G', null, null, '北京', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('20', '20', '嘉民港渝第四发展有限公司', '2330789（公司编码）', null, null, '香港', null, null, null, null, '境外', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('200', '18', '红星美凯龙（上海）企业管理有限公司', '91310115MA1H7R0Q9D', null, null, '上海', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('201', '218', '上海牧图工业产品设计有限公司', '', null, null, '重庆', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('202', '219', '大连橙心物流网络技术有限公司', '91210231MA100G221R', null, null, '辽宁省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('203', '220', '皇后大道旅游信息有限公司', '1490291000000', null, null, '香港', null, null, null, null, '境外', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('204', '221', '广州正创控股集团有限公司', '91440101MA5ANJ8N12', null, null, '广东省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('205', '222', '合美时光控股有限公司', '', null, null, '', null, null, null, null, '', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('206', '223', '苏宁集团股份有限公司', '91320000608950987L', null, null, '', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('207', '224', '华金证券股份有限公司', '', null, null, '', null, null, null, null, '', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('208', '225', '香港铂锦投资管理有限公司', '29105820000000', null, null, '香港', null, null, null, null, '境外', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('209', '226', '广州一心生活信息科技有限公司', '91440101MA5AL90Y2F', null, null, '广东省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('21', '21', '安博供应链管理（上海）有限公司', '91310000088514638D', null, null, '上海', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('210', '227', '成都华赋蓉邦教育管理有限公司', '91510100MA61TQ3A97', null, null, '', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('211', '228', '神州泰岳集团', '91110000802090167W', null, null, '', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('212', '229', '北京世纪好未来教育科技有限公司', '911101086742533119', null, null, '北京', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('213', '230', 'FLOWNATION', '', null, null, '', null, null, null, null, '境外', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('214', '231', '广州国通控股集团有限公司', '', null, null, '广东省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('216', '234', '华人文化有限责任公司', '91320594MA1M9PT43B', null, null, '江苏省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('217', '235', '四川朗基瑞兴振兴乡村产业发展集团有限公司', '91510100MA6CEUMK00', null, null, '四川省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('218', '236', '中商汇通(浙江)进出口有限公司', '91330201MA2AJX804W', null, null, '', null, null, null, null, '', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('219', '237', '山东街景智能制造科技股份有限公司', '91370700MA3C83JN4A', null, null, '山东省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('22', '22', '青岛特来电新能源有限公司', '91370222395815801F', null, null, '山东省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('220', '238', '915101125644880728', '915101125644880728', null, null, '四川省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('22ebd12b67ed4e8ab1841beb8083c881', 'd8ecdb943aae4d31adc105299e847388', '重庆技术能力有限公司', '500001234567890', '农、林、牧、渔业', '农、林、牧、渔服务业', '中国重庆', '我们是重庆技术能力有限公司', '1000.00', '100.00', '1000', '市内', '刘德华', '18912344321', '/2020年06月04日/30636128aff449d7b64e806b508e66e811.jpg', '0', null, null);
INSERT INTO `project_company_info` VALUES ('23', '23', '北京联东投资（集团）有限公司', '91110000750103519R', null, null, '北京', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('24', '24', '北京敦煌禾光信息技术有限公司', '9111010876993577X6', null, null, '北京', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('25', '25', '上海鼎晶生物医药科技股份有限公司', '91310115MA1HA5QWXE', null, null, '上海', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('26', '26', '北京未动科技有限公司', '91110108095353043A', null, null, '北京', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('27', '27', '深圳市浪尖设计有限公司    誉铭实业有限公司', '91440300708444459D', null, null, '广东省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('28', '28', '北京中科纳通电子技术有限公司', '91110116051441236U', null, null, '北京', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('29', '29', '武汉益模科技股份有限公司', '91420100781995775H', null, null, '湖北省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('3', '3', '长江生态环保集团有限公司', '91420000MA4976CJ9X', null, null, '湖北省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('30', '30', '北京东微系统科技有限公司', '91110108MA009YBF1R', null, null, '北京', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('301', null, '重庆小康工业集团股份有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('302', null, '北京万普隆能源技术有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('303', null, '北斗地网（重庆）科技集团有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('304', null, '卡尔蔡司工业测量技术有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('305', null, '北威科技公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('306', null, '北京御芯微科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('307', null, '重庆皓石金科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('308', null, '重庆蓥山机电有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('309', null, '重庆红旗钢圈有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('31', '31', '厦门大千振宇集团有限公司司', '913502050583559555', null, null, '福建省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('310', null, '重庆凌宏橡塑有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('311', null, '重庆索耐特工贸有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('312', null, '重庆帕格维电器有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('313', null, '重庆美联塑胶有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('314', null, '北京中软国际信息技术有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('315', null, '北京双创街投资管理有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('316', null, '上海恩太设备技术有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('317', null, '重庆智神科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('318', null, '深圳东康前海新能源有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('319', null, '重庆东电制冷设备有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('32', '32', '北京万普隆能源技术有限公司', '91110108685766403N', null, null, '北京', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('320', null, '重庆惟觉科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('321', null, '重庆多讯科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('322', null, '重庆琦琦机械有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('323', null, '重庆多邦科技股份有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('324', null, '重庆路之声科技有限责任公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('325', null, '海口斯密斯贸易有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('326', null, '重庆艾力斯医疗器械有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('327', null, '武汉光谷联合集团有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('328', null, '厦门易法通信息管理股份有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('33', '33', '北京中科慧眼科技有限公司', '91110108318058456U', null, null, '北京', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('330', null, '厦门大千振宇集团有限公司、重庆浪尖渝力科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('331', null, '重庆点检生物科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('332', null, '重庆大学生命科学院、上海鼎晶生物医药科技股份有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('333', null, '武汉益模科技股份有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('334', null, '中科慧眼科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('335', null, '北京未动科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('336', null, '\"重庆浪尖至简物联网科技有限公司、长安福特汽车有限公司\"', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('338', null, '龙之瑞文化传播有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('339', null, '思坦德尔（重庆）医学科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('34', '34', '光宝联合（北京）科技股份有限公司', '9111010878484362X7', null, null, '北京', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('340', null, '重庆非常规油气研究院有限公司、东方石开（北京）地质科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('341', null, '重庆非常规油气研究院有限公司、中国石油大学（北京）', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('342', null, '重庆非常规油气研究院有限公司、新华金侨(厦门)能源科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('343', null, '科德数控', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('344', null, '中船重工、重庆大学自动化学院', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('345', null, '北京东微系统科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('346', null, '澳大利亚旗探科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('347', null, '重庆金美通信有限责任公司、航天工业发展股份有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('349', null, '九方皋基金管理公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('35', '35', '河钢集团重庆大学', '91130000677356885K', null, null, '', null, null, null, null, '', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('350', null, '广州市合熠电子科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('351', null, '中国电信股份有限公司重庆分公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('352', null, '光宝联合（北京）科技股份有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('353', null, '重庆康克唯生物科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('354', null, '中电科投资控股有限公司、重庆吉芯科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('355', null, '星环科技', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('356', null, '重庆博泽汽车部件有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('357', null, '普洛斯投资（上海）公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('358', null, '重庆富罗恩斯置业有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('359', null, '安博供应链管理（上海）有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('36', '36', '上海恩谷信息科技有限公司', '913100005695943170', null, null, '上海', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('360', null, '重庆弘宸供应链管理有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('361', null, '重庆亚联亨通国际贸易有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('362', null, '费德自动化技术（重庆）有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('363', null, '中商投泽泰（重庆）实业有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('364', null, '店商互联（香港）科技发展有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('365', null, '浙江传化运通供应链管理有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('366', null, '上海永达融资租赁有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('367', null, '尊程（重庆）供应链管理有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('368', null, '重庆渝仟意贸易有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('369', null, '重庆银洲泰富商贸有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('37', '37', '航天工业发展股份有限公司', '913500001544115744', null, null, '福建省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('370', null, '韵辉供应链管理（重庆）有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('371', null, '上海名橙网络技术有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('372', null, '厦门象屿集团', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('373', null, '重庆艾斯图必贸易有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('374', null, '重庆颐辰科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('375', null, '传化物流集团股份有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('376', null, '远成物流股份有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('377', null, '天安财产保险股份有限公司重庆分公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('378', null, '重庆承载农业开发有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('379', null, '盘古集团有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('38', '39', '清陶（昆山）能源发展有限公司', '91320583MA1MMPA27R', null, null, '', null, null, null, null, '', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('380', null, '菲大装配式建筑（重庆）有限责任公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('381', null, '重庆丰倚供应链管理有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('382', null, '重庆中林林产品有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('383', null, '天津捷嘉物流有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('384', null, '重庆重铁巨龙储运有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('385', null, '重庆重多多电子商务有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('386', null, '宝能物流集团有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('387', null, '汉宏物流（中国）有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('388', null, '武汉无线飞翔科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('389', null, '娄底市森宏贸易有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('39', '40', '上海西井信息科技有限公司', '91310118342373536G', null, null, '上海', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('390', null, '广西南宁寰宇木业有限公司/重庆岭峰木业有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('391', null, '北京派天下信息科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('392', null, '宝能百货零售有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('393', null, '重庆市林业投资开发有限责任公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('395', null, '杭州正途投资管理有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '122', '文化旅游组');
INSERT INTO `project_company_info` VALUES ('396', null, '华宇集团', null, null, null, null, null, null, null, null, null, null, null, null, '0', '122', '文化旅游组');
INSERT INTO `project_company_info` VALUES ('397', null, '快乐跑（北京）体育科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '122', '文化旅游组');
INSERT INTO `project_company_info` VALUES ('398', null, '合创充电设备有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '122', '文化旅游组');
INSERT INTO `project_company_info` VALUES ('399', null, '众晟马术俱乐部有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '122', '文化旅游组');
INSERT INTO `project_company_info` VALUES ('4', '4', '重庆德胜源文化创意有限公司', '91500106MA5U4EAE17', null, null, '重庆', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('40', '41', '深圳市纽瑞芯科技有限公司', '91440300MA5DQJUP7L', null, null, '广东省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('400', null, '星贯众文化艺术传播有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '122', '文化旅游组');
INSERT INTO `project_company_info` VALUES ('401', null, '大连圣亚', null, null, null, null, null, null, null, null, null, null, null, null, '0', '122', '文化旅游组');
INSERT INTO `project_company_info` VALUES ('402', null, '七火科技', null, null, null, null, null, null, null, null, null, null, null, null, '0', '122', '文化旅游组');
INSERT INTO `project_company_info` VALUES ('403', null, '重庆山渝晨舍信桥旅游发展有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '122', '文化旅游组');
INSERT INTO `project_company_info` VALUES ('404', null, '视界骐骥', null, null, null, null, null, null, null, null, null, null, null, null, '0', '122', '文化旅游组');
INSERT INTO `project_company_info` VALUES ('405', null, '重庆大途果典文化旅游合伙企业', null, null, null, null, null, null, null, null, null, null, null, null, '0', '122', '文化旅游组');
INSERT INTO `project_company_info` VALUES ('406', null, '重庆风朗文化旅游开发有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '122', '文化旅游组');
INSERT INTO `project_company_info` VALUES ('407', null, '重庆智合兰博酒店管理有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '122', '文化旅游组');
INSERT INTO `project_company_info` VALUES ('408', null, '柏天集团', null, null, null, null, null, null, null, null, null, null, null, null, '0', '122', '文化旅游组');
INSERT INTO `project_company_info` VALUES ('409', null, '重庆六真房地产开发有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '122', '文化旅游组');
INSERT INTO `project_company_info` VALUES ('41', '42', '北京中关村信息谷资产管理责任有限公司', '911101083183377975', null, null, '北京', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('410', null, '重庆维列斯米特贸易有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '122', '文化旅游组');
INSERT INTO `project_company_info` VALUES ('411', null, '纵野科技发展（重庆）有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '122', '文化旅游组');
INSERT INTO `project_company_info` VALUES ('412', null, '重庆魔西网络科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '122', '文化旅游组');
INSERT INTO `project_company_info` VALUES ('413', null, '重庆大学建筑规划设计研究总院有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '73', '总部经济组');
INSERT INTO `project_company_info` VALUES ('414', null, '北京颐和美方健康科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '73', '总部经济组');
INSERT INTO `project_company_info` VALUES ('415', null, '开普影像公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '73', '总部经济组');
INSERT INTO `project_company_info` VALUES ('416', null, '华信控股', null, null, null, null, null, null, null, null, null, null, null, null, '0', '73', '总部经济组');
INSERT INTO `project_company_info` VALUES ('417', null, '摩尔装配建筑（湛江）有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '73', '总部经济组');
INSERT INTO `project_company_info` VALUES ('418', null, '昆明盛智易联科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '73', '总部经济组');
INSERT INTO `project_company_info` VALUES ('42', '43', '武汉慧联无限科技有限公司', '91420100077732154L', null, null, '', null, null, null, null, '', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('420', null, '华润万家有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '73', '总部经济组');
INSERT INTO `project_company_info` VALUES ('421', null, '重庆边界康复技术研究院有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '73', '总部经济组');
INSERT INTO `project_company_info` VALUES ('422', null, '新美大集团', null, null, null, null, null, null, null, null, null, null, null, null, '0', '121', '新型金融组');
INSERT INTO `project_company_info` VALUES ('423', null, '万达金融公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '121', '新型金融组');
INSERT INTO `project_company_info` VALUES ('425', null, '锦程物流网络技术有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '121', '新型金融组');
INSERT INTO `project_company_info` VALUES ('426', null, '重庆三快小额贷款有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '121', '新型金融组');
INSERT INTO `project_company_info` VALUES ('428', null, '美团财富有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '121', '新型金融组');
INSERT INTO `project_company_info` VALUES ('429', null, '浙商银行', null, null, null, null, null, null, null, null, null, null, null, null, '0', '121', '新型金融组');
INSERT INTO `project_company_info` VALUES ('43', '44', '江苏卓胜微电子股份有限公司', '913202110518277888', null, null, '', null, null, null, null, '', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('431', null, '阳光财险重庆分公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '121', '新型金融组');
INSERT INTO `project_company_info` VALUES ('432', '431', '东风小康汽车有限公司沙坪坝分公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业');
INSERT INTO `project_company_info` VALUES ('433', '432', '重庆小康控股有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业');
INSERT INTO `project_company_info` VALUES ('434', '433', '重庆华孚工业股份有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业');
INSERT INTO `project_company_info` VALUES ('435', '434', '重庆气体压缩机厂公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业');
INSERT INTO `project_company_info` VALUES ('436', '435', '北京中科纳通电子技术有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业');
INSERT INTO `project_company_info` VALUES ('437', '436', '锦联地产集团有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业');
INSERT INTO `project_company_info` VALUES ('438', '437', '深圳普门科技股份有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业');
INSERT INTO `project_company_info` VALUES ('439', '438', '深圳市裕同包装科技股份有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业');
INSERT INTO `project_company_info` VALUES ('44', '45', '星环信息科技（上海）有限公司', '913101040693974723', null, null, '上海', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('440', '439', '北京德润俊科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业');
INSERT INTO `project_company_info` VALUES ('441', '440', '重庆三磨海达磨床有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业');
INSERT INTO `project_company_info` VALUES ('442', '441', '重庆市银钢一通科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业');
INSERT INTO `project_company_info` VALUES ('443', '442', '重庆联创嘉域工业设计有限公司、四川达尔志信息技术有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业');
INSERT INTO `project_company_info` VALUES ('444', '443', '重庆金智展混凝土有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业');
INSERT INTO `project_company_info` VALUES ('445', '444', '重庆原子键科技有限公司、浙江玉程机电制造有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业');
INSERT INTO `project_company_info` VALUES ('446', '445', '重庆国安机械有限公司、江苏丰泽汽车部件有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业');
INSERT INTO `project_company_info` VALUES ('447', '446', '重庆海达塑胶制品有限公司、宁海精时模塑有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业');
INSERT INTO `project_company_info` VALUES ('448', '447', '中装集团、中科院地质地球所', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业');
INSERT INTO `project_company_info` VALUES ('449', '448', '首创高科', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业');
INSERT INTO `project_company_info` VALUES ('45', '46', '武汉光电工业技术研究院', '914201000668432896', null, null, '湖北省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('450', '449', '东风小康汽车有限公司沙坪坝分公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业');
INSERT INTO `project_company_info` VALUES ('451', '450', '潍柴（重庆）汽车有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业');
INSERT INTO `project_company_info` VALUES ('452', '451', '重庆三沃科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业');
INSERT INTO `project_company_info` VALUES ('453', '452', '首度生物科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业');
INSERT INTO `project_company_info` VALUES ('454', '453', '中科大、中电科声光电公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业');
INSERT INTO `project_company_info` VALUES ('455', '454', '普强信息技术（北京）有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业');
INSERT INTO `project_company_info` VALUES ('456', '455', '中国航天科工集团第一研究院', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业');
INSERT INTO `project_company_info` VALUES ('457', '456', '北京坤舆天信科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业');
INSERT INTO `project_company_info` VALUES ('459', '458', '广州赛宝研究院', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业');
INSERT INTO `project_company_info` VALUES ('4593d58f2d1247fd8b4f4579f012f6fa', '7afdb8a959574491ab963985caff2b0d', '啊实打实大', null, null, null, null, '啊实打实大撒大多撒撒', null, null, '0', null, null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('46', '47', '青岛欧开智能系统有限公司', '9137021276362150X6', null, null, '', null, null, null, null, '', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('460', '459', '上海西井信息科技公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业');
INSERT INTO `project_company_info` VALUES ('461', '460', '南京俊东机电设备有限公司、重庆固硕特种车辆有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业');
INSERT INTO `project_company_info` VALUES ('462', '461', '北京高孚动力科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业');
INSERT INTO `project_company_info` VALUES ('463', '462', '武汉光电工业技术研究院', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业');
INSERT INTO `project_company_info` VALUES ('464', '463', 'POTTS LIMITED（香港波兹有限公司）', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业');
INSERT INTO `project_company_info` VALUES ('465', '464', '韵盛发科技（北京）股份有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业');
INSERT INTO `project_company_info` VALUES ('466', '465', '中国移动通信集团重庆有限公司、新华三技术有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业');
INSERT INTO `project_company_info` VALUES ('467', '466', '北京中聚高科科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业');
INSERT INTO `project_company_info` VALUES ('468', '467', '浪尖设计集团有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业');
INSERT INTO `project_company_info` VALUES ('469', '468', '天津天渝科技中心', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业');
INSERT INTO `project_company_info` VALUES ('47', '48', '苏州中科天翼光电有限公司', '91320505323820409H', null, null, '', null, null, null, null, '', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('470', '469', '天津航悦科技中心（有限合伙）', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业');
INSERT INTO `project_company_info` VALUES ('471', '470', '重庆开物工业有限公司、丹麦Bjorn Thorsen A/S公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业');
INSERT INTO `project_company_info` VALUES ('472', '471', '民生电商控股（深圳）有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('473', '472', '重庆中集汽车物流股份有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('474', '473', '重庆新大成投资有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('475', '474', '广州宝供投资有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('476', '475', '卓尔智联集团有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('477', '476', '传化集团有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('478', '477', '重庆方略农业发展有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('479', '478', '重庆金点园林有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('48', '49', '德尔福（上海）动力推进系统有限公司', '91310115607367554Y', null, null, '', null, null, null, null, '', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('480', '479', '重庆鑫垚实业有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('481', '480', '广东维木网络科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('482', '481', '小米数字科技有限公司 ', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('483', '482', '传化智联股份有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('484', '483', '宝能物流集团有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('485', '484', '中国农业银行股份有限公司重庆市分行', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('486', '485', '奥山投资有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '122', '文化旅游组');
INSERT INTO `project_company_info` VALUES ('487', '486', '陕西旅游股份有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '122', '文化旅游组');
INSERT INTO `project_company_info` VALUES ('488', '487', '量子体育 电建地产', null, null, null, null, null, null, null, null, null, null, null, null, '0', '122', '文化旅游组');
INSERT INTO `project_company_info` VALUES ('489', '488', '重庆沙坪坝文化旅游发展公司 上海伽马星科技发展有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '122', '文化旅游组');
INSERT INTO `project_company_info` VALUES ('49', '50', '大禹伟业（北京）国际科技有限公司', '91110108679611421U', null, null, '', null, null, null, null, '', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('490', '489', '重庆真信投资有限公司/新加坡狮岩毅鸣基金', null, null, null, null, null, null, null, null, null, null, null, null, '0', '122', '文化旅游组');
INSERT INTO `project_company_info` VALUES ('491', '490', '崛起东方（北京）旅游文化发展有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '122', '文化旅游组');
INSERT INTO `project_company_info` VALUES ('492', '491', '重庆国泰渝龙航空科技有限公司（暂定）', null, null, null, null, null, null, null, null, null, null, null, null, '0', '122', '文化旅游组');
INSERT INTO `project_company_info` VALUES ('493', '492', '重庆一步道位停车管理有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '73', '总部经济组');
INSERT INTO `project_company_info` VALUES ('494', '493', '中国和平石油物资集团有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '73', '总部经济组');
INSERT INTO `project_company_info` VALUES ('495', '494', '重庆极客慧谷企业管理有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '73', '总部经济组');
INSERT INTO `project_company_info` VALUES ('496', '495', '国发中经（北京）技术开发有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '73', '总部经济组');
INSERT INTO `project_company_info` VALUES ('497', '496', '中铁建川集团有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '73', '总部经济组');
INSERT INTO `project_company_info` VALUES ('498', '497', '重庆博众汽车销售服务有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '73', '总部经济组');
INSERT INTO `project_company_info` VALUES ('499', '498', '上海牧图工业产品设计有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '121', '新型金融组');
INSERT INTO `project_company_info` VALUES ('5', '5', '华亿金控集团有限公司', '', null, null, '香港', null, null, null, null, '境外', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('50', '52', '浪尖设计集团有限公司', '91440300708444459D', null, null, '广东省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('501', '501', '合美时光控股（香港）有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '73', '总部经济组');
INSERT INTO `project_company_info` VALUES ('502', '502', '不贰数字传媒集团公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '73', '总部经济组');
INSERT INTO `project_company_info` VALUES ('503', '503', '中建远洋产业控股有限责任公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '73', '总部经济组');
INSERT INTO `project_company_info` VALUES ('504', '504', '万联证券股份有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '73', '总部经济组');
INSERT INTO `project_company_info` VALUES ('505', '505', '重庆万家雅迪汽车销售服务有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '73', '总部经济组');
INSERT INTO `project_company_info` VALUES ('506', '506', '重庆盛迪亚产业（集团）有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '73', '总部经济组');
INSERT INTO `project_company_info` VALUES ('506de1e19a944b348a1def3289a0a319', '0d4027a148344550b4eb59ce4ee5af55', null, null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('507', '507', '君銮中国控股集团有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '73', '总部经济组');
INSERT INTO `project_company_info` VALUES ('508', '508', '成都新尚科技集团有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '73', '总部经济组');
INSERT INTO `project_company_info` VALUES ('509', '509', '大禹伟业（北京）国际科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('51', '53', '广州赛宝信息技术研究院', '914401011905230632', null, null, '广东省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('510', '510', '自然资源部中国地质调查局成都矿产综合利用研究所', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('511', '511', '重庆红海通汇网络科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('512', '512', '建投大真（天津）集中式快速充电站有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('513', '513', '武汉众犇慧通科技有限公司/重庆洪邦科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('514', '514', '中信数字技术有限责任公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('515', '515', '重庆水泵厂有限责任公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('516', '516', '北京设计之都发展有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('517', '517', '北京的卢深视科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('518', '518', '上海空基信息科技有限公司、上海核工程研究设计院', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('519', '519', '合肥杰发科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('52', '54', '杭州快灵光电科技有限公司', '913301083112110752', null, null, '', null, null, null, null, '', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('520', '520', '东杰智能软件（深圳）有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('521', '521', '深圳华迈兴微医疗科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('522', '522', '重庆航天火箭电子技术有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('523', '523', '北京联东投资（集团）有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('524', '524', '重庆智安信科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('525', '525', '浙江世纪康大医疗科技股份有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('526', '526', '大汉三通', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('527', '527', '上海韦翰斯生物医药科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('528', '528', '湖南诚合鑫科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('529', '529', '北京智行者科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('53', '55', '北京首创高科技发展有限公司', '91110108330373248B', null, null, '北京', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('530', '530', '四川互联同创孵化器管理有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('531', '531', '成都携恩科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('532', '532', '四川大学华西医学中心', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('533', '533', '成都弘毅天承知识产权集团', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('534', '534', '成都焊研科技有限责任公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '74', '先进制造业组');
INSERT INTO `project_company_info` VALUES ('535', '535', '国通控股集团', null, null, null, null, null, null, null, null, null, null, null, null, '0', '122', '文化旅游组');
INSERT INTO `project_company_info` VALUES ('536', '536', '餐车帮', null, null, null, null, null, null, null, null, null, null, null, null, '0', '122', '文化旅游组');
INSERT INTO `project_company_info` VALUES ('537', '537', 'FLOWNATION', null, null, null, null, null, null, null, null, null, null, null, null, '0', '122', '文化旅游组');
INSERT INTO `project_company_info` VALUES ('538', '538', '华人文化集团', null, null, null, null, null, null, null, null, null, null, null, null, '0', '122', '文化旅游组');
INSERT INTO `project_company_info` VALUES ('539', '539', '华赋教育科技集团有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '122', '文化旅游组');
INSERT INTO `project_company_info` VALUES ('54', '56', '杭州九方皋股权投资基金管理有限公司', '91330106MA28L0440R', null, null, '浙江省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('540', '540', '鲁能集团', null, null, null, null, null, null, null, null, null, null, null, null, '0', '122', '文化旅游组');
INSERT INTO `project_company_info` VALUES ('541', '541', '北京厚德跨客科技孵化器有限公司 重庆拾光格旅游开发股份有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '122', '文化旅游组');
INSERT INTO `project_company_info` VALUES ('542', '542', '重庆夯格瑞传媒有限公司 淘宝直播', null, null, null, null, null, null, null, null, null, null, null, null, '0', '122', '文化旅游组');
INSERT INTO `project_company_info` VALUES ('543', '543', '朗基瑞兴产业集团', null, null, null, null, null, null, null, null, null, null, null, null, '0', '122', '文化旅游组');
INSERT INTO `project_company_info` VALUES ('544', '544', '中国电建市政建设集团', null, null, null, null, null, null, null, null, null, null, null, null, '0', '121', '新型金融组');
INSERT INTO `project_company_info` VALUES ('545', '545', '山东齐鲁云商数字科技股份有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '121', '新型金融组');
INSERT INTO `project_company_info` VALUES ('546', '546', '国泰君安重庆分公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '121', '新型金融组');
INSERT INTO `project_company_info` VALUES ('547', '547', '广发银行重庆分行', null, null, null, null, null, null, null, null, null, null, null, null, '0', '121', '新型金融组');
INSERT INTO `project_company_info` VALUES ('548', '548', '渤海银行股份有限公司重庆分行', null, null, null, null, null, null, null, null, null, null, null, null, '0', '121', '新型金融组');
INSERT INTO `project_company_info` VALUES ('549', '549', '成都中创五联科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '121', '新型金融组');
INSERT INTO `project_company_info` VALUES ('55', '57', '普洛斯投资（上海）有限公司', '913100007655863301', null, null, '上海', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('550', '550', '科通芯城集团', null, null, null, null, null, null, null, null, null, null, null, null, '0', '121', '新型金融组');
INSERT INTO `project_company_info` VALUES ('551', '551', '冀中能源集团贵州能投丰基公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '121', '新型金融组');
INSERT INTO `project_company_info` VALUES ('552', '552', '赛旺检验检测认证有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '121', '新型金融组');
INSERT INTO `project_company_info` VALUES ('553', '553', '重庆笛斯文化传播有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '121', '新型金融组');
INSERT INTO `project_company_info` VALUES ('554', '554', '杭州传化智联', null, null, null, null, null, null, null, null, null, null, null, null, '0', '121', '新型金融组');
INSERT INTO `project_company_info` VALUES ('555', '555', '杭州盈火网络科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '121', '新型金融组');
INSERT INTO `project_company_info` VALUES ('556', '556', '广西阔尔登文化传媒公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '121', '新型金融组');
INSERT INTO `project_company_info` VALUES ('557', '557', '北京十一贝科技公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '121', '新型金融组');
INSERT INTO `project_company_info` VALUES ('558', '558', '广州国通控股集团有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('559', '559', '大连圣亚旅游控股股份有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('56', '58', 'LEADING WISE COMPANY 2 Limited', '1821617（公司编码）', null, null, '香港', null, null, null, null, '境外', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('560', '560', '绿地全球商品贸易港集团、绿地集团重庆公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('561', '561', '卓尔智联集团', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('562', '562', '重庆易租通汽车租赁有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('563', '563', '中商汇通(浙江)进出口有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('564', '564', '重庆泷耀盈通供应链管理有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('565', '565', '重庆中林林产品有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('566', '566', '重庆市农产品（集团）有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('567', '567', '中新南向通道（重庆）物流发展有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('568', '568', '北京多来点信息技术有限公司', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('569', '569', '阿里巴巴集团战略发展部', null, null, null, null, null, null, null, null, null, null, null, null, '0', '75', '商贸物流组');
INSERT INTO `project_company_info` VALUES ('57', '59', '民生电商控股（深圳）有限公司', '91440300334947982R', null, null, '广东省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('58', '61', '盘古集团有限公司', '000000000000000000', null, null, '香港', null, null, null, null, '境外', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('59', '62', '传化物流集团股份有限公司', '91330109560589212Y', null, null, '浙江省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('6', '6', '和记物流（香港）有限公司', '049578000000000000', null, null, '香港', null, null, null, null, '境外', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('60', '63', '卓尔智联集团有限公司', '9142010071196501X8', null, null, '', null, null, null, null, '', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('61', '64', '广州宝供投资有限公司', '914401017315712885', null, null, '广东省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('62', '65', '泸州老窖集团有限责任公司', '91510500723203346U', null, null, '四川省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('63', '66', '汉宏物流（中国）有限公司', '91310000710939098Y', null, null, '上海', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('64', '67', '北京物美商业集团股份有限公司', '9111000072261280XB', null, null, '北京', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('65', '68', '中升（大连）集团有限公司', '91210200711308618L', null, null, '辽宁省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('66', '69', '中粮海优（北京）有限公司', '91110000055590239L', null, null, '北京', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('67', '70', '娄底市森宏贸易有限公司', '91431300MA4QCGNN1P', null, null, '湖南省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('68', '71', '大连锦程物流网络技术有限公司', '912102317730080636', null, null, '', null, null, null, null, '', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('69', '72', '北京十一贝科技公司（携程集团企业）', '91110108MA00740H5E', null, null, '北京', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('7', '7', '上海伽玛星科技发展有限公司 重庆海吉亚肿瘤医院有限公司', '913101087626421730 91500106MA5U3G3TX9', null, null, '上海 重庆', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('70', '73', '传化智联公司', '91330000609301348W', null, null, '', null, null, null, null, '', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('71', '74', '荣德鑫投资（集团）有限公司', '509988', null, null, '', null, null, null, null, '', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('72', '75', '科通芯城集团', 'F0020605', null, null, '', null, null, null, null, '', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('72cd309be27d4545ba288f2eb03288b5', 'dcd1cb4e474f4306975be6d3ed811d16', '监管机构', '656556', '采矿业', '林业', '发好烦好烦好烦', '预热预热预热', '6565.00', '656.00', '6565', '市内', '复合肥', '5655', null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('73', '76', '启迪控股股份有限公司', '91110108722611575Q', null, null, '北京', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('74', '77', '启迪协信科技城投资集团有限公司', '9111010834841276XB', null, null, '北京', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('75', '78', '陕西旅游股份有限公司', '91610000713578662F', null, null, '陕西省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('76', '79', '奥山投资有限公司', '91420000676467540A', null, null, '湖北省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('77', '80', '北京厚德跨客科技孵化器有限公司', '911101143442867000', null, null, '北京', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('78', '81', '雪松控股集团有限公司', '91440101347466547J', null, null, '广东省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('79', '82', '重庆日报', '', null, null, '', null, null, null, null, '', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('8', '8', '科德数控股份有限公司', '91210200669220902M', null, null, '辽宁省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('80', '83', '崛起东方（北京）旅游文化发展有限公司', '91110111MA017B372B', null, null, '北京', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('81', '84', '成都美方健康管理有限公司', '91510100MA6C58P66H', null, null, '', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('82', '85', '成都厚意科技有限公司', '91510100MA6AB04TX1', null, null, '四川省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('821dd8a6193f44f8a68b6b345c459382', 'a0816504793b4749ab22bdb234842c7b', 'asdasdas', null, null, null, null, null, null, null, '0', null, null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('83', '86', '国发中经（北京）技术开发有限公司', '91110108MA01CN5LXK', null, null, '北京', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('84', '87', '中海油销售四川有限公司', '91510100592064613X', null, null, '四川省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('85', '88', '欧中联创（北京）企业管理有限公司', '91110102MA003JU9X9', null, null, '', null, null, null, null, '', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('86', '89', '北京盛威时代科技有限公司', '911101080556340191', null, null, '北京', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('87', '90', '北京瑞健高科生物科技有限公司', '911101140628352000', null, null, '北京', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('88', '91', '汉口银行股份有限公司', '91420100300248067P', null, null, '', null, null, null, null, '', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('89', '92', '华科同济医疗投资管理有限公司', '91420111MA4KWD731B', null, null, '', null, null, null, null, '', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('9', '9', '北京德润俊科技有限公司', '91110115786159629T', null, null, '北京', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('90', '93', '北京点创智趣科技有限公司', '911101050785728425', null, null, '', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('91', '94', '瑞斯丽酒店管理（上海）有限公司', '91310000MA1G8QGP4Q', null, null, '', null, null, null, null, '', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('92', '95', '北京云杉世界信息技术有限公司', '91110108321679624T', null, null, '北京', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('93', '96', '北京佰才邦技术有限公司', '911101080967661063', null, null, '北京', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('94', '97', '北大培文投资（北京）有限公司', '9111010831799754XG', null, null, '', null, null, null, null, '', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('95', '98', '中关村协同发展投资有限公司', '91110108MA0017W721', null, null, '', null, null, null, null, '', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('96', '99', '中国葛洲坝集团有限公司', '91420000751025196U', null, null, '', null, null, null, null, '', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('97', '101', '上海海赋置业有限公司 西安量子体育管理有限公司', '91120118MA05JQUK0G 9131011231237487X7', null, null, '上海 陕西省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('98', '103', '美团财富有限公司', '000000000000000000', null, null, '香港', null, null, null, null, '境外', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('99', '104', '德国博泽集团', '000000000000000000', null, null, '德国', null, null, null, null, '境外', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('a2e9ceb13a464799ad8f53d8ec7d49e9', '671cd237f7314bb28da3a5389676ac22', null, null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('a8b3402ac1c0456dbb9b01c98b931ac4', '691be385490847dbacaf0c47c81ad50e', '重庆技术能力有限公司', '500001234567890', '农、林、牧、渔业', '农、林、牧、渔服务业', '中国重庆', '我们是重庆技术能力有限公司', '1000.00', '100.00', '1000', '市内', '刘德华', '18912344321', '/2020年06月04日/30636128aff449d7b64e806b508e66e811.jpg', '0', null, null);
INSERT INTO `project_company_info` VALUES ('b28966f5e0934736a1b869e977124fe7', 'Z202004010141232', '深圳前海融一科技有限公司', '91440300MA5EJEHT63', null, null, '广东省', null, null, null, null, '境内', null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('b4b98276f6924216a425c7bf328638d7', '6ad218470b16444aa3698ebf4519b9af', null, null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('b6c338ed5cc84ab6b75216c542e98bef', '8365b232a13b4aaaa5b340d6ab7c72ca', null, null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('e49ed9f3804449ab87eb416f8b595e9c', 'b2c2d9029fd9467fa62be4e82aec48f4', null, null, '电力、热力、燃气及水生产和供应业', '渔业', null, null, null, null, '0', null, null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('e4b18840fd204f9b86626aeed23c2486', '1', '哈哈技术能力有限公司', '50000032112345678901', '交通运输、仓储和邮政业', '畜牧业', '中国重庆沙坪坝区', '能力技术有限公司', '900.00', '90.00', '900', '市内', '王菲', '18901234321', '/2020年06月04日/af08fe8ce1c84cdd97e815f7dd2387a611.jpg', '0', null, null);
INSERT INTO `project_company_info` VALUES ('f0aa8e799e5944c48486f347f277e96d', 'acc262a706ce409e92ac3d9af5f3fc94', null, null, null, null, null, null, null, null, '0', null, null, null, null, '0', null, null);
INSERT INTO `project_company_info` VALUES ('f66f5dbce4c74a52bdeaf9a47718f957', '9da8ff7c2bef4cda825c97453e3a1a62', null, null, null, null, null, null, null, null, '0', null, null, null, null, '0', null, null);

-- ----------------------------
-- Table structure for project_contract
-- ----------------------------
DROP TABLE IF EXISTS `project_contract`;
CREATE TABLE `project_contract` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '合同编码',
  `project_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目编码',
  `status` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '状态：1-敲定协议， 2-司法审核通过，3-常务会议决策，4-常委会议决策',
  `meeting_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '常务会代码',
  `meeting_code_two` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '常务会代码',
  `contract_items` text COLLATE utf8_unicode_ci COMMENT '合同条款',
  `del_flag` varchar(2) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '是否删除：0-否，1-是',
  `sign_flag` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否敲定协议',
  `leg_flag` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否司法审核通过',
  `meeting_flag` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否常务会议决策',
  `meeting_two_flag` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否常务会议决策',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`,`del_flag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='项目合同信息';

-- ----------------------------
-- Records of project_contract
-- ----------------------------
INSERT INTO `project_contract` VALUES ('13e5f9a85dcd4109a3de80a016c49e2d', '36d3a498aadb49519a848e5aacb9eeea', '3', '900', '800', null, '0', '1', '1', '1', '1');
INSERT INTO `project_contract` VALUES ('8679df0c44134d9bb6d94939399254af', 'e500e598d1d84379addee8069a33a306', '3', null, null, null, '0', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for project_contract_details
-- ----------------------------
DROP TABLE IF EXISTS `project_contract_details`;
CREATE TABLE `project_contract_details` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '编码',
  `project_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目编码',
  `contract_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '合同编码',
  `file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '文件名称',
  `file_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '文件路径',
  `del_flag` varchar(2) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '是否删除：0-否，1-是',
  `contract_items` text COLLATE utf8_unicode_ci COMMENT '合同条款',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`,`contract_id`,`del_flag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='项目合同文件';

-- ----------------------------
-- Records of project_contract_details
-- ----------------------------
INSERT INTO `project_contract_details` VALUES ('c7d0c08082b24f9db22ae8349bff6956', '36d3a498aadb49519a848e5aacb9eeea', '13e5f9a85dcd4109a3de80a016c49e2d', '1130会议购房通小程序整改要点.docx', '/2020年06月04日/bf18beac16d640be921668d443ecd7a71130会议购房通小程序整改要点.docx', '0', '合同条款');

-- ----------------------------
-- Table structure for project_deal_details
-- ----------------------------
DROP TABLE IF EXISTS `project_deal_details`;
CREATE TABLE `project_deal_details` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '编码',
  `project_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目名称',
  `project_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目编码',
  `deal_user_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '跟进人',
  `deal_create_date` datetime DEFAULT NULL COMMENT '跟进时间',
  `deal_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '对接方式',
  `company_user_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '企业联系人',
  `company_user_post` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '联系人职务',
  `project_debriefing` text COLLATE utf8_unicode_ci COMMENT '项目进展',
  `project_issues` text COLLATE utf8_unicode_ci COMMENT '当前存在的问题',
  `project_follow_up` text COLLATE utf8_unicode_ci COMMENT '后续推进安排',
  `del_flag` varchar(2) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '是否删除：0-否，1-是',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`,`project_id`,`del_flag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='项目进展维护';

-- ----------------------------
-- Records of project_deal_details
-- ----------------------------
INSERT INTO `project_deal_details` VALUES ('7326fc9a2c4b4ec08333ab31555a1d17', '阿达', '98b3f44a382e4af884c39e7d03cc4381', '阿达', '2020-07-01 00:00:00', '线下面谈', '阿达', '阿达', '阿萨德按时', '啊大神大所', '大大大大大大大多多多多多多', '0');
INSERT INTO `project_deal_details` VALUES ('be0ab488b151483eb2a0da2b40a5ff48', '智慧停车场', 'd8ecdb943aae4d31adc105299e847388', '陈测试', '2020-06-12 00:00:00', '线下面谈', '刘德华', '项目对接人', '洽谈阶段', '关于实际考察待定', '协调实地考察', '0');
INSERT INTO `project_deal_details` VALUES ('c04e1c006518482b8adbac0966cb2c3d', null, '691be385490847dbacaf0c47c81ad50e', null, null, null, null, null, null, null, null, '1');
INSERT INTO `project_deal_details` VALUES ('ca367dd5929f47548ce732e538534424', null, '691be385490847dbacaf0c47c81ad50e', null, null, null, null, null, null, null, null, '1');
INSERT INTO `project_deal_details` VALUES ('d4161017208c44e3b35eaf27522ad7aa', '智慧停车系统', 'd8ecdb943aae4d31adc105299e847388', '哈哈', '2020-06-13 00:00:00', '线下面谈', '路人甲', '对接人', '有待进一步', '没有', '暂无', '0');
INSERT INTO `project_deal_details` VALUES ('d977e0350f4245839c179b7c65e37d8b', null, '98b3f44a382e4af884c39e7d03cc4381', '大萨达撒', '2020-07-02 00:00:00', '线上洽谈', '啊大大', '测试', '啊实打实大', '阿达是的按时打算阿萨德的大大大', '按时大神撒多按时', '1');

-- ----------------------------
-- Table structure for project_exchange
-- ----------------------------
DROP TABLE IF EXISTS `project_exchange`;
CREATE TABLE `project_exchange` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '编码',
  `project_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属项目',
  `contract_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '合同编号',
  `contract_items` text COLLATE utf8_unicode_ci COMMENT '合同条款内容',
  `pre_exchange_flag` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否满足兑现条款',
  `exchanged_flag` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '政策是否已兑现',
  `exchange_items` text COLLATE utf8_unicode_ci COMMENT '兑现内容',
  `exchange_date` datetime DEFAULT NULL COMMENT '兑现时间',
  `exchange_user_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '政策兑现人编码',
  `exchange_user_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '政策兑现人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人',
  `del_flag` varchar(2) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '是否删除：0-否，1-是',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`,`exchange_user_id`,`create_by`,`del_flag`) USING BTREE,
  KEY `project_id` (`project_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='项目-政策兑现';

-- ----------------------------
-- Records of project_exchange
-- ----------------------------
INSERT INTO `project_exchange` VALUES ('2f672663279a419f925bbfc2ed582413', 'this.id', '1', '合同内容，这是内容', '0', '1', '这是兑现内容', '2020-11-11 12:12:12', '12', '这是兑现人', '2020-06-08 13:54:15', '3', '1');
INSERT INTO `project_exchange` VALUES ('3f1110aa333040118bc48aa52b350431', 'this.id', '1', '合同内容，这是内容', '0', '1', '这是兑现内容', '2020-11-11 12:12:12', '12', '这是兑现人', '2020-06-04 14:29:50', '3', '1');
INSERT INTO `project_exchange` VALUES ('6884eeecf0ec45919fdfe12a4a4006ce', 'this.id', '1', '合同内容，这是内容', '0', '1', '这是兑现内容', '2020-11-11 12:12:12', '12', '这是兑现人', '2020-06-05 09:42:22', '3', '1');
INSERT INTO `project_exchange` VALUES ('8816cb89829b4166989eb5c96f08251a', 'this.id', '1', '合同内容，这是内容', '0', '1', '这是兑现内容', '2020-11-11 12:12:12', '12', '这是兑现人', '2020-06-05 10:48:30', '3', '1');
INSERT INTO `project_exchange` VALUES ('aa03891d9b024029838ccdfdd6563e01', 'this.id', '1', '合同内容，这是内容', '0', '1', '这是兑现内容', '2020-11-11 12:12:12', '12', '这是兑现人', '2020-06-08 13:54:18', '3', '0');
INSERT INTO `project_exchange` VALUES ('b4ab14faf24f4c09b8ffa2603c7842a6', 'this.id', '1', '合同内容，这是内容', '0', '1', '这是兑现内容', '2020-11-11 12:12:12', '12', '这是兑现人', '2020-06-04 14:38:35', '3', '1');
INSERT INTO `project_exchange` VALUES ('c957335de25247ab96d74a0014e05542', 'this.id', '1', '合同内容，这是内容', '0', '1', '这是兑现内容', '2020-11-11 12:12:12', '12', '这是兑现人', '2020-06-04 14:32:19', '3', '1');
INSERT INTO `project_exchange` VALUES ('dae01776fdfb4376b6ab9685123b8134', 'this.id', '1', '合同内容，这是内容', '0', '1', '这是兑现内容', '2020-11-11 12:12:12', '12', '这是兑现人', '2020-06-05 09:57:57', '3', '1');
INSERT INTO `project_exchange` VALUES ('e782da7f400d4d60a39e02156c37bae3', 'this.id', '1', '合同内容，这是内容', '0', '1', '这是兑现内容', '2020-11-11 12:12:12', '12', '这是兑现人', '2020-06-05 09:09:08', '3', '1');

-- ----------------------------
-- Table structure for project_images
-- ----------------------------
DROP TABLE IF EXISTS `project_images`;
CREATE TABLE `project_images` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '编码',
  `project_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属项目',
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '类型',
  `upload_flag` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否录入固定资产投资库',
  `upload_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '固投库项目代码',
  `signing_flag` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否参与集中签约',
  `signing_date` datetime DEFAULT NULL COMMENT '集中签约时间',
  `open_flag` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否参加集中开工：0-否，1-是',
  `open_date` datetime DEFAULT NULL COMMENT '集中开工时间',
  `del_flag` varchar(2) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '是否删除：0-否，1-是',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`,`status`,`upload_flag`,`signing_flag`,`open_flag`,`del_flag`) USING BTREE,
  KEY `project_id` (`project_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='项目画像';

-- ----------------------------
-- Records of project_images
-- ----------------------------
INSERT INTO `project_images` VALUES ('06f1df464b5c4936a806f0fa9c7080aa', 'd8ecdb943aae4d31adc105299e847388', '纳入市级考核,市级重大招商项目,西洽会签约项目,世博会签约项目', '1', '0001', '1', '2020-06-10 00:00:00', '1', '2020-06-25 00:00:00', '0');
INSERT INTO `project_images` VALUES ('d0a3e9d0cd1642dda008b0a4b54a6847', '8365b232a13b4aaaa5b340d6ab7c72ca', null, '1', null, '1', null, '1', null, '0');
INSERT INTO `project_images` VALUES ('dc8971288e054ee4998dc880ad500d56', '09457a763b384273832f767492d25210', '市级重大招商项目,纳入市级考核,西洽会签约项目', '0', null, '0', null, '0', null, '0');
INSERT INTO `project_images` VALUES ('e0234845fffa4e5e9d48081d68501c5f', '6ad218470b16444aa3698ebf4519b9af', null, '1', null, '1', null, '1', null, '0');
INSERT INTO `project_images` VALUES ('f98477edfa094683b75e2ab2e7c28239', '36d3a498aadb49519a848e5aacb9eeea', '纳入市级考核,西洽会签约项目,世博会签约项目', '1', null, '1', null, '1', null, '0');

-- ----------------------------
-- Table structure for project_info
-- ----------------------------
DROP TABLE IF EXISTS `project_info`;
CREATE TABLE `project_info` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '项目编码',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目名称',
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目编号',
  `industry` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `classify_type` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属行业',
  `classify_type_two` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属行业',
  `source_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '信息来源',
  `source_type_two` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '信息来源',
  `item_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目类型',
  `description` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目简介',
  `total_cast` decimal(10,2) DEFAULT NULL COMMENT '预计投资总额',
  `output_value` decimal(10,2) DEFAULT NULL COMMENT '预计年产值',
  `estimated_tax` decimal(10,2) DEFAULT NULL COMMENT '预计税收',
  `total_people` int(10) DEFAULT NULL COMMENT '预计用工数',
  `deal_time` datetime DEFAULT NULL COMMENT '交办时间',
  `open_time` datetime DEFAULT NULL COMMENT '计划开工时间',
  `production_time` datetime DEFAULT NULL COMMENT '计划投产时间',
  `create_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人员',
  `create_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '姓名',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '更新人员',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `group_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属小组',
  `office_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属单位',
  `remarks` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `del_flag` varchar(2) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '删除',
  `status` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '状态',
  `urge_flag` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否督办项目',
  `urge_type` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '督办类型',
  `urge_leader` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '督办领导',
  `step_status` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '阶段状态：1-暂停，2-重启，3-终止',
  `step_remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '阶段描述',
  `transfer_flag` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否投促项目',
  `investortype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `companyid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `investorid` bigint(20) DEFAULT NULL,
  `productstart` int(255) DEFAULT '1' COMMENT '是否开工 0已开工  1未开工',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`,`classify_type`,`source_type`,`item_type`,`create_by`,`office_id`,`del_flag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='项目信息';

-- ----------------------------
-- Records of project_info
-- ----------------------------
INSERT INTO `project_info` VALUES ('1', '深化与中国电科集团量子通信领域合作', 'Z201904000001', '166', '智能制造装备', '制造业', '市领导会见', null, null, null, null, '40000.00', null, null, null, null, null, null, '孙晓旭', '2019-11-30 22:37:08', null, null, null, null, '', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('10', '普门科技重庆研发及生产基地暨西部区域总部项目', 'Z201905000715', '167', '生物医药', '制造业', '智博会', null, null, null, '3600.00', '110000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-19 14:49:06', null, null, null, null, '因高新区不同意供地，项目暂时搁置。', '0', '1', null, null, null, null, null, null, null, null, null, '1');
INSERT INTO `project_info` VALUES ('100', '维列斯米特贸易进出口项目', 'Z201905000876', '167', '国际物流及城乡配送', '其他服务业', '智博会', null, null, null, null, '100.00', null, null, null, null, null, null, '孙晓旭', '2020-04-07 04:18:13', null, null, null, null, '已开工', '0', '1', null, null, null, null, null, null, null, null, null, '1');
INSERT INTO `project_info` VALUES ('101', '新数字经济产业园项目', 'Z201905000877', '167', '数字创意', '文化、体育和娱乐业', '智博会', null, null, null, '0.00', '300000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-18 16:11:35', null, null, null, null, '目前因高新区规划调整事宜，计划移交高新区。', '0', '1', null, null, null, null, null, null, null, null, null, '1');
INSERT INTO `project_info` VALUES ('102', '纵野科技生产研发西南总部项目', 'Z201906002328', '167', '智能制造装备', '制造业', '智博会', null, null, null, '0.00', '5000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-18 16:12:38', null, null, null, null, '目前因高新区规划调整事宜，计划移交高新区。', '0', '1', null, null, null, null, null, null, null, null, null, '1');
INSERT INTO `project_info` VALUES ('103', '三快小额贷款公司ABS项目', 'Z201906002340', '167', '新兴金融服务业', '金融业', '西洽会 智博会', null, null, null, null, '5000.00', null, null, null, null, null, null, '孙晓旭', '2019-11-29 16:03:08', null, null, null, null, '已运营', '0', '1', null, null, null, null, null, null, null, null, null, '1');
INSERT INTO `project_info` VALUES ('104', '汽车部件生产车间数字化装备普及', 'Z201906002345', '167', '汽车', '制造业', '', null, null, null, null, '100000.00', null, null, null, null, null, null, '孙晓旭', '2019-12-30 16:15:00', null, null, null, null, '正常运营', '0', '1', null, null, null, null, null, null, null, null, null, '1');
INSERT INTO `project_info` VALUES ('105', '工业设计中试制造基地项', 'Z201906002347', '167', '电子信息', '制造业', '智博会', null, null, null, '1500.00', '6000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:47:34', null, null, null, null, '基础施工，正在办理施工许可证', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('106', '“智匠星云”汽车工业互联网平台项目', 'Z201906003125', '167', '互联网云计算大数据', '信息传输、软件和信息技术服务业', '智博会', null, null, null, null, '160000.00', null, null, null, null, null, null, '孙晓旭', '2019-11-26 11:06:20', null, null, null, null, '无', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('107', '航天智慧产业研究院', 'Z201906003130', '167', '互联网云计算大数据', '信息传输、软件和信息技术服务业', '智博会', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:47:41', null, null, null, null, '磋商', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('108', '中科·国机地球资源装备产研项目', 'Z201906003132', '167', '智能制造装备', '制造业', '智博会', null, null, null, '14384.00', '200000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-22 14:09:44', null, null, null, null, '完善协议', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('109', '航天科工5G技术产业研究院', 'Z201906003166', '167', '电子信息', '制造业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:47:49', null, null, null, null, '磋商', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('11', '裕同科技智慧工厂暨高端智能包装项目', 'Z201905000716', '167', '智能制造装备', '制造业', '智博会', null, null, null, '5000.00', '160000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-19 14:49:18', null, null, null, null, '因高新区不同意供地，项目暂时搁置。', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('110', '四维图新第二总部项目', 'Z201906003172', '167', '电子信息', '制造业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:47:55', null, null, null, null, '等待双方高层同意。', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('111', '红正德高端无线安全总部及研发暨生产基地项目', 'Z201906003184', '167', '电子信息', '制造业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2019-10-22 17:00:51', null, null, null, null, '无。', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('112', '易法通全国大数据中心暨人工智能研发总部项目', 'Z201906003527', '167', '人工智能', '制造业', '', null, null, null, null, '150000.00', null, null, null, null, null, null, '孙晓旭', '2019-11-26 11:31:05', null, null, null, null, '已投运', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('113', '电子安防产业化基地项目', 'Z201906003550', '167', '智能终端', '制造业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2019-10-22 17:01:32', null, null, null, null, '无', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('114', '高性能数据转化器研发及产业化基地项目', 'Z201906003579', '167', '电子信息', '制造业', '智博会', null, null, null, '10000.00', '47000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-21 15:00:40', null, null, null, null, '正在装修', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('115', '重庆市中智医谷三类医疗器械生产基地暨研究院项目', 'Z201906003607', '167', '生物医药', '制造业', '智博会', null, null, null, '1000.00', '5000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-19 15:08:14', null, null, null, null, '已投运', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('116', '军用通信设备产业园', 'Z201906003626', '167', '智能制造装备', '制造业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-22 14:07:34', null, null, null, null, '协调相关金融机构解决企业资金需求', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('117', '互联网+城市智慧停车项目', 'Z201906003627', '167', '其他', '信息传输、软件和信息技术服务业', '智博会', null, null, null, null, '1000.00', null, null, null, null, null, null, '孙晓旭', '2019-12-30 09:49:16', null, null, null, null, '签订正式协议，已完成企业注册。已入驻运营。', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('118', '卓尔文旅总部项目', 'Z201906004216', '167', '文化旅游服务业', '租赁和商务服务业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2019-11-26 17:04:37', null, null, null, null, '因企业投资战略调整，该项目暂缓', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('119', '新能源汽车高性能动力项目', 'Z201906004590', '167', '新能源汽车及智能汽车', '制造业', '西洽会', null, null, null, '30000.00', '1000000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-19 15:09:47', null, null, null, null, '电机电控车间 二次结构完成95%，屋面刚性层完成95%，地面砼完成5%，外墙施工进场。食堂砌体完成，办公楼砌体完成80%。PACK车间钢柱钢梁安装完成50%。', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('12', '旗探科技总部基地暨智能物联研究院公司项目', 'Z201905000717', '167', '物联网', '信息传输、软件和信息技术服务业', '西洽会 智博会', null, null, null, null, '100000.00', null, null, null, null, null, null, '孙晓旭', '2019-11-26 11:03:19', null, null, null, null, '无', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('120', '同弘股权投资基金管理有限公司', 'Z201906004593', '167', '新兴金融服务业', '金融业', '西洽会', null, null, null, null, '1200.00', null, null, null, null, null, null, '孙晓旭', '2019-11-29 16:39:53', null, null, null, null, '目前已入驻园区并已正常运营。', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('121', '渝晋新股权投资基金', 'Z201906004596', '167', '新兴金融服务业', '金融业', '西洽会', null, null, null, null, '800.00', null, null, null, null, null, null, '孙晓旭', '2019-09-23 11:45:05', null, null, null, null, '', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('122', '共建重庆大学城科技产业服务平台项目', 'Z201906004601', '167', '园区开发类', '其他服务业', '西洽会', null, null, null, null, '200.00', null, null, null, null, null, null, '孙晓旭', '2019-11-26 11:07:41', null, null, null, null, '无', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('123', '重离子治癌症项目', 'Z201906005163', '167', '生物医药', '制造业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-22 14:07:26', null, null, null, null, '根据安排，区规划与自然资源局已做地块选址方案并报区政府主要领导审议。', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('124', '韵盛发科技总部项目', 'Z201906005164', '167', '物联网', '制造业', '', null, null, null, null, '23000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-19 15:09:59', null, null, null, null, '装修受疫情影响，暂未复工', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('125', '杰发科技西部总部项目', 'Z201906005305', '167', '电子信息', '制造业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:51:58', null, null, null, null, '继续细化合作内容', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('126', '量子通信器件联合实验室项目', 'Z201906005312', '167', '电子信息', '制造业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-22 14:05:34', null, null, null, null, '磋商', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('127', '欧帝智能显示终端产研项目', 'Z201906005316', '167', '智能终端', '制造业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2019-10-22 17:08:14', null, null, null, null, '已初步对接，向企业介绍沙区及园区的资源优势，企业已提供项目策划方案，计划实地拜访企业并沟通政策匹配方案及落地细节。', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('128', '工业技术软件开发项目', 'Z201906005317', '167', '电子信息', '制造业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2019-10-22 17:08:51', null, null, null, null, '合作协议已基本确定，待空基与核工程商议确定并完成核工院集团上会后，启动我方上会程序。', '0', '1', null, null, null, null, null, '1', null, null, null, '1');
INSERT INTO `project_info` VALUES ('129', '数位智能定位研究院项目', 'Z201906005318', '167', '电子信息', '制造业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2019-10-22 17:09:16', null, null, null, null, '企业拟在重庆、成都选址落地项目，拟在近期考察沙区，磋商项目合作事宜。', '0', '1', null, null, null, null, null, '1', null, null, null, '1');
INSERT INTO `project_info` VALUES ('13', '气象遥感大数据研发应用中心项目', 'Z201905000718', '167', '互联网云计算大数据', '信息传输、软件和信息技术服务业', '智博会', null, null, null, '0.00', '18000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-19 14:55:53', null, null, null, null, '企业未获得君岳基金融资，项目停滞。', '0', '1', null, null, null, null, null, '1', null, null, null, '1');
INSERT INTO `project_info` VALUES ('130', '城市产业创新中心项目', 'Z201906005319', '167', '其他', '其他服务业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2019-10-22 17:09:25', null, null, null, null, '无。', '0', '1', null, null, null, null, null, '1', null, null, null, '1');
INSERT INTO `project_info` VALUES ('131', '思爱普（重庆）智能制造联合创新中心项目', 'Z201906005321', '167', '智能制造装备', '制造业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:53:36', null, null, null, null, '正在与企业双方商议项目具体考核指标。', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('132', '盛智易联重庆网约车项目', 'Z201907005790', '167', '其他', '其他服务业', '智博会', null, null, null, '0.00', '20000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:52:46', null, null, null, null, '完成工商注册并取得网络预约出租汽车经营许可证。目前尚未投入自有车辆，正与重庆部分汽车租赁公司洽谈合作。预计一个月内投入自有车辆，并有可能将全国网约车结算总部移到重庆。', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('133', '华为创新中心项目', 'Z201907006215', '167', '汽车', '制造业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-03-31 23:09:00', null, null, null, null, '下一步，拟请华为就区块链方面的研究做梳理，初步提出合作方案', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('134', '固硕特种车辆定制改装总部基地暨产业化项目', 'Z201907006278', '167', '高端交通装备', '制造业', '智博会', null, null, null, '0.00', '90000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-22 14:05:49', null, null, null, null, '已签订协议', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('135', '寰宇进口木材（重庆）产业园项目', 'Z201907006352', '167', '其他', '批发和零售业', '', null, null, null, null, '20000.00', null, null, null, null, null, null, '孙晓旭', '2020-04-26 16:54:32', null, null, null, null, '企业已注册，已入驻运营，开展木材进口业务。', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('136', '崛起东方金融街景观改造及旅游演艺项目', 'Z201907006455', '167', '文化旅游服务业', '文化、体育和娱乐业', '智博会', null, null, null, '0.00', '3000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-18 16:14:41', null, null, null, null, '经沟通，金融街目前还未与崛起东方就项目选址达成一致，且崛起东方目前正在进行内部股权改革，项目或将延迟，继续协调企业商务条款沟通，尽快签约，再次会同两家企业协商项目选址事宜。', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('137', '现代智慧体育中心项目', 'Z201908007067', '167', '文旅类 ', '文化、体育和娱乐业', '', null, null, null, null, '5000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-18 17:19:48', null, null, null, null, '项目公司已注册，已签订正式协议，我方协助企业寻找项目用地。', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('138', '中铁建川重庆总部项目', 'Z201908007191', '167', '城市基础设施', '建筑业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:52:26', null, null, null, null, '已完成公司注册，目前正在就办公场地进行选择，并完成恩施和阆中项目土地摘牌。', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('139', '国泰·未来方舟项目', 'Z201908007194', '167', '非住宅类房地产类', '批发和零售业', '', null, null, null, null, '100000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:48:10', null, null, null, null, '项目合作协议已完成公司上会流程，已报区司法局审核，将启动区常务会流程。', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('14', '捷嘉（重庆）冷链进口平台', 'Z201905000719', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2019-12-27 10:03:37', null, null, null, null, '\"1.完成公司注册及税务登记。', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('140', '重庆华润万家生活超市有限公司吸收合并广西华润万家生活超市有限公司项目', 'Z201908007199', '167', '其他', '批发和零售业', '', null, null, null, null, '130000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:48:14', null, null, null, null, '已签约', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('141', '爱建证券西南投行分公司', 'Z201908007201', '167', '新兴金融服务业', '金融业', '', null, null, null, null, '1000000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:48:19', null, null, null, null, '11月5日，江涛书记，世祥常务带队考察爱建证券上海总部，就爱建在沙区设立投行分公司事宜进行高层对接。计划于年内签订招商协议。目前就核心条款进行磋商。', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('142', '高孚动力总部基地暨磁悬浮电机生产基地项目', 'SPB20200618101261', '167', '电子信息', '制造业', '', null, '楼宇类项目', null, '2000.00', '130000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-29 14:18:07', null, '2020-06-18 23:54:44', null, null, '已完成装修，部分设备已进场', '0', '3', null, null, null, '0', null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('143', '燃气热泵产业化制造基地暨研究院项目', 'Z201908007245', '167', '能源', '制造业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-21 10:37:15', null, null, null, null, '已完善协议', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('144', '城市数字消防安全管理公共服务平台全国总部基地项目', 'Z201908007253', '167', '互联网云计算大数据', '信息传输、软件和信息技术服务业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-04-01 21:27:35', null, null, null, null, '', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('145', '的卢深视三维视觉西南总部暨产业化制造基地项目', 'Z201908007267', '167', '人工智能', '制造业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-22 14:07:09', null, null, null, null, '待企业回复协议意见', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('146', '工业技术软件创新中心及数字交付基地', 'Z201908007272', '167', '电子信息', '制造业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-25 14:12:25', null, null, null, null, '无', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('147', '分子束外延生长设备产业化暨半导体分子束外延技术研究院项目', 'Z201908007276', '167', '集成电路', '制造业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-19 15:11:59', null, null, null, null, '已投运', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('148', '派天下智慧物流港总部', 'Z201908007283', '167', '其他', '信息传输、软件和信息技术服务业', '', null, null, null, null, '500000.00', null, null, null, null, null, null, '孙晓旭', '2019-12-27 10:30:48', null, null, null, null, '已注册入驻运营。', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('149', '美宜佳西南总部', 'Z201908007288', '167', '其他', '批发和零售业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-19 15:35:19', null, null, null, null, '目前正积极争取其总部项目落地，双方洽谈中。', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('15', '益海嘉里船运结算项目', 'Z201905000720', '167', '其他', '交通运输、仓储和邮政业', '智博会', null, null, null, null, '20000.00', null, null, null, null, null, null, '孙晓旭', '2019-12-27 10:05:36', null, null, null, null, '企业正常经营', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('150', '宝能物流西部运营中心项目', 'Z201908007290', '167', '其他', '交通运输、仓储和邮政业', '', null, null, null, null, '70000.00', null, null, null, null, null, null, '孙晓旭', '2019-12-27 10:31:44', null, null, null, null, '双方签订正式协议，并已完成项目公司注册，企业已运营。', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('151', '跨境电商出口产业园项目', 'Z201908007311', '167', '其他', '批发和零售业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-19 15:36:27', null, null, null, null, '双方继续就合作事项磋商。', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('152', '华越医疗器械产业链项目', 'C201909007553', '167', '卫生事业', '卫生和社会工作', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:48:28', null, null, null, null, '磋商', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('153', '威斯康星口腔医疗平台项目', 'C201909007554', '167', '卫生事业', '卫生和社会工作', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:48:31', null, null, null, null, '磋商', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('154', '荷马艺术高中追加投资项目', 'C201909007555', '167', '文化教育', '教育', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:48:36', null, null, null, null, '磋商中', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('155', '维木供应链西南区项目', 'Z201909007558', '167', '其他', '批发和零售业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2019-12-27 10:40:45', null, null, null, null, '因企业经营投资计划调整，该项目终止合作。', '0', '1', null, null, null, null, null, null, null, null, null, '1');
INSERT INTO `project_info` VALUES ('156', '宝能零售西南总部项目', 'Z201909007562', '167', '其他', '批发和零售业', '', null, null, null, null, '7000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-19 15:36:41', null, null, null, null, '签订正式协议，并完成项目公司注册。已正常经营。', '0', '1', null, null, null, null, null, null, null, null, null, '1');
INSERT INTO `project_info` VALUES ('157', '固废资源化利用实验室项目', 'C201909007563', '167', '节能环保', '科学研究和技术服务业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-22 14:06:47', null, null, null, null, '磋商', '0', '1', null, null, null, null, null, null, null, null, null, '1');
INSERT INTO `project_info` VALUES ('158', '新媒体大厦项目', 'C201909007564', '167', '非住宅类房地产类', '房地产业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:54:24', null, null, null, null, '辰辉已做出初步产业策划方案，方案较为粗略，双方多次就方案进行讨论，企业正在深化方案。同时企业也在对项目周边地块整体开发进行研究。', '0', '1', null, null, null, null, null, null, null, null, null, '1');
INSERT INTO `project_info` VALUES ('159', '远洋商业综合体项目', 'C201909007565', '167', '非住宅类房地产类', '房地产业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:54:30', null, null, null, null, '磋商', '0', '1', null, null, null, null, null, null, null, null, null, '1');
INSERT INTO `project_info` VALUES ('16', '摩尔装配建筑总部项目', 'Z201905000721', '167', '研发、设计、咨询、会计、法律等专业服务业', '科学研究和技术服务业', '智博会', null, null, null, '0.00', '100000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:34:20', null, null, null, null, '无', '0', '1', null, null, null, null, null, null, null, null, null, '1');
INSERT INTO `project_info` VALUES ('160', '华熙live商业综合体项目', 'C201909007566', '167', '文旅类 ', '文化、体育和娱乐业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:54:34', null, null, null, null, '磋商', '0', '1', null, null, null, null, null, null, null, null, null, '1');
INSERT INTO `project_info` VALUES ('161', '杨家沟项目', 'C201909007602', '167', '文旅类 ', '文化、体育和娱乐业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2019-09-26 11:07:20', null, null, null, null, '', '0', '1', null, null, null, null, null, null, null, null, null, '1');
INSERT INTO `project_info` VALUES ('162', '重型汽车驾驶室总成及阴极电泳涂装项目', 'Z201909007611', '167', '汽车', '制造业', '', null, null, null, null, '35000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-19 15:13:10', null, null, null, null, '地勘已完成，正在进行地基处理专项设计。', '0', '1', null, null, null, null, null, null, null, null, null, '1');
INSERT INTO `project_info` VALUES ('163', '工业微耕机整机生产基地及研发中心暨模具设计研发中心项目', 'Z201909007612', '167', '智能制造装备', '制造业', '', null, null, null, null, '55000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-19 15:12:45', null, null, null, null, '地勘已完成，正在进行地基处理专项设计。', '0', '1', null, null, null, null, null, null, null, null, null, '1');
INSERT INTO `project_info` VALUES ('164', '大数据精准推广服务运营总部暨研发中心项目', 'Z201909007613', '167', '互联网云计算大数据', '信息传输、软件和信息技术服务业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-19 15:14:03', null, null, null, null, '已退出，暂未签订解除合同', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('165', '新能源汽车仪表台及内饰总成生产基地暨模具设计研发中心项目', 'Z201909007614', '167', '汽车', '制造业', '', null, null, null, null, '57000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-19 15:15:09', null, null, null, null, '地勘已完成，正在进行地基处理专项设计。', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('166', '物流园公共仓储项目', 'C201909007651', '167', '园区开发类', '交通运输、仓储和邮政业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2019-09-27 18:43:34', null, null, null, null, '', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('167', '酩酊坊酒产业全国总部基地项目', 'Z201910007821', '167', '其他', '批发和零售业', '', null, null, null, null, '10000000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-19 15:36:58', null, null, null, null, '签订正式协议，已注册。已进场装修，已运营。', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('168', '口岸创新中心（二期）', 'C201909007852', '167', '园区开发类', '其他服务业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2019-10-09 13:49:13', null, null, null, null, '', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('169', '大型实景梦幻演出秀项目', 'C201910007908', '167', '文旅类 ', '文化、体育和娱乐业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:52:53', null, null, null, null, '磋商', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('17', '中国和平石油', 'Z201905000722', '167', '新兴金融服务业', '金融业', '智博会', null, null, null, null, '30000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:34:58', null, null, null, null, '磋商', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('170', 'POE电脑总部基地及结算中心', 'Z201910007909', '167', '总部贸易和转口贸易', '信息传输、软件和信息技术服务业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:53:45', null, null, null, null, '磋商', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('171', '中交产业合作项目', 'SPB20200618671721', '167', '环境保护', '水利、环境和公共设施管理业', '', null, null, 'ces', null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:53:41', null, '2020-06-18 21:32:15', null, null, '磋商', '0', '1', null, null, null, '0', null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('172', '审核播控运营中心项目', 'C201910007912', '167', '文旅类 ', '文化、体育和娱乐业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2019-10-23 14:22:22', null, null, null, null, '带领对方现场考察重师楼宇，待对方评估后确定。', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('173', '龙湖光年商业首进重庆品牌商户', 'C201910007913', '167', '非住宅类房地产类', '批发和零售业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:53:03', null, null, null, null, '10月16日，跟进龙湖光年商业招租中首进重庆商户情况与龙湖孙总沟通后情况：1.龙湖光年招60个首进重庆的品牌是龙湖集团给龙湖招商团队提出的要求和最高目标。2.截止现在龙湖光年商业已招约100余家商户占商业面积40%左右，均为已入驻的重庆品牌。', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('174', '北控5G信息科技西南片区全资子公司项目', 'C201910007914', '167', '电子信息', '信息传输、软件和信息技术服务业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:53:08', null, null, null, null, '10月16日，总部经济组赴北京拜访该企业。对方与区城投公司合作意愿强烈，希望与区平台公司成立合资公司，开展运营等一系列工作。该公司将于近期赴沙区进行试点街区选址。', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('175', '乐学教育重庆项目', 'C201910007916', '167', '文化教育', '教育', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:53:11', null, null, null, null, '目前处于初步洽谈状态，我组将可行性进行研判。', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('176', '惠通商业体项目', 'C201910007917', '167', '非住宅类房地产类', '房地产业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:48:44', null, null, null, null, '初步确定通过签订惠通项目增资协议，双共同招商合作模式。', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('177', '广汇领克4S店项目', 'Z201910007918', '167', '汽车', '批发和零售业', '', null, null, null, null, '30000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:48:47', null, null, null, null, '双方已就协议内容达成基本一致，正在履行上会程序。', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('178', '中科国际产业园项目', 'C201910007920', '167', '数字创意', '租赁和商务服务业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:48:57', null, null, null, null, '企业来渝与我组商洽。会议形成三方面意见：1.拟在我去设立中科国际科创园。2.由企业完善拟在我去涉及科创园的产业策划方案。3.落实可以引入的产业并算账。', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('179', '智慧停车平台', 'Z201910007950', '167', '其他', '交通运输、仓储和邮政业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:49:02', null, null, null, null, '初步对接，邀请企业实地考察', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('18', '重庆红星美凯龙智慧物流城', 'Z201905000723', '167', '电子商务及跨境结算', '交通运输、仓储和邮政业', '', null, null, null, null, '100000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:53:23', null, null, null, null, '主体施工基本完成，正在进行内部装修', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('180', '功夫动漫西南地区子公司及区域研发中心', 'Z201910007951', '167', '文旅类 ', '文化、体育和娱乐业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-18 16:38:44', null, null, null, null, '待企业研判后进行产业内容沟通，受疫情影响，企业投资进度放缓。', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('181', '大宗农副产品贸易平台', 'Z201910007980', '167', '其他', '批发和零售业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-19 15:37:23', null, null, null, null, '签订正式协议。已完成注册。已投运。', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('182', '西部产融大数据服务中心', 'Z201910007981', '167', '其他', '金融业', '', null, null, null, '12000.00', '20000.00', null, null, null, null, null, null, '孙晓旭', '2020-04-30 15:02:16', null, null, null, null, '签订正式协议。已注册项目公司，目前正推进平台建设。', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('183', '中大云商跨境电商区域运营中心仓', 'Z201910007982', '167', '其他', '批发和零售业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-19 15:37:53', null, null, null, null, '双方就协议磋商中。', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('184', '中电光谷科技创新服务平台项目', 'Z201910007983', '167', '其他', '信息传输、软件和信息技术服务业', '', null, null, null, null, '24000.00', null, null, null, null, null, null, '孙晓旭', '2020-03-27 02:36:40', null, null, null, null, '签订正式协议。', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('185', '物产中大云商重庆运营中心项目', 'Z201910007984', '167', '其他', '批发和零售业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2019-10-25 15:17:34', null, null, null, null, '双方合作前期洽谈', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('186', '军用人工智能终端研发总部暨产业化项目', 'Z201911008235', '167', '智能终端', '制造业', '', null, null, null, null, '10000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-19 15:16:07', null, null, null, null, '已完成工商地址迁移。', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('187', '新材料相溶剂研发暨产业化项目', 'Z201911008238', '167', '新材料', '制造业', '', null, null, null, null, '250000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-20 10:26:00', null, null, null, null, '已完善协议', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('188', '航天用特种吸波材料研制项目', 'Z201911008239', '167', '新材料', '制造业', '', null, null, null, null, '10000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-19 15:16:53', null, null, null, null, '已完成工商注册', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('189', '盈火互联网小贷项目', 'Z201911008299', '167', '', '金融业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-19 09:11:28', null, null, null, null, '企业需取得互联网小贷的牌照，但受制于目前金融政策，拍照暂未取得。', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('19', '丰树重庆跨境物流服务平台项目', 'Z201905000724', '167', '电子商务及跨境结算', '交通运输、仓储和邮政业', '', null, null, null, null, '35000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-20 14:06:53', null, null, null, null, '项目基本完工，正在开展验收工作。', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('190', '西部（重庆）地质科技创新研究院', 'Z201911008305', '167', '', '科学研究和技术服务业', '', null, null, null, '6600.00', null, null, null, null, null, null, null, '孙晓旭', '2020-05-15 15:10:35', null, null, null, null, '准备正式谈判。', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('191', 'D5-1/04总部基地(新媒体大厦）', 'Z201911008338', '167', '非住宅类房地产类', '房地产业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:49:10', null, null, null, null, '辰辉已做出初步产业策划方案，方案较为粗略，双方多次就方案进行讨论，企业正在深化方案。同时企业也在对项目周边地块整体开发进行研究。', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('192', '西南环球珠宝之都项目', 'C201910008348', '167', '非住宅类房地产类', '房地产业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:54:41', null, null, null, null, '4月14日陶常务带领招商中心办公室、区规资局、总部经济组对接了中建远洋，企业汇报了策划方案，企业首选地块为特钢厂保留建筑，由于同济大学正在对该地块做设计方案，所以我方又向企业推荐了枣子堡地块、金碧正街楼宇。企业表示首选仍是特钢厂地块，愿意与同济大学合作，其次考虑枣子堡地块。下一步需等同济大学方案出来后再研究，同时企业对枣子堡地块进行研判。', '0', '1', null, null, null, null, null, null, null, null, null, '1');
INSERT INTO `project_info` VALUES ('193', '中信数字西南区域总部项目', 'Z201911008451', '167', '', '信息传输、软件和信息技术服务业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:49:14', null, null, null, null, '对方希望沙区主要领导与中信集团领导洽谈，高位推动项目落地。', '0', '1', null, null, null, null, null, null, null, null, null, '1');
INSERT INTO `project_info` VALUES ('194', '信创工程适配中心项目', 'Z201911008452', '167', '', '信息传输、软件和信息技术服务业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-20 10:25:11', null, null, null, null, '协议正走盖章流程', '0', '1', null, null, null, '1', null, null, null, null, null, '1');
INSERT INTO `project_info` VALUES ('195', '安全可靠研究院项目', 'Z201911008513', '167', '', '信息传输、软件和信息技术服务业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-20 10:25:30', null, null, null, null, '无', '0', '1', null, null, null, null, null, null, null, null, null, '1');
INSERT INTO `project_info` VALUES ('196', '航空科技沉浸式体验基地及总部项目', 'Z201912008713', '167', '', '文化、体育和娱乐业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-18 16:30:01', null, null, null, null, '项目一期已于5月份开始营业。', '0', '1', null, null, null, null, null, null, null, null, null, '1');
INSERT INTO `project_info` VALUES ('197', '安全可靠研究院项目', 'Z201912008727', '167', '', '信息传输、软件和信息技术服务业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-03-16 04:29:58', null, null, null, null, '待企业完善项目策划书后', '0', '1', null, null, null, null, null, null, null, null, null, '1');
INSERT INTO `project_info` VALUES ('198', '航天一院项目', 'Z201912008779', '167', '', '信息传输、软件和信息技术服务业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-22 14:06:11', null, null, null, null, '无', '0', '1', null, null, null, null, null, null, null, null, null, '1');
INSERT INTO `project_info` VALUES ('199', '普强信息技术项目', 'Z201912008781', '167', '', '信息传输、软件和信息技术服务业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-22 14:06:19', null, null, null, null, '磋商', '0', '1', null, null, null, null, null, null, null, null, null, '1');
INSERT INTO `project_info` VALUES ('2', '推动中电科20所与北斗（重庆）科技集团开展业务合作', 'Z201904000002', '166', '电子信息', '制造业', '市领导会见', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2019-11-30 22:37:08', null, null, null, null, '暂缓', '0', '1', null, null, null, null, null, null, null, null, null, '1');
INSERT INTO `project_info` VALUES ('20', '嘉民重庆跨境贸易及电子商务物流园', 'Z201905000725', '167', '电子商务及跨境结算', '交通运输、仓储和邮政业', '', null, null, null, null, '80000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-20 14:07:05', null, null, null, null, '已开始运营。', '0', '1', null, null, null, null, null, null, null, null, null, '1');
INSERT INTO `project_info` VALUES ('200', '高能气体压裂项目', 'Z201912008782', '167', '', '信息传输、软件和信息技术服务业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-20 10:25:41', null, null, null, null, '磋商', '0', '1', null, null, null, null, null, null, null, null, null, '1');
INSERT INTO `project_info` VALUES ('201', '爱仁医药基因检测项目', 'Z201912008783', '167', '', '制造业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-22 14:47:18', null, null, null, null, '无', '0', '1', null, null, null, null, null, null, null, null, null, '1');
INSERT INTO `project_info` VALUES ('202', '武汉光电工业技术研究院项目', 'Z201912008784', '167', '', '信息传输、软件和信息技术服务业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-21 16:59:49', null, null, null, null, '正在办理公司注册,因注册人含有外国专家，已由对方公司自行办理注册。', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('203', '思坦德尔（重庆）医学科技有限公司病理诊断技术研究中心项目', 'Z201912008785', '167', '', '科学研究和技术服务业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-01-21 22:30:04', null, null, null, null, '已投运', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('204', '点检肿瘤精准检测服务平台项目', 'Z201912008786', '167', '', '其他服务业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-19 15:18:23', null, null, null, null, '对电梯井坑做加固施工处理', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('205', '御芯微智能技术研究院项目', 'Z201912008787', '167', '', '信息传输、软件和信息技术服务业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-01-21 22:37:50', null, null, null, null, '已投运', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('206', '煤层气微压裂项目', 'Z201912008788', '167', '', '信息传输、软件和信息技术服务业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-20 10:23:55', null, null, null, null, '无', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('207', '煤层气径向水平井技术项目', 'Z201912008789', '167', '', '信息传输、软件和信息技术服务业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-20 10:23:45', null, null, null, null, '无', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('208', '重庆进口医药基地·重庆医药集团进口医药分拨 中心', 'Z201912008806', '167', '', '交通运输、仓储和邮政业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-19 15:38:50', null, null, null, null, '双方已签订正式协议。已注册、已运营。', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('209', '中卓科技工业企业服务平台项目', 'Z201912008938', '167', '', '信息传输、软件和信息技术服务业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-19 15:18:46', null, null, null, null, '签订正式协议，正在办理注册地址迁移。', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('21', '安博重庆西部国际物流中心', 'Z201905000726', '167', '国际物流及城乡配送', '交通运输、仓储和邮政业', '', null, null, null, null, '30000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:50:43', null, null, null, null, '一期项目主体结构施工基本完成，正在开展装修工作，二期主体结构施工。', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('210', '斌贸农业合作项目', 'Z201912009061', '167', '', '其他服务业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-25 14:12:09', null, null, null, null, '磋商', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('211', '金磁广场茶文化产业中心项目', 'Z201912009062', '166', '租赁和商务服务业', '167', '', '', null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:49:27', null, null, null, null, '\"预计2020年6月份工商注册', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('212', '重庆科教文化产业园项目', 'Z201912009065', '167', '文旅类 ', '文化、体育和娱乐业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:49:32', null, null, null, null, '磋商', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('213', '网络文化产业基地重庆项目', 'Z201912009069', '167', '', '信息传输、软件和信息技术服务业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:49:38', null, null, null, null, '市投促局，区商务委，总部经济组对接同济智慧数组信息有限公司，双方就其在沙区设立总部相关事宜进行了初步协商，我组将进行研判项目可行性。', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('214', '时空电动重庆总部项目', 'Z201912009088', '167', '', '交通运输、仓储和邮政业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:49:41', null, null, null, null, '市投促局、区商务委、总部经济组对接时空电动汽车股份有限公司，双发就合作模式、拟选址等情况进行沟通，相关事宜进行了初步磋商，我组将进行研判项目可行性。', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('215', '依图大数据应用场景项目', 'Z201912009089', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:49:46', null, null, null, null, '\"区商务委、总部经济组及先进', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('216', '传化西南国际供应链总部基地', 'Z201912009161', '167', '', '交通运输、仓储和邮政业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-19 15:39:14', null, null, null, null, '双方已就协议达成一致意见。', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('217', '红星美凯龙贸易产业孵化平台项目', 'Z201912009172', '167', '', '批发和零售业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-19 15:39:27', null, null, null, null, '已签订正式协议，已开展业务。', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('218', '牧图设计西南总部项目', 'Z202001009576', '167', '', '其他服务业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-19 15:19:21', null, null, null, null, '正在办理注册地址迁移。', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('219', '橙心物流网全国总部项目', 'Z202001009577', '167', '', '其他服务业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-19 09:15:18', null, null, null, null, '签订正式协议', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('22', '沙坪坝区新能源汽车充电基础设施项目', 'Z201905000727', '167', '新能源汽车及智能汽车', '制造业', '', null, null, null, null, '2300.00', null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:50:47', null, null, null, null, '', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('220', '趣携小贷增资项目', 'Z202001009578', '167', '', '金融业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-04-28 09:38:56', null, null, null, null, '已获得市金管局已批复，完成增资。', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('221', '正创新零售产业园', 'SPB20200619638629', '167', '其他', '交通运输、仓储和邮政业', '', null, null, null, null, '245000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-25 15:59:31', null, '2020-06-19 13:47:08', null, null, '签订正式协议。', '0', '3', null, null, null, '0', null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('222', '合美时光商业综合体', 'Z202003009652', '167', '', '批发和零售业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:49:49', null, null, null, null, '双方在3月进行了多伦电话会谈，对方承诺商业综合体自持50%以上，我方对其资产财务状况进行深入调研，其公司总资产177亿元，净资产125亿元，负债52亿元，年产值57亿元，公司运行情况良好，无地产烂尾、失信等问题。对方将于疫情结束后赴沙区考察', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('223', '原公安局地块项目', 'Z202003009653', '167', '', '批发和零售业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:49:53', null, null, null, null, '企业已作出产业策划方案，双方多次沟通修改，4月9日确定了送审方案，并对招商协议土地出让意向协议进行磋商，下一步准备签订土地出让意向性协议。', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('224', '华金证券重庆分公司项目', 'Z202003009654', '167', '', '金融业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:49:58', null, null, null, null, '3月中旬，双方通过视频会议进行对接，就企业在沙区独立结算比例、成立后的合作模式及沙区提供的优惠政策等进行沟通，对方将于近期组织内部研判。疫情后希望到访沙区。', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('225', '星乐荟国际广场项目', 'Z202003009733', '167', '', '租赁和商务服务业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:50:04', null, null, null, null, '已签约。', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('226', '天猫新零售智慧商圈项目', 'Z202003009857', '167', '', '批发和零售业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-18 16:25:27', null, null, null, null, '企业已完成沙区物业空间实地考察，并初步梳理项目方案，我方计划于六月份实地考察企业西南片区已落地项目。', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('227', '华赋艺术培训西南总部项目', 'Z202003009858', '167', '', '教育', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-18 17:19:29', null, null, null, null, '目前我方已推荐清华芯动、融汇物业等项目，并组织企业实地踏勘，同时组织企业与权属方进行商务洽谈，推动企业将成都华赋西南总部搬迁至沙区，4月8日我方赴项目成都基地考察，4月9日邀请企业测算团队实地踏勘物业空间，5月13日刘世莉副区长带领区文旅委、文旅招商组赴成都华赋集团进行考察，助推项目落地。', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('228', '神州泰岳大数据创新基地项目', 'Z202003009859', '167', '', '科学研究和技术服务业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-18 16:24:21', null, null, null, null, '与投资方多次就合作模式及企业诉求进行沟通协商，因受疫情影响，神州泰岳原计划于年初进场的重庆市国安项目延期，目前其重庆团队正全力推动国安项目落地，导致与沙区合作项目方案推进缓慢。同时因企业高层变动，目前产业方向正在梳理调整。', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('229', '好未来未来之星项目', 'Z202003009860', '167', '', '教育', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-18 16:39:07', null, null, null, null, '双方已就区域税收结算及新品牌业态进行线上沟通。目前企业在重庆范围税收约3000万，其中沙区项目税收约900万。现双方已形成项目组，启动相关数据梳理工作，整合一批新品牌业态项目落户，目前已初步完成税收测算，我方正在与企业沟通先征后返扶持方式。', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('23', '联东U谷·重庆沙坪坝国际企业港项目', 'Z201905000728', '167', '智能制造装备', '制造业', '', null, null, null, null, '200000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-19 14:58:22', null, null, null, null, '已投运', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('230', '室内飞行项目', 'Z202003009861', '167', '', '文化、体育和娱乐业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-18 16:34:21', null, null, null, null, '企业初步意向选址于融创茂文旅城，目前融创茂已完成选址评估。投资方正在完善项目方案，拟邀请投资方于疫情好转后，再次与融创茂沟通，结合双方需求深化、落实项目设计方案，推动项目落地。', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('231', '国通（重庆）智慧产业园', 'Z202003009921', '167', '其他', '交通运输、仓储和邮政业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-19 15:42:22', null, null, null, null, '双方前期合作洽谈.', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('233', '物联网+智慧城市项目', 'Z202004010269', '167', '', '批发和零售业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-19 15:50:04', null, null, null, null, '双方签订正式协议。', '0', '1', null, null, null, null, null, null, null, null, null, '1');
INSERT INTO `project_info` VALUES ('234', '华人梦中心项目', 'Z202005010362', '167', '', '文化、体育和娱乐业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-18 17:39:16', null, null, null, null, '企业实地赴沙区踏勘，待企业研判后进一步推进。', '0', '1', null, null, null, null, null, null, null, null, null, '1');
INSERT INTO `project_info` VALUES ('235', '乡村振兴示范带农旅项目', 'Z202005010365', '167', '', '其他服务业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-18 17:40:53', null, null, null, null, '我方已与4月27日邀请企业团队赴中梁镇斐然湖核心区考察，并与5月12日赴企业大邑项目实地踏勘，企业计划结合中梁镇自然风貌，打造重庆市中心农旅项目目的地。', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('236', '中商汇通(浙江)进出口有限公司', 'Z202005010374', '167', '', '批发和零售业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-19 11:38:13', null, null, null, null, '双方就合作事项进行前期洽谈', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('237', 'super晚-文创夜市项目', 'SPB20200618555059', '167', '其他', '批发和零售业', '', null, null, null, null, null, null, null, null, null, null, '103', '孙晓旭', '2020-05-25 16:39:47', null, '2020-06-18 20:51:32', '103', null, '完成正式合同签订', '0', '3', null, null, null, '0', null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('238', '成都博宇集团总部暨工业机器人生产基地项目', 'SPB20200619758347', '167', '电子信息', '制造业', '', null, '楼宇类项目', null, null, '230000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-27 14:17:37', null, '2020-06-19 13:34:07', null, null, '签订正式协议', '0', '3', null, null, null, '0', null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('24', '中土跨境电子商务建设项目', 'Z201905000729', '167', '电子商务及跨境结算', '批发和零售业', '', null, null, null, null, '2000.00', null, null, null, null, null, null, '孙晓旭', '2019-12-27 10:06:14', null, null, null, null, '正常开展业务。', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('25', '鼎晶医学研究中心暨医学检验所项目', 'Z201905000730', '167', '研发机构', '科学研究和技术服务业', '', null, null, null, null, '10000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-19 14:58:14', null, null, null, null, '实验室已完成空调改结构及房间隔间，办公室正在装修地面。', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('26', '智能视觉交互技术运营中心项目', 'Z201905000731', '167', '电子信息', '制造业', '', null, null, null, null, '13000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:52:34', null, null, null, null, '已完成装修，正在购置办公家具', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('27', 'M²精密模具制造研发中心及产业园项目', 'Z201905000732', '167', '智能制造装备', '制造业', '', null, null, null, null, '130000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-19 14:59:32', null, null, null, null, '主体施工40%', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('28', '重庆纳米电子材料产业园暨创建国家纳米电子材料（西南）检测中心项目', 'Z201905000733', '167', '新材料', '制造业', '', null, null, null, null, '55000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-19 15:00:07', null, null, null, null, '围挡已完成，临设已搭建，正在开挖地下车库。', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('29', '益模（重庆）模具及成形智能制造研究项目', 'Z201905000734', '167', '研发机构', '信息传输、软件和信息技术服务业', '', null, null, null, null, '5000.00', null, null, null, null, null, null, '孙晓旭', '2019-11-26 10:48:48', null, null, null, null, '无', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('3', '加快实施一批生态环保项目（沙坪坝区）', 'Z201904000080', '165', '', '农、林、牧、渔业', '市领导会见', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-25 14:12:50', null, null, null, null, '副区长本周再次组织相关部门论证设计方案和PPP实施方案，长江环保集团和市水务集团就特许经营权问题和市财政补贴是否穿透项目公司，将以上两个问题上报市建委。', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('30', '集成电路设计总部基地暨研发中心项目', 'Z201905000735', '167', '集成电路', '制造业', '智博会', null, null, null, null, '20000.00', null, null, null, null, null, null, '孙晓旭', '2019-11-26 10:49:37', null, null, null, null, '', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('300', '金康新能源汽车高性能动力项目', null, '166', null, null, null, null, '用地类项目', '占地面积600亩，达产后年产值100亿元，年税收4亿元。', '300000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '301', null, '0');
INSERT INTO `project_info` VALUES ('301', '万普隆能源科技产业园暨万普隆非常规油气研究院项目', null, '166', null, null, null, null, '用地类项目', '占地面积91亩，达产后年产值6亿元，年税收3000万元。', '30000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '302', null, '0');
INSERT INTO `project_info` VALUES ('302', '北斗民用战略新兴产业园项目', null, '166', null, null, null, null, '用地类项目', '占地面积36亩，达产后年产值10亿元，年税收5000万元。', '30000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '303', null, '0');
INSERT INTO `project_info` VALUES ('303', '卡尔蔡司·开物精密测量工程中心项目', null, '166', null, null, null, null, '用地类项目', '占地面积20亩，达产后年产值2亿元，年税收2000万元。', '9000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '304', null, '0');
INSERT INTO `project_info` VALUES ('304', '北威科技公司新材料产业园项目', null, '166', null, null, null, null, '用地类项目', '项目位于重庆·大学城科技产业园，北威科技公司拟以“1+2+3 +N”（1个研究院、2家研发型新材料公司、3个孵化项目、N个研究方向）模式建立覆盖新材料研发、制造、销售全产业链的产业园，首期将实现丁腈橡胶、光触媒、真空玻璃三个项目产业化。', '100000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '305', null, '0');
INSERT INTO `project_info` VALUES ('305', '御芯微人工智能芯片研究院项目', null, '166', null, null, null, null, '楼宇类项目', '年产芯片3000万片以上，占地面积200亩，达产后年产值30亿元，年税收2亿元。', '35000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '306', null, '0');
INSERT INTO `project_info` VALUES ('306', '重庆皓石金车联网项目', null, '166', null, null, null, null, '楼宇类项目', '使用商业楼宇500平方米，达产后年销售4000万元，年税收320万元。', '2000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '307', null, '0');
INSERT INTO `project_info` VALUES ('307', '医用消毒产品项目', null, '166', null, null, null, null, '楼宇类项目', '生产医用消毒产品，总投资0.2亿元，达产后可实现年产值0.5亿元，年税收400万元。', '2000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '308', null, '0');
INSERT INTO `project_info` VALUES ('308', '汽车钢圈项目', null, '166', null, null, null, null, '楼宇类项目', '年产200万套微、轻、中、重型汽车钢圈，总投资0.53亿元，达产后可实现年产值1亿元，年税收600万元。', '5300.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '309', null, '0');
INSERT INTO `project_info` VALUES ('309', '热固性粉末涂料项目', null, '166', null, null, null, null, '楼宇类项目', '生产、销售热固性粉末涂料，总投资0.2亿元，达产后可实现年产值0.5亿元，年税收400万元。', '2000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '310', null, '0');
INSERT INTO `project_info` VALUES ('31', '重庆大千汇鼎智能科技研究院有限公司项目', 'Z201905000736', '167', '智能制造装备', '制造业', '', null, null, null, null, '15000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-19 15:01:00', null, null, null, null, '装修80%,已投运一条生产线。', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('310', '汽摩零部件项目', null, '166', null, null, null, null, '楼宇类项目', '生产汽车、摩托车零配件，总投资0.15亿元，达产后可实现年产值0.3亿元，年税收200万元。', '1500.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '311', null, '0');
INSERT INTO `project_info` VALUES ('311', '成套电器设备项目', null, '166', null, null, null, null, '楼宇类项目', '生产高低压成套电器设备,配电箱、电缆桥架,母线槽等产品。总投资0.2亿元，达产后可实现年产值0.5亿元，年税收300万元。', '2000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '312', null, '0');
INSERT INTO `project_info` VALUES ('312', '汽车零部件项目', null, '166', null, null, null, null, '楼宇类项目', '主要从事汽车内外饰产品及模具制造。总投资0.25亿元，达产后可实现年产值0.5亿元，年税收300万元。', '2500.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '313', null, '0');
INSERT INTO `project_info` VALUES ('313', '中软国际智能制造与智能服务总部基地项目', null, '167', null, null, null, null, '楼宇类项目', '使用商业楼宇1000平方米，达产后年产值1.5亿元，年税收1000万元。', '50000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '314', null, '0');
INSERT INTO `project_info` VALUES ('314', '沙坪坝双创街项目', null, '167', null, null, null, null, '楼宇类项目', '使用商业楼宇15000平方米，达产后年产值5000万元，年税收500万元。', '4000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '315', null, '0');
INSERT INTO `project_info` VALUES ('315', '恩太机械设备生产项目', null, '166', null, null, null, null, '楼宇类项目', '主要生产喷丸、抛丸设备，总投资0.12亿元，达产后可实现年产值0.5亿元，年税收500万元。', '1200.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '316', null, '0');
INSERT INTO `project_info` VALUES ('316', '智神科技锅炉智能控制产品及工业物联网平台项目', null, '166', null, null, null, null, '楼宇类项目', '该项目主要从事锅炉智能控制产品及工业物联网平台、燃气具智能检测生产线、汽车零部件智能检测生产线三大核心产品的科研开发、系统集成、生产销售与工程服务。项目总投资0.3亿元，达产后可实现年产值0.8亿元，年税收600万元。', '3000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '317', null, '0');
INSERT INTO `project_info` VALUES ('317', '太阳能光热发电产业链生产基地项目', null, '166', null, null, null, null, '楼宇类项目', '年产定日镜100万平方米，占地约4000平方米厂房，达产后年产值5亿元，年税收3000万元。', '2500.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '318', null, '0');
INSERT INTO `project_info` VALUES ('318', '东电制冷汽车零部件生产项目', null, '166', null, null, null, null, '楼宇类项目', '使用厂房占地面积30亩，达产后年产值5亿元，年税收3000万元。', '8600.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '319', null, '0');
INSERT INTO `project_info` VALUES ('319', '惟觉科技军工设备研发生产项目', null, '166', null, null, null, null, '楼宇类项目', '主要从事军事模拟训练设备和军事特种装备的研发、生产和销售。项目总投资0.25亿元，达产后可实现年产值0.6亿元，年税收800万元。', '2500.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '320', null, '0');
INSERT INTO `project_info` VALUES ('32', '万普隆能源科技产业园暨万普隆非常规油气研究院项目', 'Z201905000737', '167', '页岩气', '制造业', '', null, null, null, null, '60000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-19 15:02:46', null, null, null, null, '主体已全部封顶，砌墙完工，正在进行外立面保温层施工，消防设施安装。', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('320', '多讯科技地产包装、策划营销项目', null, '166', null, null, null, null, '楼宇类项目', '主要从事企业形象整体包装策划设计，平面设计，3D设计，影视拍摄及制作，文化交流及礼仪服务.项目总投资0.1亿元，达产后可实现年产值0.3亿元，年税收350万元。', '1000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '321', null, '0');
INSERT INTO `project_info` VALUES ('321', '琦琦汽车悬梁吊耳衬套项目', null, '166', null, null, null, null, '楼宇类项目', '主要生产汽车悬梁吊耳衬套，总投资0.1亿元，达产后可实现年产值0.2亿元，年税收150万元。', '1000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '322', null, '0');
INSERT INTO `project_info` VALUES ('322', '多邦科技检测监控终端项目', null, '166', null, null, null, null, '楼宇类项目', '从事远程在线监测监控终端研发生产、销售、安装、技术与售后服务为一体。项目总投资0.5亿元，达产后可实现年产值1亿元，年税收800万元。', '5000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '323', null, '0');
INSERT INTO `project_info` VALUES ('323', '“工业级”的无功补偿和滤波装置项目', null, '166', null, null, null, null, '楼宇类项目', '自主研发出“工业级”的无功补偿和滤波装置，总投资0.18亿元，达产后可实现年产值0.5亿元，年税收400万元。', '1800.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '324', null, '0');
INSERT INTO `project_info` VALUES ('324', '医疗器械贸易项目', null, '167', null, null, null, null, '楼宇类项目', '从事医疗器械的销售和售后工作。', '1225.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '325', null, '0');
INSERT INTO `project_info` VALUES ('325', '医疗器械销售项目', null, '167', null, null, null, null, '楼宇类项目', '主要批发、零售医疗器械产品。项目总投资0.12亿元，达产后可实现年产值0.5亿元，年收300万元。', '1200.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '326', null, '0');
INSERT INTO `project_info` VALUES ('326', '中电光谷项目', null, '166', null, null, null, null, '楼宇类项目', '中电光谷作为国内顶尖的产业园开发运营商，拟联合沙坪坝区政府共同出资1亿元成立合资公司，联合开发、协同招商、共同运营区域内核心项目，致力于将大学科技创新城打造成“重庆智核”。', '10000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '327', null, '0');
INSERT INTO `project_info` VALUES ('327', '易法通全国运营服务中心项目', null, '166', null, null, null, null, '楼宇类项目', '新三板上市企业，专注于互联网法律服务的高新技术企业，是国内第一家互联网法律服务类专业垂直电商平台，唯一一家采取京东模式的法律电商企业。拟来沙区建设全国服务运营中心，由法律服务中心、大数据与产品研发中心、人工智能（法律服务机器人系统平台）开发等职能等核心部门组成。', '100000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '328', null, '0');
INSERT INTO `project_info` VALUES ('328', '御芯微智能技术研究院项目', null, '166', null, null, null, null, '楼宇类项目', '成立御芯微智能技术研究院，未来5年将打造UCfuse通信计算融合芯片设计平台，WloTa通信协议、芯片与系统研发，RISC-V平台研发推广等，3-5年内，成为全球芯片、IOT、AI领域的领先性公司', '50000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '329', null, '0');
INSERT INTO `project_info` VALUES ('329', '重庆大千汇鼎智能科技研究院项目', null, '166', null, null, null, null, '楼宇类项目', '引进增材制造设备、高分子复杂材料、一体化控制软件的技术创新团队及国外液态金属3D打印专家组，组建线上线下联动的智能制造产业公共服务平台。', '20000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '330', null, '0');
INSERT INTO `project_info` VALUES ('33', '中科慧眼ADAS技术运营中心项目', 'Z201905000738', '167', '智能制造装备', '信息传输、软件和信息技术服务业', '', null, null, null, null, '5000.00', null, null, null, null, null, null, '孙晓旭', '2019-10-22 15:48:04', null, null, null, null, '', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('330', '点检肿瘤精准检测服务平台项目', null, '166', null, null, null, null, '楼宇类项目', '项目将建设公司总部、公司营销结算中心、研发中心（独立法人）、第三方医学检验实验室（独立法人）和人工智能医疗病理诊断“云诊断”平台等。', '35000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '331', null, '0');
INSERT INTO `project_info` VALUES ('331', '重庆大学·鼎晶生物检验检测中心', null, '166', null, null, null, null, '楼宇类项目', '系校企合作项目，国内分子基因细分行业前五的检验检测机构上海鼎晶生物拟与重庆大学生命科学学院合作，在园区设立研发中心和检验检测中心。', '10000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '332', null, '0');
INSERT INTO `project_info` VALUES ('332', '重庆模具及成形智能制造研究院项目', null, '166', null, null, null, null, '楼宇类项目', '项目建设华中科技大学材料成形与模具技术国家重点实验室分支机构，为模具及成形其相关上下游生产行业研发智能制造系统，提供专业的智能设计、智能加工等软件解决方案。', '30000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '333', null, '0');
INSERT INTO `project_info` VALUES ('333', '中科慧眼技术服务中心及研究院项目', null, '166', null, null, null, null, '楼宇类项目', '项目由北京中科慧眼科技有限公司在重庆设立ADAS技术运营中心，开展汽车智能辅助驾驶技术研发、运营和服务。项目租用工投大厦300平方米，总投资0.5亿元，达产后可实现年产值0.5亿元，年税收400万元。', '5000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '334', null, '0');
INSERT INTO `project_info` VALUES ('334', '未动科技人工智能交互项目', null, '166', null, null, null, null, '楼宇类项目', '该项目拟建成研发、测试及产业化基地，旨在利用人脸识别、姿态识别和手势识别视觉交互人工智能技术，为智能驾舱与智能家电提供革命性的视觉交互技术和解决方案，并打造成为全球领先的智能座位舱一级供应商。', '40000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '335', null, '0');
INSERT INTO `project_info` VALUES ('335', '“智匠星云”汽车工业互联网平台项目', null, '166', null, null, null, null, '楼宇类项目', '该项目旨在打造汽车行业工业互联网领导品牌，助力尚处工业2.0前后的传统汽车零部件企业数字化、网络化、智能化转型升级，同时在自身天然优质用户聚集的条件下，形成平台经济，助推重庆“中国制造2025”示范区之路。项目总投资约5亿元，完全建成后将实现产值约16亿元，直接提升平台用户企业经济效益6%以上，间接带动平台用户企业附加工业产值50亿元以上。', '50000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '336', null, '0');
INSERT INTO `project_info` VALUES ('336', '智能视觉交互技术运营中心项目', null, '166', null, null, null, null, '楼宇类项目', '公司是人工智能视觉交互领域国内领先厂商，拟投资建设智能视觉交互技术运营中心，其中一期项目拟租用办公场地300平方米，预计5年内实现年产值1.3亿元，年税收900万元，涵盖智能驾舱视觉交互实验室、智能驾舱多模态展示中心，二期为视觉计算模组生产测试基地。', '40000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '337', null, '0');
INSERT INTO `project_info` VALUES ('337', '龙之瑞VR内容产学研一体化项目', null, '166', null, null, null, null, '楼宇类项目', '项目建设总部基地，主要开展VR定制内容和自主ip产品的研发，建设VR成果展示中心，产品研发中心，总部结算中心。项目租用办公场地500平米，总投资5000万元，达产后年产值5亿元，年税收3000万元。', '5000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '338', null, '0');
INSERT INTO `project_info` VALUES ('338', '思坦德尔病理诊断技术研究中心项目', null, '166', null, null, null, null, '楼宇类项目', '斯坦德尔作为专业的病理诊断服务和临床医学研究中心，与西南医院等12家医院建立了长期稳固的合作关系，为进一步发挥自身在病理诊断方面的优势，企业拟成立面向西南医疗机构的重庆首家第三方病理诊断中心。项目总投资1亿元，将落户于科学城科创大街2K组团医疗研发大楼。', '10000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '339', null, '0');
INSERT INTO `project_info` VALUES ('339', '煤层气微压裂项目', null, '166', null, null, null, null, '楼宇类项目', '项目依托沙区区位创新资源，东方石开公司提供的煤层气微压裂技术 ，先在煤层气客户市场领域进行试验，试验成功后推广至国内的煤层气行业，为客户提供技术服务。', '100000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '340', null, '0');
INSERT INTO `project_info` VALUES ('34', '光宝联合总部落户项目', 'Z201905000742', '167', '电子信息', '制造业', '智博会', null, null, null, '3170.00', '0.00', null, null, null, null, null, null, '孙晓旭', '2020-05-19 15:03:12', null, null, null, null, '装修已完成90%，预计五月底完工。', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('340', '煤层气径向水平井技术项目', null, '166', null, null, null, null, '楼宇类项目', '项目依托沙区区位创新资源，石油大学自行研发煤层气径向水平井技术，向煤层气客户市场领域进行试验，试验成功后，推广至煤层气区块。', '200000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '341', null, '0');
INSERT INTO `project_info` VALUES ('341', '高能气体压裂项目', null, '166', null, null, null, null, '楼宇类项目', '项目依托沙区区位创新资源，新华金侨公司提供的煤层气高能气体压裂技术，先在煤层气客户市场领域进行试验，试验成功后推广至国内的煤层气行业。', '200000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '342', null, '0');
INSERT INTO `project_info` VALUES ('342', '科德重庆五轴联动数控机床研发、生产项目', null, '166', null, null, null, null, '楼宇类项目', '科德数控拟在沙区投资建设数控系统及五轴数控机床项目。项目总投资约10亿元，建成达产后可实现年产值约12亿元。项目分两期建设，一期项目拟设立数控系统公司，建设五轴数控系统的唯一研发及销售基地，并设立光洋西南研究，运营清华光洋联合研发中心和重庆大学光洋联合研发中心。二期将根据产品研发进度、市场开拓情况设立数控机床西南制造基地。', '100000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '343', null, '0');
INSERT INTO `project_info` VALUES ('343', '前卫集团&重大自动化学院无线充电项目', null, '166', null, null, null, null, '楼宇类项目', '中船重工旗下骨干企业前卫集团，联合重庆大学无线电能传输研究所研发团队，拟在沙坪坝区建设无线电能传输新技术研究院和产业基地，深化产学研合作、加速科技成果转化。项目总投资5亿元，预计占地50亩，5年内达产，达产后预计实现年营收约5亿元以上、年利润约1亿元、年综合税收7000万元。', '50000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '344', null, '0');
INSERT INTO `project_info` VALUES ('344', '集成电路设计总部基地暨研发中心项目', null, '166', null, null, null, null, '楼宇类项目', '打造东微全国总部基地及研发中心，包含以智能电源管理集成电路产品为核心的高端模拟集成电路设计、测试、销售及结算，以及配套软件应用及系统开发。', '10000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '345', null, '0');
INSERT INTO `project_info` VALUES ('345', '旗探科技总部基地暨智能物联研究院项目', null, '166', null, null, null, null, '楼宇类项目', '旗探科技拟在沙区设立旗探物联网总部基地，统筹国内外项目落地与实施；成立智能物联研究院公司，引入加拿大皇家科学院院士及国内外高端研发高层次人才，研发下一代边缘化计算及物联网技术应用；建设产业化基地，实现物联网技术及应用从研发到生产的产业链全覆盖。', '480000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '346', null, '0');
INSERT INTO `project_info` VALUES ('346', '金美轨道交通研发暨生产基地项目', null, '166', null, null, null, null, '楼宇类项目', '主要从事于轨道交通自动售检票设备和系统的研发及生产，致力于打造轨道行业龙头企业。', '20000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '347', null, '0');
INSERT INTO `project_info` VALUES ('347', '金美汽车电子研发暨生产基地项目', null, '166', null, null, null, null, '楼宇类项目', '从事新能源汽车控制器、动力传动控制器及智能汽车电子产品研发及生产。', '15000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '348', null, '0');
INSERT INTO `project_info` VALUES ('348', '九方皋基金项目', null, '166', null, null, null, null, '楼宇类项目', '企业是以私募股权投资与基金管理为主的专业性投资管理公司，区内引进企业御芯微副总裁李春宏系该企业执行合伙人，基金在集成电路与半导体行业领域，进行投资管理及服务。', '100000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '349', null, '0');
INSERT INTO `project_info` VALUES ('349', '重庆市中智医谷三类医疗器械生产基地暨研究院项目', null, '166', null, null, null, null, '楼宇类项目', '项目拟建设三类医疗器械生产基地，生产生物传感器手术机器人、智能化有源医疗器械和无源植入医疗器械。同时柔性引进国家再生医学首席科学家教授团队，成立独立法人化研究院（以下简称“研究院公司”）。研究院公司以高端医疗器械人工智能化为主要研究方向，搭建公共检测评价平台，为中试基地提供生产成果转化支撑。', '52000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '350', null, '0');
INSERT INTO `project_info` VALUES ('35', '河钢重大西南研究院', 'Z201905000743', '167', '新材料', '科学研究和技术服务业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-01-02 10:53:51', null, null, null, null, '无', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('350', '5G信息化建设项目', null, '166', null, null, null, null, '楼宇类项目', '双方本着“政府引导、聚合产业、服务民生、合作创新、科学发展”的原则，就沙坪坝区5G通信基础网络建设及智慧应用领域的建设规划方案、运营规划等层面开展论证、咨询、项目建设与落地等方面的合作', '100000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '351', null, '0');
INSERT INTO `project_info` VALUES ('351', '光宝联合总部暨生产基地项目', null, '166', null, null, null, null, '楼宇类项目', '公司总部位于北京，于2012年11月在新三板挂牌，业务涉及游戏平台开发及相关产品运营、移动医疗、智能家居、基础增值服务、软件应用及研发等。该司拟在重庆设立全国总部公司及智能穿戴设备生产基地，并于今年内退出新三板，2020年赴港股上市。', '150000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '352', null, '0');
INSERT INTO `project_info` VALUES ('352', '康克唯肿瘤疫苗项目', null, '166', null, null, null, null, '楼宇类项目', '项目拟将公司本部搬迁至沙区并设立研究院基地，主要从事肿瘤新抗原免疫治疗产品研发及生产，引进以杨一增教授为首的宾夕法尼亚大学团队为技术支撑，研究抗癌疫苗等项目。', '80000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '353', null, '0');
INSERT INTO `project_info` VALUES ('353', '高性能数据转换器集成电路研发及产业化基地项目', null, '166', null, null, null, null, '楼宇类项目', '项目由中电科投资联合中国电子科技集团有限公司（以下简称 “中电科”）旗下相关公司，在沙坪坝区合资成立“吉芯科技”，打造集设计、测试、生产于一体的高性能数据转换器集成电路研发及产业化基地，聚焦研发高速高动态、超宽带低延迟、高精度低功耗、抗辐照高可靠、多通道与系统集成的高性能数据转化器产品，满足我国在通信领域对高性能数据转换自主可控的需求，并提供IP及解决方案服务。', '200000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '354', null, '0');
INSERT INTO `project_info` VALUES ('354', '星环大数据分析与应用研究院项目', null, '167', null, null, null, null, '楼宇类项目', '星环科技专注于企业级容器云计算、大数据和人工智能核心平台的研发和服务,领航大数据与人工智能基础软件，公司产品已经在十多个行业应用落地，目前星环科技已完成C轮融资，由腾讯领投。星环科技拟引入北京大学资源，建设大数据分析与应用研究院，聚焦大数据行业的人才培养和大数据领域的分析研究。', '20000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '355', null, '0');
INSERT INTO `project_info` VALUES ('355', '项目补充协议暨新增座椅、锁模块生产线项目', null, '166', null, null, null, null, '楼宇类项目', '重庆博泽汽车部件有限公司拟在原场地一期项目用地上新增投资，新上生产线。用于福特斯翼虎和林肯MKC座椅及锁模块等不少于3个（包含本数）项目的建设。', '10000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '356', null, '0');
INSERT INTO `project_info` VALUES ('356', '普洛斯投资公司跨境贸易物流基地项目', null, '167', null, null, null, null, '用地类项目', '普洛斯是中国最大的现代产业园的提供商和服务商，也是中国市场最早启动智慧物流及相关产业生态系统的打造者和促进者。旨在打造一个以跨境贸易为主导，冷链、电商零售为代表的高端现代物流园。', '50000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '357', null, '0');
INSERT INTO `project_info` VALUES ('357', '佛罗伦萨小镇重庆奥特莱斯项目', null, '167', null, null, null, null, '用地类项目', '该项目规划占地约211亩，项目总投资约10亿人民币，拟建设特色商品展销区、商品折扣店、创意家居展示区等。项目将形成以“一带一路”文化体验为特色，集聚进口家居产品、创意产品、国内外高端品牌工厂折扣店聚集的综合商贸体验区。', '100000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '358', null, '0');
INSERT INTO `project_info` VALUES ('358', '美国安博西部物流中心', null, '167', null, null, null, null, '用地类项目', '该项目拟打造为西南地区重要的中欧跨境贸易集散地、进口整车及零部件周转分拨中心、国际知名第三方/第四方物流聚集高地。拟引入欧洲知名品牌的进口整车及零部件、国际货代、欧洲进口消费品等发展跨境贸易、跨境物流的企业。', '68000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '359', null, '0');
INSERT INTO `project_info` VALUES ('359', '渝满俄国际物流项目', null, '167', null, null, null, null, '楼宇类项目', '注册资本金5000万元，业务包括国际货运、保税物流、跨境电商物流、贸易代理、供应链服务。', '5000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '360', null, '0');
INSERT INTO `project_info` VALUES ('36', '上海恩谷医疗科技项目', 'Z201905000744', '167', '电子信息', '信息传输、软件和信息技术服务业', '', null, null, null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-22 14:09:56', null, null, null, null, '对方重庆项目的计划延后实施。', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('360', '中俄及中乌进口贸易服务平台', null, '167', null, null, null, null, '楼宇类项目', '依托铁路口岸，搭建乌克兰进口商品展示交易平台，大力发展预包装食品与大宗农副产品的进口业务，及建材、机械设备等出口业务，促进乌克兰、俄罗斯—重庆的国际贸易发展。', '1340.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '361', null, '0');
INSERT INTO `project_info` VALUES ('361', '国际汽车零配件及保养产品进口平台', null, '167', null, null, null, null, '楼宇类项目', '依托重庆整车进口口岸和“渝新欧”国际贸易大通道，开展整车、零配件等汽车相关产品进口，并运用保税物流中心（B型）开展进出口贸易、保税业务，大力推动自贸区项下的汽车贸易相关产业。', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '362', null, '0');
INSERT INTO `project_info` VALUES ('362', '中商投泽泰整车平行进口', null, '167', null, null, null, null, '楼宇类项目', '依托“渝新欧”、铁路口岸，打造口岸整车进口汽车与零部件批售平台，经销商供应链服务平台，自贸区产业园等为一体的全国汽车贸易。', '5000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '363', null, '0');
INSERT INTO `project_info` VALUES ('363', '店商互联', null, '167', null, null, null, null, '楼宇类项目', '店商互联（北京）科技发展有限公司成立于2014年，总部设在北京，是一家提供快消品B2B采销渠道、交易平台及物流服务的全供应链全信息化系统服务商。其主要为集合全国超过30万家便利店通过集采方式为便利店提供各种快消品。其在园区的项目公司“重庆快消通供应链管理有限公司”办公地点设在物流园口岸贸易服务大厦。', '500.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '364', null, '0');
INSERT INTO `project_info` VALUES ('364', '传化互联网供应链项目', null, '167', null, null, null, null, '楼宇类项目', '为传化集团-浙江传化运通供应链管理有限公司在园区设立一家从事互联网供应链项目的全资子公司，以跨境服务为特色，以贸易金融为核心，从事目标市场的定制化进出口代理采销、国内流通以及综合化配套业务，推动重庆铁路口岸经济发展。2018年预计进出口贸易额为8亿美元，预测未来五年年均按10%递增。', '1000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '365', null, '0');
INSERT INTO `project_info` VALUES ('365', '上海永达融资租赁有限公司重庆分公司', null, '167', null, null, null, null, '楼宇类项目', '上海永达融资租赁有限公司拟在重庆设立分公司，以积极开拓重庆地区融资租赁业务，扩大融资租赁规模，带动重庆地区融资租赁产业发展，促进当地经济建设。', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '366', null, '0');
INSERT INTO `project_info` VALUES ('366', '尊程供应链项目', null, '167', null, null, null, null, '楼宇类项目', '从事进出口贸易、供应链管理、第三方物流等业务，其服务对象包括LG电子在内的多家国内外企业，近期主要通过南向通道、渝新欧通道以及铁路口岸开展东南亚电子产品销往欧洲的转口贸易。', '1000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '367', null, '0');
INSERT INTO `project_info` VALUES ('367', '重庆渝仟意贸易有限公司', null, '167', null, null, null, null, '楼宇类项目', '为发展国际贸易，与入驻企业店商互联的前端采购商哈尔滨新龙行贸易发展有限公司达成合作共识，拓展西部业务在重庆新设的公司，依托渝新欧、渝满俄国际贸易通道，为本公司和公司客户提供食品、粮油制品、日用百货等商品的进出口代理采销，同时从事国内贸易业务。', '500.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '368', null, '0');
INSERT INTO `project_info` VALUES ('368', '银洲泰富进口牛肉项目', null, '167', null, null, null, null, '楼宇类项目', '依托重庆铁路口岸、铁路保税物流中心（B型）、中欧（重庆）铁路及南向铁海联运等资源优势，三方积极推动铁路口岸冷链产业发展。利用重庆银洲泰富商贸有限公司海外丰富的的商业资源及全产业链运营经验，大力推动铁路口岸进口牛肉业务发展，并在重庆铁路口岸搭建国内进口牛肉简单加工与集散分拨中心，辐射内陆西南、华中及华东区域，促进铁路口岸国际贸易产业发展。', '2000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '369', null, '0');
INSERT INTO `project_info` VALUES ('369', '韵辉进口贸易及分拨中心', null, '167', null, null, null, null, '楼宇类项目', '以铁路、铁海联运等运输方式进口奶粉、防弹衣材料、木材、塑料粒子等产品，预计年进出口贸易额1亿美元以上。', '1000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '370', null, '0');
INSERT INTO `project_info` VALUES ('37', '金美轨道交通研发暨生产基地项目', 'Z201905000747', '167', '电子信息', '制造业', '智博会', null, null, null, null, '30000.00', null, null, null, null, null, null, '孙晓旭', '2019-11-26 11:24:39', null, null, null, null, '完成注册', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('370', '超级座驾西区营运中心', null, '167', null, null, null, null, '楼宇类项目', '拟投资建设“超级座驾重庆商务体验中心项目”、“超级座驾区域物流中心项目”、西南区域进出口贸易中心、供应链金融中心和结算中心，总投资约2亿元人民币。建成后将作为超级座驾辐射云、贵、川、陕、甘、宁、渝、湘、鄂八省一市的物流仓储和分拨中心，年分拨车辆8000-10000台。', '21000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '371', null, '0');
INSERT INTO `project_info` VALUES ('371', '象屿汽车供应链平台', null, '167', null, null, null, null, '楼宇类项目', '依托重庆自贸区和铁路口岸，打造供应链金融服务平台，重点发展平行车进口和国际贸易业务。', '999.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '372', null, '0');
INSERT INTO `project_info` VALUES ('372', '艾斯图必冷链项目', null, '167', null, null, null, null, '楼宇类项目', '依托铁路保税物流中心（B型）和中欧班列（重庆）、南向通道铁海联运等国际贸易大通道，主要开展 冷链物流供应链及冻肉、水果等商品进口及销售业务。', '1000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '373', null, '0');
INSERT INTO `project_info` VALUES ('373', '摩托车零配件出口项目', null, '167', null, null, null, null, '楼宇类项目', '依托重庆铁路口岸、铁路保税物流中心（B型）、中欧（重庆）铁路及南向铁海联运等资源优势，主要从事摩托车零配件等货物及技术出口贸易，提供智能仓储，共同物流，供应链集成服务及智能系统与产业大数据云平台服务。', '30000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '374', null, '0');
INSERT INTO `project_info` VALUES ('374', '传化智联西南区域智慧物流合作项目', null, '167', null, null, null, null, '楼宇类项目', '传化集团按照重庆物流战略规划，打造“一核心三中心四节点”的物流网络体系，建设传化网中国西部物流枢纽、西部供应链总部中心、供应链金融服务中心，辐射东南亚智能公路物流网络运营系统，全面推进重庆生产服务业转型升级。', '1350000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '375', null, '0');
INSERT INTO `project_info` VALUES ('375', '远成集团资本项目', null, '167', null, null, null, null, '楼宇类项目', '远成集团拟整合旗下33家合同物流运输板块子公司，整体打包在港股上市，拟以远成集团重庆物流公司为母公司、全国其他32家公司为子公司整体包装上市。', '30000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '376', null, '0');
INSERT INTO `project_info` VALUES ('376', '天安保险', null, '167', null, null, null, null, '楼宇类项目', '在园区注册成立分公司，依托自贸区政策，开展财产保险业务。5年保费规模10亿人民币，预计年税收1000万元。', '100000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '377', null, '0');
INSERT INTO `project_info` VALUES ('377', '金科国冠商贸总部项目', null, '167', null, null, null, null, '楼宇类项目', '投资方将项目总部迁址园区，依托自贸区政策，在重庆市范围内建设多家生活超市，开展农副产品、生活用品销售及城市物流配送业务。在5年时间内投资人民币15亿元，于重庆及周边省市开设以生鲜产品销售为主的生活超市300家（单店面积1500—6000平方米）；项目前期拟租赁物流园区公共仓用于开展城市配送业务，后期拟分别投资8亿元建设现代物流分拣配送中心，投资2亿元建设产业链信息化研究院。成熟运营后预计年实现营收400亿元，贡献税收2亿元。', '250000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '378', null, '0');
INSERT INTO `project_info` VALUES ('378', '盘古电商产业园', null, '167', null, null, null, null, '楼宇类项目', '拟开发运营盘古重庆沙坪坝互联网+电商产业园项目，打造的具有区域性标杆地位的国家级电子商务示范园区。', '150000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '379', null, '0');
INSERT INTO `project_info` VALUES ('379', '菲大装配式建筑产业贸易集散中心', null, '167', null, null, null, null, '楼宇类项目', '拟将装配式建筑生产线、研发及贸易结算功能落户沙区，并在沙区投资建设新媒体大厦、装配式环保住宅开发。', '20000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '380', null, '0');
INSERT INTO `project_info` VALUES ('38', '金美汽车电子研发暨生产基地项目', 'Z201905000748', '167', '新能源汽车及智能汽车', '制造业', '智博会', null, null, null, null, '20000.00', null, null, null, null, null, null, '孙晓旭', '2019-11-26 11:26:06', null, null, null, null, '注册完成', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('380', '益海嘉里船运结算项目', null, '167', null, null, null, null, '楼宇类项目', '企业于2018年9月在重庆市沙坪坝区成立重庆丰倚供应链管理有限公司（以下简称“重庆丰倚”），以重庆丰倚为结算中心承上海丰倚在大连、徐州等地设立的船运公司业务。重庆丰倚主要从事长江沿线无船承运业务，客户以益海嘉里集团长江沿岸工厂为主，中储粮、中粮集团、武钢业务为辅；航线主要以重庆、武汉、岳阳、安徽为主，年承接运输货量将达到250万吨，可实现运输收入２亿元，税前利润4,000万元，全年可实现税收将超过1,000万元。', '5000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '381', null, '0');
INSERT INTO `project_info` VALUES ('381', '国际木材进口集散中心', null, '167', null, null, null, null, '楼宇类项目', '企业是2014年组建成立的商贸物流企业，由中国林业集团有限公司的全资企业中国林产品有限公司控股并进行直接管理，营业范围包括木材、木制品的加工与销售。国际木材进口集散中心项目计划总投资约人民币5亿元，预计年进出口贸易额约3 亿美元。', '50000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '382', null, '0');
INSERT INTO `project_info` VALUES ('382', '捷嘉（重庆）冷链进口平台', null, '167', null, null, null, null, '楼宇类项目', '天津捷嘉物流有限公司于2018年10月在重庆铁路口岸注册成立新丝路（重庆）国际货运代理有限公司，将依托重庆铁路口岸、国际陆海贸易新通道、中欧班列（重庆）等优势资源，围绕冻肉、水产品、食品等冷链进口贸易业务开展国际货运代理、报关报检、代理进口以及供应链金融服务，打造捷嘉（重庆）冷链进口平台。', '100000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '383', null, '0');
INSERT INTO `project_info` VALUES ('383', '重铁巨龙钢材市场产业升级项目', null, '167', null, null, null, null, '楼宇类项目', '重庆重铁巨龙储运有限公司为重铁巨龙钢材市场的运营主体，公司成立于2009年12月，由重庆重铁物流有限公司、重庆巨公投资有限公司共同发起，公司注册资本1.5亿元。2019年，重铁巨龙拟打造钢材交易平台，将在重铁巨龙内经营、在其他区注册的商家进行整合在沙区，促使重铁巨龙更快的完成钢材交易平台的打造。', '30000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '384', null, '0');
INSERT INTO `project_info` VALUES ('384', '酩酊坊酒产业全国总部基地项目', null, '167', null, null, null, null, '楼宇类项目', '重多多电子商务公司是一家集聚项目投资、酒产业发展、大数据、电子商务、文化旅游、资源重组、软件开发为一体的企业。拟打造酩酊坊酒产业全国总部基地项目，设立酩酊坊酒文化产业全国总部、酩酊坊全球（酒类）产业园、酩酊坊酒文化博览馆、数据中心，形成集展示体验、电商交易、运营结算等于一体的酒文化产业生态。 本项目预计于2020-2024年在全国设立约100家博览馆，引进商家约2000个，累积实现营业额约1000亿元人民币，纳税约15亿元人民币。', '200000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '385', null, '0');
INSERT INTO `project_info` VALUES ('385', '宝能物流西部运营中心项目', null, '167', null, null, null, null, '楼宇类项目', '宝能集团是中国房地产500强（第172位）。宝能物流集团是宝能系下的子集团之一，是宝能发展现代物流事业的核心载体 ，是国内建设现代化综合物流模式的企业之一。拟投资建设宝能西部生鲜进口分拨中心、供应链金融服务平台、特色进口商品展示展销中心等项目', '500000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '386', null, '0');
INSERT INTO `project_info` VALUES ('386', '汉宏物流中国西部运营中心项目', null, '167', null, null, null, null, '楼宇类项目', '汉宏物流是德国知名物流公司，2019年在国际货代行业排名世界第9。拟在重庆铁路口岸注册成立西部总公司，依托保时捷铁路常态化运输项目提供整车及零部件进口物流服务。', '10000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '387', null, '0');
INSERT INTO `project_info` VALUES ('387', '互联网+城市智慧停车项目', null, '167', null, null, null, null, '楼宇类项目', '武汉无线飞翔科技有限公司成立于2009年，是一家集高新技术产品的创新、研发、销售和服务为一体的高科技企业。企业拟搭建互联网+的城市停车资源智慧管理平台，采用 “人工智能+云技术+线上支付+互联网”的新型停车管理服务模式，为客户提供数字化停车的解决方案。企业拟在沙坪坝区设立西南区域运营中心与研发中心。', '150000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '388', null, '0');
INSERT INTO `project_info` VALUES ('388', '西南大宗商品贸易平台项目', null, '167', null, null, null, null, '楼宇类项目', '拟依托重庆铁路口岸，拟打造打造西南大宗商品贸易平台，开展西南区域煤炭和钢材等产品的大宗贸易结算、物流仓储及供应链金融等业务。', '150000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '389', null, '0');
INSERT INTO `project_info` VALUES ('389', '寰宇进口木材（重庆）产业园项目', null, '167', null, null, null, null, '楼宇类项目', '寰宇木业邀请其重庆合作伙伴岭峰木业共同打造寰宇进口木材（重庆）产业园，依托中欧班列、国际陆海贸易新通道开展俄罗斯木材、木制品等产品进出口贸易、转口贸易、内贸销售、仓储分拨等业务。运营成熟后，预计实现年销售额2亿元、进出口贸易额3000万美元、税收约400万。', '50000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '390', null, '0');
INSERT INTO `project_info` VALUES ('39', '清陶能源锂电池项目', 'Z201905000749', '167', '能源', '制造业', '', null, null, null, null, '0.00', null, null, null, null, null, null, '孙晓旭', '2019-10-22 16:39:53', null, null, null, null, '企业表示现在江苏昆山等地持有较多重资产，目前企业已摘牌土地对于近期发展较为充足，希望将重庆项目暂缓。', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('390', '派天下智慧物流港总部', null, '167', null, null, null, null, '楼宇类项目', '北京派天下信息科技为北京“双高企业”，有北京市高新技术企业及中关村高新企业资质。投资建设高速公路智慧物流港。项目拟将派天下总部迁入重庆国际物流枢纽园区，建设“司机之家+智能分拨仓+金融”的智慧物流港；项目拟落户大数据中心及设立研究院；联合各省高速集团成立高速公路智慧物流港产业基金。', '450000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '391', null, '0');
INSERT INTO `project_info` VALUES ('391', '宝能零售西南总部项目', null, '167', null, null, null, null, '楼宇类项目', '宝能百货零售有限公司成立于2017年，是宝能投资集团旗下一级子公司。项目将依托中欧班列（重庆）、陆海新通道、铁路口岸保税物流中心等资源，投资建设“宝能零售西南总部项目”，开展海外直采、B2B大宗商品交易、属地销售、简单加工及城市配送等业务；在西南区选址建设“东市西市”仓储式会员超市、“悠宝利”精选超市等门店5家。', '50000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '392', null, '0');
INSERT INTO `project_info` VALUES ('392', '国际木材进口分拨中心项目', null, '167', null, null, null, null, '楼宇类项目', '重庆林业投资是重庆林投集团全资子公司，主要开展一带一路国际木材进口及分销，同时开展供应链金融业务。项目拟依托中欧班列（重庆）、铁路口岸落户国际木材交易中心项目。', '100000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '393', null, '0');
INSERT INTO `project_info` VALUES ('393', '中电光谷科技创新服务平台项目', null, '167', null, null, null, null, '楼宇类项目', '武汉光谷联合集团有限公司是香港主板上市公司，中国电子信息产业集团（CEC）旗下专业的科技园区开发运营平台，国内领先的产业资源共享平台。目前，中电光谷在全国26座城市开发运营38个产业园心项目，采用平台驱动的模式，依托中国电子信息产业集团资源优势，重点发展电子信息研发、高新科技等产业培育；依托沙坪坝区医疗机构资源，重点发展生物医药、医疗研发及创新等产业孵化，将该项目发展成为西南地区高水平的创新生态引擎。', '100000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '394', null, '0');
INSERT INTO `project_info` VALUES ('394', '磁器口禹王宫项目', null, '167', null, null, null, null, '用地类项目', '项目位于磁器口禹王宫地块，可建筑面积约805㎡，建设以VR/AR技术为核心的沉浸式演艺项目及配套服务。', '3000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '395', null, '0');
INSERT INTO `project_info` VALUES ('395', '华宇文旅综合体项目', null, '167', null, null, null, null, '用地类项目', '项目位于沙坪坝区华宇城地块，项目总占地283亩.项目围绕高铁经济圈旅游集散地为核心，以都市旅游目的地为目标，打造集国内外一线高端品牌购物中心，餐饮+休闲+阅读的跨界文化社交中心，全品类一站式亲子教育+康养中心，主题式、情景式、景观式的大型侵入式AR、VR娱乐体验中心，超五星级酒店+潮流运动+夜时尚的高端商务中心为一体的综合性“文化、旅游、商务、休闲、生活”城市共生体。项目建成后，将成为连接高铁经济圈和三峡商圈的重要纽带和沙区旅游消费新IP。', '650000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '396', null, '0');
INSERT INTO `project_info` VALUES ('396', '快乐跑森林定向跑项目', null, '167', null, null, null, null, '楼宇类项目', '引入北京快乐跑公司，打造定向越野赛事落户歌乐山森林公园，建设覆盖渝、贵、川定向越野旅游基地，完善沙区定向跑体育旅游赛事空白，打造成为西南区域体育旅游总部基地。', '1000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '397', null, '0');
INSERT INTO `project_info` VALUES ('397', '青年广场分时租赁', null, '167', null, null, null, null, '楼宇类项目', '为响应国家号召，拟投入6000万元，配套先进新能源充电设备，进一步为西部片区居民出行提供便利。', '6000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '398', null, '0');
INSERT INTO `project_info` VALUES ('398', '众晟马术俱乐部', null, '167', null, null, null, null, '楼宇类项目', '经营管理马术俱乐部', '168.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '399', null, '0');
INSERT INTO `project_info` VALUES ('399', '星贯众乐器', null, '167', null, null, null, null, '楼宇类项目', '生产销售各类乐器', '500.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '400', null, '0');
INSERT INTO `project_info` VALUES ('4', '沙坪坝区政府与重庆德胜源文化创意有限公司、成都东郊记忆园区运营管理有限公司合作开发旅游文创项目', 'Z201904000158', '167', '文旅类 ', '文化、体育和娱乐业', '市领导会见', null, null, null, null, '6000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-25 14:12:42', null, null, null, null, '本月文创园设计公司正在修改设计方案.', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('40', '西井科技人工智能研究院项目', 'Z201905000750', '167', '人工智能', '制造业', '', null, null, null, null, '0.00', null, null, null, null, null, null, '孙晓旭', '2020-05-22 10:57:03', null, null, null, null, '签订正式协议', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('400', '歌乐山资产招商项目', null, '167', null, null, null, null, '楼宇类项目', '歌乐山云锦宾馆实施升级改造', '1918.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '401', null, '0');
INSERT INTO `project_info` VALUES ('401', '横街35号项目', null, '167', null, null, null, null, '楼宇类项目', '磁器口横街35号实施升级改造', '1153.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '402', null, '0');
INSERT INTO `project_info` VALUES ('402', '青年广场车库', null, '167', null, null, null, null, '楼宇类项目', '青年广场1号车库实施升级改造', '150.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '403', null, '0');
INSERT INTO `project_info` VALUES ('403', '青年广场智慧展厅', null, '167', null, null, null, null, '楼宇类项目', '青年广场6号楼实施升级改造', '753.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '404', null, '0');
INSERT INTO `project_info` VALUES ('404', '正途项目有限合伙基金', null, '167', null, null, null, null, '楼宇类项目', '正途重庆项目开发管理合伙人', '5000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '405', null, '0');
INSERT INTO `project_info` VALUES ('405', '红岩联线VR项目', null, '167', null, null, null, null, '楼宇类项目', '红色主题VR项目', '2500.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '406', null, '0');
INSERT INTO `project_info` VALUES ('406', '云锦宾馆运营管理', null, '167', null, null, null, null, '楼宇类项目', '云锦宾馆运营管理', '50.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '407', null, '0');
INSERT INTO `project_info` VALUES ('407', '金沙酒店项目', null, '167', null, null, null, null, '楼宇类项目', '金沙酒店实施升级改造', '2429.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '408', null, '0');
INSERT INTO `project_info` VALUES ('408', '陈家桥102亩项目', null, '167', null, null, null, null, '楼宇类项目', '中高端低密度新生态休闲生活社区', '2000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '409', null, '0');
INSERT INTO `project_info` VALUES ('409', '维列斯米特贸易进出口项目', null, '167', null, null, null, null, '楼宇类项目', '货物进出口，批发，零售肉制品。', '300.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '410', null, '0');
INSERT INTO `project_info` VALUES ('41', '纽瑞芯低功耗物联网收发芯片产业化项目', 'Z201905000751', '167', '电子信息', '制造业', '', null, null, null, null, '0.00', null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:35:59', null, null, null, null, '无', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('410', '纵野科技产业园区及总部项目', null, '167', null, null, null, null, '楼宇类项目', '企业拟将西南片区总部落户沙区，主要业态为计算机软件开发；企业孵化；文化产业园区管理；版权代理；数据加工服务；注册资本金为1亿元。', '200000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '411', null, '0');
INSERT INTO `project_info` VALUES ('411', '魔西网络科技项目', null, '167', null, null, null, null, '楼宇类项目', '企业主要从事计算机软硬件开发、销售及技术服务、技术转让；利用互联网销售电子产品、日用百货；房地产营销策划、代理；房地产信息咨询；楼盘销售代理；代办房屋交易手续；企业管理咨询；企业营销策划；企业形象策划；商务信息咨询；设计、制作、代理、术设计制作；图文设计制作；会议会展服务；礼仪服务；销售:电子产品、通用设备、日用百货；货物及技术进出口等业务。 项目以计算机软硬件开发为主导，主要销售电子屏广告、软件服务、智能终端等综合性网络服务。', '1000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '412', null, '0');
INSERT INTO `project_info` VALUES ('412', '重庆大学设计创意产业园项目', null, '167', null, null, null, null, '用地类项目', '该项目通过改造原鸽牌电缆厂的建筑物，将其打造成重庆大学设计创意产业园。该项目是以设计、动漫等创意产业为核心的创意产业综合体及其配套等工程。', '5000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '413', null, '0');
INSERT INTO `project_info` VALUES ('413', '健康综合体', null, '167', null, null, null, null, '楼宇类项目', '为响应国家“健康中国”战略，践行程京院士“哑铃模式”，博奥颐和、上海天亿集团、美方健康、上海朗盛投资，四家企业打造北京颐和美方健康科技有限公司。用“技术+产业+运营+资本”的运营模式，形成了健康服务运营系统。拟选址建造健康综合体。', '30000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '414', null, '0');
INSERT INTO `project_info` VALUES ('414', '影像中心', null, '167', null, null, null, null, '楼宇类项目', '开普影像公司在哈尔滨、长春、沈阳等地已建立多家区域影像中心，现拟在沙区选址建设一家区域影像中心，与西南医院、新桥医院等优质医疗资源合作，依托远程影像医疗模式和技术，整合区域影像资源，建设一家辐射重庆及西南片区的区域影像中心。', '13000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '415', null, '0');
INSERT INTO `project_info` VALUES ('415', '华信基业', null, '167', null, null, null, null, '楼宇类项目', '华信基业集团有限公司是中国华信控股集团的全资子公司，成立于2005年，是一家专注基本建设、基础产业领域的金融类公司。其主要客户对象主要为各级政府平台公司和各类国企、央企及特大型民企、上市公司。1、华信基业集团拟在沙坪坝区注册成立华信基业金融服务集团有限公司。2、金融服务公司下设产业基金管理公司、保险代理公司、融资租赁公司、招商传媒公司、行业实体公司的等子公司。', '1000000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '416', null, '0');
INSERT INTO `project_info` VALUES ('416', '摩尔装配建筑总部项目', null, '167', null, null, null, null, '楼宇类项目', '企业从事钢结构装配式建筑建造，房屋建筑设计、研发、技术咨询。拟在沙区打造中国西部摩尔装配式钢结构建筑技术研发中心和摩尔建筑产品产业链大数据服务交易中心。', '500000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '417', null, '0');
INSERT INTO `project_info` VALUES ('417', '盛智易联重庆网约车项目', null, '167', null, null, null, null, '楼宇类项目', '拟在公路客运不发达的地区、自然旅游景区等，提供城际网约车服务，同时开展接送机、接送站、公路客运接驳等城市网约车业务；通过差异化的市场定位，占领网约车细分市场。', '30000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '418', null, '0');
INSERT INTO `project_info` VALUES ('418', '重庆大学建筑规划设计研究总院', null, '167', null, null, null, null, '楼宇类项目', '拟在沙坪坝区注册设立重大环境工程研究院、重庆学府建筑工程公司、重庆佑邦消防检测公司、重大建设工程质量检测公司、重庆林鸥监理咨询公司，开展与环境、消防、质量相关的咨询、检测评估等业务。', '100000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '419', null, '0');
INSERT INTO `project_info` VALUES ('419', '华润万家有限公司西南区域分公司合并项目', null, '167', null, null, null, null, '楼宇类项目', '华润万家是中央直属的国有控股企业集团、世界500强企业。目前重庆华润万家生活超市有限公司共有13家分支机构。华润万家有限公司拟将广西华润万家生活超市有限公司搬迁至重庆，并与重庆华润万家生活超市有限公司合并。', '35000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '420', null, '0');
INSERT INTO `project_info` VALUES ('42', '中关村创新基地', 'Z201905000752', '167', '电子信息', '科学研究和技术服务业', '', null, null, null, null, '0.00', null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:36:07', null, null, null, null, '待企业确定选址', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('420', '重庆鑫和康复医院', null, '167', null, null, null, null, '楼宇类项目', '重庆边界康复技术研究院有限公司成立于2016年。是专门从事康复医学研究、中医药转化研究，生物技术、干细胞技术研发，健康养老服务，医药信息、健康咨询和网络信息技术开发的综合研究型企业。汇集一批具有丰富临床经验的医学专家，以骨与关节、脊髓损伤、神经、视力与听力、疼痛、儿童、老年、心肺、烧伤和肿瘤康复及康复理疗技术11个专业为主要研究方向。', '250000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '421', null, '0');
INSERT INTO `project_info` VALUES ('421', '三快小贷新增运营资金项目', null, '167', null, null, null, null, '楼宇类项目', '三快小贷公司成立于2016年12月，先期注册资本金1.5亿美元。目前根据公司发展需要，增强服务实体经济与普惠金融的能力，新增运营资金26亿人民币。（其中，美金1.6亿美元，人民币16亿元）。', '260000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '422', null, '0');
INSERT INTO `project_info` VALUES ('422', '万达小贷新增运营资金项目', null, '167', null, null, null, null, '楼宇类项目', '万达小贷公司已于2017年12月成立，先期注册资本金10亿元。现根据发展需要，拟增加公司运营资金15亿元。', '150000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '423', null, '0');
INSERT INTO `project_info` VALUES ('423', '三快小贷第二轮新增运营资金项目', null, '167', null, null, null, null, '楼宇类项目', '小贷公司第二轮增加运营资金、增强服务实体经济与普惠金融的能力，在前期签约落地26亿元运营资金的基础上新增运营资金8.6亿元人民币。', '136000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '424', null, '0');
INSERT INTO `project_info` VALUES ('424', '锦程物流网国际跨境支付项目', null, '167', null, null, null, null, '楼宇类项目', 'T.C.S项目是锦程物流网在中国人民银行的大力支持下打造的全球第一家以交易结算服务为核心的物流跨境支付平台，旨在依托整合资源优势，介由平台与银行金融机构和向税务部门的集中支付与报税服务，降低企业结算成本和税务风险，全面提升行业服务标准与能力，致力于打造全球最安全的物流交易和结算中心。', '1020000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '425', null, '0');
INSERT INTO `project_info` VALUES ('425', '三快小额贷款公司ABS项目', null, '167', null, null, null, null, '楼宇类项目', '三快小贷为优化资本结构降低成本，拟在深圳证券交易所发行美团网生意贷资产支持专项计划（ABS），发行方式为储架式分期发行，管理人为中国国际金融股份有限公司，计划发行总额50亿元，本次首期拟发行5亿元，募集资金的主要用途为补充三快小贷公司的运营资金。', '500000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '426', null, '0');
INSERT INTO `project_info` VALUES ('426', '三快小额贷款公司ABS项目', null, '167', null, null, null, null, '楼宇类项目', '三快小贷为优化资本结构降低成本，拟在上海证券交易所发行美团网生意贷资产支持专项计划（ABS），发行方式为储架式分期发行，管理人为中国国际金融股份有限公司，计划发行总额50亿元，募集资金的主要用途为补充三快小贷公司的运营资金。', '500000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '427', null, '0');
INSERT INTO `project_info` VALUES ('427', '三快小贷新增运营资金项目', null, '167', null, null, null, null, '楼宇类项目', '增加运营资金30亿元人民币', '300000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '428', null, '0');
INSERT INTO `project_info` VALUES ('428', '浙商银行合作项目', null, '167', null, null, null, null, '楼宇类项目', '浙商重庆分行在沙区设立一家一级支行机构。将在金融创新、产融结合、信用体系建设等方面全面合作，累计向沙坪坝实体经济和社会发展提供不少于亿元的意向性融资支持额度。', '800000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '429', null, '0');
INSERT INTO `project_info` VALUES ('429', '三快小贷新增注册资本金项目', null, '167', null, null, null, null, '楼宇类项目', '增加注册资本金1.5亿美元', '105000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '430', null, '0');
INSERT INTO `project_info` VALUES ('43', '慧联无限西区总部暨产业基地项目', 'Z201905000753', '167', '物联网', '制造业', '', null, '楼宇类项目', null, null, '0.00', null, null, null, null, null, null, '孙晓旭', '2020-05-22 14:09:34', null, null, null, null, '无', '0', '1', null, null, null, null, null, null, null, null, null, '1');
INSERT INTO `project_info` VALUES ('430', '阳光财险合作项目', null, '167', null, null, null, null, '楼宇类项目', '阳光财险重庆分公司将整合公司内部资源，利用股东、客户及社会资源，支持甲方经济发展和基础设施建设，在未来三年内利用总公司的优势资源，牵头组织或运用自有资金为甲方的建设项目提供债券、股权或者其他形式共计20亿元的融资额度。', '200000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '431', null, '0');
INSERT INTO `project_info` VALUES ('431', '东风小康汽车整车及相关零部件项目', null, '166', null, null, null, null, '用地类项目', '年产整车10万台，占地约1200亩，达产后年产值130亿元，年税收4亿元。', '250000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '432', null, '1');
INSERT INTO `project_info` VALUES ('432', '小康控股汽车及摩托车零部件项目', null, '166', null, null, null, null, '用地类项目', '占地面积300亩，达产后年产值5亿元，年税收2000万元。', '50000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '433', null, '1');
INSERT INTO `project_info` VALUES ('433', '华孚高性能汽车结构件生产项目', null, '166', null, null, null, null, '用地类项目', '占地面积90亩，达产后年产值10亿元，年税收4000万元。', '60000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '434', null, '1');
INSERT INTO `project_info` VALUES ('434', '重庆气压公司气体压缩机项目', null, '166', null, null, null, null, '用地类项目', '气压公司是集自主研发、制造、销售、服务于一体的综合性压缩机制造企业，项目建成后公司将从上桥整体搬迁至重庆·大学城科技产业园。', '30000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '435', null, '1');
INSERT INTO `project_info` VALUES ('435', '重庆纳米电子材料产业园暨国家纳米电子材料（西南）检测中心项目', null, '166', null, null, null, null, '用地类项目', '占地面积55亩，达产后年产值5.5亿元，年税收3000万元。', '30000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '436', null, '1');
INSERT INTO `project_info` VALUES ('436', '锦联（重庆）新经济产业园', null, '166', null, null, null, null, '用地类项目', '占地面积270亩，达产后年产值27亿元，年税收6000万元。', '170000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '437', null, '1');
INSERT INTO `project_info` VALUES ('437', '普门科技新增投资项目', null, '166', null, null, null, null, '用地类项目', '目前国内唯一获得国家科技进步一等奖的医疗器械企业，深圳医疗器械企业前20名，公司正在准备IPO。原协议签订供地10亩+30000平方米产业化场地，目前，企业已摘地9亩，只能满足研发及小试需求。企业拟在原协议基础上扩大项目内容，建设西南总部，可新增产值约20亿元。', '105000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '438', null, '1');
INSERT INTO `project_info` VALUES ('438', '裕同科技智慧工厂暨高端智能包装项目', null, '166', null, null, null, null, '用地类项目', '项目将打造继武汉、许昌之外的全国第三个裕同科技智慧工厂示范区，主要从事高端智能包装项目研发设计、生产制造和销售等。', '160000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '439', null, '1');
INSERT INTO `project_info` VALUES ('439', '德润俊科技医学转化产业研究院暨三类医疗器械生产基地项目', null, '166', null, null, null, null, '用地类项目', '项目由北京德润俊科技公司投资，拟建设医学转化产业研究院及三类医疗器械生产基地，计划转化8个以上三类医疗器械。目前该公司已成功研发出温敏栓塞等高附加值医疗器械4种，预计最快的产品将于明年初获得CFDA审批。', '250000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '440', null, '1');
INSERT INTO `project_info` VALUES ('44', '卓胜微电子重庆研发中心项目', 'Z201905000754', '167', '集成电路', '制造业', '', null, '楼宇类项目', null, null, '0.00', null, null, null, null, null, null, '孙晓旭', '2020-05-22 14:09:19', null, null, null, null, '磋商', '0', '3', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('440', '三磨海达高档数控磨床总部暨研发、生产基地项目', null, '166', null, null, null, null, '用地类项目', '企业是专业从事砂带磨削基础技术研究、应用技术开发、磨床生产、销售、服务的高新技术企业，占地4亩8000万年产值。拟在沙区落户企业总部，进行数控磨床的研发生产和销售结算等。', '50000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '441', null, '1');
INSERT INTO `project_info` VALUES ('441', '银钢总部基地项目', null, '166', null, null, null, null, '用地类项目', '银钢一通创立于1990年，现处沙坪坝区井口镇南溪工业园。公司专注于内燃机五大核心零部件之一的凸轮轴的研发与制造，广泛应用于汽车、摩托车、通用汽柴油机等行业领域，是一家集研发、设计、制造、销售为一体的高新技术企业。企业现拟整体搬迁至青凤工业园，预计五年总投资约8.8亿元，达产年产值约13.5亿元，年税收0.8亿元。', '125000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '442', null, '1');
INSERT INTO `project_info` VALUES ('442', '工业设计中试制造基地项目', null, '166', null, null, null, null, '用地类项目', '项目依托重庆市工业设计促进中心、企业在工业设计的行业资源，以“设计+孵化+成果转化”的创新模式，建设集工业设计、结构设计、电子开发、软件设计、样品试验、小批试制和小批量生产一体化的综合工业设计转化基地。', '31400.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '443', null, '1');
INSERT INTO `project_info` VALUES ('443', '绿色环保智能制造新型建材基地项目', null, '166', null, null, null, null, '用地类项目', '金智展为沙区新桥的既存企业，拥有年产90万方的环保型预拌商品混凝土生产能力，2018年沙区A级纳税企业。金智展拟在青凤工业园内建设绿色环保智能制造新型商品混凝土及砂浆搅拌站；在沙区设立企业总部，将其在其他区县设立的关联或控股公司的部分销售业务归口到沙区进行结算。', '30000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '444', null, '1');
INSERT INTO `project_info` VALUES ('444', '重型汽车驾驶室总成及阴极电泳涂装项目', null, '166', null, null, null, null, '用地类项目', '原子键科技为区内存量企业，企业拟将现有生产场地整体迁移至沙坪坝区青凤工业园内，并与重庆科技学院机械与动力工程学院汽车系合作，建设独立法人研究院公司，将成果就地转化；建设重型汽车驾驶室总成车间及新建三条阴极电泳全自动涂装线，主要从事重型汽车驾驶室的生产及汽车、摩托车、通机等金属件的表面涂装加工，与整车公司产业链实现无缝衔接。', '35000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '445', null, '1');
INSERT INTO `project_info` VALUES ('445', '工业微耕机整机生产基地及研发中心暨模具设计研发中心项目', null, '166', null, null, null, null, '用地类项目', '国安机械为区内存量企业，企业拟将现有生产场地整体迁移至沙坪坝区青凤工业园内，并联合重庆工商等大学机械学院成立独立法人机构的技术研发中心和实验室，挂牌“重庆工商大学实践教学基地”和“重庆国安机械有限公司—重庆工商大学产学研合作基地”，并同步建设微耕机整机研发中心、工业模具设计研发中心及机器人焊接及冲压自动化工艺生产线。', '35000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '446', null, '1');
INSERT INTO `project_info` VALUES ('446', '新能源汽车仪表台及内饰总成生产基地暨模具设计研发中心项目', null, '166', null, null, null, null, '用地类项目', '海达塑胶为区内存量企业，企业拟将现有生产场地整体迁移至沙坪坝区青凤工业园内，并与重庆工商大学合作建设独立法人研发机构，进行模具开发与制作，将成果就地转化；同步建设50条汽车仪表台等内饰件自动化生产线，建设模具数字化设计制造及企业信息化管理中心、大型及精密冲压模具、塑料模具、铸造模具、轮胎活络模具设计制造基地。', '30000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '447', null, '1');
INSERT INTO `project_info` VALUES ('447', '中科·国机地球资源装备产研基地项目', null, '166', null, null, null, null, '用地类项目', '中装集团、中科院地质地球所拟合作建设地球资源装备研究院及孵化加速高端服务平台、产业化基地。设立产业化研究院，开展地球资源装备产业化应用研究；并以此为载体嫁接中科院科技成果，进行产业化，打造地球资源装备产业化基地。', '250000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '448', null, '1');
INSERT INTO `project_info` VALUES ('448', '首创集成电路产业园', null, '166', null, null, null, null, '用地类项目', '首创联合中关村发展集团于2015年启动建设中关村集成电路设计园，2018年交付，总建筑面积22万平方米。园区以IC设计为核心，部署物联网、移动互联网、智能硬件设计、软件应用、信息安全等产业。2018园区拟入驻企业及已入驻企业27家，年产值近250亿元，税收40亿元，专利超过1700件，已经成为国家发展集成电路设计的重要载体。', '490000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '449', null, '1');
INSERT INTO `project_info` VALUES ('449', '小康中高端智能网联汽车项目', null, '166', null, null, null, null, '用地类项目', '整车项目工厂将引进国内一流高科技公司提供智能网联服务，并按照智能数字化柔性汽车整车工厂标准建设，产品为中高端智能网联汽车，计划投放的整车产品包括全新款智能网联SUV-风光580、F527（包括燃油和电动增程EVR等）以及公司未来根据市场和行业情况所研发的其他中高端车型包括但不限于燃油和电动增程EVR。', '250000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '450', null, '1');
INSERT INTO `project_info` VALUES ('45', '星环大数据分析与应用研究院项目', 'Z201905000755', '167', '互联网云计算大数据', '信息传输、软件和信息技术服务业', '', null, '楼宇类项目', null, '1500.00', '11500.00', null, null, null, null, null, null, '孙晓旭', '2020-05-19 15:04:27', null, null, null, null, '机房装修。', '0', '3', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('450', '潍柴（重庆）新能源汽车研究院项目', null, '166', null, null, null, null, '楼宇类项目', '使用商业楼宇3000平方米，达产后年销售5000万元，年税收500万元。', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '451', null, '1');
INSERT INTO `project_info` VALUES ('451', '西南智能环保技术研究院及总部项目', null, '167', null, null, null, null, '楼宇类项目', '使用商业楼宇1500平方米，达产后年销售8亿元，年税收2000万元。', '600.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '452', null, '1');
INSERT INTO `project_info` VALUES ('452', '首度生物基因检测项目', null, '166', null, null, null, null, '楼宇类项目', '项目拟在重庆成立面向西南地区的生物基因第三方检测机构，与医院合作，提供全方位基因检测。', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '453', null, '1');
INSERT INTO `project_info` VALUES ('453', '重庆量子通信器件重点实验室', null, '166', null, null, null, null, '楼宇类项目', '中电科集团与中科大拟依托于重庆声光电建立“量子通信器件联合实验室”，开展量子通信单光子探测器等领域全方位协同创新，并将该实验室建成量子信息科学国家实验室量子通信分中心。', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '454', null, '1');
INSERT INTO `project_info` VALUES ('454', '普强项目', null, '166', null, null, null, null, '楼宇类项目', '公司是一家专业从事语音识别、语音分析和语言处理技术研究及产品开发的高新技术企业。提供以中文为主的智能语音和语言核心技术、软件产品、应用方案、以及云平台服务。', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '455', null, '1');
INSERT INTO `project_info` VALUES ('455', '航天一院项目', null, '166', null, null, null, null, '楼宇类项目', '项目由沙坪坝区下属国有投资平台、航天科工一院、社会资本共同建设。建设内容包括但不限于行政中心、城市大数据运营中心、电子市民中心、创新中心，以及在交通、公安、城建、环保、旅游、市场监管、粮食、园林、智能制造、教育、医疗等领域的智慧示范应用，支撑落实重庆市将科学城打造为“智核”的战略措施。', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '456', null, '1');
INSERT INTO `project_info` VALUES ('456', '遥感气象大数据研发暨应用中心项目', null, '166', null, null, null, null, '楼宇类项目', '本项目拟建设全国第一家商业化遥感+气象大数据研发暨应用中心，致力于打造最全、最及时、精度最高的空间数据运营中心，面向城市治理、金融、能源、农业、交通运输等相关行业提供商业化服务。', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '457', null, '1');
INSERT INTO `project_info` VALUES ('457', '绿康档案大数据创新创业中心项目', null, '166', null, null, null, null, '楼宇类项目', '', '10000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '458', null, '1');
INSERT INTO `project_info` VALUES ('458', '赛宝重庆工业质量技术产业化制造基地暨研究院项目', null, '166', null, null, null, null, '楼宇类项目', '企业是电子五所的全资子公司，拟在沙区建设重庆军民融合共性技术研究院公司。', '40000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '459', null, '1');
INSERT INTO `project_info` VALUES ('459', '西井科技项目', null, '166', null, null, null, null, '楼宇类项目', '企业自主开发了类人脑芯片，借助独有算法及硬件平台，实现港口、矿场等封闭式场景的无人化、自动化，拟在沙区设立人工智能研发中心、运营中心及人才培训基地。', '100000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '460', null, '1');
INSERT INTO `project_info` VALUES ('46', '光电工研院重庆研究院', 'Z201905000757', '167', '集成电路', '制造业', '', null, '楼宇类项目', null, null, '0.00', null, null, null, null, null, null, '孙晓旭', '2020-05-19 15:05:24', null, null, null, null, '因注册人含有外国专家，已由对方公司自行办理注册。', '0', '3', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('460', '特种专用车辆产业化项目', null, '166', null, null, null, null, '楼宇类项目', '固硕汽车是一家集研发、制造、销售各类特种专用车的高科技企业，主要提供移动运营商、公检法、环保、交通、消防、人防、应急保障等行业的特种车辆定制改装及系统集成。', '150000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '461', null, '1');
INSERT INTO `project_info` VALUES ('46012e1544d14973ad9d6ad00a1b0322', '推动中电科20所与北斗（重庆）科技集团开展业务合作', 'SPB20200618421765', '166', null, null, null, null, '用地类项目', null, null, null, null, null, null, null, null, '1', '若依', '2020-06-18 18:29:25', '1', '2020-06-29 11:45:58', null, null, null, '0', '3', '1', null, null, '0', null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('461', '高孚动力全国性总部暨磁悬浮生产制造基地项目', null, '166', null, null, null, null, '楼宇类项目', '北京高孚动力科技有限公司成立于2019年3月，注册资本金500万元，是专业从事磁悬浮轴承技术、气浮技术、特种电机及驱动控制技奖；公司拥有强大的技术研发能力，团队3有北京办公室和河北涿州6000 平方米的生产基地。项目从事磁悬浮电机的生产、研发及销售。计划总投资约2.8亿元，预计3年后达产，实现年营收不低于3亿元，年上缴综合税收不低于0.2亿元。', '180000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '462', null, '1');
INSERT INTO `project_info` VALUES ('462', '光电工研院重庆研究院', null, '166', null, null, null, null, '楼宇类项目', '1.项目以沙区为主体成立光电工研院重庆分院，武汉光电工研院参与运营管理，主要建设芯片开发平台、国际技术转化中心、企业孵化中心等。2.依托重庆分院联合华中科技大学，成立星火集成电路公共服务平台，对初创IC设计企业提供EDA、MPW、封测、基金投资等服务。', '100000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '463', null, '1');
INSERT INTO `project_info` VALUES ('463', '大数据精准推广服务运营总部暨研发中心项目', null, '166', null, null, null, null, '楼宇类项目', '波兹在我区设立全资子公司建设大数据精准推广服务运营研发中心，开展服务运营、大数据研发、系统维护。通过供应方平台（SSP）接入超4000个主流海外App，利用自主研发的大数据AI算法，帮助APP运营商对用户行为习惯进行实时大数据精准分析，通过分析结果进行广告的精准投放。项目公司1年内达到30人团队，5年内达50人团队。其中30%为研发人员，70%为运营人员。', '10000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '464', null, '1');
INSERT INTO `project_info` VALUES ('464', '韵盛发科技总部项目', null, '166', null, null, null, null, '楼宇类项目', '企业于成立于2008年5月，注册资本金3600万元（实缴），是北京和中关村双高新技术企业，为国内领先的以边缘计算和云服务形式，提供无线接入、物联网、大数据相关设备和服务的供应商，目前有超过5个国家20个无线运营商的70多个网络25万个接入点使用其产品和服务。企业拟将北京总部搬迁至重庆。', '35000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '465', null, '1');
INSERT INTO `project_info` VALUES ('465', '5G智慧沙坪坝建设项目', null, '166', null, null, null, null, '楼宇类项目', '本着“政府引导、聚合产业、服务民生、合作创新、科学发展”的原则，就沙坪坝区5G通信基础网络建设及智慧应用领域的建设规划方案、运营规划等层面开展论证、咨询、项目建设与落地等方面的合作', '120000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '466', null, '1');
INSERT INTO `project_info` VALUES ('466', '第三代半导体的生长及分析系统的研发与应用项目', null, '166', null, null, null, null, '楼宇类项目', '项目依托中聚高科、北京大学物理学院，中国工程物理研究院激光聚变研究中积淀，拟由中聚高科牵头实施，在沙区开展第三代半导体的生长及分析系统的研发与应用，打破国外对国内第三代半导体的生长及分析系统的技术垄断，满足国内军工单位、科研院所的需求。预计研发完成后，将实现年销售收入过亿元，带动本地超过100名人员就业。研发指标。年申请发明专利及软件著作权20项', '60000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '467', null, '1');
INSERT INTO `project_info` VALUES ('467', '重庆工业设计城项目', null, '166', null, null, null, null, '楼宇类项目', '该项目由国内知名工业设计企业浪尖牵头，拟联合国内各家知名工业设计企业，围绕工业设计六大集群，打造服务重庆、辐射西南、面向全国的一流工业设计城。', '110000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '468', null, '1');
INSERT INTO `project_info` VALUES ('468', '航天用特种吸波材料研制项目', null, '166', null, null, null, null, '楼宇类项目', '该项目拟在我区设立项目公司，一期建设研发运营中心、产品展示中心、人才培训基地、总部结算；二期根据运营情况拿地拓展，建设复合材料生产测试基地。', '40000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '469', null, '1');
INSERT INTO `project_info` VALUES ('469', '军用人工智能终端研发总部暨产业化项目', null, '166', null, null, null, null, '楼宇类项目', '项目一期建设研发中心、运营中心、产品展示中心、人才培训基地、结算中心，研发产品通过委托代工生产；二期根据运营情况建设端智能设备的生产测试和产业化基地。', '50000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '470', null, '1');
INSERT INTO `project_info` VALUES ('47', '机器人总部及研发生产基地项目', 'Z201905000758', '167', '智能制造装备', '制造业', '', null, '楼宇类项目', null, null, '0.00', null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:36:20', null, null, null, null, '等待企业高层回复', '0', '3', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('470', '再生材料改性剂研发暨产业化项目', null, '167', null, null, null, null, '楼宇类项目', '项目公司生产产品（相容剂），可极大提升再生产品相容后强度、力学性能，增强再生产品附加值。项目公司通过对再生资源规范处置和利用，回收利用循环，提升地区再生资源综合转化率，助力区域经济绿色、共赢发展。', '250000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '471', null, '1');
INSERT INTO `project_info` VALUES ('471', '民生电商金融产业园', null, '167', null, null, null, null, '用地类项目', '该项目占地127.8亩，拟建造领先水平的金融监管设施及物流仓储设施，为该项目所在区域内的相关企业提供高质量的供应链金融服务及配套仓储设施，打造一个以跨境贸易、冷链、汽车、电商为产业基础的现代金融物流产业园。 ', '33000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '472', null, '1');
INSERT INTO `project_info` VALUES ('472', '中集股份多式联运（重庆）智能应用基地项目', null, '167', null, null, null, null, '用地类项目', '项目围绕重庆汽车产业领域，打造为以提供集成供应物流服务为核心，以商品车、非商品车集散分拨、智慧物流应用推广为特色的整车智慧物流基地，包含立体智能无人机器人停车库及数字化展厅。', '50000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '473', null, '1');
INSERT INTO `project_info` VALUES ('473', '新能源汽车智慧物流产业园项目', null, '167', null, null, null, null, '用地类项目', '该项目拟打造集新能源汽车体验中心、新能源汽车互联网数据服务及结算中心、新能源汽车仓储分拔中心、新能源汽车锂电池检测中心、新能源汽车充电站、汽车综合检测中心等功能于一体的新能源汽车创新服务示范基地。', '20000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '474', null, '1');
INSERT INTO `project_info` VALUES ('474', '(宝供)重庆·粤港澳商贸物流枢纽项目', null, '167', null, null, null, null, '用地类项目', '项目以重庆为中心，对接粤港澳大湾区，承接国际陆海贸易新通道沿线优势产业产品的商贸流通需求，建设集展贸交易结算、一体化采购、分销、柔性加工、电商交割、跨境供应链、商务办公、商业配套、供应链大数据、供应链金融于一体的商贸流通枢纽。', '200000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '475', null, '1');
INSERT INTO `project_info` VALUES ('475', '卓尔智联西南总部项目', null, '167', null, null, null, null, '用地类项目', '卓尔智联智联集团是国内500强企业（排名79位），主要从事商贸、金融、物流等现代商贸服务业。拟依托重庆铁路口岸及自贸区优势资源，开展国内大宗贸易及物流结算平台与重庆卓尔云仓项目建设。', '800000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '476', null, '1');
INSERT INTO `project_info` VALUES ('476', '传化网西南运营中心项目', null, '167', null, null, null, null, '用地类项目', '传化集团是中国企业500强，中国民营企业500强，发展化工、物流、农业、科技城、投资等事业领域。你在沙区投资传化网西南运营中心，打造“一核心三中心四节点”的物流网络体系。', '550000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '477', null, '1');
INSERT INTO `project_info` VALUES ('477', '国际花木苗圃培植展销基地', null, '167', null, null, null, null, '楼宇类项目', '作为植物种苗口岸的必要配套项目，总占地面积约114亩，主要建设花木培育区和配套交易区，项目总投资约1亿元。同时引进相关产业运营商入驻，发展“一带一路”沿线国家及台湾地区的花木、种苗、水生动物的进口贸易、展销。', '10000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '478', null, '1');
INSERT INTO `project_info` VALUES ('478', '金点园林结算中心项目', null, '167', null, null, null, null, '楼宇类项目', '主要从事城市园林绿化、造林绿化施工及园林古建筑工程专业承包等业务。', '100000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '479', null, '1');
INSERT INTO `project_info` VALUES ('479', '鑫垚大宗商品贸易平台', null, '167', null, null, null, null, '楼宇类项目', '重庆鑫垚实业有限公司是一家从事钢材、煤炭、矿石和建材等行业的综合性企业，主要开展原煤、焦煤、焦炭、矿产品、金属材料、建材的对外贸易及国内销售业务，并对外进行煤炭产业投资。', '100000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '480', null, '1');
INSERT INTO `project_info` VALUES ('48', '中科天翼高精密激光陀螺研发暨生产基地项目', 'Z201905000759', '167', '智能制造装备', '制造业', '', null, '楼宇类项目', null, null, '0.00', null, null, null, null, null, null, '孙晓旭', '2020-05-22 14:08:57', null, null, null, null, '待企业股改完成后再行协商签订。', '0', '3', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('480', '维木（重庆）物流供应链平台项目', null, '167', null, null, null, null, '楼宇类项目', '广东维木网络科技有限公司是一家木业行业产业链服务企业，隶属广东君泰投资集团有限公司，旗下有物流管理、木皮联供应链、电子信息化平台等四家子公司，木材年交易额约60亿元，进出口贸易额约10亿人民币。', '100000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '481', null, '1');
INSERT INTO `project_info` VALUES ('481', '小米金融产融服务平台', null, '167', null, null, null, null, '楼宇类项目', '小米金融是小米公司旗下个人综合金融服务平台，业务范围包括消费信贷、第三方支付、互联网理财、互联网保险、供应链金融、金融科技等。小米金融拟产融大数据服务中心，主要利用区块链、大数据、云计算、人工智能等技术手段，通过企业化组织和专业化服务实现最深', '300000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('482', '传化智联金融合作', null, '167', null, null, null, null, '楼宇类项目', '以传物流场景为依托，在重庆开展物流金融合作，赋能陆海贸易新通道', '100000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('483', '宝能集团金融合作', null, '167', null, null, null, null, '楼宇类项目', '开展“物流+供应链+金融”的物流金融、惠普金融合作，重点在冷链产品、平行进口整车、电子产品等领域。', '50000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('484', '农行重庆分行金融合作', null, '167', null, null, null, null, '楼宇类项目', '为中新互联互通项目发展提供金融合作。', '500000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '485', null, '1');
INSERT INTO `project_info` VALUES ('485', '奥山冰雪世纪城项目', null, '167', null, null, null, null, '楼宇类项目', '文旅公司拟以招商引资的合作方式，引入奥山集团冰雪运动综合体项目落户沙区大学城片区，增强沙区文体产业聚集。项目占地326.71亩，可建方量约40.72万㎡，项目建设内容包括体育休闲产业及配套，含自持物业冰雪MALL 2万㎡、星级酒店2万㎡。', '500000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '486', null, '1');
INSERT INTO `project_info` VALUES ('486', '磁器口金碧正街文化旅游项目', null, '167', null, null, null, null, '用地类项目', '项目位于磁器口金碧正街，北侧紧邻特钢厂，南与凤凰溪、古镇横街相邻，西邻212国道，东邻嘉陵江，面积约172亩，可建设用地约82亩，规划为混合居住用地，拟打造文旅项目。', '320000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '487', null, '1');
INSERT INTO `project_info` VALUES ('487', '新经济数字产业园', null, '167', null, null, null, null, '用地类项目', '拟选址虎溪场镇，总体规划一中心两基地，以 多功能综合电竞馆为标志载体，电竞游戏赛事为内容核心，龙头企业带动， 促进电竞产业交流，拉动数字娱乐产业集聚，升级项目区域消费，以人气聚集地为标签，构建集工作、生活、文娱、消费于一体的多元化数字娱乐产业集聚地。', '1100000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '488', null, '1');
INSERT INTO `project_info` VALUES ('488', '重庆中美海吉亚医院国际医疗项目', null, '167', null, null, null, null, '用地类项目', '在海吉亚医院现有项目上增设国际病房、肿瘤筛选中心、国际医学交流中心、国际医疗设备引入并将日本藤田医科大学附属医院国际转诊通道、医生赴日研修、远程会诊、国际转诊等业态导入海吉亚医院。', '100000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '489', null, '1');
INSERT INTO `project_info` VALUES ('489', '渝晋新股权投资基金', null, '167', null, null, null, null, '楼宇类项目', '注册资本金500万元离岸人民币，计划项目公司成立后发起一支规模约5亿元人民的私募基金，主要投资文化旅游体育及其他相关产业，预计5年年均营业收入为1亿元。', '500.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '490', null, '1');
INSERT INTO `project_info` VALUES ('49', '德尔福科技发动机组件及新能源汽车部分电控模块生产制造基地项目', 'Z201905000760', '167', '汽车', '制造业', '', null, '楼宇类项目', null, null, '0.00', null, null, null, null, null, null, '孙晓旭', '2020-05-22 14:08:47', null, null, null, null, '无', '0', '3', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('490', '崛起东方金融街景观改造及旅游演艺项目', null, '167', null, null, null, null, '楼宇类项目', '以演绎剧院为核心，同时贯穿辐射项目街区，打造一站式情景体验演绎项目。', '32000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '491', null, '1');
INSERT INTO `project_info` VALUES ('491', '航空科技沉浸式体验基地及总部项目', null, '167', null, null, null, null, '楼宇类项目', '项目以航空科技为主导资源，利用现有航空器、飞行员训练模拟器、航空知识教育培训等系统方式，由浅入深地满足不同人群的消费需求，在磁器口沙磁巷打造“航空+旅游”的航空主题街区，主要包含飞机模拟驾驶、国防科普教育、航空教育培训、航空博物馆等业态。同时计划在莲花湖打造总部基地项目，打造大型航空产业总部基地，涉及航空飞机、专业设备的买卖及产品的主题体验等内容。', '220000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '492', null, '1');
INSERT INTO `project_info` VALUES ('492', '重庆一步道位停车管理有限公司总部项目', null, '167', null, null, null, null, '用地类项目', '拟建设约25个智慧公共停车库和一个城市级智慧停车平台', '200000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '493', null, '1');
INSERT INTO `project_info` VALUES ('493', '中国和平石油', null, '167', null, null, null, null, '楼宇类项目', '拟在沙区注册成立中国和平石油金融服务集团有限公司，下设全资产业基金管理公司、保险代理公司、融资租赁公司、招商传媒公司、行业实体公司、加气站、炼油化工设备等子公司。上述综合金融服务机构，年为实体金融配套达500亿元、金融投融资配套业务500亿元。', '1000000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '494', null, '1');
INSERT INTO `project_info` VALUES ('494', '极客慧谷总部项目', null, '167', null, null, null, null, '楼宇类项目', '该项目为珠江集团在渝设立的区域公司，主要职能为跟投集团确定的西部项目，参与项目的建设及运营。公司注册资本1亿元，承诺5年以内投资不低于20亿元。公司的运营范围为：企业管理咨询；市场营销策划；房地产开发及经营；土地开发整理；自有房屋租赁；物业管理；城市规划设计；房地产信息咨询；园林绿化工程的设计与施工；市政公用工程的设计与施工。', '200000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '495', null, '1');
INSERT INTO `project_info` VALUES ('495', '城市数字消防安全管理公共服务平台全国总部基地项目', null, '167', null, null, null, null, '楼宇类项目', '拟在沙区设立全国总部基地，建设城市数字消防安全管理公共服务平台、新型消防产业生态链、消防大数据产业园区。', '800000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '496', null, '1');
INSERT INTO `project_info` VALUES ('496', '中铁建川重庆总部项目', null, '167', null, null, null, null, '楼宇类项目', '中铁建川集团有限公司隶属于中国科学技术协会，集团位于成都，主要经营范围涉及城市基础建设、公共设施、房地产开发等。现拟在沙区设立全资子公司，开展重庆区域业务。', '690000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '497', null, '1');
INSERT INTO `project_info` VALUES ('497', '广汇领克4S店项目', null, '167', null, null, null, null, '楼宇类项目', '重庆博众汽车隶属广汇汽车，广汇汽车是全国排名第一的汽车经销商，全国网点800余家、隶属于世界500强新疆广汇实业（集团）投资有限公司。公司拟在平顶山奔驰4S店旁新增领克4S店，占领汽车细分市场。', '10000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '498', null, '1');
INSERT INTO `project_info` VALUES ('498', '牧图设计西南总部项目', null, '167', null, null, null, null, '楼宇类项目', '拟引进牧图公司在我区成立牧图设计公司西南总部，项目前期投资500万，并为我区推荐制造业类企业客户。', '1000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '3', null, null, null, null, null, null, '1', '499', null, '1');
INSERT INTO `project_info` VALUES ('5', '华亿金控进口汽车零配件全国营运中心项目', 'Z201904000201', '167', '其他', '批发和零售业', '市领导会见', null, '楼宇类项目', null, null, null, null, null, null, null, null, null, '孙晓旭', '2019-11-26 16:25:29', null, null, null, null, '企业经营策略调整，国内投资暂缓。', '0', '3', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('50', '大禹伟业产业技术研究及生产基地院项目', 'Z201905000761', '167', '材料', '制造业', '', null, '楼宇类项目', null, null, '0.00', null, null, null, null, null, null, '孙晓旭', '2020-05-22 14:08:35', null, null, null, null, '已达成协议条款', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('500', '优效产业联盟项目', null, null, null, null, null, null, null, '该项目由四川企业家段林岐先生发起，段林岐先生在沙区成立重庆优效企业管理有限公司。该公司作为优效产业联专业公司的形式开展汽车文化宣传、道路救援、汽共同搭建汽车产业联盟雏形，为各大车企及车主提供汽车推广及售后服务，后期将继续开设或投资相关企业，完善产业链，形成更加全面的汽车产业联盟。', '27600.00', '7000.00', '500.00', null, null, null, null, null, null, null, null, null, null, null, '5月签约', '0', '1', null, null, null, null, '重庆优效企业管理有限公司已经注册成立，将作为本次合作的签约方。其管理公司名下三家子公司已完成公司核名程序。', null, '2', '500', null, '1');
INSERT INTO `project_info` VALUES ('501', '合美时光商业综合体项目', null, null, null, null, null, null, null, '合美时光建立于2013年，成立于香港，主营业务为商业地产投资、文旅产业投资及运营管理。希望投资（外资）沙区商业综合体项目或棚户区改造项目。', '800000.00', '500000.00', '30000.00', null, null, null, null, null, null, null, null, null, null, null, '', '0', '1', null, null, null, null, '双方在3月进行了多轮电话会谈，对方承诺商业综合体自持50%以上，我方对其资产财务状况进行深入调研，其公司总资产177亿元，净资产125亿元，负债52亿元，年产值57亿元，公司运行情况良好，无地产烂尾、失信等问题。对方正在安排考察计划，计划于17日左右到访沙区，希望对接区领导。', null, '1', '501', null, '1');
INSERT INTO `project_info` VALUES ('502', '数字内容产业平台基地重庆总部项目', null, null, null, null, null, null, null, '不贰数字传媒集团公司拟在重庆打造数字内容（图文、直播、短视频、语音等）产业基地，建设内容包括数字内容交易、数字内容大数据服务两大平台，和数字内容企业总部中心/孵化中心、配套服务中心（人才公寓）、数字内容创意商业体验中心、5G网综视频拍摄基地、网络动态监测大数据分析中心5大模块。远期规划建设国家级电子商务服务中心、国家级网络文化产业基地。', '100000.00', '376000.00', '7200.00', null, null, null, null, null, null, null, null, null, null, null, '', '0', '1', null, null, null, null, '双方就其在沙区设立区域总部相关事宜进行了深入磋商，对项目首期约5000平方米左右的楼宇需求，我组已带企业在我区东、西部多个商业楼宇查勘，对方研判后初步拟选址平顶山万达广场旁盛华中心，约5800平方米。3月4、17日区商务委、总部经济组再次与企业就合作协议书进行深入洽谈，3月19日招商中心办公室、总部经济组拜访不贰数字传媒重庆公司，深入了解其运营情况及上下产业链，4月1日、7日总部经济组再次对接不贰集团公司，就合同核心条款进行磋商。', null, '1', '502', null, '1');
INSERT INTO `project_info` VALUES ('503', '西南环球珠宝之都项目', null, null, null, null, null, null, null, '中建远洋为中国建筑股份有限公司和远洋集团控股有限公司共同出资成立，中国建筑股份有限公司占股30中建和远洋产业转型合作战略的重要组成部分。中建远洋拟联合全国工商联金银珠宝业商会共同打造以时尚和珠宝为主题的泛珠宝产业集群，项目建成后将引入珠宝鉴定、设计、拍卖机构，导入珠宝销售、珠宝金融等产业，举办珠宝文化会展。', null, '350000.00', '30000.00', null, null, null, null, null, null, null, null, null, null, null, '', '0', '1', null, null, null, null, '4月中旬陶常务带领招商中心办公室、区规资局、总部经济组对接了中建远洋，企业汇报了策划方案，企业首选地块为特钢厂保留建筑，由于同济大学正在对该地块做设计方案，所以我方又向企业推荐了枣子堡地块、金碧正街楼宇。企业表示首选仍是特钢厂地块，愿意与同济大学合作，其次考虑枣子堡地块。下一步需等同济大学方案出来后再研究，同时企业对枣子堡地块进行研判。', null, '1', '503', null, '1');
INSERT INTO `project_info` VALUES ('504', '万联证券项目', null, null, null, null, null, null, null, '万联证券股份有限公司是广州市属全资国有证券公司，于2001年8月23日经中国证监会机构字[2001]148号文批准设立，现有注册资本59.54亿元。公司总部设在广州市，注册地址广州市天河区珠江东路11号18、19楼，扎根珠三角，在全国主要省份、直辖市及经济活跃的城市均设立了分支机构，形成了以华南为中心、辐射全国的营业网点布局。', '100000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, '', '0', '1', null, null, null, null, '4月30日，双方就产业导入和合作模式初步洽谈，下一步待对方重庆负责人5月份回总公司述职汇报后再作具体的策划方案，后续跟进。', null, '1', '504', null, '1');
INSERT INTO `project_info` VALUES ('505', '万家4S店项目', null, null, null, null, null, null, null, '重庆万家雅迪汽车销售服务有限公司于2008年成立，为一汽奥迪汽车经销商。其母公司吉林省华诚伟业汽车贸易集团股份有限公司为一汽汽车战略合作伙伴，主要销售一汽大众、一汽丰田、一汽奥迪等知名品牌。本次企业拟在沙区购买土地，设立一汽捷达4S店，如果土地条件允许，还将争取开设一汽丰田4S店。', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', '0', '1', null, null, null, null, '5月20日，我组联合商务委、商贸物流组跟企业进行初步对接。推荐凤鸣山4S地块及物流园商业用地。企业了解情况后，初步决定落地落户凤鸣山4S地块，但由于地块形状不规整。企业提出相关诉求。', null, '1', '505', null, '1');
INSERT INTO `project_info` VALUES ('506', '原公安分局地块项目', null, null, null, null, null, null, null, '企业拟在原公安分局地块上投资建设商业楼宇，引入雅高酒店、新东方教育MALL、智慧城市数据中心、直播孵化平台等业态，将该楼宇打造成沉浸式特色商业综合体。', '400000.00', '110000.00', '5000.00', null, null, null, null, null, null, null, null, null, null, null, '', '0', '1', null, null, null, null, '企业已做出产业策划方案，双方多次沟通修改，4月9日确定了送审方案，并对招商协议和土地出让意向性协议进行磋商。下一步准备签订土地出让意向性协议。', null, '1', '506', null, '1');
INSERT INTO `project_info` VALUES ('507', '新三板加速器大厦项目（新媒体大厦）', null, null, null, null, null, null, null, '企业是由赛伯乐投资集团合伙人唐唐联合北京星弘领创、北大校友会共同创立，是一家专注于互联网+、大农业、大健康、高新科技、影视文创、文化旅游等创业投资的大型控股公司。企业拟在D5-1/04地块上建设新三板加速器大厦，引入新三板交易中心、孵化中心和区块链相关产业，由新三板学院程晓明院长负责管理运营。', '300000.00', '200000.00', '20000.00', null, null, null, null, null, null, null, null, null, null, null, '', '0', '1', null, null, null, null, '5月9日，双方就产业导入和合作模式初步洽谈，下一步待对方做出具体的策划方案再对接。', null, '1', '507', null, '1');
INSERT INTO `project_info` VALUES ('508', '新尚知识产权交易中心项目', null, null, null, null, null, null, null, '成都新尚科技集团有限公司（以下简称“新尚集团”）是一家全国性大型多元化科技企业集团，创建于1992年，总部位于成都。经过近30年的高速发展，新尚团业务遍布上海、北京、杭州、成都、深圳、重庆、郑州等全国12个城市，设立了63家公济领域，新尚集团在连锁卖场运营、高校产业园开发运营、高校知识产权交易运营三项均处于全国第一。', '600000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, '', '0', '1', null, null, null, null, '5月15日上午，蔡焘常委带领区政府办、区科技局、区住建委、区规资局、磁管委、总部经济组会同重庆大学对接了新尚集团，沟通了解了企业背景、已建成的项目情况，并就合作项目、合作模式进行交流，下一步将协助企业进行项目选址工作，向企业推荐拟选址地块，并带企业到推荐地块现场考察。', null, '1', '508', null, '1');
INSERT INTO `project_info` VALUES ('509', '大禹伟业节能环保新材料暨西南地区总部项目', null, null, null, null, null, null, null, '1.企业背景：大禹伟业成立于2008年9月，注册资本金1.25亿元，是一家集节能环保新材料和高铁配套产品的研发、生产、销售和服务一体的国家和中关村双高新技术企业。2.技术优势：持有专利技术100多项，是国内液体橡胶行业的开拓者、创新者和领军者，也是行业标准的制定者，主编及参编了多项标准和图集。3.市场情况：2018年和2019年营收分别为约3亿元和2亿元。4.项目内容：建设大禹伟业节能环保新材料西南地区总部，涵盖研发、生产、销售以及西南地区结算中心。', '190000.00', '80000.00', '8000.00', null, null, null, null, null, null, null, null, null, null, null, '5月进入协议谈判阶段', '0', '1', null, null, null, null, '1.项目处于协议谈判阶段；2.5月7日，代区长陪同企业董事长实地考察青凤园区，企业对凤凰立交下道口主干道北侧180亩地块较为满意；3.目前已起草协议，正在与对方沟通协议细节。', null, '1', '509', null, '1');
INSERT INTO `project_info` VALUES ('51', '人工智能芯片及应用研究院', 'Z201905000762', '167', '集成电路', '制造业', '', null, '楼宇类项目', null, null, '0.00', null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:36:56', null, null, null, null, '无', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('510', '西部（重庆）地质科技创新研究院项目', null, null, null, null, null, null, null, '1.企业背景：自然资源部中国地质调查局成都矿产综合利用研究所（简称成都综合所）始建于1953年，主要从事矿产综合利用新技术、新方法、新工艺研究与开发，长期为业界提供选矿、冶金、地质勘查、岩矿鉴定和岩矿分析测试等各类科技服务，是国内仅有的两家以矿产综合利用为专业的科研院所之一，是原地矿部唯一的“功勋研究所”。2.技术团队：柔性引进中科院李廷栋院士1人，工程院卢耀如、赵文津院士2人；中国地质科学院陈安泽、胡泽松、颜世强、秦建华4名二级研究员带队的博士教授团队，涵盖地质构造、喀斯', '50000.00', '48000.00', '3000.00', null, null, null, null, null, null, null, null, null, null, null, '5月进入上会审查阶段', '0', '1', null, null, null, null, '1.项目处于上会审查阶段；2.已就项目协议达成一致，拟于近期上报常务会审议；3.项目公司已在物流园区内注册；4.去年与区政府签订了框架协议，拟进一步推进项目上升为中国地调局与市政府合作。', null, '1', '510', null, '1');
INSERT INTO `project_info` VALUES ('511', '红海通汇总部结算项目', null, null, null, null, null, null, null, '1.企业背景：红海通汇成立于2018年，是一家集“资源渠道开发—资源优化配置—资源服务—方案解决”于一体的专业人力资源服务产业链的科技型公司，专注于人力资源线上系统的开发与应用，提供供应链管理系统等相关服务。2.市场情况：目前红海通汇及其关联公司已为富士康、新普、英业达、京东物流、顺丰物流、中光电、惠科等200家大中型企业提供专业人力资源整合服务。2018年营业收入约1.8亿元，2019年营业收入约2.5亿元。3.项目内容：拟设立全国总部结算中心，整合红海通汇及关联企业资源，逐步将现有业务导', '6000.00', '12000.00', '600.00', null, null, null, null, null, null, null, null, null, null, null, '5月签订协议', '0', '1', null, null, null, null, '1.项目处于上会审查阶段；2.双方就协议条款达成一致，下一步待通过会议审查后签订协议。', null, '1', '511', null, '1');
INSERT INTO `project_info` VALUES ('512', '大真智能充电桩西南地区总部项目', null, null, null, null, null, null, null, '1.企业背景：建投大真是天津大真科技发展有限公司控股子公司。大真科技成立于2013年11月，注册资本金1000万元，是一家拥有自主知识产权，集研发、生产、销售、运营管理为一体的智能充电桩综合性服务商，目前在天津、苏州、南京、大连等8地均有布局。2.运营模式：推出“桩东计划”、“桩主计划”、“充电站计划”及“全国运营中心合伙人计划”，打破了充电桩传统运营的前期投入大、充电桩利用率低下、商业模式不清晰、盈利难等问题。3.市场情况：大真科技于2019年10月开始正式从天津转向全国市场布局，截止2019', '15000.00', '5000.00', '500.00', null, null, null, null, null, null, null, null, null, null, null, '5月签订协议', '0', '1', null, null, null, null, '1.项目处于上会审查阶段；2.双方就协议条款达成一致，下一步待通过会议审查后签订协议。', null, '1', '512', null, '1');
INSERT INTO `project_info` VALUES ('513', '物联网整体解决方案项目', null, null, null, null, null, null, null, '1.企业背景：企业成立于2015年7月，企业专注于工业大数据的采集，分析和挖掘，助力制造企业精细化运营，致力于打造最具客户价值的电机博士工业物联网云平台，实践物联网和大数据的应用。2.项目内容：拟在我区成立全资子公司，落地物联网整体解决方案项目，整合资源成立新一代信息技术产业联盟。.研发团队：团队领头人田广礼是武汉市“黄鹤英才”计划支持企业带头人、国家住建部智装委专家委员、华中科技大学武汉校友会副会长，拥有15项专利授权。3.市场情况：主要为工厂关键动力机电设备及水务给排水水泵', '5000.00', '15000.00', '500.00', null, null, null, null, null, null, null, null, null, null, null, '5月签订协议', '0', '1', null, null, null, null, '1.该项目处于协议谈判阶段；2.企业已在重庆牵头组建新一代信息技术产业联盟，目前企业正在完善方案；3.企业旗下的九犇科技已就协议达成一致，先行落地光谷·智创园。', null, '1', '513', null, '1');
INSERT INTO `project_info` VALUES ('514', '中信数字全国总部项目', null, null, null, null, null, null, null, '1.企业背景：中信数字技术有限责任公司系中信数媒全资子公司，中信集团全资二级子公司，专注于智慧城市、智慧社区等智慧产业建设及运营管理。 2.项目优势：（1）凭借中信集团强大的资金优势和技术整合能力，为区域“刚需”的智慧项目提供了“长周期‘按揭’付款”模式（付款年限可放长至10年以上）；（2）该项目系我区接触的众多智慧企业中，为数不多的不单纯依靠本区项目的总部结算功能的项目；（3）为后续引进中信集团旗下其他项目奠定良好基础。3.项目内容：中信数字拟将现有注册地从北京朝阳区变更至沙坪', '60000.00', '300000.00', '9000.00', null, null, null, null, null, null, null, null, null, null, null, '5月进入协议谈判', '0', '1', null, null, null, null, '1.项目处于协议谈判阶段；2. 对方正在内部就中信数字注册地迁移至重庆内部过会研究；3. 因重庆项目负责人正在外地出差洽谈业务，待返回重庆后，再就项目内容进行洽谈，力争锁定协议内容；4.建议纳入区政府主要领导北京方向考察计划。', null, '1', '514', null, '1');
INSERT INTO `project_info` VALUES ('515', '水泵厂整体搬迁扩产扩能项目', null, null, null, null, null, null, null, '1.企业背景：港股上市公司，国家西部地区泵类产品检测中心，是国内专业从事计量泵、往复泵、液压隔膜泵、高压自平衡离心泵、深井泵、齿轮泵以及以泵为主机的除鳞系统和成套加药装置开发研制、生产的主导企业。2.技术优势：拥有90余项专利技术，其中30余项离心泵专利技术，20余项隔膜计量往复泵，1项化工齿轮泵专利技术，1项环保产品专利技术，具有一、二、三类压力容器设计和制造资格。产品多次获得国家、部、市技术进步奖，优质产品奖等多项奖励。3.市场情况：2016年至2019年营收分别为4.98亿元、5.22', '300000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, '5月进入协议谈判阶段', '0', '1', null, null, null, null, '1.项目处于协议谈判阶段；2.由区土储中心对水泵厂现有地块进行收储，相关事宜正在推进；3.先进制造业组与水泵厂就项目选址进行提前沟通，我方希望企业尽快锁定项目选址地块，双方已就规划布局等相关问题进行多次论证沟通；4.下一步，拟于近期再次与水泵厂沟通，尽快锁定选址地块。', null, '1', '515', null, '1');
INSERT INTO `project_info` VALUES ('516', '设计之都设计产业综合服务平台项目', null, null, null, null, null, null, null, '1.企业背景：北京设计之都发展有限公司成立于2014年8月12日，注册资本金实缴2000万人民币，是一家围绕区域、产业、企业核心诉求，整合产业资源，致力于生态体系与服务体系的构建，形成设计产业DBO核心服务模式的国有企业。2.股权结构：设计之都共有2家股东，分别为北京金融街资本运营中心（为北京市西城区人民政府国有资产监督管理委员会全资子公司），占股51%、北京首科集团公司（为北京科技协作中心全资子公司），占股49%。3.经营情况：截止目前设计之都共参与7个项目的打造，建设科技设计综合服', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '5月进入调查研究阶段', '0', '1', null, null, null, null, '1. 2019年12月，设计之都总经理王果儿一行来我区考察，并与总部经济组进行了初步洽谈，会后前往重庆包装制品厂、国际枢纽园区创新中心等项目拟用空间进行了实地考察。随后，设计之都反馈对实地考察的项目拟用空间均不太满意；3.自2020年1月，疫情开始爆发，项目进展缓慢。2020年5月，总部经济组向设计之都新提供项目拟用空间龙湖光年，目前企业暂未反馈；4. 近期，先进制造业组与其沟通，初步形成了项目涵盖工业设计、建筑设计和消费设计等产业聚集；5. 已邀请对方投资副总郭海5月16日来区考察', null, '1', '516', null, '1');
INSERT INTO `project_info` VALUES ('517', '的卢深视西南总部暨三维视觉工程成果转化、高精尖产线与资金结算中心项目', null, null, null, null, null, null, null, '1.企业背景：国家高新技术企业在结构光深度感知、三维实时高精度重建、三维跟踪识别及感知等技术方向处于领先地位，总部位于北京，在杭州、合肥两地设有研发中心。2.技术优势：国内最早研究三维视觉智能感知全栈技术的企业，国内唯一一家建立了省级规模三维人像数据库的企业，其三维深度感知技术在1080P分辨率5米范围内，精度达到5mm误差，人脸重建精度保持在平均1.5mm以内，三维人像识别错误率可做到十亿分之一；三维实时高精度重建技术，已将重建精度做到毫米级，移动设备帧率达到40帧/秒。3.研发', '42000.00', '23000.00', '850.00', null, null, null, null, null, null, null, null, null, null, null, '5月进入协议谈判阶段', '0', '1', null, null, null, null, '1.项目处于调查研究阶段；2.企业有融资需求3000万元，君岳基金跟投1000万元，争取以基金投资换取项目落地，匹配一定普惠政策扶持；3.企业正完善项目计划书，下一步内部研究后与企业进行磋商。', null, '1', '517', null, '1');
INSERT INTO `project_info` VALUES ('518', '工业技术软件研究院项目', null, null, null, null, null, null, null, '1.企业背景：上海核工院：成立于1993年，是我国第一个从事核电工程的研究设计院，2007年6月整建制转入国家核电技术有限公司，是国家核电技术有限公司承担第三代核电技术的引进、消化吸收、研发转让、应用的主体单位。上海空基：成立于2016年7月，注册资本金500万元，专业从事于软件技术开发、技术咨询及服务。公司核心团队曾为高端制造业（航空、航发、航天、船舶、核能、汽车、化工等）提供了近百项专业技术服务。2.项目内容：项目拟建设工业技术软件研究院，将致力于自主可控的基础工业仿真软', '10000.00', '10000.00', '1000.00', null, null, null, null, null, null, null, null, null, null, null, '5月进入协议谈判阶段', '0', '1', null, null, null, null, '1.项目处于协议谈判阶段；2.2019年10月，区政府主要领导带队实地考察上海核工院，双方就合作内容及项目协议基本达成一致意见；3.2019年11月，企业集团董事长变更，所有对外投资暂停，目前企业正在就该项目进行重新论证，待论证通过后，启动落地事宜。4.2020年5月，企业重新启动项目论证，待对方近期向核工院董事长汇报后，确定下一步推进计划。', null, '1', '518', null, '1');
INSERT INTO `project_info` VALUES ('519', '杰发科技胎压芯片设计研发中心项目', null, null, null, null, null, null, null, '1.企业背景：杰发科技成立于2013年，总部位于合肥，并在深圳和上海设有分公司，公司致力于汽车电子信息系统解决方案的研究，是国内重要的车载电子芯片及解决方案的供应商，杰发科技于2017年被国内四维图新全资收购，成为其全资子公司。杰发科技成立后仅用两年时间，便实现国内后装车载芯片市场占有率约50-60%，而其竞争对手CSR市场占有率则约为20-30%，杰发科技是国内汽车电子芯片领域难得的稀缺资源。2.政策利好：2020年1月1日起，所有在产乘用车开始实施胎压监测系统（TPMS）强制安装要求，据此', '50000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, '5月进入协议谈判阶段', '0', '1', null, null, null, null, '1.项目处于调查研究阶段。2. 2020年4月中旬先进制造业组拜访杰发科技，双方交流了企业战略发展规划想法以及项目落地需求，待企业进行项目精准测算后，与企业商议落地方案细节。3. 4月下旬视频会议，我方介绍沙区政策及兜底条款，待对方高层内部商议后决定。', null, '1', '519', null, '1');
INSERT INTO `project_info` VALUES ('52', '重庆工业设计城项目', 'Z201905000763', '167', '研发平台', '制造业', '', null, '楼宇类项目', null, null, '0.00', null, null, null, null, null, null, '孙晓旭', '2020-05-19 15:06:23', null, null, null, null, '已完成工商注册，已完成施工图，正在进行施工图审查。', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('520', '东杰物联网信息系统项目', null, null, null, null, null, null, null, '1.企业背景：公司成立于2015年，注册资本金3000万元，其股东之一“太原东杰软件开发有限公司”（持股10%）是深交所A股上市公司“山西东杰智能物流装备股份有限公司”的一级子公司。公司致力于标准化、模块化的数字化工厂平台打造，旗下拥有智能物流全流程控制系统及硬件设备，可提供从原材料采购-加工-物流-销售-结算的供应链一体化软件集成定制开发服务。2.市场情况：主要客户群体包括中车、唯品会、万邦医药等中大型企业。', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '5月进入调查研究阶段', '0', '1', null, null, null, null, '1.项目处于初次对接阶段。2.4月赴深圳拜访企业推介园区，企业初步表达来渝发展意愿，目前正在完善项目计划书。', null, '1', '520', null, '1');
INSERT INTO `project_info` VALUES ('521', '华迈微流控化学发光即时诊断设备生产暨研发项目', null, null, null, null, null, null, null, '1.企业背景：华迈兴微成立于2014年，致力于体外诊断免疫快速检测平台（微流控化学发光免疫分析平台）的研发、生产与销售，在深圳南山科技园拥有近3000平米的研发基地，研发人员占比超过 35%；在坪山国家生物产业基地拥有2000多平米的万级GMP标准洁净厂房室和仪器试剂生产中心；产品覆盖了心血管、传染病及激素类的检验检测。2.技术优势：拥有81项专利技术，其中发明专利47项；9项二类医疗器械产品注册证。3.融资情况：前后完成5轮融资，最近一次为2019年6月5000万B轮融资。4.项目内容：拟借助重庆大学罗', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '5月进入调查研究阶段', '0', '1', null, null, null, null, '1.项目处于初次对接阶段；2.4月17日，先进制造业组赴深圳拜访华迈兴微，双方就合作模式、合作优势、市场前景等方面展开洽谈，企业与重庆大学罗阳教授有项目合作，有意愿到西南片区布局；3.4月21日，先进制造业组拜访重亲大学罗阳教授，拟借助罗阳教授与华迈兴微合作基础，引导企业将部分新产品的生产及研发落户我区；4.下一步待华迈兴微与罗阳就教授明确合作模式后，邀请企业来区考察。', null, '1', '521', null, '1');
INSERT INTO `project_info` VALUES ('522', '航天火箭电子民用产品生产项目', null, null, null, null, null, null, null, '1.企业背景：重庆航天火箭电子技术有限公司创建于1958年，隶属于中国航天科技集团有限公司第九研究院，是航天系统专业从事遥测遥控、卫星通信、电子医疗器械等设备和系统的研制生产基地。2.主要产品：特定电磁波治疗器、红外线治疗器、医用压缩式雾化器、GNSS多模导航设备、ZCQ-SDFP信号采集传输设备、WSL无人机数据链系统等。3.项目内容：企业位于九龙坡区留学生创业园，大约50亩，因产能扩张现有场地无法满足需求，计划将民用电子医疗器械和遥测遥控通信产品独立发展。', '50000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, '5月进入调查研究阶段', '0', '1', null, null, null, null, '1.项目处于初次洽谈阶段；2.企业正在高新区和沙区比选；3.与企业深入沟通项目落地模式，企业计划以航天九院为主体，或航天火箭电子公司员工混改的模式新设子公司，目前正在内部商议中。', null, '1', '522', null, '1');
INSERT INTO `project_info` VALUES ('523', '联东U谷·重庆青凤国际企业港项目', null, null, null, null, null, null, null, '1.企业背景：联东集团（LIANDO）成立于2003年6月，专业从事产业园区平台建设运营，拥有强大的客户资源整合和园区运营管理能力。2.技术实力：联东U谷连续8年获得国务院发展研究中心企业研究所、中国指数研究院联合发布的“中国产业园区十强企业排行榜”和“中国产业园区品牌价值排行榜”榜首 。3.项目内容：拟在沙坪坝区青凤园区购地建设“联东U谷·重庆青凤国际企业港“项目。', '200000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, '', '0', '1', null, null, null, null, '1.项目处于调查阶段；2.项目用地选址暂未协商一致。', null, '1', '523', null, '1');
INSERT INTO `project_info` VALUES ('524', '智安信工业设计项目', null, null, null, null, null, null, null, '1.企业背景：智安信主营汽车及零部件的研发设计，包括造型、总布置、电器、底盘等，提供从方案预研、造型设计、工程设计、CAE分析、模型制作、快件加工、样车试制和试验，一直到批量生产前的技术服务。2.市场情况：合作车企包括北汽、广汽、江铃、吉利、庆铃、长城等，业务涵盖造型设计、整车集成、工程开发、CAE分析等汽车设计全流程服务。3.项目内容：拟建设集办公、研发、样机制造、销售结算于一体的公司总部。', '20000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, '5月进入调查研究阶段', '0', '1', null, null, null, null, '1.项目处于初次对接阶段。2.4月实地拜访企业，企业初步表达来区发展意愿，目前正在完善项目计划书。3.疫情因素，企业现金流受到影响，正在筹集资金。资金充裕后，希望以购买现有标准厂房的形式落地。', null, '1', '524', null, '1');
INSERT INTO `project_info` VALUES ('525', '浙江世纪康大IVD研发、生产项目', null, null, null, null, null, null, null, '1.企业背景：浙江世纪康大医疗科技股份有限公司创立于1996年，位于国家级萧山经济技术开发区，先后评为“国家级高新技术企业”、“杭州市战略性新兴产业培育企业”、“杭州市高新技术研发中心”、“萧山区工业新兴产业重点培育企业”、“萧山区创新示范企业”、“萧山区纳税五百强企业”，2015年10月，在全国中小企业股份转让系统挂牌。2.技术优势：该公司产品涵盖分子、生化、免疫、微生物、血凝、血球、粪便分析及免疫组化等系列，已获批68项专利，其中包含发明专利32项。', null, '5000.00', '500.00', null, null, null, null, null, null, null, null, null, null, null, '5月进入调查研究', '0', '1', null, null, null, null, '1.项目由我方主动拜访市经信委医药处时获取，处于初次对接阶段；2.该企业已经自行考察巴南区、大渡口区、两江新区等区域，大渡口区已起草合作协议，提出扶持政策，争取项目落户；3.我方已结合区域位置及市区两级现有政策等，向企业初步介绍沙区综合情况；4.拟下周赴浙江实地考察，洽谈项目合作事宜。', null, '1', '525', null, '1');
INSERT INTO `project_info` VALUES ('526', '大汉三通区域总部项目', null, null, null, null, null, null, null, '1.该公司是一家短消息服务提供商，并为基础电信运营上和各行各业客户提供移动增值业务平台技术和应用解决方案，是国家工信部批准的跨地区电信增值业务经营许可商。2013年在新三板挂牌上市，2016年6月新三板首次分层，首批入选创新层企业，另成功入选中国战略新兴产业指数、新三板做市指数、新三板成指；2.已获得2轮融资，2017年该公司营业总收入16.04亿元。', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '5月进入调查研究', '0', '1', null, null, null, null, '1.该项目为上海鼎晶生物公司推荐，系以商招商项目；2.项目处于初次对接阶段，已电话联系，拟下周拜访。', null, '1', '526', null, '1');
INSERT INTO `project_info` VALUES ('527', '韦翰斯遗传检测项目', null, null, null, null, null, null, null, '该公司是一家专注于基因检测技术在遗传病方向应用的国家高新技术企业，同时拥有遗传检测第三方独立医学检验实验室，已获得2轮融资，软著22项、专利5项。', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '5月进入调查研究', '0', '1', null, null, null, null, '1.该项目为上海鼎晶生物公司推荐，系以商招商项目；2.项目处于初次对接阶段，已电话联系，拟下周拜访。', null, '1', '527', null, '1');
INSERT INTO `project_info` VALUES ('528', '镁合金高压连接器、高压线束总部及研发生产项目', null, null, null, null, null, null, null, '1.企业背景：2014年12月9日成立于湖南株洲国家高新区，注册资本金1500万元，致力于为国内外知名汽车制造厂家提供“安全、可靠、高效” 的电连接解决方案，主要产品是镁合金高压连接器、高压线束；2.企业荣誉：国家高新技术企业、国家科技型中小企业、湖南省两化融合认证试点企业、湖南省中小企上云标杆企业、两创建示范企业、IATF16949：2016版认证企业等；3.技术实力：于2018年在湖南株洲全面打造国内首个电连接产品智造基地，并已取得20余项国家专利授权；4.市场情况：为资阳中车、中航光电、江铃新能', '20000.00', '20000.00', '1000.00', null, null, null, null, null, null, null, null, null, null, null, '5月进入协议谈判阶段', '0', '1', null, null, null, null, '1.项目为小康供应商峰会对接企业，处于调查研究阶段；2.五一节前，企业负责人到青凤园实地考察，对小康核心供应商地块较为满意，目前正在完善项目计划书内容；3.拟近期实地考察企业，并就项目合作进行洽谈。', null, '1', '528', null, '1');
INSERT INTO `project_info` VALUES ('529', '智行者无人驾驶车辆研发中心项目', null, null, null, null, null, null, null, '1.企业背景：智行者成立于2015年，是一家深耕于无人驾驶汽车领域，为国内提供无人驾驶系统解决方案的高新技术企业，拥有多项具有自主知识产权的核心技术；2.主要产品：智行者已经凭借自主研发的无人驾驶大脑，相继开发了智能环卫、智慧物流、智能安防等领域场景的应用服务的低速无人驾驶车辆；3.团队结构：目前智行者团队260人，研发人员占比高达80%，985、211高校人员占比70%，硕士以上学历占比近8成。4.项目内容：拟在沙区建设西南区域总部，研发、销售结算中心。', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '5月进入调查研究阶段', '0', '1', null, null, null, null, '1. 项目处于初次对接阶段；2. 下一步待邀请对方来沙区实地考察项目选址，进一步明确项目内容及对方核心诉求。', null, '1', '529', null, '1');
INSERT INTO `project_info` VALUES ('53', '重庆工业质量技术产业化制造基地暨研究院项目', 'Z201905000764', '167', '研发机构', '制造业', '智博会', null, '楼宇类项目', null, '1500.00', '11500.00', null, null, null, null, null, null, '孙晓旭', '2020-05-21 14:54:23', null, null, null, null, '签订正式协议', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('530', '成渝高校协同创新基地项目', null, null, null, null, null, null, null, '1.企业背景：四川互联同创旗下掌灯科技集团成立于2018年，是一家以科技成果转化和产业化应用为主业的科技服务企业，依托四川省互联网协会、电子科技大学、广东中科科创，深耕校、院、企科技成果转化，参与环电子科大知识经济圈、环理工大学知识经济圈建设与运营工作，以人才+产业+资本“保姆式“服务，帮助其服务的团队完成从0到1的发展，近两年创造综合经济价值过亿元，成功挖掘、培育和转化科技成果13项，估值超过10亿元。2.项目内容：掌灯科技拟集中成都、昆明等地资源，在沙坪坝区成立掌灯集团总部', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '6月进入上会审查', '0', '1', null, null, null, null, '1. 项目处于初次对接阶段；2.区科技局与四川互联同创达成项目合作意向，初步确定项目选址铁路口岸创新中心，积极推动首批入驻企业来渝考察，筹划技术交易服务大厅、成渝人才服务平台建设（企业自筹500万元建设经费）', null, '1', '530', null, '1');
INSERT INTO `project_info` VALUES ('531', '西部民用航空技术应用研究院项目', null, null, null, null, null, null, null, '1.企业背景：企业自2009年成立以来，一直深耕计算机信息系统和无人机应用领域，获得了多个行业准入牌照和认证，并取得了包括多项发明专利在内的80余项知识产权。在行业内率先将无人机应用同高性能科学计算、大数据、地理信息系统（GIS）、建筑信息模型（BIM）跨界融合，成都市瞪羚企业、成都市准独角兽企业、国家高新技术企业。2.项目内容：依托携恩科技，导入电子科大、天府智能研究院等相关科研资源，建设时空大数据智能飞行服务平台、无人机巡检数据管理平台、无人机与低空数据管理平台、无人机应', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '5月进入协议谈判阶段', '0', '1', null, null, null, null, '1. 项目处于调查研究阶段；2. 成都携恩科技公司已与重庆建筑科技学院达成校企合作意向，落实3000平方米教学场地和室外飞行训练场地，拟定合作协议框架，待双方审定签署。3.已与携恩科技初步达成研究院建设800平方米场地选址及场地装修意向。', null, '1', '531', null, '1');
INSERT INTO `project_info` VALUES ('532', '重庆（华西）新型分析测试研究院项目', null, null, null, null, null, null, null, '1.企业背景：四川大学华西医学中心公共卫生学院是国内最著名的公共卫生学院之一,学院有公共卫生与预防医学博士后流动站、7个博士点、12个硕士点、川大华西第四医院，集教学、科研、医疗、预防、保健、干部培训和高科技开发为一体。2.项目内容：项目拟依托川大华西医学中心公共卫生学院分析测试中心在食品/保健食品、消毒产品、农药、化肥、化学品、化妆品毒理鉴定、生活饮水检测等领域研发、检测、评价能力，建立产学研用协同创新平台，组建研究院及研究院有限公司，开展研发创新、技术成果转化、检测', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '5月进入调查研究阶段', '0', '1', null, null, null, null, '1.项目处于初次对接阶段；2.与高校达成初步共建项目意向，联系重庆大学医学部、重庆医高专；协助梳理了市场情况；3.与融资租赁、银行等金融机构沟通，帮助解决项目资金需求。', null, '1', '532', null, '1');
INSERT INTO `project_info` VALUES ('533', '知识产权应用和成果转化示范基地', null, null, null, null, null, null, null, '1.企业背景：成都弘毅天承知识产权代理有限公司拥有先进的软件、合理的分工、健全的管理机制和高素质的人才队伍，以专业高效的服务保障客户的知识产权权益，在业界树立了良好的品牌形象，逐步成长为在全省排名前三的综合知识产权服务机构，并与各级知识产权和科技行政管理机关建立了良好的工作关系。公司立足于成都，覆盖全省，逐步建立面向全国的广泛服务网络。2.项目内容：知识产权应用和成果转化示范基地。', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '5月进入调查研究阶段', '0', '1', null, null, null, null, '1. 项目处于初次对接阶段；2. 4月2日，双方在成都面谈，沟通介绍了各自的情况，争取展开合作的意愿；3. 提出了建设知识产权登记、交易平台，知识产权成果转化示范基地等项目，待对方来沙区考察、洽谈后进一步推进。', null, '1', '533', null, '1');
INSERT INTO `project_info` VALUES ('534', '成都焊研科技智能制造项目', null, null, null, null, null, null, null, '1.企业背景：焊研科技系国营成都电焊机研究所改制而来，主要聚焦非标件焊接设备、自动化产线的研发、设计和制造。企业占地26000平方米，职工约300人，公司产品包括智造机器人、标准自动化焊接设备、阻焊设备、弧焊电源等，广泛应用于汽车、能源设备、航空航天、核工业、军工等数十个行业，年产值约2亿元。2.项目内容：焊研科技有意将其近年来重点研发的智能制造系统项目搬迁至制造业较为发达的城市，设立智能制造研究院总部，拟选择区域为江苏或者重庆，投资方式、投资金额、运营模式等尚待进一步对', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '5月进入调查研究阶段', '0', '1', null, null, null, null, '1.项目处于初次对接阶段；2.4月24日，先进制造业组赴成都首次对接，双方就合作意愿、合作优势、市场前景等方面展开洽谈，下一步拟适时邀请企业来沙区实地考察。', null, '1', '534', null, '1');
INSERT INTO `project_info` VALUES ('535', '国通花卉贸易产业园项目', null, null, null, null, null, null, null, '国通集团创立于 2004年,是以产业园区投资开发、运营管理为主的大型综合性企业集团，广州省现代产业500强，现代服务业500强。主营业务：保税物流中心、钢铁专业市场、花卉专业市场、超低温冷链等板块。拟于中梁镇斐然湖片区打造西南花卉贸易产业园项目。', '5000.00', '400.00', null, null, null, null, null, null, null, null, null, null, null, null, '2020年6月签约', '0', '1', null, null, null, null, '双方已就项目方案初步沟通，根据企业资源优势结合重庆地理特征寻求共同合作点，落地高端花卉展示中心、繁育中心，后期双方联合招商，带动中梁镇景观升级，计划于5月25日赴国通总部洽谈协议内容。', null, '1', '535', null, '1');
INSERT INTO `project_info` VALUES ('536', 'super晚 文创夜市', null, null, null, null, null, null, null, '以夜间经营为核心特色，作为移动商业应用孵化示范点，文创夜市以新能源动能店车为载体，集中打造可移动的商业形态模式，规范店车经营标准，为移动商业经营做好示范作用，项目定位于综合型的都市旅游集市，将融合线上线下创新消费体验，将打造互联网+消费生态系统，实现智慧商店、智慧市集的新业态场景。', '5000.00', '300.00', '100.00', null, null, null, null, null, null, null, null, null, null, null, '2020年5月签约', '0', '1', null, null, null, null, '已于企业沟通合同条款，正在走合同流程。', null, '1', '536', null, '1');
INSERT INTO `project_info` VALUES ('537', '室内飞行项目', null, null, null, null, null, null, null, 'Flownation是目前世界上知名室内飞行体验项目品牌商，在日本、韩国、俄罗斯、德国推出了4个体验项目基地，另在欧洲及东南亚有7个项目正在建设。企业风洞技术拥有成熟的工程设计，价格实惠（平均每小时约391元收入），项目可以广泛运用在娱乐体验、体育培训、军事训练等板块，此项先进技术也可进入多种场所：物中心、城市中心和娱乐场所，预计重庆市场潜在总收入超过3000万元。投资方拟在沙区寻求约1000平方米空间落地项目，导入室内飞行体验、培训等业态，形成名片效应，后续根据市场需要落地项目设备', '10000.00', '1200.00', '200.00', null, null, null, null, null, null, null, null, null, null, null, '2020年6月签约', '0', '1', null, null, null, null, '企业初步意向选址于融创茂文旅城，目前融创茂已完成选址评估。投资方正在完善项目方案，拟邀请投资方于疫情好转后，再次与融创茂沟通，结合双方需求深化、落实项目设计方案，推动项目落地。', null, '1', '537', null, '1');
INSERT INTO `project_info` VALUES ('538', '华人梦中心项目', null, null, null, null, null, null, null, '企业主要从事文化娱乐项目投资开发、文旅地产及体育赛事开发管理运营等业务。企业拟于井双片区打造包含创意坊、演艺中心、星光坊等业态的梦中心项目；同时计划于国际物流园片区选址打造曼城训练俱乐部中心项目；于中梁山选址打造Discovery主题乐园。', '300000.00', '25000.00', '3000.00', null, null, null, null, null, null, null, null, null, null, null, '2020年10月签约', '0', '1', null, null, null, null, '企业实地赴沙区踏勘，计划于5月27日赴华人文化集团总部洽谈', null, '1', '538', null, '1');
INSERT INTO `project_info` VALUES ('539', '教育综合体项目', null, null, null, null, null, null, null, '企业于2013年成立，全国直营幼儿园多达230余家。企业在幼教规模上排名全国第一，旗下品牌为春天里国际幼儿园。企业主要从事早教托育、艺术培训、职业培训等教育综合体打造，现企业拟在沙区落户华赋西南总部，同时结合沙区教育资源打造艺术培训综合体，为四川美术学院定向培养艺术类人才。', '50000.00', '6000.00', '600.00', null, null, null, null, null, null, null, null, null, null, null, '2020年7月签约', '0', '1', null, null, null, null, '我方已推荐清华芯动、融汇物业等项目，并组织企业与权属方进行商务洽谈，待双方敲定商务条款后签订招商协议。', null, '1', '539', null, '1');
INSERT INTO `project_info` VALUES ('54', '硅光子芯片项目', 'Z201905000765', '167', '集成电路', '制造业', '', null, '楼宇类项目', null, null, '0.00', null, null, null, null, null, null, '孙晓旭', '2020-05-25 14:12:34', null, null, null, null, '无', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('540', '西政旧改项目', null, null, null, null, null, null, null, '鲁能集团是国家电网公司全资子公司，核心业务聚焦地产、能源两大板块。该项目拟将西政老校区80亩教育+体育用地进行5.3万方空间的旧改开发，利用校方产学研优势，招商引入鲁能产业资源，打造西部法务培训中心，同时优化沙磁景区配套功能。', '86000.00', '20000.00', '3500.00', null, null, null, null, null, null, null, null, null, null, null, '2020年三季度签约', '0', '1', null, null, null, null, '我方协助校方及企业与规划部门初步落实了地块相关信息和指标，校方已与5月9日与区规划局沟通将30亩体育用地调整为科研教育用地事宜，目前鲁能正在完善项目方案，根据调规情况细化项目测算工作，初步达成签订三方协议的共识。', null, '1', '540', null, '1');
INSERT INTO `project_info` VALUES ('541', '英诺创新空间', null, null, null, null, null, null, null, '企业主要从事创业综合体策划与运营，致力于成为中国新一代创新创业服务、产业升级和城市更新的颠覆式创新领航者。通过“基金投资+产业加速”的方式，成功帮助多家企业IPO。项目拟打造集科创文创生产、科教企业创新孵化、时尚创意产业、配套创新创业基金等生态智慧型综合创业社区。', '220000.00', '30000.00', '5000.00', null, null, null, null, null, null, null, null, null, null, null, '2020年三季度签约', '0', '1', null, null, null, null, '目前赖家桥合作项目暂缓，已推荐物流园创新中心为备选址；重师项目由区政府办牵头区科技局、区教委、渝碚路街道、文旅组等部门联合与重师协商合作条件，目前正梳理校地合作方案；已于5月11日与重师及投资方沟通老校区价格相关事宜，已达成初步共识，租金价格48元/㎡/月，促成双方尽快达成合作。', null, '1', '541', null, '1');
INSERT INTO `project_info` VALUES ('542', '国际产品线上体验推广基地', null, null, null, null, null, null, null, '企业主要从事淘宝美食直播、线上带货营销业务。拟依托淘宝直播线上资源，选址国际物流口岸，结合一带一路战略，联合国际主播资源，打造包含国内外产品交互体验、营销推广、线上带货、文化交流等内容的国际产品线上体验推广基地项目。', '15000.00', '10000.00', '2000.00', null, null, null, null, null, null, null, null, null, null, null, '2020年三季度签约', '0', '1', null, null, null, null, '我方已于4月10日实地考察企业直播基地，并就其运营模式、发展诉求进行会谈沟通。推荐企业结合国际物流口岸优势打造国际产品线上体验推广基地项目。企业计划于本月内完成项目策划方案，双方将根据策划方案进一步推动项目落地。', null, '1', '542', null, '1');
INSERT INTO `project_info` VALUES ('543', '稻香渔歌农旅项目', null, null, null, null, null, null, null, '朗基产业集团秉承“朗照万家基业长青”的愿景，坚持“人文关怀、诚信自律、阳光进取、务实创新、和谐共生”的精神，聚焦“生态+健康”，将自身定位为“健康生活运营服务商”，以田园产业为核心，“健康产业+”、“康养产业+”为两翼，做实健康业务和田园业务。拟于中梁镇斐然湖片区打造乡村振兴示范带项目。', '50000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, '2020年三季度签约', '0', '1', null, null, null, null, '我方已与4月27日邀请企业团队赴中梁镇斐然湖核心区考察，并与5月12日赴企业大邑项目实地踏勘，企业计划结合中梁镇自然风貌，打造重庆市中心农旅项目目的地。', null, '1', '543', null, '1');
INSERT INTO `project_info` VALUES ('544', '中国电建市政集团西南总部项目', null, null, null, null, null, null, null, '该项目由中国电建市政建设集团在我区设立西南总公司，以子公司架构在我区独立核算和纳税，负责中国电建市政建设集团在重庆及周边省市的市场业务。', '600000.00', '600000.00', '36000.00', null, null, null, null, null, null, null, null, null, null, null, '', '0', '1', null, null, null, null, '中国电建市政集团高层拟于本周五到沙区拜访，同时企业代表也在积极对接我区施工项目。', null, '1', '544', null, '1');
INSERT INTO `project_info` VALUES ('545', '云顺科技总部项目', null, null, null, null, null, null, null, '山东齐鲁云商数字科技股份有限公司旗下云顺科技拟在重庆市沙坪坝区打造百亿级物流产业基地，借助强大实力股东资源，从网络货运结算环节入手，通过物联网科技手段，提供网络货运、仓储物流、车后生态、供应链金融和数字技术等一体化服务，为供应链上的各个角色成员企业的信息化赋能。', '50000.00', '1000000.00', '100000.00', null, null, null, null, null, null, null, null, null, null, null, '', '0', '1', null, null, null, null, '正在就项目落地政策扶持与企业磋商中，我方拟邀请客方到沙区考察。', null, '1', '545', null, '1');
INSERT INTO `project_info` VALUES ('546', '国泰君安合作项目', null, null, null, null, null, null, null, '国泰君安重庆分公司是重庆市业务规模第二的全牌照证券机构。拟与我区合作：1.设立国泰君安沙坪坝营业部；2.拟投入资金提高沙区社会融资规模中直接融资的比例，着力推动沙坪坝区企业发债融资、上市融资、并购重组等资本市场领域的发展。', '100000.00', '100000.00', '1000.00', null, null, null, null, null, null, null, null, null, null, null, '', '0', '1', null, null, null, null, '已完成选址，准备装修，等待总公司的开业批复，双方正协商推进落户协议的签订。', null, '1', '546', null, '1');
INSERT INTO `project_info` VALUES ('547', '广发银行沙坪坝支行', null, null, null, null, null, null, null, '广发银行重庆分行拟在沙坪坝区设立广发银行沙坪坝支行。', '800000.00', '200000.00', '2000.00', null, null, null, null, null, null, null, null, null, null, null, '', '0', '1', null, null, null, null, '正在完善协议签章事宜', null, '1', '547', null, '1');
INSERT INTO `project_info` VALUES ('548', '渤海银行', null, null, null, null, null, null, null, '渤海银行拟入驻沙区设立沙坪坝支行。', '200000.00', '100000.00', null, null, null, null, null, null, null, null, null, null, null, null, '', '0', '1', null, null, null, null, '企业正在我区进行实地考察，我方协助企业寻找适合的营业场所，双方共同推进落地协议的洽谈。', null, '1', '548', null, '1');
INSERT INTO `project_info` VALUES ('549', '中创多模态医学影像虚拟手术研发中心项目', null, null, null, null, null, null, null, '成都中创五联科技有限公司于2017年始创于四川成都，是一家致力于引领中国数字化医学发展的研发型高新技术企业，拥有顶级的离线渲染和实时渲染图像处理技术、 三维重建技术、VR技术等，完美打造出超高质量、超高视觉效果、易使用、易交互的医学级数字化产品，针对医学教育、临床应用、大众科普与健康等领域开启全新的应用与交互模式，并通过医学大数据与云信息平台相配合，实现全国性的医学医疗资源共享、信息沟通与实时互动。公司有意向在沙坪坝区落户销售总部、研发中心。', '15000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, '', '0', '1', null, null, null, null, '企业前期通过对我区的医疗资源和招商环境的考察，表示很有信心在我区落户和发展。我组针对企业的项目计划书已经做出了相关效益测算和项目报告，拟近期到企业参观考察进一步推进项目落户协议的商谈。', null, '1', '549', null, '1');
INSERT INTO `project_info` VALUES ('55', '中关村集成电路设计产业园', 'Z201905000767', '167', '集成电路', '制造业', '', null, '楼宇类项目', null, null, '300000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:50:34', null, null, null, null, '已签订正式协议。', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('550', '科通芯片产业园', null, null, null, null, null, null, null, '项目拟设立：1.芯片研究院及实验室：主要职能是引入国外IP和实现IP本土化转化。2．产业城投资运营公司：主要职能是负责产业城（园区）内建设、投资、运营，引入的芯片研发设计企业提供技术、市场和资本服务，以及园区的日常管理工作。3．科通西南地区总部：主要职能是作为IC产业相关软硬件销售的主体以及科通旗下区域性的销售结算中心。4．规模10亿元的产业投资基金。5．职业培训学校。', '450000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, '', '0', '1', null, null, null, null, '目前正在就企业投资额度与我区扶持政策、资金支持进行测算，拟疫情稳定后再次到深圳与企业洽谈。', null, '1', '550', null, '1');
INSERT INTO `project_info` VALUES ('551', '国投丰基能源科技有限公司项目', null, null, null, null, null, null, null, '设立重庆国投丰基能源科技有限公司，打造集煤炭销售、大宗贸易物流、供应链金融以及结算的平台总部。', '30000.00', null, '6000.00', null, null, null, null, null, null, null, null, null, null, null, '', '0', '1', null, null, null, null, '双方就落户协议中的投资额、税收奖励、办公场地租金扶持等事项正在进行磋商。', null, '1', '551', null, '1');
INSERT INTO `project_info` VALUES ('552', '赛旺检验检测认证西南总公司', null, null, null, null, null, null, null, '赛旺检验检测认证有限公司按照国家倡导构建绿色、环保节约型社会的目标要求，为西南地区生产企业的节能减排、绿色制造提供技术支持，是综合性、多功能性的实验室，是第三方的产品检验检测认证一站式服务机构。拟到沙区扩展食品、药品、环境、建筑材料检测综合检测中心和实验室，并建立快速认证中心。', '7000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, '', '0', '1', null, null, null, null, '针对对方提供商业计划书我方已经进行了经济效益测算并形成项目报告书，双方已对项目细节进行了初步洽谈。', null, '1', '552', null, '1');
INSERT INTO `project_info` VALUES ('553', '笛斯文旅总部项目', null, null, null, null, null, null, null, '重庆笛斯文化传播有限公司于1997年成立，主要经营范围包括 发行制作、电视剧、动画片、综艺等广播电视节目。企业拟与北京星光国际集团共同在我区投资开发机甲产业园项目，打造机甲、影视制作、特色文旅产业集群。', '458200.00', '550000.00', '58600.00', null, null, null, null, null, null, null, null, null, null, null, '', '0', '1', null, null, null, null, '正在与企业测算项目收益，磋商落户协议。', null, '1', '553', null, '1');
INSERT INTO `project_info` VALUES ('554', '传化金融项目', null, null, null, null, null, null, null, '企业是传化智联旗下专业从事供应链普惠金融的战略平台。该项目拟在我区设立：1.传化互联网小贷公司，开展线上平台化授信业务，为中小企业提供定制化的普惠金融服务。2.传化金融服务公司，为客户提供全方位“一揽子”金融服务，为供应链普惠金融的战略平提供实体支撑。', '100000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, '', '0', '1', null, null, null, null, '已向市金融监管局汇报，加快传化互联网小贷的设立进程；保持与企业金融事业部门的对接，了解集团在金融板块的战略计划。', null, '1', '554', null, '1');
INSERT INTO `project_info` VALUES ('555', '盈盈互联网小贷项目', null, null, null, null, null, null, null, '企业拟成立重庆盈火网络小额贷款有限公司，在全国范围内开展办理各项小额贷款、小企业发展、管理、财务等咨询及其他经批准的业务。', '100000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, '', '0', '1', null, null, null, null, '1.企业拜访沙区，就小贷设立申请、可行性研究等细节进行座谈；2.，金融组拜访盈盈集团，邀请企业将盈火科技公司搬迁到沙区以及设立盈火互联网小贷公司。', null, '1', '555', null, '1');
INSERT INTO `project_info` VALUES ('556', '阔尔登文化西部总部项目', null, null, null, null, null, null, null, '广西阔尔登文化传媒公司拟在我区设立阔尔登文化西部总部，同时与四川美术学院一道在我区设立中国（西部）动漫研究院。', '5000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, '', '0', '1', null, null, null, null, '双方就去年年底达成的今年到重庆与川美合作意向再次沟通，公司回复其到渝投资的可行性分析报告已经完成并已报送集团总公司，但因疫情导致公司电影项目暂停，集团总公司预计要在下半年再考虑到重庆来进一步洽谈合作项目。', null, '1', '556', null, '1');
INSERT INTO `project_info` VALUES ('557', '二当家互联网保险经纪公司项目', null, null, null, null, null, null, null, '企业是携程集团的参股公司，拟在我区设立互联网保险代理公司和全国呼叫中心，开展全国互联网保险代理业务。', '5000.00', null, null, null, null, null, null, null, null, null, null, null, null, null, '', '0', '1', null, null, null, null, '重庆银保监局已受理该企业的设立申请。', null, '1', '557', null, '1');
INSERT INTO `project_info` VALUES ('558', '国通（重庆）智慧产业园', null, null, null, null, null, null, null, '国通集团创立于 2004年,是以产业园区投资开发、运营管理为主的大型综合性企业集团，广州省现代产业500强，现代服务业500强。主营业务：保税物流中心、钢铁专业市场、花卉专业市场、超低温冷链等板块。本项目拟打造以精品肉类、进口鲜活海鲜、特色农产品为主的食品全产业链条。布局全球直供、冷链物流中心、食品检测中心、中央厨房、国际贸易中心功能。', '70000.00', '100000.00', '4000.00', null, null, null, null, null, null, null, null, null, null, null, '5月确定协议', '0', '1', null, null, null, null, '1. 2019年12月底，市口岸物流办携广州国通控股集团到访园区，2020年1月18日，市口岸物流办带队商贸物流组赴广东实地考察，双方达成合作意向。2商贸物流组就冷链产业园项目合作协议已拟定协议初稿，与企业开展协议正式商议，目前在项目经济指标、违约罚则方面还未达成一致意见，力争5月完成协议洽谈。企业已启动项目公司注册工作和地勘工作。4. 苗木基地项目由文旅投和中梁山镇与企业进行洽谈。5月25日商务委拟带队文旅组赴国通对接洽谈。', null, '1', '558', null, '1');
INSERT INTO `project_info` VALUES ('559', '大白鲸国际文旅度假城', null, null, null, null, null, null, null, '大连圣亚旅游控股股份有限公司是国内海洋主题乐园首家上市公司。企业已推出“大白鲸计划”全文化产业链文旅项目，拟打造成中国的“蓝色迪士尼”。已建成投运项目2个，位于大连和哈尔滨；托管运营项目2个，位于芜湖和淮安；在建第五代海洋公园3个，位于镇江、昆明和三亚。大连圣亚拟联合知名开发企业投资50亿元（其中乐园部分50亿元），选址国际枢纽园区Ag标准分区，联合大白鲸IP、阿那亚品质度假生活IP、人民网体育、凤仪文化传媒影视，打造含“极地探索世界”、“海洋探索世界”、“鲸海港湾（海洋主题文创生', '500000.00', '100000.00', '10000.00', null, null, null, null, null, null, null, null, null, null, null, '5月确定协议', '0', '1', null, null, null, null, '1. 3月17日，会同区规资局就项目方案中用地范围、征地拆迁、对土地利用规划和道路规划进行调整，我方同步推进调规工作。2，加快推动项目洽谈，双方就协议条款基本达成一致意见，已征求司法局意见，待企业确定关于权利义务转让的条款后，拟5月报区政府审议。3. 就合作开发单位，圣亚已与绿城达成初步合作意向，计划在本协议签订后再与绿城签订正式合作协议。4. 园区已进行规划调整研究工作（含Ag分区控规)，同时推动湿地公园及AG分区征地批文、城轨土规调整、管线迁改、林地使用批复等具体事宜。', null, '1', '559', null, '1');
INSERT INTO `project_info` VALUES ('56', '九方皋基金项目', 'Z201905000768', '167', '新兴金融服务业', '金融业', '智博会', null, '楼宇类项目', null, null, '0.00', null, null, null, null, null, null, '孙晓旭', '2019-11-26 11:29:45', null, null, null, null, '完成注册', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('560', '绿地“一带一路”国际贸易港项目', null, null, null, null, null, null, null, '绿地全球商品贸易港集团是世界企业500强绿地集团旗下的核心成员企业，总部位于上海。围绕进口全产业链布局，重点开拓国际贸易、终端零售、商业运营、商贸物流领域。其在国内打造的绿地全球商品贸易港是放大进博会溢出效应的重大平台。其中，上海贸易港示范项目位于虹桥，紧邻国家会展中心，总面积11万平方米，于2018年开业。已有53个国家和地区的137家企业入驻，国家进口馆32个，商品5万余件，累计交易超过50亿元。并建有上海首个保税展示展销场所，亚洲最大现货裸钻直销中心。本项目定位为西南地区', '500000.00', '200000.00', '10000.00', null, null, null, null, null, null, null, null, null, null, null, '推动5月启动协议洽谈', '0', '1', null, null, null, null, '1.2020年5月6日双方高层再次进行会谈，具体内容如下：1)拟选址园区中央商务区X26-01、X27-01地块，合计约319.35亩商业商务用地，建设面积约35万方将建设绿地·重庆全球商品贸易港项目，包含办公、商业、进口商品展示展销、酒店等功能。其中，核心片区中约5万方。2）将X26-01（144亩 纯商业）地块、配套AH片区约314亩商住用地纳入一期用地范围。2.根据园区土地出让计划安排，项目一期用地拟两次出让，双方拟开展招商协议及勾地协议洽谈。3.计划近期邀请区领导赴上海考察绿地跨境贸易港项目。', null, '1', '560', null, '1');
INSERT INTO `project_info` VALUES ('561', '卓尔智联西南总部项目', null, null, null, null, null, null, null, '卓尔智联集团是国内500强企业（排名166位），主要从事商贸、金融、物流等现代商贸服务业。企业拟与沙区就“一带一路”国际商品交易中心、长江青年城、特钢厂文旅3个项目进行合作洽谈。一是分步建设“一带一路”商品交易中心。二是建设重庆长江青年城。项目参照武汉模式，为拥有重庆户籍并在重庆创业、就业、无自有住房的大学生，提供低于市场价且涵盖住宅、公寓、众创空间、孵化基地、共享服务和教育医疗配套等综合功能的大型青年居住梦想社区。三是导入卓尔集团旗下产城开发资源，对沙坪坝区特钢厂项目', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '6月推动协议洽谈', '0', '1', null, null, null, null, '一、就“一带一路”商品交易中心的建设内容及建设步骤深入沟通。具体如下：1. 落地现货交易平台及卓尔云仓交割库。推荐卓尔云仓合作模式及选址。2. 落地金融总部。一是落地众邦银行分行/支行；二是申请互联网小贷及资产管理金融牌照；三是引入卓尔金服。推荐金融总部选址。3.落地期货交易所。卓尔集团和园区共同推动新加坡交易所、中新示范管理局参与，针对监管部门重点关注事项进行调研并提交可行性调研报告，明确推进品类、交易所申报程序、申报材料，最后编制项目可研报告。', null, '1', '561', null, '1');
INSERT INTO `project_info` VALUES ('562', '易租通智慧物流总部项目', null, null, null, null, null, null, null, '项目入驻园区，依托其西南最大的新能源物流运营企业优势和重庆本土网约车品牌“招招出行”平台资源，采用“互联网+新能源+物流”新模式，聚合打造货运版的“滴滴打车”。分阶段将旗下现有成熟的汽车租售业务、“招招出行”网约车业务以及“易狗出行”物流城配业务迁移至乙方在园区新注册的公司名下，构建集交易结算中心、呼叫调度中心、车辆数据中心、网上交易支付系统为一体的综合运营平台和总部基地。', '58000.00', '35000.00', '300.00', null, null, null, null, null, null, null, null, null, null, null, '5月确定协议', '0', '1', null, null, null, null, '1.双方就协议条款基本达成一致意见，拟近期上报审议。2. 同步启动新公司注册事宜，协助对方办理企业注册及办公室选址。', null, '1', '562', null, '1');
INSERT INTO `project_info` VALUES ('563', '中商汇通·进出口供应链服务平台项目', null, null, null, null, null, null, null, '中商汇通(浙江)进出口有限公司是中国商贸国际有限公司为拓展中国内地市场设立的全资子公司，总部位于香港中环，面向中国内地及港澳地区，从事进口食品的销售渠道建设和品牌推广，打造供应链的全产业链条，目前经销网络已覆盖全国及港澳地区三十多个省市。拟依托重庆铁路口岸和保税物流中心功能及四条国际贸易通道优势，利用其成熟的业务模式和总部资源，立足重庆，拓展中国内陆西部地区业务，针对食品加工厂、烘焙企业、餐饮企业及商超等销售对象和渠道客户，打造货物集采、供应链金融、保税仓储、冷', '51100.00', null, '800.00', null, null, null, null, null, null, null, null, null, null, null, '5月确定协议', '0', '1', null, null, null, null, '1. 双方就协议条款基本达成一致意见，拟近期上报审议。2. 已同步启动新公司注册事宜，协助对方办理企业注册及办公室选址。', null, '1', '563', null, '1');
INSERT INTO `project_info` VALUES ('564', '泷耀盈通全国总部项目', null, null, null, null, null, null, null, '重庆泷耀盈通供应链管理有限公司成立于2017年3月，主要开展汽车贸易、汽车金融，是全国性汽车贸易企业。已与多家代理商和零售商建立长期合作关系，围绕汽车贸易展开集销售、维修、金融等为一体的汽车全产业链增值服务。 依托铁路口岸汽车产业链、供应链金融服务等资源，开展汽车销售、汽车租赁、综合物流业务，打造集运营中心、销售结算中心为一体的泷耀盈通全国总部。', '20000.00', '50000.00', '300.00', null, null, null, null, null, null, null, null, null, null, null, '5月确定协议', '0', '1', null, null, null, null, '双方就协议条款基本达成一致意见，拟近期上报审议。', null, '1', '564', null, '1');
INSERT INTO `project_info` VALUES ('565', '中林保理公司', null, null, null, null, null, null, null, '重庆中林是央企中国林业集团（中国企业500强）旗下公司，重庆市总部贸易企业。该公司由中国林业集团的全资子公司中国林产品有限公司控股并直接管理，是中林在西南区域的国际木材进口贸易及分销、木制品加工与销售、木材产业园区运营的重要平台。重庆中林在园区已落地国际木材进口集散中心项目，共落户2家贸易平台公司，近两年进出口贸易额累计已超过20亿元，2019年税收贡献超过1000万元。重庆中林拟成立商业保理公司，注册资本金实缴1亿元，依托重庆铁路口岸打造集“贸易+物流+供应链金融”于一体的供', '50000.00', '100000.00', '3000.00', null, null, null, null, null, null, null, null, null, null, null, '5月再次对接重庆市地方金融监督管理局', '0', '1', null, null, null, null, '1. 双方已达成合作意向，由重庆中林依托铁路口岸及其对外开放通道，打造国际木材供应链运营中心。为提升供应链金融服务能力，拟由重庆中林与重庆国际物流枢纽园区合资成立商业保理公司，其中园区出资占比5-10%。2. 3月23日，商贸物流组带领企业对接市金融监管局监管二处，沟通保理牌照申请事宜。', null, '1', '565', null, '1');
INSERT INTO `project_info` VALUES ('566', '农产品集团冷链进口分拨基地', null, null, null, null, null, null, null, '重庆市农产品（集团）有限公司系重庆市供销合作总社、重庆供销控股集团直属企业，资产总额40亿元，年营业收入50亿元。目前，旗下农产品国际贸易公司、供销汽贸公司已入驻国际物流枢纽园区开展农产品进出口、平行车进口贸易业务。企业拟在园区投资打造农产品冷链进口分拨基地项目，依托陆海新通道、铁路口岸及B型保税物流中心冻库，开展冻肉进口贸易及分销、农产品出口、国际国内冷链物流及供应链金融服务。', '20000.00', '100000.00', '2000.00', null, null, null, null, null, null, null, null, null, null, null, '5月洽谈合作模式', '0', '1', null, null, null, null, '双方多次对接，就以下项目内容达成合作意向：①成立冷链物流公司，投资约1亿元在铁路口岸B保冻库（2.7万方未加装制冷设备）加装冷链设施设备，打造农产品集团冷链进口分拨基地。②成立农产品进出口公司，打造冻品进口供应链金融服务平台，将进出口贸易额、销售结算留在沙区。预计年营业收入10亿元、税收贡献1000万元。③国际国内冷链物流。冷链物流公司将投资打造城市温控产业园、产地冷库；投资购买冷藏集装箱，与陆海新通道、中欧班列（渝新欧）合作开展国际国内冷链物流。', null, '1', '566', null, '1');
INSERT INTO `project_info` VALUES ('567', '陆海新通道重庆铁路口岸国际集装箱运管中心（交易及分拨中心）', null, null, null, null, null, null, null, '中新南向通道（重庆）物流发展有限公司成立于2017年7月，是陆海新通道铁海联运班列的运营平台公司。项目拟选址重庆国际物流枢纽园区（公共仓三期地块），紧靠铁路集装箱中心站，占地面积约376亩，总投资7.53亿元（不含土地费用），建设多层冻库、立体冻库、加工厂房、普通仓库、堆箱区、展示交易区、停车场、房等基础设施，为通道普通、冷链货物提供中转、仓储、修洗、加工、交易、金融等专业一体化服务，建设集装箱统筹调度、集中统一、高效运转的一体化运管中心，为通道运输高效运输提供有力保障。', '150000.00', '300000.00', '10000.00', null, null, null, null, null, null, null, null, null, null, null, '2020年完成项目前期工作，争取年底开工建设', '0', '1', null, null, null, null, '1.企业3月提出用地需求，并已提交投资方案。据悉，企业已将项目建设实施方案提交市口岸物流办，待审批。2. 据企业反馈，拟近期成立南向通道重庆供应链公司，以该公司作为投资主体开展协议洽谈。', null, '1', '567', null, '1');
INSERT INTO `project_info` VALUES ('568', '多来点城市中央厨房项目', null, null, null, null, null, null, null, '北京多来点信息技术有限公司成立于2009年，注册资金1.2亿元人民币，是北京科委、信息产业部认定的高新技术企业、双软认证企业，国内最大的餐饮软件模式服务企业。项目拟投资建设中央厨房，搭建物流、仓储、国际采购平台，为餐饮行业提供采购、仓储、配送服务（含冷链加工），形成覆盖全国市场的销售网络，项目全部建成满产后预计营收约60-80亿元，利润约4-5亿，每年可创造税收1-2亿元。', '50000.00', '600000.00', '10000.00', null, null, null, null, null, null, null, null, null, null, null, '5月前往考察', '0', '1', null, null, null, null, '2019年12月，商贸物流组赴北京拜访企业总部，考察基本情况，今年4月21日，企业发来项目投资建议书，下一步双方将互访，深化合作事项。双方初步合作意向：①中央厨房区域总部。建议企业将西南区域总部、中央厨房网上商城结算业务落户；②国际贸易合作。依托沙区通道优势，开展冻肉、水果、粮油等原材料的国际采购和分拨，整合行业供应链资源。远期落地大宗农副产品贸易总部。', null, '1', '568', null, '1');
INSERT INTO `project_info` VALUES ('569', '阿里巴巴“一带一路”商品展贸馆', null, null, null, null, null, null, null, '阿里巴巴集团成立于1999年，最新上榜2019年上市公司市值500强（排名第一），2019年11月，阿里巴巴港股上市，总市值超4万亿。主要经营电子商务、网上支付、B2B网上交易市场及云计算业务。旗下公司业务包括：淘宝网、天猫、聚划算、全球速卖通、阿里巴巴国际交易市场、1688、阿里妈妈、阿里云、蚂蚁金服、菜鸟网络等。阿里巴巴集团战略发展部作为阿里集团对外投资发展、战略规划的核心部门，拟与沙区合作打造“一带一路”商品展贸馆、阿里云智慧园区项目。', '5000.00', '10000.00', '1000.00', null, null, null, null, null, null, null, null, null, null, null, '5月确定具体合作模式', '0', '1', null, null, null, null, '1. 3月26日起，园区与阿里巴巴集团战略发展部、跨境电商事业部、钉钉团队对接7次，我方提出从以下方向开展合作：①.“一带一路”商品展贸馆。阿里巴巴负责建设线上展示交易国别馆，园区负责提供线下展贸馆场地。阿里战略部正在协调阿里相关部门对项目商业模式进行评估。②.跨境电商出口。目前，阿里与重庆市政府、市商务委签署“春雷计划”合作协议，拟从全市层面助推全市跨境电商线上平台转型发展。园区积极带动入园贸易企业参加5月8日“春雷行动”启动大会，引导入园贸易企业整合阿里电商资源，推动本地', null, '1', '569', null, '1');
INSERT INTO `project_info` VALUES ('57', '普洛斯重庆跨境贸易物流基地', 'Z201905000769', '167', '电子商务及跨境结算', '交通运输、仓储和邮政业', '', null, '楼宇类项目', null, null, '12000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-20 14:07:20', null, null, null, null, '正在主体施工。', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('58', '佛罗伦萨小镇重庆奥特莱斯', 'Z201905000770', '167', '消费品', '批发和零售业', '西洽会', null, '楼宇类项目', null, '20000.00', '100000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:50:27', null, null, null, null, '正常开展主体施工。', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('59', '民生电商重庆金融物流园', 'Z201905000771', '167', '电子商务及跨境结算', '交通运输、仓储和邮政业', '', null, '楼宇类项目', null, null, '15000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-20 14:07:39', null, null, null, null, '正常开展主体施工。', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('6', '港渝国际海铁联运大通道项目', 'Z201904000202', '167', '国际物流及城乡配送', '交通运输、仓储和邮政业', '市领导会见', null, '楼宇类项目', null, null, null, null, null, null, null, null, null, '孙晓旭', '2019-11-29 17:01:32', null, null, null, null, '重庆到香港货物正常运输。', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('60', '菲大装配式建筑产业贸易总部', 'Z201905000772', null, null, null, null, null, '楼宇类项目', null, null, null, null, null, null, null, null, null, '孙晓旭', '2019-12-27 10:06:40', null, null, null, null, '\"1.已完成公司注册，已签订正式入驻协议。', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('61', '盘古互联网产业西南基地项目', 'Z201905000776', null, null, null, null, null, '楼宇类项目', null, null, null, null, null, null, null, null, null, '孙晓旭', '2019-12-27 10:07:38', null, null, null, null, '\"1.完成公司注册及税务登记。', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('62', '传化网西南运营中心项目', 'Z201905000777', '167', '国际物流及城乡配送', '交通运输、仓储和邮政业', '市领导会见 西洽会 智博会', null, '楼宇类项目', null, '120000.00', '200000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-15 15:12:55', null, null, null, null, '双方正积极推进招拍挂前期工作', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('63', '卓尔智联西南总部项目', 'Z201905000778', '167', '其他', '批发和零售业', '', null, '楼宇类项目', null, null, '0.00', null, null, null, null, null, null, '孙晓旭', '2020-05-19 15:33:38', null, null, null, null, '双方就商贸物流、贸易金融产城开发等方面进行深入探讨。', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('64', '(宝供)重庆·粤港澳商贸物流枢纽项目', 'Z201905000779', '167', '其他', '交通运输、仓储和邮政业', '智博会', null, '楼宇类项目', null, '0.00', '800000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-20 14:07:48', null, null, null, null, '无', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('65', '泸州老窖合作项目', 'Z201905000780', '167', '其他', '批发和零售业', '', null, null, null, null, '0.00', null, null, null, null, null, null, '孙晓旭', '2019-11-26 16:43:31', null, null, null, null, '因企业经营战略调整，暂停该项目。', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('66', '汉宏物流中国西部运营中心项目', 'Z201905000781', '167', '国际物流及城乡配送', '批发和零售业', '智博会', null, null, null, null, '0.00', null, null, null, null, null, null, '孙晓旭', '2019-12-27 10:26:19', null, null, null, null, '已注册公司，已开展整车进口运输业务。', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('67', '物美区域总部项目', 'Z201905000782', '167', '其他', '批发和零售业', '', null, null, null, null, '0.00', null, null, null, null, null, null, '孙晓旭', '2020-05-19 15:34:00', null, null, null, null, '双方寻求西南区域总部项目合作。', '0', '1', null, null, null, null, null, null, null, null, null, '1');
INSERT INTO `project_info` VALUES ('68', '中升集团4S店项目', 'Z201905000783', '167', '其他', '批发和零售业', '', null, null, null, null, '0.00', null, null, null, null, null, null, '孙晓旭', '2019-11-26 16:52:12', null, null, null, null, '由于企业还未取得品牌新增授权，目前不能确定投资计划。项目暂无进展', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('69', '中粮海优西南贸易分拨中心项目', 'Z201905000784', '167', '其他', '批发和零售业', '', null, null, null, null, '0.00', null, null, null, null, null, null, '孙晓旭', '2020-05-19 15:34:21', null, null, null, null, '因企业经营战略调整，该项目暂缓。', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('7', '重庆中美海吉亚医院国际医疗项目', 'Z201905000501', '167', '卫生事业', '卫生和社会工作', '智博会', null, null, null, '10000.00', '30000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-18 15:25:13', null, null, null, null, '海吉亚二期工程计划于4月中旬开工，预计建成后增加床位1100张。据了解，项目处于高新区范围内，工商税务等均已转移。', '0', '1', null, null, null, null, null, null, '1', null, null, '1');
INSERT INTO `project_info` VALUES ('70', '西南大宗商品贸易平台项目', 'Z201905000785', '167', '其他', '批发和零售业', '智博会', null, null, null, null, '0.00', null, null, null, null, null, null, '孙晓旭', '2019-12-27 10:28:08', null, null, null, null, '已开展业务。', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('71', '锦程物流网“美元快付”全国结算中心项目', 'Z201905000786', '167', '新兴金融服务业', '金融业', '', null, null, null, null, '0.00', null, null, null, null, null, null, '孙晓旭', '2020-05-19 09:10:00', null, null, null, null, '19年1月正式营业。', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('72', '二当家互联网保险经纪公司项目', 'Z201905000788', '167', '新兴金融服务业', '金融业', '', null, null, null, null, '0.00', null, null, null, null, null, null, '孙晓旭', '2020-05-19 09:09:46', null, null, null, null, '重庆银保监局已受理该企业的设立申请。', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('73', '传化金融项目', 'Z201905000789', '167', '新兴金融服务业', '金融业', '', null, null, null, null, '0.00', null, null, null, null, null, null, '孙晓旭', '2020-05-19 09:10:12', null, null, null, null, '将于近期向市金融监管局汇报，加快传化互联网小贷的设立进程。', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('74', '荣德鑫-中驰车福重庆电商产业园项目', 'Z201905000790', '167', '电子商务及跨境结算', '租赁和商务服务业', '', null, '楼宇类项目', null, null, '0.00', null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:37:21', null, null, null, null, '条件不成熟，对方暂无投资计划。', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('75', '科通芯片产业园项目', 'Z201905000791', '167', '电子信息', '信息传输、软件和信息技术服务业', '', null, '楼宇类项目', null, null, '0.00', null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:52:17', null, null, null, null, '正在与企业就项目运营模式以及需要我区对项目落地支持的政策进行协商。', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('76', '启迪AI科技园项目', 'Z201905000792', '167', '人工智能', '信息传输、软件和信息技术服务业', '', null, '楼宇类项目', null, null, '0.00', null, null, null, null, null, null, '孙晓旭', '2019-10-29 10:19:31', null, null, null, null, '企业原因，项目暂停推进。', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('77', '重庆特钢厂文创项目', 'Z201905000793', '167', '文化旅游服务业', '文化、体育和娱乐业', '', null, '楼宇类项目', null, null, '300000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:38:08', null, null, null, null, '项目暂缓。', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('78', '金碧正街文化旅游项目', 'Z201905000794', '167', '文化旅游服务业', '文化、体育和娱乐业', '', null, '楼宇类项目', null, '20000.00', '80000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-18 16:05:53', null, null, null, null, '项目共涉及845户（其中住宅814户，非住宅31户）。目前累计签约803户,签约率96%。一期剧场地块已于4月30日网上挂牌，预计5月下旬完成招拍挂程序。', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('79', '奥山冰雪综合体', 'Z201905000795', '167', '文化旅游服务业', '文化、体育和娱乐业', '西洽会', null, '楼宇类项目', null, '120000.00', '40000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-18 16:10:00', null, null, null, null, '目前市地产集团已确定近期将项目选址的住宅地块185亩单独挂牌，商业地块113亩挂牌时间待定（商业部分已划入高新区），地产集团计划5月中旬将土地挂牌，因暂无开发商与市地产集团签订勾地协议，故还未正式发出土地出让通知。', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('8', '科德重庆五轴联动数控机床研发、生产项目', 'Z201905000713', '167', '智能制造装备', '制造业', '西洽会 智博会', null, '楼宇类项目', null, null, '100000.00', null, null, null, null, null, null, '孙晓旭', '2019-11-26 10:50:24', null, null, null, null, '已投运', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('80', '英诺创新空间项目', 'Z201905000796', null, null, null, null, null, '楼宇类项目', null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-18 16:04:21', null, null, null, null, '\"目前赖家桥合作项目暂缓，已推荐物流园创新中心为备选址；', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('81', '雪松文旅项目', 'Z201905000798', '167', '文化旅游服务业', '文化、体育和娱乐业', '', null, '楼宇类项目', null, null, '0.00', null, null, null, null, null, null, '孙晓旭', '2020-04-17 16:03:58', null, null, null, null, '雪松内部投委会认为目前重庆的政策暂不满足集团投资需求，暂缓集团在重庆范围内投资计划。', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('82', '凤凰山项目', 'Z201905000799', '167', '文化旅游服务业', '文化、体育和娱乐业', '', null, '楼宇类项目', null, null, '0.00', null, null, null, null, null, null, '孙晓旭', '2019-10-24 16:14:19', null, null, null, null, '因地块现有地上建筑面积无法满足企业运营平衡，故项目暂缓', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('83', '金融街旅游演艺项目', 'Z201905000800', '167', '文化旅游服务业', '文化、体育和娱乐业', '', null, null, null, null, '0.00', null, null, null, null, null, null, '孙晓旭', '2019-11-26 15:50:57', null, null, null, null, '投资方暂缓投资计划', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('84', '健康综合体', 'Z201905000801', '167', '医疗、卫生、体育、养老等大健康服务业', '卫生和社会工作', '', null, null, null, null, '1000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:39:07', null, null, null, null, '开始装修收尾', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('85', '一步道位停车管理有限公司总重庆部项目', 'Z201905000802', '167', '公共交通网络', '租赁和商务服务业', '智博会', null, null, null, '50000.00', '5000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:39:24', null, null, null, null, '已完成工商注册，在我区已经运行3个停车场，目前就拟出让地块已经签订托底协议', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('86', '国发中经全国总部基地', 'Z201905000803', '167', '智能终端', '信息传输、软件和信息技术服务业', '', null, null, null, null, '0.00', null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:39:37', null, null, null, null, '无', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('87', '中海油区域总部', 'Z201905000804', '167', '能源', '批发和零售业', '', null, null, null, null, '0.00', null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:46:22', null, null, null, null, '企业已完成预核名程序，确定名称为“中海油重庆能源有限公司”。股东单位由“中海油四川公司”变更为其母公司——“中海油华东公司”。企业已上报加油站预核准申请资料，我组将积极协助区规资局完成专规平移并启动土地挂牌前期工作。', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('88', '欧盟中国联合创新基地', 'Z201905000805', '167', '新兴金融服务业', '信息传输、软件和信息技术服务业', '', null, null, null, null, '0.00', null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:46:51', null, null, null, null, '已深度研究欧创中心提供的知识产权交易中心项目建议书并完成项目合作协议草拟。针对对方在项目用地问题上的顾虑，我组正积极促成主要领导对接，争取项目早日落地。', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('89', '盛威时代西南总部', 'Z201905000806', '167', '文化旅游服务业', '交通运输、仓储和邮政业', '', null, null, null, null, '0.00', null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:51:04', null, null, null, null, '完成工商注册并取得网络预约出租汽车经营许可证。目前尚未投入自有车辆，正与重庆部分汽车租赁公司洽谈合作。预计一个月内投入自有车辆，并有可能将全国网约车结算总部移到重庆。', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('9', '德润俊科技医学转化产业研究院暨三类医疗器械生产基地项目', 'Z201905000714', '167', '生物医药', '制造业', '智博会', null, '楼宇类项目', null, '3000.00', '100000.00', null, null, null, null, null, null, '孙晓旭', '2020-05-19 14:48:46', null, null, null, null, '因高新区不同意供地，项目暂时搁置', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('90', '新一代人体再生医学材料项目', 'Z201905000807', '167', '生物医药', '卫生和社会工作', '', null, null, null, null, '0.00', null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:51:21', null, null, null, null, '磋商', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('91', '汉口银行沙坪坝支行', 'Z201905000808', '167', '其他', '金融业', '', null, null, null, null, '0.00', null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:52:13', null, null, null, null, '磋商', '0', '1', null, null, null, null, null, '1', null, null, null, '1');
INSERT INTO `project_info` VALUES ('92', '干细胞研究实验室', 'Z201905000809', '167', '生物医药', '卫生和社会工作', '', null, null, null, null, '0.00', null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:51:35', null, null, null, null, '磋商', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('93', '点创科技西南区域总部', 'Z201905000810', '167', '消费品', '批发和零售业', '', null, null, null, null, '0.00', null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:51:31', null, null, null, null, '就新增重庆板块业务并在我区成立区域总部并迁入结算中心事宜进行了深入的沟通。', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('94', '瑞斯丽酒店及迪拜产业合作项目', 'Z201905000812', '167', '文化旅游服务业', '住宿和餐饮业', '', null, null, null, null, '0.00', null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:52:03', null, null, null, null, '已实地考察虎溪老场镇、物流园中央商务区、老公安分局、新媒体大厦等地块。', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('95', '美菜网西南总部', 'Z201905000813', '167', '电子商务及跨境结算', '交通运输、仓储和邮政业', '', null, '楼宇类项目', null, null, '0.00', null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:51:27', null, null, null, null, '对方已就协议初稿进行反馈，双方对协议中的用地面积、冷冻仓库租赁问题进行了磋商。持续跟进中', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('96', '佰才邦西南区域总部及5G产业园', 'Z201905000814', '167', '智能制造装备', '信息传输、软件和信息技术服务业', '', null, null, null, null, '0.00', null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:47:10', null, null, null, null, '赴北京对接5G产业园具体合作需求，合作模式及产业引入等问题。', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('97', '北京大学合作项目', 'Z201905000815', '167', '医疗、卫生、体育、养老等大健康服务业', '卫生和社会工作', '', null, null, null, null, '0.00', null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:47:19', null, null, null, null, '上门拜访企业进行洽谈', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('98', '中关村产业园项目', 'Z201905000816', '167', '研发平台', '科学研究和技术服务业', '', null, null, null, null, '0.00', null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:47:22', null, null, null, null, '待企业高管和投资团队实地考察沙区，确定投资项目及计划。', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('98b3f44a382e4af884c39e7d03cc4381', '测试项目1', 'SPB20200630311310', null, '采矿业', '农业', '市局推荐', '自助发掘', '用地类项目', '测试项目1测试项目1测试项目1测试项目1测试项目1测试项目1测试项目1测试项目1测试项目1测试项目1测试项目1测试项目1测试项目1测试项目1测试项目1测试项目1测试项目1', '20.00', '500.00', '30.00', '5', '2020-06-03 00:00:00', '2021-06-16 00:00:00', '2020-06-29 00:00:00', '1', 'admin', '2020-06-30 17:09:56', '1', '2020-06-30 17:10:00', null, null, null, '0', '1', '1', null, null, '0', null, null, null, null, null, '1');
INSERT INTO `project_info` VALUES ('99', '土湾片区民俗街项目', 'Z201905000817', '167', '文化旅游服务业', '住宿和餐饮业', '', null, null, null, null, '0.00', null, null, null, null, null, null, '孙晓旭', '2020-05-20 09:47:27', null, null, null, null, '初步洽谈，对项目进行了推介，鉴于该地区被学校、道路、隧道、高压线、轨道线分割成无数块，土地拍卖难以产生价值，经讨论，由对方制定整体打造方案，我方初审后，报区政府审定。目前对方正在完善方案。', '0', '1', null, null, null, null, null, '1', '1', null, null, '1');
INSERT INTO `project_info` VALUES ('Z202004010141232', '荣易达供应链服务平台项目', 'SPB20200619817528', '167', '电子商务及跨境结算', '批发和零售业', '', null, '楼宇类项目', null, null, null, null, null, null, null, null, null, '孙晓旭', '2020-05-25 15:52:35', null, '2020-06-19 13:40:06', null, null, '签订正式协议', '0', '3', null, null, null, '0', null, '1', '1', null, null, '1');

-- ----------------------------
-- Table structure for project_investigate
-- ----------------------------
DROP TABLE IF EXISTS `project_investigate`;
CREATE TABLE `project_investigate` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '编码',
  `project_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属项目',
  `investigate_start_time` datetime DEFAULT NULL COMMENT '考察开始时间',
  `investigate_end_time` datetime DEFAULT NULL COMMENT '考察结束时间',
  `main_leader` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '主要人员',
  `other_leader` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '陪同领导',
  `investigate_plane` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '考察方案',
  `remarks` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `del_flag` varchar(2) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '是否删除：0-否，1-是',
  `travel_date` datetime DEFAULT NULL COMMENT '出行日期',
  `return_trip_date` datetime DEFAULT NULL COMMENT '回程日期',
  `project_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目名称',
  `address` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '考察地点',
  `travel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '出行时长',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`,`project_id`,`del_flag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='项目-考察信息';

-- ----------------------------
-- Records of project_investigate
-- ----------------------------
INSERT INTO `project_investigate` VALUES ('46fd569989ff4411b06c765a26d8a5ae', 'd8ecdb943aae4d31adc105299e847388', '2020-06-04 00:00:00', '2020-06-08 00:00:00', '区长', '领导交办', '/2020年06月04日/2941a7b1b96b440e80280e39a45efb131130会议购房通小程序整改要点.docx', '测试', '0', null, null, null, null, null);
INSERT INTO `project_investigate` VALUES ('66431c92838f499782c98e428c1353a7', '70', '2020-06-19 13:49:50', '2020-06-19 13:49:51', '区委书记', null, null, null, '0', null, null, null, '156', '2');

-- ----------------------------
-- Table structure for project_investigate_details
-- ----------------------------
DROP TABLE IF EXISTS `project_investigate_details`;
CREATE TABLE `project_investigate_details` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '编码',
  `investigate_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '考察编码',
  `dept` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属部门',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '姓名',
  `del_flag` varchar(2) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '是否删除：0-否，1-是',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`,`investigate_id`,`del_flag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='考察陪同人员';

-- ----------------------------
-- Records of project_investigate_details
-- ----------------------------
INSERT INTO `project_investigate_details` VALUES ('a277167f9a084d2fbdb77979dec18119', '66431c92838f499782c98e428c1353a7', '总部经济组', '56151', '0');
INSERT INTO `project_investigate_details` VALUES ('b4ecf3e5c4ad42d796b5ecbcfd4bf96f', '46fd569989ff4411b06c765a26d8a5ae', '先进制造业', '王加', '0');
INSERT INTO `project_investigate_details` VALUES ('cd93f4e73cfa4c62b4e6dc01c55c5abf', '66431c92838f499782c98e428c1353a7', null, null, '0');

-- ----------------------------
-- Table structure for project_investigate_file
-- ----------------------------
DROP TABLE IF EXISTS `project_investigate_file`;
CREATE TABLE `project_investigate_file` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `investigate_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '考察编码',
  `file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '文件名称',
  `file_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '文件路径',
  `del_flag` varchar(2) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '是否删除：0-否，1-是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='项目考察信息-考察方案';

-- ----------------------------
-- Records of project_investigate_file
-- ----------------------------

-- ----------------------------
-- Table structure for project_investor
-- ----------------------------
DROP TABLE IF EXISTS `project_investor`;
CREATE TABLE `project_investor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `project_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `investorname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `documenttype` int(255) DEFAULT NULL,
  `documentnumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telephone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `investoraddress` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='项目投资人';

-- ----------------------------
-- Records of project_investor
-- ----------------------------
INSERT INTO `project_investor` VALUES ('1', '6ab5a98f8f304207b28b6db8571f8d96', '晓东', null, '1235622', null, null);
INSERT INTO `project_investor` VALUES ('2', '6ab5a98f8f304207b28b6db8571f8d96', '投资人姓名', '1', '证件号码', '电话号码', '投资人注册地');
INSERT INTO `project_investor` VALUES ('3', '5132132', '晓东', null, '1235622', null, null);
INSERT INTO `project_investor` VALUES ('4', '7afdb8a959574491ab963985caff2b0d', '测试', '1', '5002301977010850452', '13206204891', '阿萨德');
INSERT INTO `project_investor` VALUES ('5', '7afdb8a959574491ab963985caff2b0d', '测试', '1', '5002301977010850452', '13206204888', '阿萨德');
INSERT INTO `project_investor` VALUES ('6', '123456132', '小小东haha', null, '1235622', null, null);
INSERT INTO `project_investor` VALUES ('7', '7afdb8a959574491ab963985caff2b0d', '小小东haha', null, '1235622', null, null);
INSERT INTO `project_investor` VALUES ('8', '7afdb8a959574491ab963985caff2b0d', '小小东haha', null, '1235622', null, null);
INSERT INTO `project_investor` VALUES ('9', '5132132', '晓东', null, '1235622', null, null);
INSERT INTO `project_investor` VALUES ('10', '9da8ff7c2bef4cda825c97453e3a1a62', '哈哈开发了啊', '1', '1561321654151', '1235641531321', '阿咖妃');
INSERT INTO `project_investor` VALUES ('11', '7afdb8a959574491ab963985caff2b0d', '小小东haha', null, '1235622', null, null);
INSERT INTO `project_investor` VALUES ('12', '5132132', '晓东', null, '1235622', null, null);
INSERT INTO `project_investor` VALUES ('13', '7afdb8a959574491ab963985caff2b0d', '小小东haha', null, '1235622', null, null);
INSERT INTO `project_investor` VALUES ('14', '5132132', '晓东', null, '1235622', null, null);
INSERT INTO `project_investor` VALUES ('15', '7afdb8a959574491ab963985caff2b0d', '小小东haha', null, '1235622', null, null);
INSERT INTO `project_investor` VALUES ('16', '5132132', '晓东', null, '1235622', null, null);
INSERT INTO `project_investor` VALUES ('17', 'acc262a706ce409e92ac3d9af5f3fc94', 'asdasdsa ', null, '', '', '');
INSERT INTO `project_investor` VALUES ('18', 'acc262a706ce409e92ac3d9af5f3fc94', 'dddd', null, '', 'dd', '');
INSERT INTO `project_investor` VALUES ('19', '7afdb8a959574491ab963985caff2b0d', '小小东haha', null, '1235622', null, null);
INSERT INTO `project_investor` VALUES ('20', '5132132', '晓东', null, '1235622', null, null);
INSERT INTO `project_investor` VALUES ('21', '7afdb8a959574491ab963985caff2b0d', '小小东haha', null, '1235622', null, null);
INSERT INTO `project_investor` VALUES ('22', '5132132', '晓东', null, '1235622', null, null);
INSERT INTO `project_investor` VALUES ('23', '5132132', '晓东', null, '1235622', null, null);
INSERT INTO `project_investor` VALUES ('24', '98b3f44a382e4af884c39e7d03cc4381', '杜升', '1', '500230199701080479', '13206204891', '重庆');

-- ----------------------------
-- Table structure for project_personnel_info
-- ----------------------------
DROP TABLE IF EXISTS `project_personnel_info`;
CREATE TABLE `project_personnel_info` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '编码',
  `project_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目编码',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '姓名',
  `post` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '职务',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '职称',
  `high_honor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '高级荣誉',
  `remarks` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `del_flag` varchar(2) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '是否删除：0-否，1-是',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`,`project_id`,`del_flag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='项目-人才信息';

-- ----------------------------
-- Records of project_personnel_info
-- ----------------------------
INSERT INTO `project_personnel_info` VALUES ('39e27fab9a9045f99258d3d9864b18c1', '6ad218470b16444aa3698ebf4519b9af', null, null, null, null, null, '0');
INSERT INTO `project_personnel_info` VALUES ('5cd8e2e06dd9489aaa256801978bd4d0', '8365b232a13b4aaaa5b340d6ab7c72ca', null, null, null, null, null, '0');
INSERT INTO `project_personnel_info` VALUES ('956dddd9fb994ea29483bb0b474b7112', '691be385490847dbacaf0c47c81ad50e', '王珊珊', '经理', '高级经济师', '长江学者', '关于王珊珊的介绍', '0');
INSERT INTO `project_personnel_info` VALUES ('9ca267dcd25e4071ab8841d638263213', 'd8ecdb943aae4d31adc105299e847388', '王珊珊', '经理', '高级经济师', '长江学者', '关于王珊珊的介绍', '0');
INSERT INTO `project_personnel_info` VALUES ('af572c4d6805437285e5567c67e2e7fc', '46012e1544d14973ad9d6ad00a1b0322', null, null, null, null, null, '0');
INSERT INTO `project_personnel_info` VALUES ('ca4f09bfccf8411faa308439dc19a697', '36d3a498aadb49519a848e5aacb9eeea', '恩施', '测试', '高级工程师', '院士', null, '0');
INSERT INTO `project_personnel_info` VALUES ('ca99465526da4435b8974e1f42c88dea', 'd8ecdb943aae4d31adc105299e847388', '王珊珊', '经理', '高级经济师', '长江学者', '关于王珊珊的介绍', '1');

-- ----------------------------
-- Table structure for project_personnel_resume
-- ----------------------------
DROP TABLE IF EXISTS `project_personnel_resume`;
CREATE TABLE `project_personnel_resume` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '编码',
  `personnel_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '人才编码',
  `file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '文件名称',
  `file_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '文件路径',
  `del_flag` varchar(2) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '是否删除：0-否，1-是',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`,`personnel_id`,`del_flag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='项目-人才信息-简历';

-- ----------------------------
-- Records of project_personnel_resume
-- ----------------------------
INSERT INTO `project_personnel_resume` VALUES ('14acc377f750450cac0df0ccf1ce4e81', '956dddd9fb994ea29483bb0b474b7112', '1130会议购房通小程序整改要点.docx', '/2020年06月04日/7cc851c2da1f42769e6b0d8334f07d921130会议购房通小程序整改要点.docx', '0');
INSERT INTO `project_personnel_resume` VALUES ('6a068c311fad4c1a97f7229c74f1a2b9', 'ca4f09bfccf8411faa308439dc19a697', '1130会议购房通小程序整改要点.docx', '/2020年06月04日/9ece2801436b427496daecb648365eca1130会议购房通小程序整改要点.docx', '0');
INSERT INTO `project_personnel_resume` VALUES ('6d107723b2c24fbcbd469291912c4dc5', 'ca99465526da4435b8974e1f42c88dea', '1130会议购房通小程序整改要点.docx', '/2020年06月04日/7cc851c2da1f42769e6b0d8334f07d921130会议购房通小程序整改要点.docx', '1');
INSERT INTO `project_personnel_resume` VALUES ('a0f36b6e84cf41748f0b790346995557', '9ca267dcd25e4071ab8841d638263213', '1130会议购房通小程序整改要点.docx', '/2020年06月04日/7cc851c2da1f42769e6b0d8334f07d921130会议购房通小程序整改要点.docx', '0');

-- ----------------------------
-- Table structure for project_process
-- ----------------------------
DROP TABLE IF EXISTS `project_process`;
CREATE TABLE `project_process` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '编码',
  `project_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目编码',
  `step` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目阶段：0-待审批，1-审批通过，2-审批拒绝',
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '审批类型：1-部门审批，2-成员审批',
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '状态：1-暂停，2-重启，3-终止',
  `reason` text COLLATE utf8_unicode_ci COMMENT '原因',
  `reboot_date` datetime DEFAULT NULL COMMENT '预计重启时间',
  `remarks` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `del_flag` varchar(2) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '是否删除：0-否，1-是',
  `dept_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '部门编码',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`,`project_id`,`del_flag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='项目审批流程';

-- ----------------------------
-- Records of project_process
-- ----------------------------

-- ----------------------------
-- Table structure for project_process_details
-- ----------------------------
DROP TABLE IF EXISTS `project_process_details`;
CREATE TABLE `project_process_details` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '详情编码',
  `process_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '审批编码',
  `user_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '编码',
  `user_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '姓名',
  `sort` int(10) DEFAULT '0' COMMENT '排序',
  `step` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目阶段：-1-未到审批，0-待审批，1-审批通过，2-审批拒绝',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` varchar(2) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '是否删除：0-否，1-是',
  `reason` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`,`process_id`,`user_id`,`del_flag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='项目审批详情';

-- ----------------------------
-- Records of project_process_details
-- ----------------------------

-- ----------------------------
-- Table structure for project_prospectus_details
-- ----------------------------
DROP TABLE IF EXISTS `project_prospectus_details`;
CREATE TABLE `project_prospectus_details` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '编码',
  `project_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目编码',
  `file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '文件名称',
  `file_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '文件路径',
  `del_flag` varchar(2) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '是否删除：0-否，1-是',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`,`project_id`,`del_flag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='项目计划书';

-- ----------------------------
-- Records of project_prospectus_details
-- ----------------------------
INSERT INTO `project_prospectus_details` VALUES ('cc065ae1001f4c5183276f3f616ad946', '98b3f44a382e4af884c39e7d03cc4381', '爆破器材表.xlsx', '/2020年06月30日/944767a625f54f8c913769b95bbdf45f爆破器材表.xlsx', '0');
INSERT INTO `project_prospectus_details` VALUES ('e46695d5270c457c81c0142353f49faf', 'd8ecdb943aae4d31adc105299e847388', '1130会议购房通小程序整改要点.docx', '/2020年06月04日/d982a8530b7840f897714c5d9ebae29b1130会议购房通小程序整改要点.docx', '0');

-- ----------------------------
-- Table structure for project_reception
-- ----------------------------
DROP TABLE IF EXISTS `project_reception`;
CREATE TABLE `project_reception` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `project_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属项目',
  `reception_date` datetime DEFAULT NULL COMMENT '接待日期',
  `main_leader` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '主要领导',
  `other_leader` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '陪同领导',
  `remarks` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `del_flag` varchar(2) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '是否删除：0-否，1-是',
  `project_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目名称',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`,`del_flag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='项目-接待信息';

-- ----------------------------
-- Records of project_reception
-- ----------------------------
INSERT INTO `project_reception` VALUES ('871b64e256504368b42d6187a94cacb1', 'd8ecdb943aae4d31adc105299e847388', '2020-06-09 00:00:00', '常务副区长', '区财政局', null, '0', null);
INSERT INTO `project_reception` VALUES ('f15e9caae202456d9991e0f7afc0fc1c', '70', '2020-06-19 14:09:23', null, '区委书记', 'fgdafd', '0', null);

-- ----------------------------
-- Table structure for project_reception_details
-- ----------------------------
DROP TABLE IF EXISTS `project_reception_details`;
CREATE TABLE `project_reception_details` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '编码',
  `reception_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '接待编码',
  `dept` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '部门',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '姓名',
  `del_flag` varchar(2) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '是否删除：0-否，1-是',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`,`reception_id`,`del_flag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='项目-接待-陪同人员';

-- ----------------------------
-- Records of project_reception_details
-- ----------------------------
INSERT INTO `project_reception_details` VALUES ('0344284c0e014113bcc7930634f009ad', 'f15e9caae202456d9991e0f7afc0fc1c', '总部经济组', 'gsg', '0');
INSERT INTO `project_reception_details` VALUES ('d35437e6db0040d09a86ac661d2886eb', '871b64e256504368b42d6187a94cacb1', '商贸物流组', '张原', '0');

-- ----------------------------
-- Table structure for project_reception_file
-- ----------------------------
DROP TABLE IF EXISTS `project_reception_file`;
CREATE TABLE `project_reception_file` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '编码',
  `reception_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '接待编码',
  `file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '文件名称',
  `file_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '文件路径',
  `del_flag` varchar(2) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '是否删除：0-否，1-是',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`,`reception_id`,`del_flag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='项目-接待详情-接待方案';

-- ----------------------------
-- Records of project_reception_file
-- ----------------------------

-- ----------------------------
-- Table structure for project_reception_visit
-- ----------------------------
DROP TABLE IF EXISTS `project_reception_visit`;
CREATE TABLE `project_reception_visit` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '编码',
  `reception_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '接待编码',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '姓名',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '职务',
  `del_flag` varchar(2) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '是否删除：0-否，1-是',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`,`reception_id`,`del_flag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='项目-接待记录-到访人员';

-- ----------------------------
-- Records of project_reception_visit
-- ----------------------------
INSERT INTO `project_reception_visit` VALUES ('5aaaa25ee6ab43b3bb6e759f9ffe3ddb', 'f15e9caae202456d9991e0f7afc0fc1c', null, null, '0');

-- ----------------------------
-- Table structure for project_transfer
-- ----------------------------
DROP TABLE IF EXISTS `project_transfer`;
CREATE TABLE `project_transfer` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '编码',
  `project_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目编码',
  `project_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目名称',
  `from_group_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '转办人所属小组',
  `from_create_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '转办人编码',
  `from_create_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '转办人姓名',
  `deal_date` datetime DEFAULT NULL COMMENT '转办时间',
  `to_create_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '移交对象编码',
  `to_create_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '移交对象姓名',
  `to_group_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '移交所属小组',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `del_flag` varchar(2) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '是否删除：0-否，1-是',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`,`project_id`,`from_group_id`,`to_create_by`,`to_group_id`,`del_flag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='转办移交记录';

-- ----------------------------
-- Records of project_transfer
-- ----------------------------
INSERT INTO `project_transfer` VALUES ('015dff6195e1474cbb63b2a1c241566a', '237', 'super晚-文创夜市项目', null, null, 'ee', '2020-06-23 00:00:00', '103', '若依', '103', '2020-06-18 20:51:32', '0');
INSERT INTO `project_transfer` VALUES ('39f04c4abf044ccd8d75a3efa264afcb', '237', 'super晚-文创夜市项目', null, null, '陈', '2020-06-18 00:00:00', '103', '若依', '103', '2020-06-18 20:13:32', '0');
INSERT INTO `project_transfer` VALUES ('75c2541ef8254f22b3792fbf55298b2b', '691be385490847dbacaf0c47c81ad50e', '智慧停车场', null, null, '陈', '2020-06-19 00:00:00', '103', '若依', '103', '2020-06-19 09:25:47', '0');
INSERT INTO `project_transfer` VALUES ('87a2721836244fcca0eb7e695e9701ca', '237', 'super晚-文创夜市项目', null, null, '122', '2020-06-17 00:00:00', '103', '若依', '103', '2020-06-18 20:28:09', '0');
INSERT INTO `project_transfer` VALUES ('ba96b741283b4680b105dd078a135c7d', '36d3a498aadb49519a848e5aacb9eeea', '智能穿戴设备制造', null, null, '张珊珊', '2020-06-04 00:00:00', '104', 'admin', '104', '2020-06-04 11:24:24', '0');
INSERT INTO `project_transfer` VALUES ('ef3d715aafea444aaa38c9a149f57fde', '237', 'super晚-文创夜市项目', null, null, '陈', '2020-06-18 00:00:00', '103', '若依', '103', '2020-06-18 20:14:35', '0');
INSERT INTO `project_transfer` VALUES ('f8ef9f7041bb4cbba26d36c3eb8a5287', '237', 'super晚-文创夜市项目', null, null, '陈', '2020-06-18 00:00:00', '103', '若依', '103', '2020-06-18 20:27:24', '0');

-- ----------------------------
-- Table structure for start_product
-- ----------------------------
DROP TABLE IF EXISTS `start_product`;
CREATE TABLE `start_product` (
  `id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ID',
  `actual_date` datetime DEFAULT NULL COMMENT '实际开工时间',
  `estimated_date` datetime DEFAULT NULL COMMENT '预计开工时间',
  `actualproduct_date` datetime DEFAULT NULL COMMENT '实际投产时间',
  `estimatedproduct_date` datetime DEFAULT NULL COMMENT '预计投产时间',
  `actual_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '实际年产值',
  `estimated_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '预计年产值',
  `actual_payable` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '实际纳税值',
  `estimated_payable` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '预计纳税值',
  `product_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目ID',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '更新人',
  `del_flag` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of start_product
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `dept_level` varchar(2) DEFAULT NULL COMMENT '0 --总单位 1--总部门 2--分部门',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('100', '0', '0', '若依科技', '0', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '0');
INSERT INTO `sys_dept` VALUES ('101', '100', '0,100', '深圳总公司', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '1');
INSERT INTO `sys_dept` VALUES ('102', '100', '0,100', '长沙分公司', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '1');
INSERT INTO `sys_dept` VALUES ('103', '101', '0,100,101', '研发部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '2');
INSERT INTO `sys_dept` VALUES ('104', '101', '0,100,101', '市场部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '2');
INSERT INTO `sys_dept` VALUES ('105', '101', '0,100,101', '测试部门', '3', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '2');
INSERT INTO `sys_dept` VALUES ('106', '101', '0,100,101', '财务部门', '4', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '2');
INSERT INTO `sys_dept` VALUES ('107', '101', '0,100,101', '运维部门', '5', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '2');
INSERT INTO `sys_dept` VALUES ('108', '102', '0,100,102', '市场部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '2');
INSERT INTO `sys_dept` VALUES ('109', '102', '0,100,102', '财务部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '2');
INSERT INTO `sys_dept` VALUES ('110', '0', '', '测试部门', '0', null, null, null, '0', '0', '', null, '', null, null);
INSERT INTO `sys_dept` VALUES ('113', '101', '', '测试', '0', null, null, null, '0', '0', '1', null, '1', null, null);
INSERT INTO `sys_dept` VALUES ('114', '101', '', '测试', '0', null, null, null, '0', '0', '1', null, '1', null, null);
INSERT INTO `sys_dept` VALUES ('115', '102', '', '测试22', '0', null, null, null, '0', '0', '1', null, '1', null, null);
INSERT INTO `sys_dept` VALUES ('117', '102', '', '测试部门', '0', null, null, null, '0', '0', '1', null, '1', null, '2');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('1', '1', '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别男');
INSERT INTO `sys_dict_data` VALUES ('2', '2', '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别女');
INSERT INTO `sys_dict_data` VALUES ('3', '3', '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别未知');
INSERT INTO `sys_dict_data` VALUES ('4', '1', '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '显示菜单');
INSERT INTO `sys_dict_data` VALUES ('5', '2', '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES ('6', '1', '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('7', '2', '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('8', '1', '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('9', '2', '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('10', '1', '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '默认分组');
INSERT INTO `sys_dict_data` VALUES ('11', '2', '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统分组');
INSERT INTO `sys_dict_data` VALUES ('12', '1', '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认是');
INSERT INTO `sys_dict_data` VALUES ('13', '2', '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认否');
INSERT INTO `sys_dict_data` VALUES ('14', '1', '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知');
INSERT INTO `sys_dict_data` VALUES ('15', '2', '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '公告');
INSERT INTO `sys_dict_data` VALUES ('16', '1', '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('17', '2', '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '关闭状态');
INSERT INTO `sys_dict_data` VALUES ('18', '99', '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '其他操作');
INSERT INTO `sys_dict_data` VALUES ('19', '1', '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES ('20', '2', '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '修改操作');
INSERT INTO `sys_dict_data` VALUES ('21', '3', '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '删除操作');
INSERT INTO `sys_dict_data` VALUES ('22', '4', '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '授权操作');
INSERT INTO `sys_dict_data` VALUES ('23', '5', '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导出操作');
INSERT INTO `sys_dict_data` VALUES ('24', '6', '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导入操作');
INSERT INTO `sys_dict_data` VALUES ('25', '7', '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '强退操作');
INSERT INTO `sys_dict_data` VALUES ('26', '8', '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '生成操作');
INSERT INTO `sys_dict_data` VALUES ('27', '9', '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '清空操作');
INSERT INTO `sys_dict_data` VALUES ('28', '1', '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('29', '2', '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('30', '1', '有限责任公司', '1', 'company_type', '', '', 'Y', '0', 'admin', '2020-04-21 16:24:50', 'admin', '2020-04-21 16:25:46', '');
INSERT INTO `sys_dict_data` VALUES ('31', '2', '股份制责任公司', '2', 'company_type', '', '', 'Y', '0', 'admin', '2020-04-21 16:25:13', 'admin', '2020-04-21 16:25:54', '');
INSERT INTO `sys_dict_data` VALUES ('32', '1', '通过朋友推荐', '1', 'know_from', null, null, 'Y', '0', 'admin', '2020-04-21 16:28:16', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('33', '2', '网上看到', '2', 'know_from', null, null, 'Y', '0', 'admin', '2020-04-21 16:28:30', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('34', '1', '7天', '1', 'delivery_date', null, null, 'Y', '0', 'admin', '2020-04-21 16:31:22', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('35', '2', '30天', '2', 'delivery_date', null, null, 'Y', '0', 'admin', '2020-04-21 16:31:31', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('36', '1', '待审核', '0', 'status', '', '', 'Y', '0', 'admin', '2020-04-23 16:24:57', 'admin', '2020-04-23 16:25:15', '');
INSERT INTO `sys_dict_data` VALUES ('37', '2', '审核通过', '1', 'status', null, null, 'Y', '0', 'admin', '2020-04-23 16:25:24', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('38', '3', '审核拒绝', '2', 'status', null, null, 'Y', '0', 'admin', '2020-04-23 16:25:34', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('39', '1', '供应', '1', 'message_type', null, null, 'Y', '0', 'admin', '2020-04-30 15:40:57', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('40', '2', '采购', '2', 'message_type', null, null, 'Y', '0', 'admin', '2020-04-30 15:41:17', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('41', '2', '省、自治区、直辖市', '2', 'region_level', '', '', 'Y', '0', 'admin', '2020-05-06 09:35:14', 'admin', '2020-05-06 10:37:57', '');
INSERT INTO `sys_dict_data` VALUES ('42', '3', '地级市、地区、自治州、盟', '3', 'region_level', '', '', 'Y', '0', 'admin', '2020-05-06 09:35:26', 'admin', '2020-05-06 10:38:03', '');
INSERT INTO `sys_dict_data` VALUES ('43', '4', '市辖区、县级市、县', '4', 'region_level', '', '', 'Y', '0', 'admin', '2020-05-06 09:35:42', 'admin', '2020-05-06 10:38:08', '');
INSERT INTO `sys_dict_data` VALUES ('46', '5', '山西运城2', '5', 'region_level', null, null, 'N', '0', '', '2020-05-15 11:27:58', '', '2020-05-15 11:29:54', null);
INSERT INTO `sys_dict_data` VALUES ('47', '6', '山西运城', '6', 'region_level', null, null, 'N', '0', '', '2020-05-15 11:28:51', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('48', '1', '李四', '0', 'system_leader', null, null, 'N', '0', '', '2020-05-26 11:28:08', '', '2020-05-26 11:28:10', null);
INSERT INTO `sys_dict_data` VALUES ('49', '1', '张三', '1', 'system_leader', null, null, 'N', '0', '', null, '', null, null);
INSERT INTO `sys_dict_data` VALUES ('50', '0', '王五', '1', 'secretary_district', null, null, 'N', '0', '', null, '', null, null);
INSERT INTO `sys_dict_data` VALUES ('51', '0', '金融', '1', 'industry_involved', null, null, 'N', '0', '', null, '', '2020-06-01 14:44:04', null);
INSERT INTO `sys_dict_data` VALUES ('52', '0', '市场组', '1', 'belong_group', null, null, 'N', '0', '', null, '', null, null);
INSERT INTO `sys_dict_data` VALUES ('53', '0', '博士', '1', 'honor_type', null, null, 'N', '0', '', null, '', null, null);
INSERT INTO `sys_dict_data` VALUES ('54', '0', 'luckly', '1', 'nick_name', null, null, 'N', '0', '', null, '', null, null);
INSERT INTO `sys_dict_data` VALUES ('55', '0', '瀚乐思', '1', 'participate_unit', null, null, 'N', '0', '', null, '', null, null);
INSERT INTO `sys_dict_data` VALUES ('56', '0', '100', '1', 'location_number', null, null, 'N', '0', '', null, '', null, null);
INSERT INTO `sys_dict_data` VALUES ('57', '0', '东', '1', 'location_type', null, null, 'N', '0', '', null, '', null, null);
INSERT INTO `sys_dict_data` VALUES ('58', '0', '用地类', '1', 'project_type', null, null, 'N', '0', '', null, '', null, null);
INSERT INTO `sys_dict_data` VALUES ('59', '0', '门类1', '1', 'category_type', null, null, 'N', '0', '', null, '', null, null);
INSERT INTO `sys_dict_data` VALUES ('60', '0', '大类1', '1', 'big_type', null, null, 'N', '0', '', null, '', null, null);
INSERT INTO `sys_dict_data` VALUES ('61', '0', '网络', '1', 'info_source', null, null, 'N', '0', '', null, '', null, null);
INSERT INTO `sys_dict_data` VALUES ('62', '0', 'good', '1', 'leader_ship', null, null, 'N', '0', '', null, '', null, null);
INSERT INTO `sys_dict_data` VALUES ('65', '0', '所属行业', '金融', 'industry', null, null, 'N', '0', '', '2020-06-01 15:44:09', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('69', '0', '所属行业', '先进制造', 'industry', null, null, 'N', '0', '', '2020-06-01 16:08:47', '', '2020-06-01 20:37:59', null);
INSERT INTO `sys_dict_data` VALUES ('73', '0', '所属小组', '总部经济组', 'group', null, null, 'N', '0', '', '2020-06-01 16:13:44', '', '2020-06-01 20:36:23', null);
INSERT INTO `sys_dict_data` VALUES ('74', '0', '所属小组', '先进制造业', 'group', null, null, 'N', '0', '', '2020-06-01 16:14:14', '', '2020-06-01 20:36:38', null);
INSERT INTO `sys_dict_data` VALUES ('75', '0', '所属小组', '商贸物流组', 'group', null, null, 'N', '0', '', '2020-06-01 16:14:26', '', '2020-06-01 20:36:55', null);
INSERT INTO `sys_dict_data` VALUES ('76', '0', '企业来源', '市内', 'Sourceofenterprise', null, null, 'N', '0', '', '2020-06-01 16:16:39', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('77', '0', '企业来源', '市外', 'Sourceofenterprise', null, null, 'N', '0', '', '2020-06-01 16:16:50', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('78', '0', '企业来源', '境外', 'Sourceofenterprise', null, null, 'N', '0', '', '2020-06-01 16:17:33', '', '2020-06-01 20:35:34', null);
INSERT INTO `sys_dict_data` VALUES ('79', '0', '企业来源', '领导交办', 'informationsources', null, null, 'N', '0', '', '2020-06-01 16:23:08', '', '2020-06-01 20:34:32', null);
INSERT INTO `sys_dict_data` VALUES ('80', '0', '主要参与单位', '区科技局', 'Company', null, null, 'N', '0', '', '2020-06-01 16:29:53', '', '2020-06-01 20:24:33', null);
INSERT INTO `sys_dict_data` VALUES ('81', '0', '项目类型', '楼宇类项目', 'Projecttype', null, null, 'N', '0', '', '2020-06-01 16:30:15', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('82', '0', '空间需求类型', '厂房', 'Spacedemand', null, null, 'N', '0', '', '2020-06-01 16:33:13', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('83', '0', '对接方式', '线下面谈', 'Dockingmode', null, null, 'N', '0', '', '2020-06-01 16:52:30', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('84', '0', '督办项目来源', '领导交办', 'Projectsupervision', null, null, 'N', '0', '', '2020-06-01 16:52:42', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('85', '0', '知识类别', '产业知识', 'Knowledgecategory', null, null, 'N', '0', '', '2020-06-01 16:52:58', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('86', '0', '主要领导', '区委书记', 'Mainleaders', null, null, 'N', '0', '', '2020-06-01 16:53:12', '', '2020-06-01 20:18:00', null);
INSERT INTO `sys_dict_data` VALUES ('87', '0', '高级荣誉', '无', 'honor', null, null, 'N', '0', '', '2020-06-01 16:53:27', '', '2020-06-30 12:08:56', null);
INSERT INTO `sys_dict_data` VALUES ('88', '0', '职称', '无', 'title', null, null, 'N', '0', '', '2020-06-01 16:53:40', '', '2020-06-30 12:07:18', null);
INSERT INTO `sys_dict_data` VALUES ('89', '0', '对接方式', '线上洽谈', 'Dockingmode', null, null, 'N', '0', '', '2020-06-01 20:15:05', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('90', '0', '督办项目来源', '市局推荐', 'Projectsupervision', null, null, 'N', '0', '', '2020-06-01 20:16:08', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('91', '0', '督办项目来源', '领导考察', 'Projectsupervision', null, null, 'N', '0', '', '2020-06-01 20:16:25', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('92', '0', '督办项目来源', '领导接待', 'Projectsupervision', null, null, 'N', '0', '', '2020-06-01 20:16:39', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('93', '0', '知识类别', '招商经验', 'Knowledgecategory', null, null, 'N', '0', '', '2020-06-01 20:17:10', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('94', '0', '知识类别', '商务礼仪', 'Knowledgecategory', null, null, 'N', '0', '', '2020-06-01 20:17:21', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('95', '0', '知识类别', '谈判技巧', 'Knowledgecategory', null, null, 'N', '0', '', '2020-06-01 20:17:33', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('96', '0', '主要领导', '区长', 'Mainleaders', null, null, 'N', '0', '', '2020-06-01 20:18:05', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('97', '0', '主要领导', '常务副区长', 'Mainleaders', null, null, 'N', '0', '', '2020-06-01 20:18:17', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('98', '0', '主要领导', '分管副区长', 'Mainleaders', null, null, 'N', '0', '', '2020-06-01 20:18:27', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('99', '0', '高级荣誉', '院士', 'honor', null, null, 'N', '0', '', '2020-06-01 20:19:38', '', '2020-06-30 12:08:51', null);
INSERT INTO `sys_dict_data` VALUES ('100', '0', '高级荣誉', '长江学者', 'honor', null, null, 'N', '0', '', '2020-06-01 20:19:51', '', '2020-06-30 12:08:40', null);
INSERT INTO `sys_dict_data` VALUES ('101', '0', '高级荣誉', '千人计划', 'honor', null, null, 'N', '0', '', '2020-06-01 20:20:02', '', '2020-06-30 12:08:33', null);
INSERT INTO `sys_dict_data` VALUES ('102', '0', '高级荣誉', '鸿雁计划', 'honor', null, null, 'N', '0', '', '2020-06-01 20:20:28', '', '2020-06-30 12:08:21', null);
INSERT INTO `sys_dict_data` VALUES ('103', '0', '职称', '高级经济师', 'title', null, null, 'N', '0', '', '2020-06-01 20:21:51', '', '2020-06-30 12:07:08', null);
INSERT INTO `sys_dict_data` VALUES ('104', '0', '职称', '副高级工程师', 'title', null, null, 'N', '0', '', '2020-06-01 20:21:59', '', '2020-06-30 12:06:57', null);
INSERT INTO `sys_dict_data` VALUES ('105', '0', '职称', '高级工程师', 'title', null, null, 'N', '0', '', '2020-06-01 20:22:44', '', '2020-06-30 12:06:37', null);
INSERT INTO `sys_dict_data` VALUES ('106', '0', '职称', '副教授', 'title', null, null, 'N', '0', '', '2020-06-01 20:22:51', '', '2020-06-30 12:06:25', null);
INSERT INTO `sys_dict_data` VALUES ('107', '0', '空间需求类型', '办公场所', 'Spacedemand', null, null, 'N', '0', '', '2020-06-01 20:23:16', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('108', '0', '空间需求类型', '土地', 'Spacedemand', null, null, 'N', '0', '', '2020-06-01 20:23:28', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('109', '0', '项目类型', '用地类项目', 'Projecttype', null, null, 'N', '0', '', '2020-06-01 20:23:46', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('110', '0', '主要参与单位', '区政协', 'Company', null, null, 'N', '0', '', '2020-06-01 20:24:50', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('111', '0', '主要参与单位', '区经信委', 'Company', null, null, 'N', '0', '', '2020-06-01 20:25:02', '', '2020-06-01 20:25:33', null);
INSERT INTO `sys_dict_data` VALUES ('112', '0', '主要参与单位', '区住建委', 'Company', null, null, 'N', '0', '', '2020-06-01 20:25:49', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('113', '0', '主要参与单位', '招商中心办公室', 'Company', null, null, 'N', '0', '', '2020-06-01 20:26:08', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('114', '0', '主要参与单位', '区商务委', 'Company', null, null, 'N', '0', '', '2020-06-01 20:26:21', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('115', '0', '主要参与单位', '区财政局', 'Company', null, null, 'N', '0', '', '2020-06-01 20:26:32', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('116', '0', '主要参与单位', '区文旅委', 'Company', null, null, 'N', '0', '', '2020-06-01 20:32:03', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('117', '0', '信息来源', '市局推荐', 'informationsources', null, null, 'N', '0', '', '2020-06-01 20:34:42', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('118', '0', '信息来源', '自主发掘', 'informationsources', null, null, 'N', '0', '', '2020-06-01 20:34:51', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('119', '0', '信息来源', '企业申请', 'informationsources', null, null, 'N', '0', '', '2020-06-01 20:35:07', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('120', '0', '企业来源', '港澳台地区', 'Sourceofenterprise', null, null, 'N', '0', '', '2020-06-01 20:35:55', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('121', '0', '所属小组', '新型金融组', 'group', null, null, 'N', '0', '', '2020-06-01 20:37:07', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('122', '0', '所属小组', '文化旅游组', 'group', null, null, 'N', '0', '', '2020-06-01 20:37:21', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('123', '0', '门类', '农、林、牧、渔业', 'menlei', null, null, 'N', '0', '', '2020-06-02 09:28:01', '', '2020-06-03 10:00:39', null);
INSERT INTO `sys_dict_data` VALUES ('125', '0', '大类', '农业', 'dalei', null, null, 'N', '0', '', '2020-06-02 09:30:06', '', '2020-06-04 10:19:00', null);
INSERT INTO `sys_dict_data` VALUES ('126', '0', '领导交办', '市局推荐', 'lingdaojiaoban', null, null, 'N', '0', '', '2020-06-02 09:35:49', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('127', '0', '区委书记', '自助发掘', 'quweishuji', null, null, 'N', '0', '', '2020-06-02 09:36:10', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('128', '0', '空间类型', '厂房', 'kongjianleixing', null, null, 'N', '0', '', '2020-06-02 09:40:40', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('129', '0', '空间数量', '亩', 'kongjianshuliang', null, null, 'N', '0', '', '2020-06-02 09:40:44', '', '2020-06-03 09:57:26', null);
INSERT INTO `sys_dict_data` VALUES ('130', '0', '空间数量', '平米', 'kongjianshuliang', null, null, 'N', '0', '', '2020-06-03 09:57:35', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('131', '0', '门类', '采矿业', 'menlei', null, null, 'N', '0', '', '2020-06-03 10:00:54', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('133', '0', '门类', '制造业', 'menlei', null, null, 'N', '0', '', '2020-06-03 10:01:42', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('134', '0', '门类', '电力、热力、燃气及水生产和供应业', 'menlei', null, null, 'N', '0', '', '2020-06-03 10:02:12', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('135', '0', '门类', '建筑业', 'menlei', null, null, 'N', '0', '', '2020-06-03 10:02:24', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('136', '0', '门类', '批发和零售业', 'menlei', null, null, 'N', '0', '', '2020-06-03 10:02:41', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('137', '0', '门类', '交通运输、仓储和邮政业', 'menlei', null, null, 'N', '0', '', '2020-06-03 10:03:23', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('138', '0', '门类', '住宿和餐饮业', 'menlei', null, null, 'N', '0', '', '2020-06-03 10:03:37', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('139', '0', '门类', '信息传输、软件和信息技术服务业', 'menlei', null, null, 'N', '0', '', '2020-06-03 10:03:49', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('140', '0', '门类', '金融业', 'menlei', null, null, 'N', '0', '', '2020-06-03 10:04:00', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('141', '0', '门类', '房地产业', 'menlei', null, null, 'N', '0', '', '2020-06-03 10:04:12', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('142', '0', '门类', '租赁和商务服务业', 'menlei', null, null, 'N', '0', '', '2020-06-03 10:04:23', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('143', '0', '门类', '科学研究和技术服务业', 'menlei', null, null, 'N', '0', '', '2020-06-03 10:04:38', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('144', '0', '门类', '水利、环境和公共设施管理业', 'menlei', null, null, 'N', '0', '', '2020-06-03 10:04:52', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('145', '0', '门类', '居民服务、修理和其他服务业', 'menlei', null, null, 'N', '0', '', '2020-06-03 10:05:04', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('146', '0', '门类', '教育', 'menlei', null, null, 'N', '0', '', '2020-06-03 10:05:15', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('147', '0', '门类', '卫生和社会工作', 'menlei', null, null, 'N', '0', '', '2020-06-03 10:05:29', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('148', '0', '门类', '文化、体育和娱乐业', 'menlei', null, null, 'N', '0', '', '2020-06-03 10:05:40', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('149', '0', '门类', '公共管理、社会保障和社会组织', 'menlei', null, null, 'N', '0', '', '2020-06-03 10:05:52', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('150', '0', '门类', '国际组织', 'menlei', null, null, 'N', '0', '', '2020-06-03 10:06:04', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('152', '0', '大类', '林业', 'dalei', null, null, 'N', '0', '', '2020-06-04 10:20:32', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('153', '0', '大类', '畜牧业', 'dalei', null, null, 'N', '0', '', '2020-06-04 10:20:42', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('154', '0', '大类', '渔业', 'dalei', null, null, 'N', '0', '', '2020-06-04 10:20:54', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('155', '0', '大类', '农、林、牧、渔服务业', 'dalei', null, null, 'N', '0', '', '2020-06-04 10:21:05', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('157', '0', '主要参与单位', '市级重大招商项目', 'art', null, null, 'N', '0', '', '2020-06-04 14:58:30', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('158', '0', '主要参与单位', '纳入市级考核', 'art', null, null, 'N', '0', '', '2020-06-04 14:59:45', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('159', '0', '主要参与单位', '西洽会签约项目', 'art', null, null, 'N', '0', '', '2020-06-04 15:00:07', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('160', '0', '主要参与单位', '世博会签约项目', 'art', null, null, 'N', '0', '', '2020-06-04 15:00:20', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('161', '0', '主要参与单位', '中心峰会签约项目', 'art', null, null, 'N', '0', '', '2020-06-04 15:00:40', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('163', '0', '空间单位', '亩', 'num', null, null, 'N', '0', '', '2020-06-05 11:07:04', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('164', '0', '空间单位', '平米', 'num', null, null, 'N', '0', '', '2020-06-05 11:07:09', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('165', '0', '所属产业', '第一产业', 'chanye', null, null, 'N', '0', '', '2020-06-18 10:53:24', '', '2020-06-18 20:02:55', null);
INSERT INTO `sys_dict_data` VALUES ('166', '0', '所属产业', '第二产业', 'chanye', null, null, 'N', '0', '', '2020-06-18 10:53:53', '', '2020-06-18 20:03:01', null);
INSERT INTO `sys_dict_data` VALUES ('167', '0', '所属产业', '第三产业', 'chanye', null, null, 'N', '0', '', '2020-06-18 10:54:08', '', '2020-06-18 20:03:06', null);
INSERT INTO `sys_dict_data` VALUES ('168', '0', '空间类型', '办公场所', 'kongjianleixing', null, null, 'N', '0', '', '2020-06-18 13:43:09', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('169', '0', '空间类型', '土地', 'kongjianleixing', null, null, 'N', '0', '', '2020-06-18 13:43:17', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('170', '0', '主要参与单位', '500强', 'art', null, null, 'N', '0', '', '2020-06-30 10:57:01', '', null, null);
INSERT INTO `sys_dict_data` VALUES ('171', '0', '职称', '教授', 'title', null, null, 'N', '0', '', '2020-06-30 12:05:36', '', '2020-06-30 12:06:16', null);
INSERT INTO `sys_dict_data` VALUES ('172', '0', '高级荣誉', '沙瓷计划', 'honor', null, null, 'N', '0', '', '2020-06-30 12:08:13', '', null, null);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE KEY `dict_type` (`dict_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES ('2', '菜单状态', 'sys_show_hide', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES ('3', '系统开关', 'sys_normal_disable', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统开关列表');
INSERT INTO `sys_dict_type` VALUES ('4', '任务状态', 'sys_job_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES ('5', '任务分组', 'sys_job_group', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务分组列表');
INSERT INTO `sys_dict_type` VALUES ('6', '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES ('7', '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知类型列表');
INSERT INTO `sys_dict_type` VALUES ('8', '通知状态', 'sys_notice_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES ('9', '操作类型', 'sys_oper_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES ('10', '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录状态列表');
INSERT INTO `sys_dict_type` VALUES ('11', '企业类型', 'company_type', '0', 'admin', '2020-04-21 16:24:22', '', null, '企业类型');
INSERT INTO `sys_dict_type` VALUES ('12', '了解溢捷的渠道', 'know_from', '0', 'admin', '2020-04-21 16:26:48', '', null, '了解溢捷的渠道');
INSERT INTO `sys_dict_type` VALUES ('13', '发货期限', 'delivery_date', '0', 'admin', '2020-04-21 16:30:40', '', null, '发货期限');
INSERT INTO `sys_dict_type` VALUES ('14', '审核状态', 'status', '0', 'admin', '2020-04-23 16:24:42', '', null, '会员审核状态');
INSERT INTO `sys_dict_type` VALUES ('15', '消息类型', 'message_type', '0', 'admin', '2020-04-30 15:39:52', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('16', '地区行政级别', 'region_level', '0', 'admin', '2020-05-06 09:34:58', '', null, null);
INSERT INTO `sys_dict_type` VALUES ('17', '领导交办', 'leader_ship', '0', '', null, '', null, null);
INSERT INTO `sys_dict_type` VALUES ('18', '区委书记', 'secretary_district', '0', '', null, '', null, null);
INSERT INTO `sys_dict_type` VALUES ('19', '所属行业', 'industry_involved', '0', '', null, '', null, null);
INSERT INTO `sys_dict_type` VALUES ('20', '所属小组', 'belong_group', '0', '', null, '', null, null);
INSERT INTO `sys_dict_type` VALUES ('21', '主要领导', 'system_leader', '0', '', null, '', null, null);
INSERT INTO `sys_dict_type` VALUES ('22', '门类', 'category_type', '0', '', null, '', null, null);
INSERT INTO `sys_dict_type` VALUES ('23', '项目类型', 'project_type', '0', '', null, '', null, null);
INSERT INTO `sys_dict_type` VALUES ('24', '空间类型', 'location_type', '0', '', null, '', null, null);
INSERT INTO `sys_dict_type` VALUES ('25', '空间数量', 'location_number', '0', '', null, '', null, null);
INSERT INTO `sys_dict_type` VALUES ('26', '参与单位', 'participate_unit', '0', '', null, '', null, null);
INSERT INTO `sys_dict_type` VALUES ('27', '职称', 'nick_name', '0', '', null, '', null, null);
INSERT INTO `sys_dict_type` VALUES ('28', '高级荣誉', 'honor_type', '0', '', null, '', null, null);
INSERT INTO `sys_dict_type` VALUES ('29', '大类', 'big_type', '0', '', null, '', null, null);
INSERT INTO `sys_dict_type` VALUES ('30', '信息来源', 'info_source', '0', '', null, '', null, null);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `url` varchar(200) DEFAULT '#' COMMENT '请求地址',
  `target` varchar(200) DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` varchar(200) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` varchar(200) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3053 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '个人中心', '0', '0', '/system/user', '', '', '0', null, '#', '', null, '', null, 'T0100000');
INSERT INTO `sys_menu` VALUES ('2', '我的工作', '1', '0', '/system/role', '', '', '0', null, '#', '', null, '', null, 'T0100001');
INSERT INTO `sys_menu` VALUES ('3', '数据看板', '1', '0', '/system/menu', '', '', '0', null, '#', '', null, '', null, 'T0100002');
INSERT INTO `sys_menu` VALUES ('4', '日程安排', '1', '0', '/system/dept', '', '', '0', null, '#', '', null, '', null, 'T0100003');
INSERT INTO `sys_menu` VALUES ('10', '项目管理', '0', '0', '/system/post', '', '', '0', null, '#', '', null, '', null, 'T0200000');
INSERT INTO `sys_menu` VALUES ('11', '项目查询', '10', '0', '/system/dict', '', '', '0', null, '#', '', null, '', null, 'T0200002');
INSERT INTO `sys_menu` VALUES ('12', '新建项目', '10', '0', '/system/config', '', '', '0', null, '#', '', null, '', null, 'T0200003');
INSERT INTO `sys_menu` VALUES ('13', '督办项目', '10', '0', '/system/notice', '', '', '0', null, '#', '', null, '', null, 'T0200004');
INSERT INTO `sys_menu` VALUES ('14', '在谈项目', '10', '0', '/monitor/online', '', '', '0', null, '#', '', null, '', null, 'T0200005');
INSERT INTO `sys_menu` VALUES ('15', '拟签约项目', '10', '0', '#', '', '', '0', null, '#', '', null, '', null, 'T0200006');
INSERT INTO `sys_menu` VALUES ('16', '已签约项目', '10', '0', '#', '', '', '0', null, '#', '', null, '', null, 'T0200007');
INSERT INTO `sys_menu` VALUES ('17', '暂停项目', '10', '0', '#', '', '', '0', null, '#', '', null, '', null, 'T0200008');
INSERT INTO `sys_menu` VALUES ('18', '终止项目', '10', '0', '#', '', '', '0', null, '#', '', null, '', null, 'T0200009');
INSERT INTO `sys_menu` VALUES ('30', '考察管理', '0', '0', '#', '', '', '0', null, '#', '', null, '', null, 'T0300000');
INSERT INTO `sys_menu` VALUES ('31', '考察管理', '30', '0', '#', '', '', '0', null, '#', '', null, '', null, 'T0300001');
INSERT INTO `sys_menu` VALUES ('32', '考察管理', '31', '0', '#', '', '', '0', null, '#', '', null, '', null, 'T0300002');
INSERT INTO `sys_menu` VALUES ('33', '新增考察', '31', '0', '#', '', '', '0', null, '#', '', null, '', null, 'T0300003');
INSERT INTO `sys_menu` VALUES ('35', '接待管理', '30', '0', '#', '', '', '0', null, '#', '', null, '', null, 'T0300004');
INSERT INTO `sys_menu` VALUES ('36', '接待管理', '35', '0', '#', '', '', '0', null, '#', '', null, '', null, 'T0300005');
INSERT INTO `sys_menu` VALUES ('37', '新增接待', '35', '0', '#', '', '', '0', null, '#', '', null, '', null, 'T0300006');
INSERT INTO `sys_menu` VALUES ('40', '投促管理', '0', '0', '#', '', '', '0', null, '#', '', null, '', null, 'T0400000');
INSERT INTO `sys_menu` VALUES ('41', '用地类项目', '40', '0', '#', '', '', '0', null, '#', '', null, '', null, 'T0400001');
INSERT INTO `sys_menu` VALUES ('42', '楼宇类项目', '40', '0', '#', '', '', '0', null, '#', '', null, '', null, 'T0400002');
INSERT INTO `sys_menu` VALUES ('50', '知识管理', '0', '0', '#', '', '', '0', null, '#', '', null, '', null, 'T0500000');
INSERT INTO `sys_menu` VALUES ('51', '知识新增', '50', '0', '#', '', '', '0', null, '#', '', null, '', null, 'T0500001');
INSERT INTO `sys_menu` VALUES ('52', '产业知识', '50', '0', '#', '', '', '0', null, '#', '', null, '', null, 'T0500002');
INSERT INTO `sys_menu` VALUES ('53', '招商经验', '50', '0', '#', '', '', '0', null, '#', '', null, '', null, 'T0500003');
INSERT INTO `sys_menu` VALUES ('54', '商务礼仪', '50', '0', '#', '', '', '0', null, '#', '', null, '', null, 'T0500004');
INSERT INTO `sys_menu` VALUES ('55', '谈判技巧', '50', '0', '#', '', '', '0', null, '#', '', null, '', null, 'T0500005');
INSERT INTO `sys_menu` VALUES ('60', '报送管理', '0', '0', '#', '', '', '0', null, '#', '', null, '', null, 'T0600000');
INSERT INTO `sys_menu` VALUES ('61', '日报报送', '60', '0', '#', '', '', '0', null, '#', '', null, '', null, 'T0600001');
INSERT INTO `sys_menu` VALUES ('70', '系统设置', '0', '0', '#', '', '', '0', null, '#', '', null, '', null, 'T0700000');
INSERT INTO `sys_menu` VALUES ('71', '配置管理', '70', '0', '#', '', '', '0', null, '#', '', null, '', null, 'T0700001');
INSERT INTO `sys_menu` VALUES ('72', '所属小组', '71', '0', '#', '', '', '0', null, '#', '', null, '', null, 'T0700002');
INSERT INTO `sys_menu` VALUES ('73', '企业来源', '71', '0', '#', '', '', '0', null, '#', '', null, '', null, 'T0700003');
INSERT INTO `sys_menu` VALUES ('74', '信息来源', '71', '0', '#', '', '', '0', null, '#', '', null, '', null, 'T0700004');
INSERT INTO `sys_menu` VALUES ('75', '领导交办', '74', '0', '#', '', '', '0', null, '#', '', null, '', null, 'T0700005');
INSERT INTO `sys_menu` VALUES ('76', '区委书记', '74', '0', '#', '', '', '0', null, '#', '', null, '', null, 'T0700006');
INSERT INTO `sys_menu` VALUES ('77', '主要参与单位', '71', '0', '#', '', '', '0', null, '#', '', null, '', null, 'T0700007');
INSERT INTO `sys_menu` VALUES ('78', '项目类型', '71', '0', '#', '', '', '0', null, '#', '', null, '', null, 'T0700008');
INSERT INTO `sys_menu` VALUES ('79', '空间需求', '71', '0', '#', '', '', '0', null, '#', '', null, '', null, 'T0700009');
INSERT INTO `sys_menu` VALUES ('80', '空间类型', '79', '0', '#', '', '', '0', null, '#', '', null, '', null, 'T0700010');
INSERT INTO `sys_menu` VALUES ('81', '空间数量', '79', '0', '#', '', '', '0', null, '#', '', null, '', null, 'T0700011');
INSERT INTO `sys_menu` VALUES ('82', '空间单位', '79', '0', '#', '', '', '0', null, '#', '', null, '', null, 'T0700012');
INSERT INTO `sys_menu` VALUES ('83', '职称', '71', '0', '#', '', '', '0', null, '#', '', null, '', null, 'T0700013');
INSERT INTO `sys_menu` VALUES ('84', '职务', '71', '0', '#', '', '', '0', null, '#', '', null, '', null, 'T0700014');
INSERT INTO `sys_menu` VALUES ('85', '高级荣誉', '71', '0', '#', '', '', '0', null, '#', '', null, '', null, 'T0700015');
INSERT INTO `sys_menu` VALUES ('86', '所属产业', '71', '0', '#', '', '', '0', null, '#', '', null, '', null, 'T0700016');
INSERT INTO `sys_menu` VALUES ('87', '主要领导', '71', '0', '#', '', '', '0', null, '#', '', null, '', null, 'T0700017');
INSERT INTO `sys_menu` VALUES ('88', '知识类别', '71', '0', '#', '', '', '0', null, '#', '', null, '', null, 'T0700018');
INSERT INTO `sys_menu` VALUES ('89', '督办项目来源', '71', '0', '#', '', '', '0', null, '#', '', null, '', null, 'T0700019');
INSERT INTO `sys_menu` VALUES ('90', '对接方式', '71', '0', '#', '', '', '0', null, '#', '', null, '', null, 'T0700020');
INSERT INTO `sys_menu` VALUES ('91', '所属行业', '71', '0', '#', '', '', '0', null, '#', '', null, '', null, 'T0700021');
INSERT INTO `sys_menu` VALUES ('92', '项目画像', '71', '0', '#', '', '', '0', null, '#', '', null, '', null, 'T0700022');
INSERT INTO `sys_menu` VALUES ('100', '系统管理', '70', '0', '#', '', '', '0', null, '#', '', null, '', null, 'T0700023');
INSERT INTO `sys_menu` VALUES ('101', '组织管理', '100', '0', '#', '', '', '0', null, '#', '', null, '', null, 'T0700024');
INSERT INTO `sys_menu` VALUES ('102', '角色管理', '100', '0', '#', '', '', '0', null, '#', '', null, '', null, 'T0700025');
INSERT INTO `sys_menu` VALUES ('103', '角色管理', '102', '0', '#', '', '', '0', null, '#', '', null, '', null, 'T0700026');
INSERT INTO `sys_menu` VALUES ('104', '新增角色', '102', '0', '#', '', '', '0', null, '#', '', null, '', null, 'T0700027');
INSERT INTO `sys_menu` VALUES ('110', '用户管理', '100', '0', '#', '', '', '0', null, '#', '', null, '', null, 'T0700028');
INSERT INTO `sys_menu` VALUES ('111', '用户管理', '110', '0', '#', '', '', '0', null, '#', '', null, '', null, 'T0700029');
INSERT INTO `sys_menu` VALUES ('112', '新增用户', '110', '0', '#', '', '', '0', null, '#', '', null, '', null, 'T0700030');
INSERT INTO `sys_menu` VALUES ('150', '审批管理', '0', '0', '#', '', '', '0', null, '#', '', null, '', null, 'T0800000');
INSERT INTO `sys_menu` VALUES ('151', '审批设置', '150', '0', '#', '', '', '0', null, '#', '', null, '', null, 'T0800001');

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) DEFAULT NULL COMMENT '父级权限id',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `value` varchar(200) DEFAULT NULL COMMENT '权限值',
  `icon` varchar(500) DEFAULT NULL COMMENT '图标',
  `type` int(1) DEFAULT NULL COMMENT '权限类型：0->目录；1->菜单；2->按钮（接口绑定权限）',
  `uri` varchar(200) DEFAULT NULL COMMENT '前端资源路径',
  `status` int(1) DEFAULT NULL COMMENT '启用状态；0->禁用；1->启用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='后台用户权限表';

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES ('1', '0', '商品', null, null, '0', '8#', '0', '2018-09-29 16:15:14', '0');
INSERT INTO `sys_permission` VALUES ('2', '1', '商品列表', 'pms:product:read', null, '1', '/api/dept/getone', '0', '2018-09-29 16:17:01', '0');
INSERT INTO `sys_permission` VALUES ('3', '1', '添加商品', 'pms:product:create', null, '1', '/api/dept/parentDept', '0', '2018-09-29 16:18:51', '0');
INSERT INTO `sys_permission` VALUES ('4', '1', '商品分类', 'pms:productCategory:read', null, '1', '#', '0', '2018-09-29 16:23:07', '0');
INSERT INTO `sys_permission` VALUES ('5', '1', '商品类型', 'pms:productAttribute:read', null, '1', '/pms/productAttr/index', '0', '2018-09-29 16:24:43', '0');
INSERT INTO `sys_permission` VALUES ('6', '1', '品牌管理', 'pms:brand:read', null, '1', '/pms/brand/index', '0', '2018-09-29 16:25:45', '0');
INSERT INTO `sys_permission` VALUES ('7', '2', '编辑商品', 'pms:product:update', null, '2', '/pms/product/updateProduct', '0', '2018-09-29 16:34:23', '0');
INSERT INTO `sys_permission` VALUES ('8', '2', '删除商品', 'pms:product:delete', null, '2', '/pms/product/delete', '0', '2018-09-29 16:38:33', '0');
INSERT INTO `sys_permission` VALUES ('9', '4', '添加商品分类', 'pms:productCategory:create', null, '2', '/pms/productCate/create', '0', '2018-09-29 16:43:23', '0');
INSERT INTO `sys_permission` VALUES ('10', '4', '修改商品分类', 'pms:productCategory:update', null, '2', '/pms/productCate/update', '0', '2018-09-29 16:43:55', '0');
INSERT INTO `sys_permission` VALUES ('11', '4', '删除商品分类', 'pms:productCategory:delete', null, '2', '/pms/productAttr/delete', '0', '2018-09-29 16:44:38', '0');
INSERT INTO `sys_permission` VALUES ('12', '5', '添加商品类型', 'pms:productAttribute:create', null, '2', '/pms/productAttr/create', '0', '2018-09-29 16:45:25', '0');
INSERT INTO `sys_permission` VALUES ('13', '5', '修改商品类型', 'pms:productAttribute:update', null, '2', '/pms/productAttr/update', '0', '2018-09-29 16:48:08', '0');
INSERT INTO `sys_permission` VALUES ('14', '5', '删除商品类型', 'pms:productAttribute:delete', null, '2', '/pms/productAttr/delete', '0', '2018-09-29 16:48:44', '0');
INSERT INTO `sys_permission` VALUES ('15', '6', '添加品牌', 'pms:brand:create', null, '2', '/pms/brand/add', '0', '2018-09-29 16:49:34', '0');
INSERT INTO `sys_permission` VALUES ('16', '6', '修改品牌', 'pms:brand:update', null, '2', '/pms/brand/update', '0', '2018-09-29 16:50:55', '0');
INSERT INTO `sys_permission` VALUES ('17', '6', '删除品牌', 'pms:brand:delete', null, '2', '/api/dept/getone', '0', '2018-09-29 16:50:59', '0');
INSERT INTO `sys_permission` VALUES ('18', '0', '首页', null, null, '0', '/api/SysUser/getUserInfoList', '0', '2018-09-29 16:51:57', '0');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) DEFAULT NULL COMMENT '显示顺序',
  `data_scope` varchar(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` varchar(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` varchar(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '系统超级管理员', '系统超级管理员', null, '1', '0', '0', 'admin', '2020-06-19 16:58:10', '', '2020-06-19 16:58:07', '系统超级管理员');
INSERT INTO `sys_role` VALUES ('2', '管理员', 'admin', '1', '1', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_role` VALUES ('3', '普通角色', 'common', '2', '2', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '普通角色');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  `rights` varchar(255) DEFAULT NULL COMMENT 'crud权限',
  PRIMARY KEY (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '1', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '2', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '3', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '4', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '10', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '11', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '12', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '13', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '14', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '15', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '16', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '17', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '18', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '30', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '31', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '32', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '33', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '35', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '36', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '37', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '40', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '41', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '42', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '50', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '51', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '52', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '53', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '54', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '55', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '60', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '61', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '70', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '71', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '72', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '73', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '74', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '75', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '76', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '77', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '78', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '79', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '80', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '81', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '82', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '83', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '84', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '85', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '86', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '87', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '88', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '89', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '90', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '91', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '92', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '100', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '101', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '102', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '103', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '104', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '110', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '111', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '112', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '150', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '151', '0');
INSERT INTO `sys_role_menu` VALUES ('2', '1', '0');
INSERT INTO `sys_role_menu` VALUES ('2', '2', '0');
INSERT INTO `sys_role_menu` VALUES ('2', '3', '0');
INSERT INTO `sys_role_menu` VALUES ('2', '4', '0');
INSERT INTO `sys_role_menu` VALUES ('2', '10', '0');
INSERT INTO `sys_role_menu` VALUES ('2', '11', '0');
INSERT INTO `sys_role_menu` VALUES ('2', '12', '0');
INSERT INTO `sys_role_menu` VALUES ('2', '13', '0');
INSERT INTO `sys_role_menu` VALUES ('2', '14', '0');
INSERT INTO `sys_role_menu` VALUES ('2', '15', '0');
INSERT INTO `sys_role_menu` VALUES ('2', '16', '0');
INSERT INTO `sys_role_menu` VALUES ('2', '17', '0');
INSERT INTO `sys_role_menu` VALUES ('2', '18', '0');
INSERT INTO `sys_role_menu` VALUES ('2', '30', '0');
INSERT INTO `sys_role_menu` VALUES ('2', '31', '0');
INSERT INTO `sys_role_menu` VALUES ('2', '32', '0');
INSERT INTO `sys_role_menu` VALUES ('2', '33', '0');
INSERT INTO `sys_role_menu` VALUES ('2', '35', '0');
INSERT INTO `sys_role_menu` VALUES ('2', '36', '0');
INSERT INTO `sys_role_menu` VALUES ('2', '37', '0');
INSERT INTO `sys_role_menu` VALUES ('2', '40', '0');
INSERT INTO `sys_role_menu` VALUES ('2', '41', '0');
INSERT INTO `sys_role_menu` VALUES ('2', '42', '0');
INSERT INTO `sys_role_menu` VALUES ('2', '50', '0');
INSERT INTO `sys_role_menu` VALUES ('2', '51', '0');
INSERT INTO `sys_role_menu` VALUES ('2', '52', '0');
INSERT INTO `sys_role_menu` VALUES ('2', '53', '0');
INSERT INTO `sys_role_menu` VALUES ('2', '54', '0');
INSERT INTO `sys_role_menu` VALUES ('2', '55', '0');
INSERT INTO `sys_role_menu` VALUES ('2', '60', '0');
INSERT INTO `sys_role_menu` VALUES ('2', '61', '0');
INSERT INTO `sys_role_menu` VALUES ('3', '1', '0');
INSERT INTO `sys_role_menu` VALUES ('3', '2', '0');
INSERT INTO `sys_role_menu` VALUES ('3', '3', '0');
INSERT INTO `sys_role_menu` VALUES ('3', '3050', '0');
INSERT INTO `sys_role_menu` VALUES ('3', '3051', '0');
INSERT INTO `sys_role_menu` VALUES ('3', '3052', '0');

-- ----------------------------
-- Table structure for sys_role_permission_relation
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission_relation`;
CREATE TABLE `sys_role_permission_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL,
  `permission_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='后台用户角色和权限关系表';

-- ----------------------------
-- Records of sys_role_permission_relation
-- ----------------------------
INSERT INTO `sys_role_permission_relation` VALUES ('1', '1', '1');
INSERT INTO `sys_role_permission_relation` VALUES ('2', '1', '2');
INSERT INTO `sys_role_permission_relation` VALUES ('3', '1', '3');
INSERT INTO `sys_role_permission_relation` VALUES ('4', '1', '4');
INSERT INTO `sys_role_permission_relation` VALUES ('5', '1', '8');
INSERT INTO `sys_role_permission_relation` VALUES ('6', '2', '4');
INSERT INTO `sys_role_permission_relation` VALUES ('7', '2', '9');
INSERT INTO `sys_role_permission_relation` VALUES ('8', '2', '10');
INSERT INTO `sys_role_permission_relation` VALUES ('9', '2', '11');
INSERT INTO `sys_role_permission_relation` VALUES ('10', '3', '5');
INSERT INTO `sys_role_permission_relation` VALUES ('11', '3', '12');
INSERT INTO `sys_role_permission_relation` VALUES ('12', '3', '13');
INSERT INTO `sys_role_permission_relation` VALUES ('13', '3', '14');
INSERT INTO `sys_role_permission_relation` VALUES ('14', '4', '6');
INSERT INTO `sys_role_permission_relation` VALUES ('15', '4', '15');
INSERT INTO `sys_role_permission_relation` VALUES ('16', '4', '16');
INSERT INTO `sys_role_permission_relation` VALUES ('17', '4', '17');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `login_name` varchar(30) NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) DEFAULT '' COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户 01注册用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(255) DEFAULT '' COMMENT '盐加密',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'superadmin', 'admin', '00', '929876935@qq.com', '15683108350', '0', '', 'MTIz', 'c9de7f', '104', '0', '0', '127.0.0.1', '2020-04-17 14:38:22', 'admin', '2020-04-17 14:38:01', '', '2020-04-17 14:38:21', '超级管理员');
INSERT INTO `sys_user` VALUES ('2', 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', 'MTIz', '111111', '103', '0', '0', '127.0.0.1', '2020-05-14 09:44:19', 'admin', '2018-03-16 11:33:00', 'ry', '2020-05-14 09:44:17', '领导');
INSERT INTO `sys_user` VALUES ('3', '测试部门部门-001', '测试部门部门-001', '00', 'ry@qq.com', '15666666666', '1', '', 'MTIz', '222222', '105', '0', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '员工');
INSERT INTO `sys_user` VALUES ('4', '研发部门-001', '研发部门-001', '00', '1234@outlook.com', '15666666666', '0', '', 'MTIz', '222222', '103', '0', '0', '', null, '', null, '', '2020-06-19 16:54:41', '员工');
INSERT INTO `sys_user` VALUES ('5', '研发部门-002', '研发部门-002', '00', '1234@outlook.com', '15683108350', '1', '', 'MTIz', '1561561', '108', '0', '0', '', null, '', '2020-06-19 16:56:03', '', '2020-06-19 16:55:43', '员工');
INSERT INTO `sys_user` VALUES ('11', 'superadmin00122', 'superme', '00', '1234@outlook.com', '12345677', '0', '', 'MTIz', 'cf2d6bd7-8ff6-4302-8783-86748aa0ad77', '103', '0', '1', '', null, '3', '2020-05-19 16:08:32', 'admin', '2020-05-19 16:38:02', null);
INSERT INTO `sys_user` VALUES ('12', 'superadmin00122222', 'superme', '00', '1234@outlook.com', '12345677', '0', '', 'MTIz', '9c2889dc-e1ae-4796-985d-37a30685db68', '104', '0', '1', '', null, '', '2020-05-19 16:30:31', 'admin', '2020-05-19 16:30:31', null);
INSERT INTO `sys_user` VALUES ('13', '办公室001', '办公室001', '00', '', '', '0', '', 'MTIz', '', null, '0', '0', '', null, '', '2020-06-28 14:52:57', '', '2020-06-28 14:53:08', '员工');
INSERT INTO `sys_user` VALUES ('14', '办公室002', '办公室002', '00', '', '', '0', '', 'MTIz', '', null, '0', '0', '', null, '', null, '', null, '员工');
INSERT INTO `sys_user` VALUES ('15', '办公室003', '办公室003', '00', '', '', '0', '', 'MTIz', '', null, '0', '0', '', null, '', null, '', null, '员工');
INSERT INTO `sys_user` VALUES ('16', '办公室004', '办公室004', '00', '', '', '0', '', 'MTIz', '', null, '0', '0', '', null, '', null, '', null, '员工');
INSERT INTO `sys_user` VALUES ('17', '办公室005', '办公室005', '00', '', '', '0', '', 'MTIz', '', null, '0', '0', '', null, '', null, '', null, '员工');
INSERT INTO `sys_user` VALUES ('18', '市场部门001', '市场部门001', '00', '', '', '0', '', 'MTIz', '', null, '0', '0', '', null, '', null, '', null, '员工');
INSERT INTO `sys_user` VALUES ('19', '市场部门002', '市场部门002', '00', '', '', '0', '', 'MTIz', '', null, '0', '0', '', null, '', null, '', null, '员工');
INSERT INTO `sys_user` VALUES ('20', '市场部门003', '市场部门003', '00', '', '', '0', '', 'MTIz', '', null, '0', '0', '', null, '', null, '', null, '员工');
INSERT INTO `sys_user` VALUES ('21', '市场部门004', '市场部门004', '00', '', '', '0', '', 'MTIz', '', null, '0', '0', '', null, '', null, '', null, '员工');
INSERT INTO `sys_user` VALUES ('22', '市场部门005', '市场部门005', '00', '', '', '0', '', 'MTIz', '', null, '0', '0', '', null, '', null, '', null, '员工');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('1', '1');
INSERT INTO `sys_user_post` VALUES ('2', '2');
INSERT INTO `sys_user_post` VALUES ('3', '1');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` varchar(20) NOT NULL COMMENT '用户ID',
  `role_id` varchar(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('13', '1');
INSERT INTO `sys_user_role` VALUES ('14', '1');
INSERT INTO `sys_user_role` VALUES ('15', '1');
INSERT INTO `sys_user_role` VALUES ('16', '1');
INSERT INTO `sys_user_role` VALUES ('17', '1');
INSERT INTO `sys_user_role` VALUES ('18', '1');
INSERT INTO `sys_user_role` VALUES ('19', '1');
INSERT INTO `sys_user_role` VALUES ('2', '1');
INSERT INTO `sys_user_role` VALUES ('20', '1');
INSERT INTO `sys_user_role` VALUES ('21', '1');
INSERT INTO `sys_user_role` VALUES ('22', '1');
INSERT INTO `sys_user_role` VALUES ('23', '1');
INSERT INTO `sys_user_role` VALUES ('3', '1');
INSERT INTO `sys_user_role` VALUES ('4', '1');
INSERT INTO `sys_user_role` VALUES ('5', '1');
