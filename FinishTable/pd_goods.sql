/*
 Navicat Premium Data Transfer

 Source Server         : smilecat.gaoshuye.top
 Source Server Type    : MySQL
 Source Server Version : 80030 (8.0.30)
 Source Host           : 127.0.0.1:3306
 Source Schema         : pd_goods

 Target Server Type    : MySQL
 Target Server Version : 80030 (8.0.30)
 File Encoding         : 65001

 Date: 14/09/2022 20:28:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for pd_goods_info
-- ----------------------------
DROP TABLE IF EXISTS `pd_goods_info`;
CREATE TABLE `pd_goods_info`  (
  `id` bigint NOT NULL COMMENT '商品ID',
  `code` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '商品编码',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '商品名称',
  `bar_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '国条码',
  `brand_id` bigint NULL DEFAULT NULL COMMENT '品牌表ID',
  `one_category_id` bigint NULL DEFAULT NULL COMMENT '一级分类ID',
  `two_category_id` bigint NULL DEFAULT NULL COMMENT '二级分类ID',
  `three_category_id` bigint NULL DEFAULT NULL COMMENT '三级分类ID',
  `supplier_id` bigint NULL DEFAULT NULL COMMENT '商品的供应商ID',
  `price` decimal(8, 2) NOT NULL COMMENT '商品售价价格',
  `average_cost` decimal(18, 2) NOT NULL COMMENT '商品加权平均成本',
  `publish_status` tinyint NOT NULL DEFAULT 0 COMMENT '上下架状态:0下架，1上架',
  `audit_status` tinyint NOT NULL DEFAULT 0 COMMENT '审核状态: 0未审核，1已审核',
  `weight` float NULL DEFAULT NULL COMMENT '商品重量',
  `length` float NULL DEFAULT NULL COMMENT '商品长度',
  `height` float NULL DEFAULT NULL COMMENT '商品重量',
  `width` float NULL DEFAULT NULL COMMENT '商品宽度',
  `color` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '颜色',
  `production_date` datetime NOT NULL COMMENT '生产日期',
  `shelf_life` int NOT NULL COMMENT '商品有效期',
  `descript` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '商品描述',
  `update_time` datetime NULL DEFAULT NULL,
  `update_user` bigint NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `create_user` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '商品信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pd_goods_info
-- ----------------------------
INSERT INTO `pd_goods_info` VALUES (698106238453416065, '456789', '士力架', NULL, NULL, NULL, NULL, NULL, NULL, 10.00, 5.00, 1, 1, 0.1, 0.2, 0.1, 0.4, '红色', '2020-04-10 09:42:41', 5, NULL, '2020-04-10 09:44:58', 3, '2020-04-10 09:44:58', 3);
INSERT INTO `pd_goods_info` VALUES (698112493741932705, '1231231', 'BabiQ', NULL, NULL, NULL, NULL, NULL, NULL, 28.00, 20.00, 0, 1, 1, 0.5, 0.1, 0.3, '红色', '2020-04-10 10:09:41', 180, NULL, '2020-04-10 10:09:49', 3, '2020-04-10 10:09:49', 3);

SET FOREIGN_KEY_CHECKS = 1;
