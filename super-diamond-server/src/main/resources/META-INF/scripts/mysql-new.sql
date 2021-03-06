CREATE DATABASE edu_diamond;

use edu_diamond;

CREATE TABLE `CONF_USER` (
  `ID` int(11) NOT NULL,
  `USER_CODE` varchar(32) DEFAULT NULL,
  `USER_NAME` varchar(32) NOT NULL,
  `PASSWORD` varchar(32) NOT NULL,
  `DELETE_FLAG` int(1) DEFAULT '0',
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `CONF_PROJECT` (
  `ID` int(11) NOT NULL,
  `PROJ_CODE` varchar(32) DEFAULT NULL,
  `PROJ_NAME` varchar(32) DEFAULT NULL,
  `OWNER_ID` int(11) DEFAULT NULL,
  `DEVELOPMENT_VERSION` INT(11) DEFAULT 0  NULL,
  `PRODUCTION_VERSION` INT(11) DEFAULT 0  NULL,
  `TEST_VERSION` INT(11) DEFAULT 0  NULL,
  `BUILD_VERSION` INT(11) DEFAULT 0  NULL,
  `DELETE_FLAG` int(1) DEFAULT '0',
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `CONF_PROJECT_USER` (
  `PROJ_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`PROJ_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `CONF_PROJECT_MODULE` (
  `MODULE_ID` int(11) NOT NULL,
  `PROJ_ID` int(11) NOT NULL,
  `MODULE_NAME` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`MODULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `CONF_PROJECT_USER_ROLE` (
  `PROJ_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `ROLE_CODE` varchar(32) NOT NULL,
  PRIMARY KEY (`PROJ_ID`,`USER_ID`,`ROLE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `CONF_PROJECT_CONFIG` (
  `CONFIG_ID` INT(11) NOT NULL,
  `CONFIG_KEY` VARCHAR(64) NOT NULL,
  `CONFIG_VALUE` VARCHAR(256) NOT NULL,
  `CONFIG_DESC` VARCHAR(256) DEFAULT NULL,
  `CONFIG_TYPE` VARCHAR(11) DEFAULT NULL,
  `VISABLE_TYPE` VARCHAR(11) DEFAULT NULL,
  `PROJECT_ID` INT(11) NOT NULL,
  `MODULE_ID` INT(11) NOT NULL,
  `DELETE_FLAG` INT(1) DEFAULT '0',
  `OPT_USER` VARCHAR(32) DEFAULT NULL,
  `OPT_TIME` DATETIME DEFAULT NULL,
  `PRODUCTION_VALUE` VARCHAR(256) NOT NULL,
  `PRODUCTION_USER` VARCHAR(32) DEFAULT NULL,
  `PRODUCTION_TIME` DATETIME DEFAULT NULL,
  `TEST_VALUE` VARCHAR(256) NOT NULL,
  `TEST_USER` VARCHAR(32) DEFAULT NULL,
  `TEST_TIME` DATETIME DEFAULT NULL,
  `BUILD_VALUE` VARCHAR(256) NOT NULL,
  `BUILD_USER` VARCHAR(32) DEFAULT NULL,
  `BUILD_TIME` DATETIME DEFAULT NULL,
  PRIMARY KEY (`CONFIG_ID`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

create table `CONF_SHOW_PUSH`(
  `PROJ_CODE` varchar(32) DEFAULT '' COMMENT "项目编号",
  `PROFILE_NAME` varchar(32) DEFAULT '' COMMENT "配置环境(development,build,test,production)",
  `MODULE_NAMES` varchar(120) DEFAULT '' COMMENT "模块名称，可能包含多个模块,是客户端推给服务端的",
  `CLIENT_ADDRESS` varchar(32) DEFAULT '' COMMENT "对应的客户端连接地址,用于页面展示",
  `CTX_IDENTIFIER` INTEGER  DEFAULT 0 COMMENT "客户端与服务器连接的唯一标识",
  `CONN_TIME` datetime DEFAULT '1990-01-01 12:00:00' COMMENT "客户端连接的时间",
  `LAST_CONN_TIME` datetime DEFAULT '1990-01-01 12:00:00' COMMENT "客户端最后连接的时间",
  `SERVER_UUID` varchar(120) DEFAULT '' COMMENT "唯一标识当前server的UUID",
  `NEED_PUSH` char(1) DEFAULT '0' COMMENT "是否需要推送 0:不需要  1:需要",
  `CLIENT_TYPE` varchar(30) DEFAULT 'JAVA' COMMENT "客户端类型"
)ENGINE=INNODB DEFAULT CHARSET=utf8;

create table `SERVER_INFO`(
  `SERVER_ADDRESS_PORT` varchar(32) DEFAULT '' COMMENT "servlet容器的启动ip:port",
  `BOOTSTRAP_TIME` datetime DEFAULT '1990-01-01 12:00:00' COMMENT "servlet容器的启动时间",
  `SERVER_UUID` varchar(120) DEFAULT '' COMMENT "唯一标识当前server的UUID"
)ENGINE=INNODB DEFAULT CHARSET=utf8;

create table `MODULE_TEMPLATE`(
  `MODULE_NAME` varchar(120) COMMENT "模块名称"
)ENGINE=INNODB DEFAULT CHARSET=utf8;

create table `MODULE_TEMPLATE_DETAIL`(
  `MODULE_NAME` varchar(120) COMMENT "模块名称",
  `CONFIG_KEY` varchar(120) COMMENT "key",
  `CONFIG_VALUE` varchar(256) COMMENT "value",
  `CONFIG_DESC` varchar(256) COMMENT "配置描述"
)ENGINE=INNODB DEFAULT CHARSET=utf8;

insert into CONF_USER(id,USER_code,USER_NAME,PASSWORD,CREATE_TIME) values(1,'admin','admin','21232f297a57a5a743894a0e4a801fc3',current_timestamp());
insert into CONF_USER(id,USER_code,USER_NAME,PASSWORD,CREATE_TIME) values(2,'guest','guest','084e0343a0486ff05530df6c705c8bb4',current_timestamp());