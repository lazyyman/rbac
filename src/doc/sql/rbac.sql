-- 部门表
DROP TABLE IF EXISTS `rbac`.`sys_dept`;

CREATE TABLE `rbac`.`sys_dept` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `name` VARCHAR(40) NOT NULL DEFAULT '' COMMENT '部门名称',
  `parent_id` INT NOT NULL DEFAULT 0 COMMENT '上级部门ID',
  `level` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '部门层级',
  `seq` INT NOT NULL DEFAULT 0 COMMENT '部门在当前层级下的顺序, 由小到大',
  `remark` VARCHAR(255) DEFAULT '' COMMENT '备注',
  `operator` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '操作者',
  `operate_time` DATETIME NOT NULL DEFAULT now() COMMENT '最后一次操作的时间',
  `operate_ip` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '最后一次更新操作者IP',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT = '部门表';

-- 用户表
DROP TABLE IF EXISTS `rbac`.`sys_user`;

CREATE TABLE `rbac`.`sys_user` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` VARCHAR(40) NOT NULL DEFAULT '' COMMENT '密码',
  `telephone` VARCHAR(13) NOT NULL DEFAULT '' COMMENT '手机号',
  `mail` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '邮箱',
  `dept_id` INT NOT NULL DEFAULT 0 COMMENT '用户所属部门ID',
  `status` INT NOT NULL DEFAULT 1 COMMENT '状态: 1: 正常 0: 冻结 2: 删除',
  `remark` VARCHAR(255) DEFAULT '' COMMENT '备注',
  `operator` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '操作者',
  `operate_time` DATETIME NOT NULL DEFAULT now() COMMENT '最后一次操作的时间',
  `operate_ip` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '最后一次更新操作者IP',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT = '用户表';


-- 权限模块表
DROP TABLE IF EXISTS `rbac`.`sys_acl_module`;

CREATE TABLE `rbac`.`sys_acl_module` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '权限模块ID',
  `name` VARCHAR(40) NOT NULL DEFAULT '' COMMENT '权限模块名称',
  `parent_id` INT NOT NULL DEFAULT 0 COMMENT '上级权限模块ID',
  `level` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '权限模块层级',
  `status` INT NOT NULL DEFAULT 1 COMMENT '状态: 1: 正常 0: 冻结',
  `seq` INT NOT NULL DEFAULT 0 COMMENT '权限模块在当前层级下的顺序, 由小到大',
  `remark` VARCHAR(255) DEFAULT '' COMMENT '备注',
  `operator` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '操作者',
  `operate_time` DATETIME NOT NULL DEFAULT now() COMMENT '最后一次操作的时间',
  `operate_ip` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '最后一次更新操作者IP',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT = '权限模块表';

-- 权限表
DROP TABLE IF EXISTS `rbac`.`sys_acl`;

CREATE TABLE `rbac`.`sys_acl` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '权限ID',
  `code` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '权限码',
  `name` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '权限名称',
  `acl_module_id` INT NOT NULL DEFAULT 0 COMMENT '权限所属的权限模块ID',
  `url` VARCHAR(255) DEFAULT '' COMMENT '请求的URL, 可以填写正则表达式',
  `type` INT NOT NULL DEFAULT 3 COMMENT '类型 1: 菜单 2: 按钮 3: 其他',
  `status` INT NOT NULL DEFAULT 1 COMMENT '状态: 1: 正常 0: 冻结',
  `seq` INT NOT NULL DEFAULT 0 COMMENT '权限模块在当前层级下的顺序, 由小到大',
  `remark` VARCHAR(255) DEFAULT '' COMMENT '备注',
  `operator` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '操作者',
  `operate_time` DATETIME NOT NULL DEFAULT now() COMMENT '最后一次操作的时间',
  `operate_ip` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '最后一次更新操作者IP',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT = '权限表';

-- 角色表
DROP TABLE IF EXISTS `rbac`.`sys_role`;

CREATE TABLE `rbac`.`sys_role` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `name` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '角色名称',
  `type` INT NOT NULL DEFAULT 1 COMMENT '角色类型 1: 管理员 2: 其他',
  `status` INT NOT NULL DEFAULT 1 COMMENT '状态: 1: 正常 0: 冻结',
  `remark` VARCHAR(255) DEFAULT '' COMMENT '备注',
  `operator` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '操作者',
  `operate_time` DATETIME NOT NULL DEFAULT now() COMMENT '最后一次操作的时间',
  `operate_ip` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '最后一次更新操作者IP',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT = '角色表';

-- 角色用户关联关系表
DROP TABLE IF EXISTS `rbac`.`sys_role_user`;

CREATE TABLE `rbac`.`sys_role_user` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `role_id` INT NOT NULL DEFAULT 0 COMMENT '角色ID',
  `user_id` INT NOT NULL DEFAULT 0 COMMENT '用户ID',
  `operator` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '操作者',
  `operate_time` DATETIME NOT NULL DEFAULT now() COMMENT '最后一次操作的时间',
  `operate_ip` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '最后一次更新操作者IP',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT = '角色用户关联关系表';

-- 角色权限关联关系表
DROP TABLE IF EXISTS `rbac`.`sys_role_acl`;

CREATE TABLE `rbac`.`sys_role_acl` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `role_id` INT NOT NULL DEFAULT 0 COMMENT '角色ID',
  `acl_id` INT NOT NULL DEFAULT 0 COMMENT '权限ID',
  `operator` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '操作者',
  `operate_time` DATETIME NOT NULL DEFAULT now() COMMENT '最后一次操作的时间',
  `operate_ip` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '最后一次更新操作者IP',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT = '角色用户关联关系表';

-- 权限日志表
DROP TABLE IF EXISTS `rbac`.`sys_log`;

CREATE TABLE `rbac`.`sys_log` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `type` INT NOT NULL DEFAULT 0 COMMENT '权限更新类型 1: 部门 2: 用户 3: 权限模块 4: 权限 5: 角色 6: 角色用户关系 7: 角色权限关系 ',
  `target_id` INT NOT NULL DEFAULT 0 COMMENT '基于type 后制定的对象ID, 比如用户、权限、角色等表的主键',
  `old_value` TEXT COMMENT '权限ID',
  `new_value` TEXT COMMENT '权限ID',
  `operator` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '操作者',
  `operate_time` DATETIME NOT NULL DEFAULT now() COMMENT '最后一次操作的时间',
  `operate_ip` VARCHAR(20) NOT NULL DEFAULT '' COMMENT '最后一次更新操作者IP',
  `status` INT NOT NULL DEFAULT 0 COMMENT '当前是否复原过: 0: 没有 1: 复原过',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT = '权限日志表';