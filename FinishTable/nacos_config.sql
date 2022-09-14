/*
 Navicat Premium Data Transfer

 Source Server         : smilecat.gaoshuye.top
 Source Server Type    : MySQL
 Source Server Version : 80030 (8.0.30)
 Source Host           : 127.0.0.1:3306
 Source Schema         : nacos_config

 Target Server Type    : MySQL
 Target Server Version : 80030 (8.0.30)
 File Encoding         : 65001

 Date: 14/09/2022 20:25:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `c_use` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `effect` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `c_schema` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL,
  `encrypted_data_key` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '秘钥',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfo_datagrouptenant`(`data_id` ASC, `group_id` ASC, `tenant_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = 'config_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info
-- ----------------------------
INSERT INTO `config_info` VALUES (1, 'common.yml', 'DEFAULT_GROUP', 'server:\r\n  undertow: # jetty  undertow\r\n    io-threads: 8 # 设置IO线程数, 它主要执行非阻塞的任务,它们会负责多个连接, 默认设置每个CPU核心一个线程\r\n    worker-threads: 120  # 阻塞任务线程池, 当执行类似servlet请求阻塞操作, undertow会从这个线程池中取得线程,它的值设置取决于系统的负载\r\n    buffer-size: 2048  # 以下的配置会影响buffer,这些buffer会用于服务器连接的IO操作,有点类似netty的池化内存管理 , 每块buffer的空间大小,越小的空间被利用越充分\r\n    direct-buffers: true  # 是否分配的直接内存\r\n\r\nspring:\r\n  http:\r\n    encoding:\r\n      charset: UTF-8\r\n      force: true\r\n      enabled: true\r\n  servlet:\r\n    multipart:\r\n      max-file-size: 512MB      # Max file size，默认1M\r\n      max-request-size: 512MB   # Max request size，默认10M\r\n\r\ndozer:\r\n  mappingFiles:\r\n    - classpath:dozer/global.dozer.xml\r\n    - classpath:dozer/biz.dozer.xml\r\nmanagement:\r\n  endpoints:\r\n    web:\r\n      base-path: /actuator\r\n      exposure:\r\n        include: \'*\'\r\n  endpoint:\r\n    health:\r\n      show-details: ALWAYS\r\n      enabled: true\r\n\r\nfeign:\r\n  httpclient:\r\n    enabled: false\r\n  okhttp:\r\n    enabled: true\r\n  hystrix:\r\n    enabled: true   # feign 熔断机制是否开启\r\n    #支持压缩的mime types\r\n  compression:  # 请求压缩\r\n    request:\r\n      enabled: true\r\n      mime-types: text/xml,application/xml,application/json\r\n      min-request-size: 2048\r\n    response:  # 响应压缩\r\n      enabled: true\r\n\r\nribbon:\r\n  httpclient:\r\n    enabled: false\r\n  okhttp:\r\n    enabled: true\r\n  eureka:\r\n    enabled: true\r\n  ReadTimeout: 30000     #\r\n  ConnectTimeout: 30000  # [ribbon超时时间]大于[熔断超时],那么会先走熔断，相当于你配的ribbon超时就不生效了  ribbon和hystrix是同时生效的，哪个值小哪个生效\r\n  MaxAutoRetries: 0             # 最大自动重试\r\n  MaxAutoRetriesNextServer: 1   # 最大自动像下一个服务重试\r\n  OkToRetryOnAllOperations: false  #无论是请求超时或者socket read timeout都进行重试，\r\n\r\nhystrix:\r\n  threadpool:\r\n    default:\r\n      coreSize: 1000 # #并发执行的最大线程数，默认10\r\n      maxQueueSize: 1000 # #BlockingQueue的最大队列数\r\n      queueSizeRejectionThreshold: 500 # #即使maxQueueSize没有达到，达到queueSizeRejectionThreshold该值后，请求也会被拒绝\r\n  command:\r\n    default:\r\n      execution:\r\n        isolation:\r\n          thread:\r\n            timeoutInMilliseconds: 120000  # 熔断超时 ribbon和hystrix是同时生效的，哪个值小哪个生效\r\n\r\nid-generator:\r\n  machine-code: 1  # id生成器机器掩码', 'f33766c1ef74680c95b4bf4b107d0d52', '2022-09-14 02:47:12', '2022-09-14 02:47:12', NULL, '172.21.0.1', '', '62c96cc2-0759-4a4d-b4be-26901d52d420', NULL, NULL, NULL, 'yaml', NULL, '');
INSERT INTO `config_info` VALUES (2, 'mysql.yml', 'DEFAULT_GROUP', '# mysql 个性化配置， 不同的环境，需要配置不同的链接信息，只需要将这段信息复制\r\n# 到具体环境的配置文件中进行修改即可\r\n# 如：复制到pd-auth-server-dev.yml中将数据库名和ip改掉\r\npinda:\r\n  mysql:\r\n    ip: 127.0.0.1\r\n    port: 3306\r\n    driverClassName: com.mysql.cj.jdbc.Driver\r\n    database: pd_auth\r\n    username: root\r\n    password: abc123456\r\n  database:\r\n    isBlockAttack: false  # 是否启用 攻击 SQL 阻断解析器\r\n\r\n# mysql 通用配置\r\nspring:\r\n  datasource:\r\n    druid:\r\n      username: ${pinda.mysql.username}\r\n      password: ${pinda.mysql.password}\r\n      driver-class-name: ${pinda.mysql.driverClassName}\r\n      url: jdbc:mysql://${pinda.mysql.ip}:${pinda.mysql.port}/${pinda.mysql.database}?characterEncoding=utf8&autoReconnect=true&useUnicode=true&useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=Asia/Shanghai\r\n      db-type: mysql\r\n      initialSize: 10\r\n      minIdle: 10\r\n      maxActive: 500\r\n      max-wait: 60000\r\n      pool-prepared-statements: true\r\n      max-pool-prepared-statement-per-connection-size: 20\r\n      validation-query: SELECT \'x\'\r\n      test-on-borrow: false\r\n      test-on-return: false\r\n      test-while-idle: true\r\n      time-between-eviction-runs-millis: 60000  #配置间隔多久才进行一次检测，检测需要关闭的空闲连接，单位是毫秒\r\n      min-evictable-idle-time-millis: 300000    #配置一个连接在池中最小生存的时间，单位是毫秒\r\n      filters: stat\r\n      # filters: stat,wall\r\n      # filter:\r\n      #   wall:\r\n      #     enabled: true\r\n      #     config:\r\n      #       commentAllow: true\r\n      #       multiStatementAllow: true\r\n      #       noneBaseStatementAllow: true\r\n      web-stat-filter:  # WebStatFilter配置，说明请参考Druid Wiki，配置_配置WebStatFilter\r\n        enabled: true\r\n        url-pattern: /*\r\n        exclusions: \"*.js , *.gif ,*.jpg ,*.png ,*.css ,*.ico , /druid/*\"\r\n        session-stat-max-count: 1000\r\n        profile-enable: true\r\n        session-stat-enable: false\r\n      stat-view-servlet:  #展示Druid的统计信息,StatViewServlet的用途包括：1.提供监控信息展示的html页面2.提供监控信息的JSON API\r\n        enabled: true\r\n        url-pattern: /druid/*   #根据配置中的url-pattern来访问内置监控页面，如果是上面的配置，内置监控页面的首页是/druid/index.html例如：http://127.0.0.1:9000/druid/index.html\r\n        reset-enable: true    #允许清空统计数据\r\n        login-username: pinda\r\n        login-password: pinda\r\n\r\nmybatis-plus:\r\n  mapper-locations:\r\n    - classpath*:mapper_**/**/*Mapper.xml\r\n  #实体扫描，多个package用逗号或者分号分隔\r\n  typeAliasesPackage: com.itheima.pinda.*.entity;com.itheima.pinda.database.mybatis.typehandler\r\n  global-config:\r\n    db-config:\r\n      id-type: INPUT\r\n      insert-strategy: NOT_NULL\r\n      update-strategy: NOT_NULL\r\n      select-strategy: NOT_EMPTY\r\n  configuration:\r\n    #配置返回数据库(column下划线命名&&返回java实体是驼峰命名)，\r\n    #自动匹配无需as（没开启这个，SQL需要写as： select user_id as userId）\r\n    map-underscore-to-camel-case: true\r\n    cache-enabled: false\r\n    #配置JdbcTypeForNull, oracle数据库必须配置\r\n    jdbc-type-for-null: \'null\'\r\n', '6cc1b02af79061b0f2bd6aea6d0a615f', '2022-09-14 02:47:12', '2022-09-14 02:47:12', NULL, '172.21.0.1', '', '62c96cc2-0759-4a4d-b4be-26901d52d420', NULL, NULL, NULL, 'yaml', NULL, '');
INSERT INTO `config_info` VALUES (3, 'pd-auth-server-dev.yml', 'DEFAULT_GROUP', '# p6spy是一个开源项目，通常使用它来跟踪数据库操作，查看程序运行过程中执行的sql语句\r\n# 开发环境需要使用p6spy进行sql语句输出\r\n# 但p6spy会有性能损耗，不适合在生产线使用，故其他环境无需配置\r\n# spring:\r\n#   datasource:\r\n#     driver-class-name: com.p6spy.engine.spy.P6SpyDriver\r\n#     url: jdbc:p6spy:mysql://${pinda.mysql.ip}:${pinda.mysql.port}/${pinda.mysql.database}?serverTimezone=CTT&characterEncoding=utf8&useUnicode=true&useSSL=false&autoReconnect=true&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true\r\n#     db-type: mysql\r\n', '8cb4b4c7f19edda582f0e3e170c3a81c', '2022-09-14 02:47:12', '2022-09-14 02:47:12', NULL, '172.21.0.1', '', '62c96cc2-0759-4a4d-b4be-26901d52d420', NULL, NULL, NULL, 'yaml', NULL, '');
INSERT INTO `config_info` VALUES (4, 'pd-auth-server.yml', 'DEFAULT_GROUP', '# 在这里配置 权限服务 所有环境都能使用的配置\r\npinda:\r\n  mysql:\r\n    database: pd_auth\r\n  swagger:\r\n    enabled: true\r\n    docket:\r\n      auth:\r\n        title: 权限模块\r\n        base-package: com.itheima.pinda.authority.controller.auth\r\n      common:\r\n        title: 公共模块\r\n        base-package: com.itheima.pinda.authority.controller.common\r\n      core:\r\n        title: 组织岗位模块\r\n        base-package: com.itheima.pinda.authority.controller.core\r\n\r\nauthentication:\r\n  user:\r\n    header-name: token\r\n    expire: 43200               # 外部token有效期为12小时\r\n    pri-key: client/pri.key    # 加密\r\n    pub-key: client/pub.key    # 解密\r\n\r\nserver:\r\n  port: 8764\r\n', '40188236b25255fd3aec6d911dc32194', '2022-09-14 02:47:12', '2022-09-14 02:47:12', NULL, '172.21.0.1', '', '62c96cc2-0759-4a4d-b4be-26901d52d420', NULL, NULL, NULL, 'yaml', NULL, '');
INSERT INTO `config_info` VALUES (5, 'pd-gateway.yml', 'DEFAULT_GROUP', 'pinda:\r\n  log:\r\n    enabled: false\r\n\r\nspring:\r\n  mvc:\r\n    servlet:\r\n      path: /gate\r\n\r\nserver:\r\n  port: 8760\r\n  servlet:\r\n    context-path: /api  # = server.servlet.context-path\r\n\r\nzuul:\r\n  #  debug:\r\n  #    request: true\r\n  #  include-debug-header: true\r\n  retryable: false\r\n  servlet-path: /         # 默认是/zuul , 上传文件需要加/zuul前缀才不会出现乱码，这个改成/ 即可不加前缀\r\n  ignored-services: \"*\"   # 忽略eureka上的所有服务\r\n  sensitive-headers:  # 一些比较敏感的请求头，不想通过zuul传递过去， 可以通过该属性进行设置\r\n  #  prefix: /api #为zuul设置一个公共的前缀\r\n  #  strip-prefix: false     #对于代理前缀默认会被移除   故加入false  表示不要移除\r\n  routes:  # 路由配置方式\r\n    authority:  # 其中 authority 是路由名称，可以随便定义，但是path和service-id需要一一对应\r\n      path: /authority/**\r\n      serviceId: pd-auth-server\r\n    file:\r\n      path: /file/**\r\n      serviceId: pd-file-server\r\n    goods:\r\n      path: /goods/**\r\n      serviceId: pd-goods-server\r\n\r\n\r\nauthentication:\r\n  user:\r\n    header-name: token\r\n    pub-key: client/pub.key    # 解密\r\n', 'f1a78d2c11a2206deb73d1ce9b423876', '2022-09-14 02:47:12', '2022-09-14 02:47:12', NULL, '172.21.0.1', '', '62c96cc2-0759-4a4d-b4be-26901d52d420', NULL, NULL, NULL, 'yaml', NULL, '');
INSERT INTO `config_info` VALUES (6, 'pd-goods-server.yml', 'DEFAULT_GROUP', '# 在这里配置 权限服务 所有环境都能使用的配置\r\npinda:\r\n  mysql:\r\n    database: pd_goods\r\n  swagger:\r\n    enabled: true\r\n    docket:\r\n      core:\r\n        title: 核心模块\r\n        base-package: com.itheima.pinda.goods.controller\r\n\r\nserver:\r\n  port: 8767', 'f51253d86855924ef65f7840b8521d21', '2022-09-14 02:47:12', '2022-09-14 02:47:12', NULL, '172.21.0.1', '', '62c96cc2-0759-4a4d-b4be-26901d52d420', NULL, NULL, NULL, 'yaml', NULL, '');
INSERT INTO `config_info` VALUES (7, 'redis.yml', 'DEFAULT_GROUP', '# redis 通用配置， 不同的环境，需要配置不同的链接信息，\r\n# 只需要将这段信息复制到具体环境的配置文件中进行修改即可\r\n# 如：复制到pd-auth-server-dev.yml中将数据库名和ip改掉\r\npinda:\r\n  redis:\r\n    ip: 127.0.0.1\r\n    port: 6379\r\n    password: abc123456\r\n    database: 0\r\n\r\nspring:\r\n  cache:\r\n    type: GENERIC\r\n  redis:\r\n    host: ${pinda.redis.ip}\r\n    password: ${pinda.redis.password}\r\n    port: ${pinda.redis.port}\r\n    database: ${pinda.redis.database}\r\n\r\nj2cache:\r\n  #  config-location: /j2cache.properties\r\n  open-spring-cache: true\r\n  cache-clean-mode: passive\r\n  allow-null-values: true\r\n  redis-client: lettuce\r\n  l2-cache-open: true\r\n  # l2-cache-open: false     # 关闭二级缓存\r\n  broadcast: net.oschina.j2cache.cache.support.redis.SpringRedisPubSubPolicy\r\n  #  broadcast: jgroups       # 关闭二级缓存\r\n  L1:\r\n    provider_class: caffeine\r\n  L2:\r\n    provider_class: net.oschina.j2cache.cache.support.redis.SpringRedisProvider\r\n    config_section: lettuce\r\n  sync_ttl_to_redis: true\r\n  default_cache_null_object: false\r\n  # serialization: fst\r\n  serialization: fastjson\r\ncaffeine:\r\n  properties: /j2cache/caffeine.properties   # 这个配置文件需要放在项目中\r\nlettuce:\r\n  mode: single\r\n  namespace:\r\n  storage: generic\r\n  channel: j2cache\r\n  scheme: redis\r\n  hosts: ${pinda.redis.ip}:${pinda.redis.port}\r\n  password: ${pinda.redis.password}\r\n  database: ${pinda.redis.database}\r\n  sentinelMasterId:\r\n  maxTotal: 100\r\n  maxIdle: 10\r\n  minIdle: 10\r\n  timeout: 10000', 'c8b815bf66d44ac849730bae9e761c8c', '2022-09-14 02:47:12', '2022-09-14 02:47:12', NULL, '172.21.0.1', '', '62c96cc2-0759-4a4d-b4be-26901d52d420', NULL, NULL, NULL, 'yaml', NULL, '');

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'datum_id',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfoaggr_datagrouptenantdatum`(`data_id` ASC, `group_id` ASC, `tenant_id` ASC, `datum_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '增加租户字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_aggr
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '租户字段',
  `encrypted_data_key` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '秘钥',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfobeta_datagrouptenant`(`data_id` ASC, `group_id` ASC, `tenant_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = 'config_info_beta' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_beta
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfotag_datagrouptenanttag`(`data_id` ASC, `group_id` ASC, `tenant_id` ASC, `tag_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = 'config_info_tag' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_tag
-- ----------------------------

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation`  (
  `id` bigint NOT NULL COMMENT 'id',
  `tag_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`) USING BTREE,
  UNIQUE INDEX `uk_configtagrelation_configidtag`(`id` ASC, `tag_name` ASC, `tag_type` ASC) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = 'config_tag_relation' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_tags_relation
-- ----------------------------

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_group_id`(`group_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '集群、各Group容量信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of group_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info`  (
  `id` bigint UNSIGNED NOT NULL,
  `nid` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `md5` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `src_user` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL,
  `src_ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `op_type` char(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '租户字段',
  `encrypted_data_key` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '秘钥',
  PRIMARY KEY (`nid`) USING BTREE,
  INDEX `idx_gmt_create`(`gmt_create` ASC) USING BTREE,
  INDEX `idx_gmt_modified`(`gmt_modified` ASC) USING BTREE,
  INDEX `idx_did`(`data_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '多租户改造' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of his_config_info
-- ----------------------------
INSERT INTO `his_config_info` VALUES (0, 1, 'common.yml', 'DEFAULT_GROUP', '', 'server:\r\n  undertow: # jetty  undertow\r\n    io-threads: 8 # 设置IO线程数, 它主要执行非阻塞的任务,它们会负责多个连接, 默认设置每个CPU核心一个线程\r\n    worker-threads: 120  # 阻塞任务线程池, 当执行类似servlet请求阻塞操作, undertow会从这个线程池中取得线程,它的值设置取决于系统的负载\r\n    buffer-size: 2048  # 以下的配置会影响buffer,这些buffer会用于服务器连接的IO操作,有点类似netty的池化内存管理 , 每块buffer的空间大小,越小的空间被利用越充分\r\n    direct-buffers: true  # 是否分配的直接内存\r\n\r\nspring:\r\n  http:\r\n    encoding:\r\n      charset: UTF-8\r\n      force: true\r\n      enabled: true\r\n  servlet:\r\n    multipart:\r\n      max-file-size: 512MB      # Max file size，默认1M\r\n      max-request-size: 512MB   # Max request size，默认10M\r\n\r\ndozer:\r\n  mappingFiles:\r\n    - classpath:dozer/global.dozer.xml\r\n    - classpath:dozer/biz.dozer.xml\r\nmanagement:\r\n  endpoints:\r\n    web:\r\n      base-path: /actuator\r\n      exposure:\r\n        include: \'*\'\r\n  endpoint:\r\n    health:\r\n      show-details: ALWAYS\r\n      enabled: true\r\n\r\nfeign:\r\n  httpclient:\r\n    enabled: false\r\n  okhttp:\r\n    enabled: true\r\n  hystrix:\r\n    enabled: true   # feign 熔断机制是否开启\r\n    #支持压缩的mime types\r\n  compression:  # 请求压缩\r\n    request:\r\n      enabled: true\r\n      mime-types: text/xml,application/xml,application/json\r\n      min-request-size: 2048\r\n    response:  # 响应压缩\r\n      enabled: true\r\n\r\nribbon:\r\n  httpclient:\r\n    enabled: false\r\n  okhttp:\r\n    enabled: true\r\n  eureka:\r\n    enabled: true\r\n  ReadTimeout: 30000     #\r\n  ConnectTimeout: 30000  # [ribbon超时时间]大于[熔断超时],那么会先走熔断，相当于你配的ribbon超时就不生效了  ribbon和hystrix是同时生效的，哪个值小哪个生效\r\n  MaxAutoRetries: 0             # 最大自动重试\r\n  MaxAutoRetriesNextServer: 1   # 最大自动像下一个服务重试\r\n  OkToRetryOnAllOperations: false  #无论是请求超时或者socket read timeout都进行重试，\r\n\r\nhystrix:\r\n  threadpool:\r\n    default:\r\n      coreSize: 1000 # #并发执行的最大线程数，默认10\r\n      maxQueueSize: 1000 # #BlockingQueue的最大队列数\r\n      queueSizeRejectionThreshold: 500 # #即使maxQueueSize没有达到，达到queueSizeRejectionThreshold该值后，请求也会被拒绝\r\n  command:\r\n    default:\r\n      execution:\r\n        isolation:\r\n          thread:\r\n            timeoutInMilliseconds: 120000  # 熔断超时 ribbon和hystrix是同时生效的，哪个值小哪个生效\r\n\r\nid-generator:\r\n  machine-code: 1  # id生成器机器掩码', 'f33766c1ef74680c95b4bf4b107d0d52', '2022-09-13 18:47:11', '2022-09-14 02:47:12', NULL, '172.21.0.1', 'I', '62c96cc2-0759-4a4d-b4be-26901d52d420', '');
INSERT INTO `his_config_info` VALUES (0, 2, 'mysql.yml', 'DEFAULT_GROUP', '', '# mysql 个性化配置， 不同的环境，需要配置不同的链接信息，只需要将这段信息复制\r\n# 到具体环境的配置文件中进行修改即可\r\n# 如：复制到pd-auth-server-dev.yml中将数据库名和ip改掉\r\npinda:\r\n  mysql:\r\n    ip: 127.0.0.1\r\n    port: 3306\r\n    driverClassName: com.mysql.cj.jdbc.Driver\r\n    database: pd_auth\r\n    username: root\r\n    password: abc123456\r\n  database:\r\n    isBlockAttack: false  # 是否启用 攻击 SQL 阻断解析器\r\n\r\n# mysql 通用配置\r\nspring:\r\n  datasource:\r\n    druid:\r\n      username: ${pinda.mysql.username}\r\n      password: ${pinda.mysql.password}\r\n      driver-class-name: ${pinda.mysql.driverClassName}\r\n      url: jdbc:mysql://${pinda.mysql.ip}:${pinda.mysql.port}/${pinda.mysql.database}?characterEncoding=utf8&autoReconnect=true&useUnicode=true&useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=Asia/Shanghai\r\n      db-type: mysql\r\n      initialSize: 10\r\n      minIdle: 10\r\n      maxActive: 500\r\n      max-wait: 60000\r\n      pool-prepared-statements: true\r\n      max-pool-prepared-statement-per-connection-size: 20\r\n      validation-query: SELECT \'x\'\r\n      test-on-borrow: false\r\n      test-on-return: false\r\n      test-while-idle: true\r\n      time-between-eviction-runs-millis: 60000  #配置间隔多久才进行一次检测，检测需要关闭的空闲连接，单位是毫秒\r\n      min-evictable-idle-time-millis: 300000    #配置一个连接在池中最小生存的时间，单位是毫秒\r\n      filters: stat\r\n      # filters: stat,wall\r\n      # filter:\r\n      #   wall:\r\n      #     enabled: true\r\n      #     config:\r\n      #       commentAllow: true\r\n      #       multiStatementAllow: true\r\n      #       noneBaseStatementAllow: true\r\n      web-stat-filter:  # WebStatFilter配置，说明请参考Druid Wiki，配置_配置WebStatFilter\r\n        enabled: true\r\n        url-pattern: /*\r\n        exclusions: \"*.js , *.gif ,*.jpg ,*.png ,*.css ,*.ico , /druid/*\"\r\n        session-stat-max-count: 1000\r\n        profile-enable: true\r\n        session-stat-enable: false\r\n      stat-view-servlet:  #展示Druid的统计信息,StatViewServlet的用途包括：1.提供监控信息展示的html页面2.提供监控信息的JSON API\r\n        enabled: true\r\n        url-pattern: /druid/*   #根据配置中的url-pattern来访问内置监控页面，如果是上面的配置，内置监控页面的首页是/druid/index.html例如：http://127.0.0.1:9000/druid/index.html\r\n        reset-enable: true    #允许清空统计数据\r\n        login-username: pinda\r\n        login-password: pinda\r\n\r\nmybatis-plus:\r\n  mapper-locations:\r\n    - classpath*:mapper_**/**/*Mapper.xml\r\n  #实体扫描，多个package用逗号或者分号分隔\r\n  typeAliasesPackage: com.itheima.pinda.*.entity;com.itheima.pinda.database.mybatis.typehandler\r\n  global-config:\r\n    db-config:\r\n      id-type: INPUT\r\n      insert-strategy: NOT_NULL\r\n      update-strategy: NOT_NULL\r\n      select-strategy: NOT_EMPTY\r\n  configuration:\r\n    #配置返回数据库(column下划线命名&&返回java实体是驼峰命名)，\r\n    #自动匹配无需as（没开启这个，SQL需要写as： select user_id as userId）\r\n    map-underscore-to-camel-case: true\r\n    cache-enabled: false\r\n    #配置JdbcTypeForNull, oracle数据库必须配置\r\n    jdbc-type-for-null: \'null\'\r\n', '6cc1b02af79061b0f2bd6aea6d0a615f', '2022-09-13 18:47:11', '2022-09-14 02:47:12', NULL, '172.21.0.1', 'I', '62c96cc2-0759-4a4d-b4be-26901d52d420', '');
INSERT INTO `his_config_info` VALUES (0, 3, 'pd-auth-server-dev.yml', 'DEFAULT_GROUP', '', '# p6spy是一个开源项目，通常使用它来跟踪数据库操作，查看程序运行过程中执行的sql语句\r\n# 开发环境需要使用p6spy进行sql语句输出\r\n# 但p6spy会有性能损耗，不适合在生产线使用，故其他环境无需配置\r\n# spring:\r\n#   datasource:\r\n#     driver-class-name: com.p6spy.engine.spy.P6SpyDriver\r\n#     url: jdbc:p6spy:mysql://${pinda.mysql.ip}:${pinda.mysql.port}/${pinda.mysql.database}?serverTimezone=CTT&characterEncoding=utf8&useUnicode=true&useSSL=false&autoReconnect=true&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true\r\n#     db-type: mysql\r\n', '8cb4b4c7f19edda582f0e3e170c3a81c', '2022-09-13 18:47:11', '2022-09-14 02:47:12', NULL, '172.21.0.1', 'I', '62c96cc2-0759-4a4d-b4be-26901d52d420', '');
INSERT INTO `his_config_info` VALUES (0, 4, 'pd-auth-server.yml', 'DEFAULT_GROUP', '', '# 在这里配置 权限服务 所有环境都能使用的配置\r\npinda:\r\n  mysql:\r\n    database: pd_auth\r\n  swagger:\r\n    enabled: true\r\n    docket:\r\n      auth:\r\n        title: 权限模块\r\n        base-package: com.itheima.pinda.authority.controller.auth\r\n      common:\r\n        title: 公共模块\r\n        base-package: com.itheima.pinda.authority.controller.common\r\n      core:\r\n        title: 组织岗位模块\r\n        base-package: com.itheima.pinda.authority.controller.core\r\n\r\nauthentication:\r\n  user:\r\n    header-name: token\r\n    expire: 43200               # 外部token有效期为12小时\r\n    pri-key: client/pri.key    # 加密\r\n    pub-key: client/pub.key    # 解密\r\n\r\nserver:\r\n  port: 8764\r\n', '40188236b25255fd3aec6d911dc32194', '2022-09-13 18:47:11', '2022-09-14 02:47:12', NULL, '172.21.0.1', 'I', '62c96cc2-0759-4a4d-b4be-26901d52d420', '');
INSERT INTO `his_config_info` VALUES (0, 5, 'pd-gateway.yml', 'DEFAULT_GROUP', '', 'pinda:\r\n  log:\r\n    enabled: false\r\n\r\nspring:\r\n  mvc:\r\n    servlet:\r\n      path: /gate\r\n\r\nserver:\r\n  port: 8760\r\n  servlet:\r\n    context-path: /api  # = server.servlet.context-path\r\n\r\nzuul:\r\n  #  debug:\r\n  #    request: true\r\n  #  include-debug-header: true\r\n  retryable: false\r\n  servlet-path: /         # 默认是/zuul , 上传文件需要加/zuul前缀才不会出现乱码，这个改成/ 即可不加前缀\r\n  ignored-services: \"*\"   # 忽略eureka上的所有服务\r\n  sensitive-headers:  # 一些比较敏感的请求头，不想通过zuul传递过去， 可以通过该属性进行设置\r\n  #  prefix: /api #为zuul设置一个公共的前缀\r\n  #  strip-prefix: false     #对于代理前缀默认会被移除   故加入false  表示不要移除\r\n  routes:  # 路由配置方式\r\n    authority:  # 其中 authority 是路由名称，可以随便定义，但是path和service-id需要一一对应\r\n      path: /authority/**\r\n      serviceId: pd-auth-server\r\n    file:\r\n      path: /file/**\r\n      serviceId: pd-file-server\r\n    goods:\r\n      path: /goods/**\r\n      serviceId: pd-goods-server\r\n\r\n\r\nauthentication:\r\n  user:\r\n    header-name: token\r\n    pub-key: client/pub.key    # 解密\r\n', 'f1a78d2c11a2206deb73d1ce9b423876', '2022-09-13 18:47:11', '2022-09-14 02:47:12', NULL, '172.21.0.1', 'I', '62c96cc2-0759-4a4d-b4be-26901d52d420', '');
INSERT INTO `his_config_info` VALUES (0, 6, 'pd-goods-server.yml', 'DEFAULT_GROUP', '', '# 在这里配置 权限服务 所有环境都能使用的配置\r\npinda:\r\n  mysql:\r\n    database: pd_goods\r\n  swagger:\r\n    enabled: true\r\n    docket:\r\n      core:\r\n        title: 核心模块\r\n        base-package: com.itheima.pinda.goods.controller\r\n\r\nserver:\r\n  port: 8767', 'f51253d86855924ef65f7840b8521d21', '2022-09-13 18:47:11', '2022-09-14 02:47:12', NULL, '172.21.0.1', 'I', '62c96cc2-0759-4a4d-b4be-26901d52d420', '');
INSERT INTO `his_config_info` VALUES (0, 7, 'redis.yml', 'DEFAULT_GROUP', '', '# redis 通用配置， 不同的环境，需要配置不同的链接信息，\r\n# 只需要将这段信息复制到具体环境的配置文件中进行修改即可\r\n# 如：复制到pd-auth-server-dev.yml中将数据库名和ip改掉\r\npinda:\r\n  redis:\r\n    ip: 127.0.0.1\r\n    port: 6379\r\n    password: abc123456\r\n    database: 0\r\n\r\nspring:\r\n  cache:\r\n    type: GENERIC\r\n  redis:\r\n    host: ${pinda.redis.ip}\r\n    password: ${pinda.redis.password}\r\n    port: ${pinda.redis.port}\r\n    database: ${pinda.redis.database}\r\n\r\nj2cache:\r\n  #  config-location: /j2cache.properties\r\n  open-spring-cache: true\r\n  cache-clean-mode: passive\r\n  allow-null-values: true\r\n  redis-client: lettuce\r\n  l2-cache-open: true\r\n  # l2-cache-open: false     # 关闭二级缓存\r\n  broadcast: net.oschina.j2cache.cache.support.redis.SpringRedisPubSubPolicy\r\n  #  broadcast: jgroups       # 关闭二级缓存\r\n  L1:\r\n    provider_class: caffeine\r\n  L2:\r\n    provider_class: net.oschina.j2cache.cache.support.redis.SpringRedisProvider\r\n    config_section: lettuce\r\n  sync_ttl_to_redis: true\r\n  default_cache_null_object: false\r\n  # serialization: fst\r\n  serialization: fastjson\r\ncaffeine:\r\n  properties: /j2cache/caffeine.properties   # 这个配置文件需要放在项目中\r\nlettuce:\r\n  mode: single\r\n  namespace:\r\n  storage: generic\r\n  channel: j2cache\r\n  scheme: redis\r\n  hosts: ${pinda.redis.ip}:${pinda.redis.port}\r\n  password: ${pinda.redis.password}\r\n  database: ${pinda.redis.database}\r\n  sentinelMasterId:\r\n  maxTotal: 100\r\n  maxIdle: 10\r\n  minIdle: 10\r\n  timeout: 10000', 'c8b815bf66d44ac849730bae9e761c8c', '2022-09-13 18:47:11', '2022-09-14 02:47:12', NULL, '172.21.0.1', 'I', '62c96cc2-0759-4a4d-b4be-26901d52d420', '');

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `role` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `resource` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `action` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  UNIQUE INDEX `uk_role_permission`(`role` ASC, `resource` ASC, `action` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permissions
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `username` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `role` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  UNIQUE INDEX `idx_user_role`(`username` ASC, `role` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('nacos', 'ROLE_ADMIN');

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数',
  `max_aggr_size` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_id`(`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '租户容量信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tenant_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_info_kptenantid`(`kp` ASC, `tenant_id` ASC) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = 'tenant_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tenant_info
-- ----------------------------
INSERT INTO `tenant_info` VALUES (1, '1', '62c96cc2-0759-4a4d-b4be-26901d52d420', 'pinda-dev', '开发组', 'nacos', 1663094804347, 1663094804347);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `username` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `password` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('nacos', '$2a$10$NN6dQnazAvxCpAs1aaLedO.bN.hLBP0FmkRtXaY3k8l0WVDMe1N.W', 1);

SET FOREIGN_KEY_CHECKS = 1;
