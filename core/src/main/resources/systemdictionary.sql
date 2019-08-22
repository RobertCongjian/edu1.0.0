/*
Navicat MySQL Data Transfer

Source Server         : mysql_localhost
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : gxa_eloan

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2019-08-21 09:01:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for systemdictionary
-- ----------------------------
DROP TABLE IF EXISTS `systemdictionary`;
CREATE TABLE `systemdictionary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sn` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `intro` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of systemdictionary
-- ----------------------------
INSERT INTO `systemdictionary` VALUES ('1', 'incomeGrade', '月收入', null);
INSERT INTO `systemdictionary` VALUES ('2', 'educationBackground', '学历', null);
INSERT INTO `systemdictionary` VALUES ('3', 'marriage', '婚姻', null);
INSERT INTO `systemdictionary` VALUES ('4', 'kidCount', '子女', null);
INSERT INTO `systemdictionary` VALUES ('5', 'houseCondition', '住房条件', null);
INSERT INTO `systemdictionary` VALUES ('6', 'userFileType', '风控资料类型', null);

-- ----------------------------
-- Table structure for systemdictionaryitem
-- ----------------------------
DROP TABLE IF EXISTS `systemdictionaryitem`;
CREATE TABLE `systemdictionaryitem` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parentId` bigint(20) NOT NULL,
  `title` varchar(50) NOT NULL,
  `tvalue` varchar(50) DEFAULT NULL,
  `sequence` tinyint(4) NOT NULL,
  `intro` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of systemdictionaryitem
-- ----------------------------
INSERT INTO `systemdictionaryitem` VALUES ('1', '1', '3000以下', null, '1', null);
INSERT INTO `systemdictionaryitem` VALUES ('2', '1', '3000~5000', null, '2', null);
INSERT INTO `systemdictionaryitem` VALUES ('3', '2', '大专以下', null, '1', null);
INSERT INTO `systemdictionaryitem` VALUES ('4', '2', '大专', null, '2', null);
INSERT INTO `systemdictionaryitem` VALUES ('5', '3', '已婚', null, '1', null);
INSERT INTO `systemdictionaryitem` VALUES ('6', '3', '未婚', null, '2', null);
INSERT INTO `systemdictionaryitem` VALUES ('7', '4', '有子女', null, '1', null);
INSERT INTO `systemdictionaryitem` VALUES ('8', '4', '无子女', null, '2', null);
INSERT INTO `systemdictionaryitem` VALUES ('9', '5', '有自有房', null, '1', null);
INSERT INTO `systemdictionaryitem` VALUES ('10', '5', '无自有房', null, '2', null);
INSERT INTO `systemdictionaryitem` VALUES ('11', '5', '租房', null, '3', null);
INSERT INTO `systemdictionaryitem` VALUES ('12', '6', '房产证正面', null, '1', null);
INSERT INTO `systemdictionaryitem` VALUES ('13', '6', '房产证反面', null, '2', null);
INSERT INTO `systemdictionaryitem` VALUES ('14', '6', '户口本', null, '3', null);
INSERT INTO `systemdictionaryitem` VALUES ('15', '6', '结婚证', null, '4', null);
INSERT INTO `systemdictionaryitem` VALUES ('16', '6', '银行流水证明', null, '5', null);
INSERT INTO `systemdictionaryitem` VALUES ('17', '6', '学位证', null, '6', null);
INSERT INTO `systemdictionaryitem` VALUES ('18', '6', '毕业证', null, '7', null);
INSERT INTO `systemdictionaryitem` VALUES ('19', '6', '电话记录', null, '7', null);

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `bitState` bigint(20) NOT NULL,
  `realName` varchar(30) DEFAULT NULL,
  `idNumber` varchar(30) DEFAULT NULL,
  `phoneNumber` varchar(30) DEFAULT NULL,
  `incomeGrade_id` bigint(20) DEFAULT NULL,
  `marriage_id` bigint(20) DEFAULT NULL,
  `kidCount_id` bigint(20) DEFAULT NULL,
  `educationBackground_id` bigint(20) DEFAULT NULL,
  `authScore` int(11) DEFAULT NULL,
  `houseCondition_id` bigint(20) DEFAULT NULL,
  `realauthid` bigint(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('4', '22', '63', '??', '510108000000000000', '13912345678', '2', '6', '8', '4', '33', '11', '2', null);
INSERT INTO `userinfo` VALUES ('6', '0', '1', null, null, null, null, null, null, null, '0', null, null, null);
INSERT INTO `userinfo` VALUES ('7', '4', '63', '哈哈哈', '510108111111111112', '13800138000', '2', '6', '7', '4', '0', '9', '3', 'stea@qq.com');
INSERT INTO `userinfo` VALUES ('10', '0', '1', null, null, '', null, null, null, null, '0', null, null, null);
INSERT INTO `userinfo` VALUES ('53', '0', '0', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `userinfo` VALUES ('56', '0', '0', null, null, null, null, null, null, null, null, null, null, null);
