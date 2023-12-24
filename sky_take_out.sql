/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : sky_take_out

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 13/12/2023 12:49:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address_book
-- ----------------------------
DROP TABLE IF EXISTS `address_book`;
CREATE TABLE `address_book`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `consignee` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '收货人',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '性别',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '手机号',
  `province_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '省级区划编号',
  `province_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '省级名称',
  `city_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '市级区划编号',
  `city_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '市级名称',
  `district_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '区级区划编号',
  `district_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '区级名称',
  `detail` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '详细地址',
  `label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标签',
  `is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '默认 0 否 1是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '地址簿' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address_book
-- ----------------------------
INSERT INTO `address_book` VALUES (2, 4, 'hzx', '0', '13248689999', '33', '浙江省', '3301', '杭州市', '330102', '上城区', '美丽花园88栋5单元607', '2', 1);
INSERT INTO `address_book` VALUES (3, 4, '小红', '1', '13248684444', '11', '北京市', '1101', '市辖区', '110102', '西城区', '12345687', '1', 0);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` int NULL DEFAULT NULL COMMENT '类型   1 菜品分类 2 套餐分类',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '分类名称',
  `sort` int NOT NULL DEFAULT 0 COMMENT '顺序',
  `status` int NULL DEFAULT NULL COMMENT '分类状态 0:禁用，1:启用',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_category_name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '菜品及套餐分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (11, 1, '酒水饮料', 10, 0, '2022-06-09 22:09:18', '2022-06-09 22:09:18', 1, 1);
INSERT INTO `category` VALUES (12, 1, '传统主食', 9, 1, '2022-06-09 22:09:32', '2022-06-09 22:18:53', 1, 1);
INSERT INTO `category` VALUES (13, 2, '人气套餐', 12, 1, '2022-06-09 22:11:38', '2022-06-10 11:04:40', 1, 1);
INSERT INTO `category` VALUES (15, 2, '商务套餐', 13, 1, '2022-06-09 22:14:10', '2022-06-10 11:04:48', 1, 1);
INSERT INTO `category` VALUES (16, 1, '蜀味烤鱼', 4, 1, '2022-06-09 22:15:37', '2023-07-20 21:33:30', 1, 1);
INSERT INTO `category` VALUES (17, 1, '蜀味牛蛙', 5, 1, '2022-06-09 22:16:14', '2022-08-31 14:39:44', 1, 1);
INSERT INTO `category` VALUES (18, 1, '特色蒸菜', 6, 1, '2022-06-09 22:17:42', '2022-06-09 22:17:42', 1, 1);
INSERT INTO `category` VALUES (19, 1, '新鲜时蔬', 7, 0, '2022-06-09 22:18:12', '2022-06-09 22:18:28', 1, 1);
INSERT INTO `category` VALUES (20, 1, '水煮鱼', 8, 1, '2022-06-09 22:22:29', '2022-06-09 22:23:45', 1, 1);
INSERT INTO `category` VALUES (21, 1, '汤类', 11, 1, '2022-06-10 10:51:47', '2022-06-10 10:51:47', 1, 1);
INSERT INTO `category` VALUES (26, 1, 'aaaa', 1, 1, '2023-07-19 21:58:41', '2023-07-20 16:36:20', 1, 1);

-- ----------------------------
-- Table structure for dish
-- ----------------------------
DROP TABLE IF EXISTS `dish`;
CREATE TABLE `dish`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '菜品名称',
  `category_id` bigint NOT NULL COMMENT '菜品分类id',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '菜品价格',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图片',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '描述信息',
  `status` int NULL DEFAULT 1 COMMENT '0 停售 1 起售',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_dish_name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 80 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '菜品' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dish
-- ----------------------------
INSERT INTO `dish` VALUES (46, '王老吉', 11, 6.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/41bfcacf-7ad4-4927-8b26-df366553a94c.png', '还是小时候的味道', 0, '2022-06-09 22:40:47', '2022-06-09 22:40:47', 1, 1);
INSERT INTO `dish` VALUES (47, '北冰洋', 11, 4.00, 'https://sky-itcast-hzx.oss-cn-hangzhou.aliyuncs.com/5800d1ee-3fb9-439f-9b57-f6ecb7a529cc.png', '还是小时候的味道', 1, '2022-06-10 09:18:49', '2023-11-12 17:15:14', 1, 1);
INSERT INTO `dish` VALUES (48, '雪花啤酒', 11, 4.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/bf8cbfc1-04d2-40e8-9826-061ee41ab87c.png', '还是小时候的味道', 1, '2022-06-10 09:22:54', '2022-06-10 09:22:54', 1, 1);
INSERT INTO `dish` VALUES (49, '米饭', 12, 2.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/76752350-2121-44d2-b477-10791c23a8ec.png', '精选五常大米', 1, '2022-06-10 09:30:17', '2022-06-10 09:30:17', 1, 1);
INSERT INTO `dish` VALUES (50, '馒头', 12, 1.00, 'https://sky-itcast-hzx.oss-cn-hangzhou.aliyuncs.com/a37d75de-aa27-423a-a9f6-07cb3bad9842.png', '优质面粉', 1, '2022-06-10 09:34:28', '2023-07-26 19:50:37', 1, 1);
INSERT INTO `dish` VALUES (51, '老坛酸菜鱼', 20, 56.00, 'https://sky-itcast-hzx.oss-cn-hangzhou.aliyuncs.com/af8c0e85-28a2-4907-89cb-4e9dcd0cc4e5.png', '原料：汤，草鱼，酸菜', 1, '2022-06-10 09:40:51', '2023-07-26 19:50:45', 1, 1);
INSERT INTO `dish` VALUES (52, '经典酸菜鮰鱼', 20, 66.00, 'https://sky-itcast-hzx.oss-cn-hangzhou.aliyuncs.com/b13c6716-abe5-4119-8ae8-3b9bffd56df4.png', '原料：酸菜，江团，鮰鱼', 0, '2022-06-10 09:46:02', '2023-07-26 19:50:56', 1, 1);
INSERT INTO `dish` VALUES (53, '蜀味水煮草鱼', 20, 38.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/a6953d5a-4c18-4b30-9319-4926ee77261f.png', '原料：草鱼，汤', 1, '2022-06-10 09:48:37', '2022-06-10 09:48:37', 1, 1);
INSERT INTO `dish` VALUES (54, '清炒小油菜', 19, 18.00, 'https://sky-itcast-hzx.oss-cn-hangzhou.aliyuncs.com/07da7530-d7ee-4704-8630-6efd36b575d3.png', '原料：小油菜', 1, '2022-06-10 09:51:46', '2023-07-26 19:51:05', 1, 1);
INSERT INTO `dish` VALUES (55, '蒜蓉娃娃菜', 19, 18.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/4879ed66-3860-4b28-ba14-306ac025fdec.png', '原料：蒜，娃娃菜', 1, '2022-06-10 09:53:37', '2022-06-10 09:53:37', 1, 1);
INSERT INTO `dish` VALUES (56, '清炒西兰花', 19, 18.00, 'https://sky-itcast-hzx.oss-cn-hangzhou.aliyuncs.com/f46ea340-3457-4f25-a291-6199619f88eb.png', '原料：西兰花', 1, '2022-06-10 09:55:44', '2023-07-26 19:51:19', 1, 1);
INSERT INTO `dish` VALUES (57, '炝炒圆白菜', 19, 18.00, 'https://sky-itcast-hzx.oss-cn-hangzhou.aliyuncs.com/dd413997-2487-46bf-8c10-ccb7c2c444af.png', '原料：圆白菜', 1, '2022-06-10 09:58:35', '2023-07-26 19:51:28', 1, 1);
INSERT INTO `dish` VALUES (58, '清蒸鲈鱼', 18, 98.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/c18b5c67-3b71-466c-a75a-e63c6449f21c.png', '原料：鲈鱼', 1, '2022-06-10 10:12:28', '2022-06-10 10:12:28', 1, 1);
INSERT INTO `dish` VALUES (59, '东坡肘子', 18, 138.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/a80a4b8c-c93e-4f43-ac8a-856b0d5cc451.png', '原料：猪肘棒', 1, '2022-06-10 10:24:03', '2022-06-10 10:24:03', 1, 1);
INSERT INTO `dish` VALUES (60, '梅菜扣肉', 18, 58.00, 'https://sky-itcast-hzx.oss-cn-hangzhou.aliyuncs.com/70e83e73-aecf-4b3a-bb24-7b2f98dd0b55.png', '原料：猪肉，梅菜', 1, '2022-06-10 10:26:03', '2023-07-26 19:50:04', 1, 1);
INSERT INTO `dish` VALUES (61, '剁椒鱼头', 18, 66.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/13da832f-ef2c-484d-8370-5934a1045a06.png', '原料：鲢鱼，剁椒', 1, '2022-06-10 10:28:54', '2022-06-10 10:28:54', 1, 1);
INSERT INTO `dish` VALUES (62, '金汤酸菜牛蛙', 17, 88.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/7694a5d8-7938-4e9d-8b9e-2075983a2e38.png', '原料：鲜活牛蛙，酸菜', 1, '2022-06-10 10:33:05', '2022-06-10 10:33:05', 1, 1);
INSERT INTO `dish` VALUES (63, '香锅牛蛙', 17, 88.00, 'https://sky-itcast-hzx.oss-cn-hangzhou.aliyuncs.com/56fc8b6b-c911-4807-bd82-3da6c67cc768.png', '配料：鲜活牛蛙，莲藕，青笋', 1, '2022-06-10 10:35:40', '2023-07-26 19:50:19', 1, 1);
INSERT INTO `dish` VALUES (64, '馋嘴牛蛙', 17, 88.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/7a55b845-1f2b-41fa-9486-76d187ee9ee1.png', '配料：鲜活牛蛙，丝瓜，黄豆芽', 1, '2022-06-10 10:37:52', '2022-06-10 10:37:52', 1, 1);
INSERT INTO `dish` VALUES (65, '草鱼2斤', 16, 78.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/b544d3ba-a1ae-4d20-a860-81cb5dec9e03.png', '原料：草鱼，黄豆芽，莲藕', 1, '2022-06-10 10:41:08', '2023-07-26 22:20:11', 1, 1);
INSERT INTO `dish` VALUES (66, '江团鱼2斤', 16, 119.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/a101a1e9-8f8b-47b2-afa4-1abd47ea0a87.png', '配料：江团鱼，黄豆芽，莲藕', 1, '2022-06-10 10:42:42', '2022-06-10 10:42:42', 1, 1);
INSERT INTO `dish` VALUES (67, '鮰鱼2斤', 16, 72.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/8cfcc576-4b66-4a09-ac68-ad5b273c2590.png', '原料：鮰鱼，黄豆芽，莲藕', 1, '2022-06-10 10:43:56', '2022-06-10 10:43:56', 1, 1);
INSERT INTO `dish` VALUES (68, '鸡蛋汤', 21, 4.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/c09a0ee8-9d19-428d-81b9-746221824113.png', '配料：鸡蛋，紫菜', 1, '2022-06-10 10:54:25', '2022-06-10 10:54:25', 1, 1);
INSERT INTO `dish` VALUES (69, '平菇豆腐汤', 21, 6.00, 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/16d0a3d6-2253-4cfc-9b49-bf7bd9eb2ad2.png', '配料：豆腐，平菇', 1, '2022-06-10 10:55:02', '2023-07-21 00:41:34', 1, 1);
INSERT INTO `dish` VALUES (73, '测试菜品', 20, 666.00, 'https://sky-itcast-hzx.oss-cn-hangzhou.aliyuncs.com/23ca9dc2-dbae-4f6b-a256-d2a08533425a.png', '我是测试菜品描述，！@~~！@#￥%……&*（）——+|}{：“《》？发到你扫那是那是        打磨i忘记{LK', 0, '2023-07-21 00:26:44', '2023-07-21 00:26:44', 1, 1);
INSERT INTO `dish` VALUES (77, '123123123', 16, 1212.00, 'https://sky-itcast-hzx.oss-cn-hangzhou.aliyuncs.com/091ea178-2104-44ed-b78e-01455704dc57.png', '1231231', 1, '2023-07-21 20:12:32', '2023-07-21 20:56:16', 1, 1);
INSERT INTO `dish` VALUES (79, '11', 16, 1111.00, 'https://sky-itcast-hzx.oss-cn-hangzhou.aliyuncs.com/b202cfbb-512f-48af-b9d8-50fb0166a3b3.png', 'qaaaa', 1, '2023-07-21 22:03:22', '2023-07-21 22:03:22', 1, 1);

-- ----------------------------
-- Table structure for dish_flavor
-- ----------------------------
DROP TABLE IF EXISTS `dish_flavor`;
CREATE TABLE `dish_flavor`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dish_id` bigint NOT NULL COMMENT '菜品',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '口味名称',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '口味数据list',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 122 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '菜品口味关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dish_flavor
-- ----------------------------
INSERT INTO `dish_flavor` VALUES (40, 10, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]');
INSERT INTO `dish_flavor` VALUES (41, 7, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (42, 7, '温度', '[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]');
INSERT INTO `dish_flavor` VALUES (45, 6, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (46, 6, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (47, 5, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (48, 5, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]');
INSERT INTO `dish_flavor` VALUES (49, 2, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]');
INSERT INTO `dish_flavor` VALUES (50, 4, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]');
INSERT INTO `dish_flavor` VALUES (51, 3, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]');
INSERT INTO `dish_flavor` VALUES (52, 3, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (92, 53, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (93, 53, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (101, 66, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (102, 67, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (104, 73, '甜味', '[\"半糖\",\"多糖\",\"全糖\"]');
INSERT INTO `dish_flavor` VALUES (105, 73, '温度', '[\"多冰\"]');
INSERT INTO `dish_flavor` VALUES (106, 73, '忌口', '[\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (107, 73, '辣度', '[]');
INSERT INTO `dish_flavor` VALUES (109, 77, '甜味', '[\"多糖\",\"全糖\"]');
INSERT INTO `dish_flavor` VALUES (110, 77, '温度', '[\"多冰\"]');
INSERT INTO `dish_flavor` VALUES (111, 77, '辣度', '[]');
INSERT INTO `dish_flavor` VALUES (112, 77, '忌口', '[\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (113, 60, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (114, 51, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (115, 51, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (116, 52, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (117, 52, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');
INSERT INTO `dish_flavor` VALUES (118, 54, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\"]');
INSERT INTO `dish_flavor` VALUES (119, 56, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (120, 57, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]');
INSERT INTO `dish_flavor` VALUES (121, 65, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '姓名',
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '密码',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '手机号',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '性别',
  `id_number` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '身份证号',
  `status` int NOT NULL DEFAULT 1 COMMENT '状态 0:禁用，1:启用',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '员工信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (1, '管理员', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '13812312312', '1', '110101199001010047', 1, '2022-02-15 15:51:20', '2022-02-17 09:16:20', 10, 1);
INSERT INTO `employee` VALUES (2, '黄五', 'huangwu', 'e10adc3949ba59abbe56e057f20f883e', '13248684099', '1', '123123123123', 1, '2023-07-17 16:12:22', '2023-07-17 16:12:26', 10, 10);
INSERT INTO `employee` VALUES (3, '李四（修改后）', 'lisi', 'e10adc3949ba59abbe56e057f20f883e', '13248685555', '0', '330281200005026666', 1, '2023-07-17 16:15:39', '2023-07-17 20:20:20', 10, 1);
INSERT INTO `employee` VALUES (4, '李四1', 'lisi1', 'e10adc3949ba59abbe56e057f20f883e', '13248684097', '1', '330281200005021734', 0, '2023-07-17 16:16:06', '2023-07-17 16:16:06', 10, 10);
INSERT INTO `employee` VALUES (25, '王五12', 'wangwu', 'e10adc3949ba59abbe56e057f20f883e', '13248684099', '1', '330281200005021735', 1, '2023-07-17 16:46:30', '2023-07-20 21:33:02', 1, 1);
INSERT INTO `employee` VALUES (26, '六六', 'liuliu', 'e10adc3949ba59abbe56e057f20f883e', '13248684099', '1', '330281200005021735', 1, '2023-07-17 18:44:37', '2023-07-20 17:16:01', 1, 1);
INSERT INTO `employee` VALUES (27, '野兽先辈', '114514', 'e10adc3949ba59abbe56e057f20f883e', '13248684099', '1', '330281200005021735', 1, '2023-08-14 21:32:43', '2023-08-14 21:32:43', 1, 1);

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '名字',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图片',
  `order_id` bigint NOT NULL COMMENT '订单id',
  `dish_id` bigint NULL DEFAULT NULL COMMENT '菜品id',
  `setmeal_id` bigint NULL DEFAULT NULL COMMENT '套餐id',
  `dish_flavor` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '口味',
  `number` int NOT NULL DEFAULT 1 COMMENT '数量',
  `amount` decimal(10, 2) NOT NULL COMMENT '金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '订单明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES (5, '草鱼2斤', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/b544d3ba-a1ae-4d20-a860-81cb5dec9e03.png', 9, 65, NULL, '不辣', 2, 78.00);
INSERT INTO `order_detail` VALUES (6, '金汤酸菜牛蛙', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/7694a5d8-7938-4e9d-8b9e-2075983a2e38.png', 9, 62, NULL, NULL, 1, 88.00);
INSERT INTO `order_detail` VALUES (7, '平菇豆腐汤', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/16d0a3d6-2253-4cfc-9b49-bf7bd9eb2ad2.png', 9, 69, NULL, NULL, 1, 6.00);
INSERT INTO `order_detail` VALUES (8, '老坛酸菜鱼', 'https://sky-itcast-hzx.oss-cn-hangzhou.aliyuncs.com/af8c0e85-28a2-4907-89cb-4e9dcd0cc4e5.png', 9, 51, NULL, '中辣,不要香菜', 1, 56.00);
INSERT INTO `order_detail` VALUES (9, '蜀味水煮草鱼', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/a6953d5a-4c18-4b30-9319-4926ee77261f.png', 10, 53, NULL, '不要葱,中辣', 1, 38.00);
INSERT INTO `order_detail` VALUES (10, '馒头', 'https://sky-itcast-hzx.oss-cn-hangzhou.aliyuncs.com/a37d75de-aa27-423a-a9f6-07cb3bad9842.png', 10, 50, NULL, NULL, 1, 1.00);
INSERT INTO `order_detail` VALUES (11, '米饭', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/76752350-2121-44d2-b477-10791c23a8ec.png', 10, 49, NULL, NULL, 1, 2.00);
INSERT INTO `order_detail` VALUES (12, '金汤酸菜牛蛙', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/7694a5d8-7938-4e9d-8b9e-2075983a2e38.png', 11, 62, NULL, NULL, 1, 88.00);
INSERT INTO `order_detail` VALUES (13, '香锅牛蛙', 'https://sky-itcast-hzx.oss-cn-hangzhou.aliyuncs.com/56fc8b6b-c911-4807-bd82-3da6c67cc768.png', 11, 63, NULL, NULL, 1, 88.00);
INSERT INTO `order_detail` VALUES (14, '老坛酸菜鱼', 'https://sky-itcast-hzx.oss-cn-hangzhou.aliyuncs.com/af8c0e85-28a2-4907-89cb-4e9dcd0cc4e5.png', 12, 51, NULL, '不要葱,不辣', 1, 56.00);
INSERT INTO `order_detail` VALUES (15, '草鱼2斤', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/b544d3ba-a1ae-4d20-a860-81cb5dec9e03.png', 13, 65, NULL, '不辣', 1, 78.00);
INSERT INTO `order_detail` VALUES (16, '老坛酸菜鱼', 'https://sky-itcast-hzx.oss-cn-hangzhou.aliyuncs.com/af8c0e85-28a2-4907-89cb-4e9dcd0cc4e5.png', 14, 51, NULL, '不要葱,中辣', 1, 56.00);
INSERT INTO `order_detail` VALUES (17, '东坡肘子', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/a80a4b8c-c93e-4f43-ac8a-856b0d5cc451.png', 15, 59, NULL, NULL, 1, 138.00);
INSERT INTO `order_detail` VALUES (18, '平菇豆腐汤', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/16d0a3d6-2253-4cfc-9b49-bf7bd9eb2ad2.png', 16, 69, NULL, NULL, 1, 6.00);
INSERT INTO `order_detail` VALUES (19, '老坛酸菜鱼', 'https://sky-itcast-hzx.oss-cn-hangzhou.aliyuncs.com/af8c0e85-28a2-4907-89cb-4e9dcd0cc4e5.png', 16, 51, NULL, '不要香菜,中辣', 1, 56.00);
INSERT INTO `order_detail` VALUES (20, '馒头', 'https://sky-itcast-hzx.oss-cn-hangzhou.aliyuncs.com/a37d75de-aa27-423a-a9f6-07cb3bad9842.png', 17, 50, NULL, NULL, 1, 1.00);
INSERT INTO `order_detail` VALUES (21, '东坡肘子', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/a80a4b8c-c93e-4f43-ac8a-856b0d5cc451.png', 18, 59, NULL, NULL, 1, 138.00);
INSERT INTO `order_detail` VALUES (22, '馒头', 'https://sky-itcast-hzx.oss-cn-hangzhou.aliyuncs.com/a37d75de-aa27-423a-a9f6-07cb3bad9842.png', 19, 50, NULL, NULL, 1, 1.00);
INSERT INTO `order_detail` VALUES (23, '米饭', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/76752350-2121-44d2-b477-10791c23a8ec.png', 19, 49, NULL, NULL, 1, 2.00);
INSERT INTO `order_detail` VALUES (24, '平菇豆腐汤', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/16d0a3d6-2253-4cfc-9b49-bf7bd9eb2ad2.png', 20, 69, NULL, NULL, 1, 6.00);
INSERT INTO `order_detail` VALUES (25, '草鱼2斤', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/b544d3ba-a1ae-4d20-a860-81cb5dec9e03.png', 21, 65, NULL, '不辣', 1, 78.00);
INSERT INTO `order_detail` VALUES (26, '蜀味水煮草鱼', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/a6953d5a-4c18-4b30-9319-4926ee77261f.png', 22, 53, NULL, '不要葱,不辣', 1, 38.00);
INSERT INTO `order_detail` VALUES (27, '蜀味水煮草鱼', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/a6953d5a-4c18-4b30-9319-4926ee77261f.png', 23, 53, NULL, '不要葱,不辣', 1, 38.00);
INSERT INTO `order_detail` VALUES (28, '清蒸鲈鱼', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/c18b5c67-3b71-466c-a75a-e63c6449f21c.png', 24, 58, NULL, NULL, 1, 98.00);
INSERT INTO `order_detail` VALUES (29, '东坡肘子', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/a80a4b8c-c93e-4f43-ac8a-856b0d5cc451.png', 24, 59, NULL, NULL, 1, 138.00);
INSERT INTO `order_detail` VALUES (30, '金汤酸菜牛蛙', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/7694a5d8-7938-4e9d-8b9e-2075983a2e38.png', 25, 62, NULL, NULL, 1, 88.00);
INSERT INTO `order_detail` VALUES (31, '香锅牛蛙', 'https://sky-itcast-hzx.oss-cn-hangzhou.aliyuncs.com/56fc8b6b-c911-4807-bd82-3da6c67cc768.png', 25, 63, NULL, NULL, 1, 88.00);
INSERT INTO `order_detail` VALUES (32, '馋嘴牛蛙', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/7a55b845-1f2b-41fa-9486-76d187ee9ee1.png', 25, 64, NULL, NULL, 1, 88.00);
INSERT INTO `order_detail` VALUES (33, '金汤酸菜牛蛙', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/7694a5d8-7938-4e9d-8b9e-2075983a2e38.png', 26, 62, NULL, NULL, 1, 88.00);
INSERT INTO `order_detail` VALUES (34, '香锅牛蛙', 'https://sky-itcast-hzx.oss-cn-hangzhou.aliyuncs.com/56fc8b6b-c911-4807-bd82-3da6c67cc768.png', 26, 63, NULL, NULL, 1, 88.00);
INSERT INTO `order_detail` VALUES (35, '馋嘴牛蛙', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/7a55b845-1f2b-41fa-9486-76d187ee9ee1.png', 26, 64, NULL, NULL, 1, 88.00);
INSERT INTO `order_detail` VALUES (36, '金汤酸菜牛蛙', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/7694a5d8-7938-4e9d-8b9e-2075983a2e38.png', 27, 62, NULL, NULL, 1, 88.00);
INSERT INTO `order_detail` VALUES (37, '香锅牛蛙', 'https://sky-itcast-hzx.oss-cn-hangzhou.aliyuncs.com/56fc8b6b-c911-4807-bd82-3da6c67cc768.png', 27, 63, NULL, NULL, 2, 88.00);
INSERT INTO `order_detail` VALUES (38, '馋嘴牛蛙', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/7a55b845-1f2b-41fa-9486-76d187ee9ee1.png', 27, 64, NULL, NULL, 1, 88.00);
INSERT INTO `order_detail` VALUES (39, '东坡肘子', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/a80a4b8c-c93e-4f43-ac8a-856b0d5cc451.png', 28, 59, NULL, NULL, 1, 138.00);
INSERT INTO `order_detail` VALUES (40, '清蒸鲈鱼', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/c18b5c67-3b71-466c-a75a-e63c6449f21c.png', 28, 58, NULL, NULL, 1, 98.00);
INSERT INTO `order_detail` VALUES (41, '东坡肘子', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/a80a4b8c-c93e-4f43-ac8a-856b0d5cc451.png', 29, 59, NULL, NULL, 1, 138.00);
INSERT INTO `order_detail` VALUES (42, '清蒸鲈鱼', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/c18b5c67-3b71-466c-a75a-e63c6449f21c.png', 29, 58, NULL, NULL, 1, 98.00);
INSERT INTO `order_detail` VALUES (43, '蜀味水煮草鱼', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/a6953d5a-4c18-4b30-9319-4926ee77261f.png', 30, 53, NULL, '不要葱,不辣', 1, 38.00);
INSERT INTO `order_detail` VALUES (44, '蜀味水煮草鱼', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/a6953d5a-4c18-4b30-9319-4926ee77261f.png', 31, 53, NULL, '不要葱,不辣', 1, 38.00);
INSERT INTO `order_detail` VALUES (45, '蜀味水煮草鱼', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/a6953d5a-4c18-4b30-9319-4926ee77261f.png', 32, 53, NULL, '不要葱,不辣', 1, 38.00);
INSERT INTO `order_detail` VALUES (46, '鸡蛋汤', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/c09a0ee8-9d19-428d-81b9-746221824113.png', 33, 68, NULL, NULL, 1, 4.00);
INSERT INTO `order_detail` VALUES (47, '清蒸鲈鱼', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/c18b5c67-3b71-466c-a75a-e63c6449f21c.png', 34, 58, NULL, NULL, 1, 98.00);
INSERT INTO `order_detail` VALUES (48, '东坡肘子', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/a80a4b8c-c93e-4f43-ac8a-856b0d5cc451.png', 34, 59, NULL, NULL, 1, 138.00);
INSERT INTO `order_detail` VALUES (49, '馒头', 'https://sky-itcast-hzx.oss-cn-hangzhou.aliyuncs.com/a37d75de-aa27-423a-a9f6-07cb3bad9842.png', 35, 50, NULL, NULL, 1, 1.00);
INSERT INTO `order_detail` VALUES (50, '香锅牛蛙', 'https://sky-itcast-hzx.oss-cn-hangzhou.aliyuncs.com/56fc8b6b-c911-4807-bd82-3da6c67cc768.png', 36, 63, NULL, NULL, 1, 88.00);
INSERT INTO `order_detail` VALUES (51, '馋嘴牛蛙', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/7a55b845-1f2b-41fa-9486-76d187ee9ee1.png', 36, 64, NULL, NULL, 1, 88.00);
INSERT INTO `order_detail` VALUES (52, '草鱼2斤', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/b544d3ba-a1ae-4d20-a860-81cb5dec9e03.png', 37, 65, NULL, '不辣', 1, 78.00);
INSERT INTO `order_detail` VALUES (53, '江团鱼2斤', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/a101a1e9-8f8b-47b2-afa4-1abd47ea0a87.png', 38, 66, NULL, '不辣', 1, 119.00);
INSERT INTO `order_detail` VALUES (54, '鮰鱼2斤', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/8cfcc576-4b66-4a09-ac68-ad5b273c2590.png', 38, 67, NULL, '不辣', 1, 72.00);
INSERT INTO `order_detail` VALUES (55, '江团鱼2斤', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/a101a1e9-8f8b-47b2-afa4-1abd47ea0a87.png', 39, 66, NULL, '不辣', 1, 119.00);
INSERT INTO `order_detail` VALUES (56, '鮰鱼2斤', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/8cfcc576-4b66-4a09-ac68-ad5b273c2590.png', 39, 67, NULL, '不辣', 1, 72.00);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `number` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '订单号',
  `status` int NOT NULL DEFAULT 1 COMMENT '订单状态 1待付款 2待接单 3已接单 4派送中 5已完成 6已取消 7退款',
  `user_id` bigint NOT NULL COMMENT '下单用户',
  `address_book_id` bigint NOT NULL COMMENT '地址id',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `checkout_time` datetime NULL DEFAULT NULL COMMENT '结账时间',
  `pay_method` int NOT NULL DEFAULT 1 COMMENT '支付方式 1微信,2支付宝',
  `pay_status` tinyint NOT NULL DEFAULT 0 COMMENT '支付状态 0未支付 1已支付 2退款',
  `amount` decimal(10, 2) NOT NULL COMMENT '实收金额',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '手机号',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '地址',
  `user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户名称',
  `consignee` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '收货人',
  `cancel_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '订单取消原因',
  `rejection_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '订单拒绝原因',
  `cancel_time` datetime NULL DEFAULT NULL COMMENT '订单取消时间',
  `estimated_delivery_time` datetime NULL DEFAULT NULL COMMENT '预计送达时间',
  `delivery_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '配送状态  1立即送出  0选择具体时间',
  `delivery_time` datetime NULL DEFAULT NULL COMMENT '送达时间',
  `pack_amount` int NULL DEFAULT NULL COMMENT '打包费',
  `tableware_number` int NULL DEFAULT NULL COMMENT '餐具数量',
  `tableware_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '餐具数量状态  1按餐量提供  0选择具体数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (9, '1691589831991', 6, 4, 2, '2023-08-09 22:03:52', NULL, 1, 0, 317.00, '', '13248689999', NULL, NULL, 'hzx', '订单超时，自动取消', NULL, '2023-08-13 16:12:00', '2023-08-09 23:03:00', 0, NULL, 5, 0, 0);
INSERT INTO `orders` VALUES (10, '1691590147367', 6, 4, 2, '2023-08-09 22:09:07', NULL, 1, 0, 50.00, '', '13248689999', NULL, NULL, 'hzx', '订单超时，自动取消', NULL, '2023-08-13 16:12:00', '2023-08-09 23:09:00', 0, NULL, 3, 0, 0);
INSERT INTO `orders` VALUES (11, '1691831432834', 5, 4, 2, '2023-08-12 17:10:33', '2023-08-12 17:11:45', 1, 1, 184.00, '', '13248689999', NULL, NULL, 'hzx', NULL, NULL, NULL, '2023-08-12 18:10:00', 0, NULL, 2, 0, 0);
INSERT INTO `orders` VALUES (12, '1691836143827', 5, 4, 2, '2023-08-12 18:29:04', '2023-08-12 18:29:05', 1, 1, 63.00, '', '13248689999', NULL, NULL, 'hzx', NULL, NULL, NULL, '2023-08-12 19:29:00', 0, NULL, 1, 0, 0);
INSERT INTO `orders` VALUES (13, '1691836268878', 6, 4, 2, '2023-08-12 18:31:09', '2023-08-12 18:31:10', 1, 1, 85.00, '', '13248689999', NULL, NULL, 'hzx', '订单超时，自动取消', NULL, '2023-08-13 16:39:20', '2023-08-12 19:31:00', 0, NULL, 1, 0, 0);
INSERT INTO `orders` VALUES (14, '1691915537636', 6, 4, 2, '2023-08-13 16:32:18', '2023-08-13 16:32:25', 1, 1, 63.00, '', '13248689999', NULL, NULL, 'hzx', '订单超时，自动取消', NULL, '2023-08-13 16:39:20', '2023-08-13 17:32:00', 0, NULL, 1, 0, 0);
INSERT INTO `orders` VALUES (15, '1691915669956', 5, 4, 2, '2023-08-13 16:34:30', '2023-08-13 16:34:31', 1, 1, 145.00, '', '13248689999', NULL, NULL, 'hzx', '订单超时，自动取消', NULL, '2023-08-13 16:34:30', '2023-08-13 17:34:00', 0, NULL, 1, 0, 0);
INSERT INTO `orders` VALUES (16, '1691915710499', 5, 4, 2, '2023-08-13 16:35:10', '2023-08-13 16:35:12', 1, 1, 70.00, '', '13248689999', NULL, NULL, 'hzx', NULL, NULL, NULL, '2023-08-13 17:35:00', 0, NULL, 2, 0, 0);
INSERT INTO `orders` VALUES (17, '1691995594920', 5, 4, 2, '2023-08-14 14:46:35', '2023-08-14 14:46:36', 1, 1, 8.00, '', '13248689999', NULL, NULL, 'hzx', NULL, NULL, NULL, '2023-08-14 15:46:00', 0, NULL, 1, 0, 0);
INSERT INTO `orders` VALUES (18, '1691995621445', 5, 4, 2, '2023-08-14 14:47:01', '2023-08-14 14:47:02', 1, 1, 145.00, '', '13248689999', NULL, NULL, 'hzx', NULL, NULL, NULL, '2023-08-14 15:47:00', 0, NULL, 1, 0, 0);
INSERT INTO `orders` VALUES (19, '1691995695554', 5, 4, 2, '2023-08-14 14:48:16', '2023-08-14 14:48:17', 1, 1, 11.00, '', '13248689999', NULL, NULL, 'hzx', NULL, NULL, NULL, '2023-08-14 15:48:00', 0, NULL, 2, 0, 0);
INSERT INTO `orders` VALUES (20, '1691995763839', 5, 4, 2, '2023-08-14 14:49:24', '2023-08-14 14:49:25', 1, 1, 13.00, '', '13248689999', NULL, NULL, 'hzx', NULL, NULL, NULL, '2023-08-14 15:49:00', 0, NULL, 1, 0, 0);
INSERT INTO `orders` VALUES (21, '1691995927222', 5, 4, 2, '2023-08-14 14:52:07', '2023-08-14 14:52:09', 1, 1, 85.00, '', '13248689999', NULL, NULL, 'hzx', NULL, NULL, NULL, '2023-08-14 15:52:00', 0, NULL, 1, 0, 0);
INSERT INTO `orders` VALUES (22, '1691996250263', 5, 4, 2, '2023-08-14 14:57:30', '2023-08-14 14:57:32', 1, 1, 45.00, '', '13248689999', NULL, NULL, 'hzx', NULL, NULL, NULL, '2023-08-14 15:57:00', 0, '2023-08-14 15:11:59', 1, 0, 0);
INSERT INTO `orders` VALUES (23, '1691997131237', 5, 4, 2, '2023-08-14 15:12:11', '2023-08-14 15:12:13', 1, 1, 45.00, '', '13248689999', NULL, NULL, 'hzx', NULL, NULL, NULL, '2023-08-14 16:12:00', 0, NULL, 1, 0, 0);
INSERT INTO `orders` VALUES (24, '1691998896041', 5, 4, 2, '2023-08-14 15:41:36', '2023-08-14 15:41:37', 1, 1, 244.00, '', '13248689999', NULL, NULL, 'hzx', NULL, NULL, NULL, '2023-08-14 16:41:00', 0, NULL, 2, 0, 0);
INSERT INTO `orders` VALUES (25, '1691999505408', 5, 4, 2, '2023-08-14 15:51:45', '2023-08-14 15:51:47', 1, 1, 273.00, '', '13248689999', NULL, NULL, 'hzx', NULL, NULL, NULL, '2023-08-14 16:51:00', 0, NULL, 3, 0, 0);
INSERT INTO `orders` VALUES (26, '1691999523905', 6, 4, 2, '2023-08-14 15:52:04', '2023-08-14 15:52:05', 1, 1, 273.00, '', '13248689999', NULL, NULL, 'hzx', '菜品已销售完，暂时无法接单', NULL, '2023-08-14 21:07:39', '2023-08-14 16:52:00', 0, NULL, 3, 0, 0);
INSERT INTO `orders` VALUES (27, '1692000304642', 6, 4, 2, '2023-08-14 16:05:05', '2023-08-14 16:05:06', 1, 2, 362.00, '', '13248689999', NULL, NULL, 'hzx', '用户取消', NULL, '2023-08-14 16:08:41', '2023-08-14 17:05:00', 0, NULL, 4, 0, 0);
INSERT INTO `orders` VALUES (28, '1692000539926', 6, 4, 2, '2023-08-14 16:09:00', '2023-08-14 16:09:01', 1, 2, 244.00, '', '13248689999', NULL, NULL, 'hzx', '用户取消', NULL, '2023-08-14 16:09:10', '2023-08-14 17:08:00', 0, NULL, 2, 0, 0);
INSERT INTO `orders` VALUES (29, '1692001452508', 6, 4, 2, '2023-08-14 16:24:13', '2023-08-14 16:24:14', 1, 1, 244.00, '', '13248689999', NULL, NULL, 'hzx', '64565645', NULL, '2023-08-14 20:57:03', '2023-08-14 17:24:00', 0, NULL, 2, 0, 0);
INSERT INTO `orders` VALUES (30, '1692001477538', 6, 4, 2, '2023-08-14 16:24:38', '2023-08-14 16:24:39', 1, 1, 45.00, '', '13248689999', NULL, NULL, 'hzx', '菜品已销售完，暂时无法接单', NULL, '2023-08-14 21:07:35', '2023-08-14 17:24:00', 0, NULL, 1, 0, 0);
INSERT INTO `orders` VALUES (31, '1692018328941', 5, 4, 2, '2023-08-14 21:05:29', '2023-08-14 21:05:30', 1, 1, 45.00, '', '13248689999', NULL, NULL, 'hzx', NULL, NULL, NULL, '2023-08-14 22:05:00', 0, '2023-08-24 16:17:00', 1, 0, 0);
INSERT INTO `orders` VALUES (32, '1692018355043', 6, 4, 2, '2023-08-14 21:05:55', '2023-08-14 21:05:56', 1, 1, 45.00, '', '13248689999', NULL, NULL, 'hzx', NULL, '订单量较多，暂时无法接单', '2023-08-14 21:07:27', '2023-08-14 22:05:00', 0, NULL, 1, 0, 0);
INSERT INTO `orders` VALUES (33, '1692018470494', 5, 4, 2, '2023-08-14 21:07:50', '2023-08-14 21:07:52', 1, 1, 11.00, '', '13248689999', NULL, NULL, 'hzx', NULL, NULL, NULL, '2023-08-14 22:07:00', 0, '2023-08-24 16:16:59', 1, 0, 0);
INSERT INTO `orders` VALUES (34, '1692018515134', 5, 4, 2, '2023-08-14 21:08:35', '2023-08-14 21:08:36', 1, 1, 244.00, '', '13248689999', NULL, NULL, 'hzx', NULL, NULL, NULL, '2023-08-14 22:08:00', 0, '2023-08-24 16:16:59', 2, 0, 0);
INSERT INTO `orders` VALUES (35, '1692018525012', 6, 4, 2, '2023-08-15 21:08:45', '2023-08-14 21:08:46', 1, 1, 8.00, '', '13248689999', NULL, NULL, 'hzx', NULL, NULL, NULL, '2023-08-14 22:08:00', 0, '2023-08-24 16:16:57', 1, 0, 0);
INSERT INTO `orders` VALUES (36, '1692018548217', 6, 4, 2, '2023-08-16 21:09:08', '2023-08-14 21:09:09', 1, 1, 184.00, '', '13248689999', NULL, NULL, 'hzx', NULL, NULL, NULL, '2023-08-14 22:09:00', 0, '2023-08-24 16:16:58', 2, 0, 0);
INSERT INTO `orders` VALUES (37, '1692864999478', 6, 4, 2, '2023-08-24 16:16:39', '2023-08-24 16:16:41', 1, 1, 85.00, '', '13248689999', NULL, NULL, 'hzx', NULL, NULL, NULL, '2023-08-24 17:16:00', 0, '2023-08-24 16:16:58', 1, 0, 0);
INSERT INTO `orders` VALUES (38, '1692868923746', 2, 4, 2, '2023-08-24 17:22:04', '2023-08-24 17:22:05', 1, 1, 199.00, '', '13248689999', NULL, NULL, 'hzx', NULL, NULL, NULL, '2023-08-24 18:22:00', 0, NULL, 2, 0, 0);
INSERT INTO `orders` VALUES (39, '1692868943218', 3, 4, 2, '2023-08-24 17:22:23', '2023-08-24 17:22:24', 1, 1, 199.00, '', '13248689999', NULL, NULL, 'hzx', NULL, NULL, NULL, '2023-08-24 18:22:00', 0, NULL, 2, 0, 0);

-- ----------------------------
-- Table structure for setmeal
-- ----------------------------
DROP TABLE IF EXISTS `setmeal`;
CREATE TABLE `setmeal`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `category_id` bigint NOT NULL COMMENT '菜品分类id',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '套餐名称',
  `price` decimal(10, 2) NOT NULL COMMENT '套餐价格',
  `status` int NULL DEFAULT 1 COMMENT '售卖状态 0:停售 1:起售',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '描述信息',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图片',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_setmeal_name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '套餐' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setmeal
-- ----------------------------
INSERT INTO `setmeal` VALUES (1, 11, 'test', 123.00, 1, '我是描述', 'https://sky-itcast.oss-cn-beijing.aliyuncs.com/41bfcacf-7ad4-4927-8b26-df366553a94c.png', '2023-07-12 22:27:02', '2023-07-21 22:27:06', 1, 1);
INSERT INTO `setmeal` VALUES (38, 13, 'esss', 111.00, 0, 'asdasd', 'https://sky-itcast-hzx.oss-cn-hangzhou.aliyuncs.com/ca9b1bab-02cd-4bb0-a7a9-d582f4fa9e18.png', '2023-07-21 22:15:22', '2023-07-23 14:47:10', 1, 1);
INSERT INTO `setmeal` VALUES (39, 13, '2222', 111.00, 1, '131321 asa  ', 'https://sky-itcast-hzx.oss-cn-hangzhou.aliyuncs.com/b5a67215-cc8c-4383-b32f-38601fcb1f5a.png', '2023-07-23 14:48:13', '2023-07-26 19:52:33', 1, 1);
INSERT INTO `setmeal` VALUES (40, 15, 'tc名称', 1231.00, 1, '纷纷士大夫首发式', 'https://sky-itcast-hzx.oss-cn-hangzhou.aliyuncs.com/a0e80886-5344-4a35-94ea-716126f54093.png', '2023-07-23 15:26:52', '2023-07-26 19:52:09', 1, 1);
INSERT INTO `setmeal` VALUES (45, 13, 'reaasasd', 12312.00, 0, 'sdasdasas', 'https://sky-itcast-hzx.oss-cn-hangzhou.aliyuncs.com/a9f73f11-cc97-45b3-9bf0-ea682c5d721c.png', '2023-07-23 15:35:59', '2023-07-23 15:35:59', 1, 1);
INSERT INTO `setmeal` VALUES (49, 13, '1111111', 99.00, 1, '描述desc', 'https://sky-itcast-hzx.oss-cn-hangzhou.aliyuncs.com/6e630a8a-9dd5-4b73-b181-f8dcf159dd99.png', '2023-07-23 15:53:31', '2023-07-23 15:53:31', 1, 1);
INSERT INTO `setmeal` VALUES (50, 13, '222222', 11.00, 1, 'sss', 'https://sky-itcast-hzx.oss-cn-hangzhou.aliyuncs.com/27224d4e-e3eb-4f5e-a83e-13ba1dc269e5.png', '2023-07-23 15:54:03', '2023-07-23 15:54:03', 1, 1);
INSERT INTO `setmeal` VALUES (51, 13, '停售大餐', 123.00, 1, 'adasds', 'https://sky-itcast-hzx.oss-cn-hangzhou.aliyuncs.com/cc1cb0d7-bc79-4416-ad1d-df9f40f36d46.png', '2023-07-23 16:26:18', '2023-07-23 16:30:04', 1, 1);

-- ----------------------------
-- Table structure for setmeal_dish
-- ----------------------------
DROP TABLE IF EXISTS `setmeal_dish`;
CREATE TABLE `setmeal_dish`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `setmeal_id` bigint NULL DEFAULT NULL COMMENT '套餐id',
  `dish_id` bigint NULL DEFAULT NULL COMMENT '菜品id',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '菜品名称 （冗余字段）',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '菜品单价（冗余字段）',
  `copies` int NULL DEFAULT NULL COMMENT '菜品份数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 267 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '套餐菜品关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setmeal_dish
-- ----------------------------
INSERT INTO `setmeal_dish` VALUES (222, 1, 46, 'test', 222.00, NULL);
INSERT INTO `setmeal_dish` VALUES (223, 38, 38, '江团鱼2斤', 119.00, 1);
INSERT INTO `setmeal_dish` VALUES (224, 38, 38, '草鱼2斤', 68.00, 1);
INSERT INTO `setmeal_dish` VALUES (255, 49, 69, '平菇豆腐汤', 6.00, 1);
INSERT INTO `setmeal_dish` VALUES (256, 50, 52, '经典酸菜鮰鱼', 66.00, 1);
INSERT INTO `setmeal_dish` VALUES (257, 50, 73, '测试菜品', 666.00, 1);
INSERT INTO `setmeal_dish` VALUES (258, 51, 65, '草鱼2斤', 68.00, 1);
INSERT INTO `setmeal_dish` VALUES (259, 40, 52, '经典酸菜鮰鱼', 66.00, 1);
INSERT INTO `setmeal_dish` VALUES (260, 40, 64, '馋嘴牛蛙', 88.00, 1);
INSERT INTO `setmeal_dish` VALUES (261, 40, 77, '123123123', 1212.00, 1);
INSERT INTO `setmeal_dish` VALUES (262, 40, 66, '江团鱼2斤', 119.00, 1);
INSERT INTO `setmeal_dish` VALUES (263, 39, 63, '香锅牛蛙', 88.00, 1);
INSERT INTO `setmeal_dish` VALUES (264, 39, 51, '老坛酸菜鱼', 56.00, 1);
INSERT INTO `setmeal_dish` VALUES (265, 39, 52, '经典酸菜鮰鱼', 66.00, 1);
INSERT INTO `setmeal_dish` VALUES (266, 39, 53, '蜀味水煮草鱼', 38.00, 1);

-- ----------------------------
-- Table structure for shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE `shopping_cart`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '商品名称',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图片',
  `user_id` bigint NOT NULL COMMENT '主键',
  `dish_id` bigint NULL DEFAULT NULL COMMENT '菜品id',
  `setmeal_id` bigint NULL DEFAULT NULL COMMENT '套餐id',
  `dish_flavor` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '口味',
  `number` int NOT NULL DEFAULT 1 COMMENT '数量',
  `amount` decimal(10, 2) NOT NULL COMMENT '金额',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 93 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '购物车' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shopping_cart
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `openid` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '微信用户唯一标识',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '姓名',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '手机号',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '性别',
  `id_number` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '身份证号',
  `avatar` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '头像',
  `create_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (4, 'oKZMp489c1cUJL_KyB895WyBqme0', NULL, NULL, NULL, NULL, NULL, '2023-07-26 15:49:10');

SET FOREIGN_KEY_CHECKS = 1;
