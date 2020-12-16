create table w_companies (
	id int NOT NULL AUTO_INCREMENT primary key,
	company_name varchar(255) default '' comment '公司名',
	station_ids varchar(1000) default '' comment '燃气站',
	addr varchar(255) default '' comment '地址',
	lng varchar(255) default '' comment '经度',
	lat varchar(255) default '' comment '纬度',
	contact_user varchar(255) default '' comment '联系人',
	contact_user_mobile varchar(255) default '' comment '联系人手机',
	contact_user_tel varchar(255) default '' comment '联系人电话',
	permit tinyint default 1 comment '经营许可证',
	permit_pic varchar(255) default null comment '经营许可证图片',
	website varchar(255) default '' comment '网站',
	legal_name varchar(255) default '' comment '法人',
	legal_mobile varchar(255) default '' comment '法人手机',
	legal_idnum varchar(255) default '' comment '法人身份证',
	secure_name varchar(255) default '' comment '安全责任人',
	secure_mobile varchar(255) default '' comment '安全责任人手机',
	secure_idnum varchar(255) default '' comment '安全责任人身份证',
	ck_status tinyint default 0 comment '审核状态 0未审核 1已审核',
	`created_at` datetime DEFAULT NULL COMMENT '创建时间',
	`updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) comment '燃气公司';

create table w_stations (
	id int NOT NULL AUTO_INCREMENT primary key,
	station_name varchar(255) default '' comment '燃气站名',
	company_id int default 0 comment '所属公司id',
	type tinyint default 0 comment '0换瓶站, 1 LNG气站, 2 CNG气站',
	addr varchar(255) default '' comment '地址',
	lng varchar(255) default '' comment '经度',
	lat varchar(255) default '' comment '纬度',
	contact_user varchar(255) default '' comment '联系人',
	contact_user_mobile varchar(255) default '' comment '联系人手机',
	contact_user_tel varchar(255) default '' comment '联系人电话',
	permit tinyint default 1 comment '经营许可证',
	permit_no varchar(255) default '' comment '许可证编号',
	permit_pic varchar(255) default null comment '经营许可证图片',
	schedule varchar(1000) default null comment '值班信息',
	remark varchar(1000) default null comment '备注',
	backup_no varchar(255) default '' comment '备案编号',
	backup_company_id varchar(255) default '' comment '申报单位',
	ck_status tinyint default 0 comment '备案状态 0未审核 1已审核',
	license tinyint default 1 comment '营业执照',
	license_no varchar(255) default '' comment '营业执照编号',
	license_pic varchar(255) default '' comment '营业执照图片',
	device_ids varchar(1000) default '' comment '站点设备',
	admin_user_id int default 0 comment '人员分配id',
	`created_at` datetime DEFAULT NULL COMMENT '创建时间',
	`updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) comment '燃气站';

create table w_devices (
	id int NOT NULL AUTO_INCREMENT primary key,
	station_id int default 0 comment '站点id',
	device_no varchar(255) default '' comment '设备编号',
	device_name varchar(255) default '' comment '设备名',
	device_type varchar(255) default '' comment '设备型号',
	admin_user_id int default 0 comment '负责人id',
	device_status tinyint default 0 comment '0正常, 1维修中, 2已报废',
	device_pic varchar(255) default '' comment '设备图片',
	fix_logs varchar(3000) default '' comment '维修记录',
	`created_at` datetime DEFAULT NULL COMMENT '创建时间',
	`updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) comment '设备';

alter TABLE `w_admin_users` 
add station_id int default 0 comment '站点id',
add gender tinyint default 1 comment '性别 0女 1男',
add age tinyint default 0 comment '年龄',
add mobile varchar(12) default '' comment '手机',
add job_desc varchar(255) default '' comment '工作内容',
add remark varchar(255) default '' comment '备注',
add organ_id int default 0 comment '组织id',
add status tinyint default 0 comment '0正常, 1禁用',
add type tinyint default 0 comment '0管理员, 1工作人员',
add token varchar(32) not null default '' comment 'token',
add cid int default 0 comment '连接id';

create table w_zones (
	id int NOT NULL AUTO_INCREMENT primary key,
	zone_name varchar(32) not null default '' comment '区域名称',
	zone_range varchar(1000) not null default '' comment '区域范围',
	station_ids varchar(100) not null default '' comment '站点',
	gas_type tinyint default 0 comment '供气方式',
	tube_length int default 0 comment '管道长度',
	cover_area int default 0 comment '供气面积',
	population int default 0 comment '供气人口',
	zone_status tinyint default 0 comment '区域状态 0可用 1禁用',
	`created_at` datetime DEFAULT NULL COMMENT '创建时间',
	`updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) comment '区域管理';

create table w_articles (
	id int NOT NULL AUTO_INCREMENT primary key,
	title varchar(255) not null default '' comment '标题',
	article_type tinyint default 0 comment '0公告 1安全 2政策',
	cate_id tinyint default 0 comment '文章类型',
	content text default null comment '内容',
	effect_type tinyint default 0 comment '有效 0 永久, 1限时',
	effect_days int default 0 comment '有效天数',
	send_type tinyint default 0 comment '发送 0立即, 1定时',
	send_time varchar(32) default null comment '发送时间',
	receive_type tinyint default 0 comment '接收 0全部 1指定人',
	receive_user_ids varchar(1000) default null comment '接收人id',
	post_user_id int default 0 comment '发布人id',
	post_status tinyint default 0 comment '发布状态 0已发布 1草稿',
	attaches varchar(255) default null comment '附件',
	`created_at` datetime DEFAULT NULL COMMENT '创建时间',
	`updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) comment '文章';

create table w_categories (
	id int NOT NULL AUTO_INCREMENT primary key,
	cate_name varchar(255) default null comment '类型名',
	`created_at` datetime DEFAULT NULL COMMENT '创建时间',
	`updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) comment '文章类型';

create table w_attachments (
	id int NOT NULL AUTO_INCREMENT primary key,
	article_id int default 0 comment '文章id',
	path varchar(255) default null comment '文件路径',
	`created_at` datetime DEFAULT NULL COMMENT '创建时间',
	`updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) comment '附件';

create table w_events (
	id int NOT NULL AUTO_INCREMENT primary key,
	event_name varchar(255) not null default '' comment '事件名',
	event_type_id tinyint default 0 comment '事件类型',
	station_id int default 0 comment '站点id',
	admin_user_id int default 0 comment '人员分配id',
	event_status tinyint default 0 comment '0未解决, 1已解决',
	deal_content varchar(1000) default '' comment '处理过程',
	`solved_time` varchar(32) DEFAULT NULL COMMENT '解决时间',
	`solved_minutes` varchar(32) DEFAULT NULL COMMENT '解决时长(分钟)',
	`created_year` varchar(32) DEFAULT NULL COMMENT '创建年份',
	`created_month` varchar(32) DEFAULT NULL COMMENT '创建月份',
	`solved_at` datetime DEFAULT NULL COMMENT '解决时间',
	`created_day` varchar(32) DEFAULT NULL COMMENT '创建日期',
	`created_date` varchar(32) DEFAULT NULL COMMENT '创建时间',
	`created_time` datetime DEFAULT NULL COMMENT '创建时间',
	`created_at` datetime DEFAULT NULL COMMENT '创建时间',
	`updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) comment '事件';

create table w_event_types (
	id int NOT NULL AUTO_INCREMENT primary key,
	etype_name varchar(255) not null default '' comment '类型名',
	deal_time char(12) default '' comment '处理时间 (时:分)',
	`created_at` datetime DEFAULT NULL COMMENT '创建时间',
	`updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) comment '事件类型';

create table w_standards (
	id int NOT NULL AUTO_INCREMENT primary key,
	project varchar(255) default '' comment '项目',
	weight int default 0 comment '权重',
	standard int default 0 comment '标准',
	bonus int default 0 comment '补贴金额',
	real_data int default 0 comment '实际数据',
	result varchar(32) default null comment '结果 0未通过 1通过',
	std_type tinyint default 0 comment '0 液化气 1自采暖 2经营许可 3考核记录 4事件处理 5消防设施 6 安全作业 7管理制度',
	`created_at` datetime DEFAULT NULL COMMENT '创建时间',
	`updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) comment '标准';

create table w_gas_stats (
	id int NOT NULL AUTO_INCREMENT primary key,
	used_year char(12) default '' comment '使用年份',
	company_id int default 0 comment '公司id',
	used_gas int default 0 comment '用气量(L)',
	`created_at` datetime DEFAULT NULL COMMENT '创建时间',
	`updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) comment '用气量统计';

create table w_gas_used_details (
	id int NOT NULL AUTO_INCREMENT primary key,
	company_id int default 0 comment '所属公司id',
	data_pic varchar(255) default '' comment '数据图片',
	report_user_name varchar(32) default '' comment '上报人',
	report_time varchar(32) default '' comment '上报时间',
	used_gas decimal(10, 2) not null default 0 comment '用气量',
	`created_year` varchar(32) DEFAULT NULL COMMENT '创建年份',
	`created_month` varchar(32) DEFAULT NULL COMMENT '创建月份',
	`created_day` varchar(32) DEFAULT NULL COMMENT '创建日期',
	`created_date` varchar(32) DEFAULT NULL COMMENT '创建时间',
	`created_time` datetime DEFAULT NULL COMMENT '创建时间',
	`created_at` datetime DEFAULT NULL COMMENT '创建时间',
	`updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) comment '用气量明细';

create table w_rooms (
	id int NOT NULL AUTO_INCREMENT primary key,
	room_name varchar(32) not null default '' comment '群组名',
	room_pic varchar(255) not null default '' comment '群组图标',
	`created_at` datetime DEFAULT NULL COMMENT '创建时间',
	`updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) comment '聊天室';

create table w_room_users (
	id int NOT NULL AUTO_INCREMENT primary key,
	room_id int not null default 0 comment '聊天室id',
	user_id int not null default 0 comment '用户id',
	`created_at` datetime DEFAULT NULL COMMENT '创建时间',
	`updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) comment '聊天室用户';
