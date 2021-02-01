create table w_companies (
	id int NOT NULL AUTO_INCREMENT primary key,
	company_name varchar(255) default '' comment '公司名',
	company_type int default 0 comment '0 私企 1国企',
	belongs varchar(1000) default '' comment '属地',
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
	store_gas int default 0 comment '储气量',
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
add organ_id2 int default 0 comment '组织id2',
add organ_id3 int default 0 comment '组织id3',
add status tinyint default 0 comment '0正常, 1禁用',
add type tinyint default 0 comment '0管理员, 1工作人员',
add token varchar(32) not null default '' comment 'token',
add uuid varchar(255) default '' comment '连接id';
add user_id int default 0 comment '外部用户id',
add extras varchar(2000) not null default '' comment '扩展',


create table w_zones (
	id int NOT NULL AUTO_INCREMENT primary key,
	zone_name varchar(32) not null default '' comment '区域名称',
	zone_range varchar(1000) not null default '' comment '区域范围',
	station_ids varchar(100) not null default '' comment '站点',
	station_names varchar(1000) not null default '' comment '站点名',
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
	effect_status tinyint default 0 comment '有效状态 0正常 1已过期',
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
	std_type tinyint default 0 comment '0 液化气 1自采暖 2经营许可 3考核记录 4事件处理 5消防设施 6 安全作业 7管理制度',
	`created_at` datetime DEFAULT NULL COMMENT '创建时间',
	`updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) comment '标准';

create table w_gas_stats (
	id int NOT NULL AUTO_INCREMENT primary key,
	year varchar(12) not null default '' comment '上报年',
	company_id int default 0 comment '公司id',
	used_gas int default 0 comment '用量(L)',
	receipt varchar(255) not null default '' comment '凭证',
	gas_type tinyint default 0 comment '1用气量 2销量 3自采暖',
	quarter tinyint default 0 comment '季度 1,2,3,4',
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
	user_cnt int default 0 comment '用户数',
	`created_at` datetime DEFAULT NULL COMMENT '创建时间',
	`updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) comment '聊天室';

create table w_room_users (
	id int NOT NULL AUTO_INCREMENT primary key,
	room_id int not null default 0 comment '聊天室id',
	user_id int not null default 0 comment '用户id',
	user_type int not null default 0 comment '用户类型 0普通用户 1群主',
	`created_at` datetime DEFAULT NULL COMMENT '创建时间',
	`updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) comment '聊天室用户';

create table w_organs (
	id int NOT NULL AUTO_INCREMENT primary key,
	organ_name varchar(255) not null default '' comment '组织名',
	sort tinyint not null default 0 comment '排序',
	pid int default 0 comment '父级id',
	`created_at` datetime DEFAULT NULL COMMENT '创建时间',
	`updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) comment '组织管理';

create table w_im_msgs (
	id int NOT NULL AUTO_INCREMENT primary key,
	msgid varchar(32) not null default '' comment '消息id',
	timestamp int not null default 0 comment '时间戳',
	type int not null default 1 comment '类型 1聊天 2公告 9登录',
	chat_type int not null default 1 comment '1 单聊, 2群聊',
	msg_type int not null default 0 comment '消息类型 1文本 2语音 3图片 4文件',
	msg varchar(1000) not null default '' comment '消息内容',
	token varchar(32) not null default '' comment '用户token',
	user_id int not null default 0 comment '用户id',
	`to` int not null default 0 comment '接收方 用户id/群组id',
	file_url varchar(255) not null default '' comment '文件url',
	file_name varchar(255) not null default '' comment '文件名',
	file_ext varchar(255) not null default '' comment '文件扩展',
	is_send int not null default 0 comment '是否已发送 0否 1是',
	name varchar(255) not null default '' comment '用户名',
	avatar varchar(255) not null default '' comment '用户头像',
	room_name varchar(255) not null default '' comment '群名',
	room_pic varchar(255) not null default '' comment '群图标',
	`created_at` datetime DEFAULT NULL COMMENT '创建时间',
	`updated_at` datetime DEFAULT NULL COMMENT '更新时间',
	`deleted_at` datetime DEFAULT NULL COMMENT '删除时间'
) comment '历史消息';

create table w_chats (
	id int NOT NULL AUTO_INCREMENT primary key,
	user_id int not null default 0 comment '用户id',
	`to` int not null default 0 comment '接收方 用户id/群组id',
	chat_type int not null default 1 comment '1 单聊, 2群聊',
	msg_type int not null default 0 comment '消息类型 1文本 2语音 3图片 4文件',
	msg varchar(1000) not null default '' comment '消息内容',
	file_url varchar(255) not null default '' comment '文件url',
	file_name varchar(255) not null default '' comment '文件名',
	file_ext varchar(255) not null default '' comment '文件扩展',
	name varchar(255) not null default '' comment '用户名',
	avatar varchar(255) not null default '' comment '用户头像',
	`created_at` datetime DEFAULT NULL COMMENT '创建时间',
	`updated_at` datetime DEFAULT NULL COMMENT '更新时间',
	`deleted_at` datetime DEFAULT NULL COMMENT '删除时间'
) comment '用户会话';

create table w_article_views (
	id int NOT NULL AUTO_INCREMENT primary key,
	article_id int default 0 comment '文章id',
	user_id int not null default 0 comment '用户id',
	`created_at` datetime DEFAULT NULL COMMENT '创建时间',
	`updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) comment '文章浏览记录';

create table w_station_exams (
	id int NOT NULL AUTO_INCREMENT primary key,
	period tinyint default 0 comment '考核周期 0周 1月 2季 3年',
	quarter tinyint default 0 comment '季度 1,2,3,4',
	station_id int default 0 comment '站点id',
	company_id int default 0 comment '公司id',
	score int default 0 comment '评分',
	exam_status int default 0 comment '考核状态 0未考核 1已考核',
	exam_date varchar(32) default 0 comment '考核时间',
	remark varchar(2000) default null comment '备注',
	std_type tinyint default 0 comment '0 液化气 1自采暖 2经营许可 3考核记录 4事件处理 5消防设施 6 安全作业 7管理制度 8用气量 9评价',
	event_deal_cnt int default 0 comment '事件处理数',
	event_cnt int default 0 comment '事件数',
	event_per varchar(32) default '' comment '事件完成率',
	report_user_id int default 0 comment '上报人id',
	year varchar(12) not null default '' comment '上报年',
	report_time varchar(32) not null default '' comment '上报时间',
	manage_file varchar(255) not null default '' comment '管理文件',
	fire_num int default 0 comment '消防设施数量',
	fire_result varchar(32) not null default '' comment '消防合格率',
	sec_ck_num int default 0 comment '检查次数',
	sec_ck_result varchar(32) not null default '' comment '检查合格率',
	sec_fix_num int default 0 comment '维修次数',
	sec_fix_result varchar(32) not null default '' comment '维修合格率',
	consume int default 0 comment '用量',
	real_bonus int default 0 comment '实际补贴金额',
	effect_begin varchar(32) default null comment '生效时间',
	effect_end varchar(32) default null comment '失效时间',
	`begin_time` datetime DEFAULT NULL COMMENT '周期开始时间',
	`end_time` datetime DEFAULT NULL COMMENT '周期结束时间',
	`final_time` datetime DEFAULT NULL COMMENT '上报截止时间',
	report_status tinyint default 0 comment '上报状态 0未上报 1已上报',
	extras varchar(2000) not null default '' comment '扩展',
	`created_at` datetime DEFAULT NULL COMMENT '创建时间',
	`updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) comment '场站考核';

create table w_station_exam_stds (
	id int NOT NULL AUTO_INCREMENT primary key,
	station_exam_id int default 0 comment '考核id',
	standard_id int default 0 comment '标准id',
	project varchar(255) default '' comment '项目',
	weight int default 0 comment '权重',
	standard int default 0 comment '标准',
	bonus int default 0 comment '补贴金额',
	real_data int default 0 comment '实际数据',
	real_bonus int default 0 comment '实际补贴金额',
	result varchar(32) default null comment '结果 0未通过 1通过',
	`created_at` datetime DEFAULT NULL COMMENT '创建时间',
	`updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) comment '考核项目结果';

create table w_cert_periods (
	id int NOT NULL AUTO_INCREMENT primary key,
	effect_type int default 1 comment '1一年一审 2两年一审',
	`created_at` datetime DEFAULT NULL COMMENT '创建时间',
	`updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) comment '许可证审核周期';

create table w_bottles (
	id int NOT NULL AUTO_INCREMENT primary key,
	bottle_no varchar(32) not null default '' comment '钢瓶编号',
	station_id int default 0 comment '站点id',
	volume int default 0 comment '容积(L)',
	guest varchar(32) not null default '' comment '客户',
	flow_time varchar(32) not null default '' comment '流转时间',
	status tinyint default 0 comment '0正常 1异常',
	`created_at` datetime DEFAULT NULL COMMENT '创建时间',
	`updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) comment '钢瓶记录';

create table w_bottle_sale_logs (
	id int NOT NULL AUTO_INCREMENT primary key,
	station_id int default 0 comment '站点id',
	company_id int default 0 comment '公司id',
	zone_id int default 0 comment '区域id',
	bottle_num int default 0 comment '钢瓶数',
	volume int default 0 comment '容积(L)',
	sale_num int default 0 comment '销售总量',
	sale_date varchar(12) not null default '' comment '销售日期',
	sale_time varchar(12) not null default '' comment '销售日期',
	year varchar(12) not null default '' comment '年',
	month varchar(12) not null default '' comment '月',
	`created_at` datetime DEFAULT NULL COMMENT '创建时间',
	`updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) comment '换站瓶销售记录';

create table w_api_settings (
	id int NOT NULL AUTO_INCREMENT primary key,
	client_id varchar(255) not null default '' comment 'client_id',
	client_secret varchar(255) not null default '' comment 'client secret',
	project_id int not null default 0 comment 'project id',
	url varchar(255) not null default '' comment 'url',
	access_token varchar(255) not null default '' comment 'token',
	token_type varchar(255) not null default '' comment 'token 类型',
	refresh_token varchar(255) not null default '' comment '刷新token',
	create_token_time char(10) not null default '' comment '获取token 时间',
	expires_in int not null default 0 comment '过期时间',
	scope varchar(255) not null default '' comment 'scope',
	`created_at` datetime DEFAULT NULL COMMENT '创建时间',
	`updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) comment '接口设置';

create table w_report_periods (
	id int NOT NULL AUTO_INCREMENT primary key,
	year varchar(12) not null default '' comment '年',
	`begin_time` datetime DEFAULT NULL COMMENT '周期开始时间',
	`end_time` datetime DEFAULT NULL COMMENT '周期结束时间',
	`final_time` datetime DEFAULT NULL COMMENT '上报截止时间',
	std_type tinyint default 0 comment '0 液化气 1自采暖 2经营许可 3考核记录 4事件处理 5消防设施 6 安全作业 7管理制度 8用气量 9评价',
	`created_at` datetime DEFAULT NULL COMMENT '创建时间',
	`updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) comment '上报周期';

create table w_bottle_sale_details (
	id int NOT NULL AUTO_INCREMENT primary key,
	station_id int default 0 comment '站点id',
	company_id int default 0 comment '公司id',
	zone_id int default 0 comment '区域id',
	discount_num int default 0 comment '惠民气',
	fair_num int default 0 comment '平价气',
	sale_num int default 0 comment '总瓶数',
	bonus int default 0 comment '补贴金额',
	year varchar(12) not null default '' comment '年',
	month varchar(12) not null default '' comment '月',
	reporter varchar(32) not null default '' comment '上报人',
	report_time varchar(32) not null default '' comment '上报时间',
	time_range varchar(255) not null default '' comment '统计时间范围',
	remark varchar(1000) default null comment '备注',
	`created_at` datetime DEFAULT NULL COMMENT '创建时间',
	`updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) comment '换站瓶销售记录';

create table w_intfcs (
	id int NOT NULL AUTO_INCREMENT primary key,
	plt_name varchar(255) not null default '' comment '平台名',
	plt_desc varchar(255) not null default '' comment '平台说明',
	create_date varchar(32) not null default '' comment '接入日期',
	status tinyint not null default 1 comment '状态 0接入中 1成功',
	`created_at` datetime DEFAULT NULL COMMENT '创建时间',
	`updated_at` datetime DEFAULT NULL COMMENT '更新时间'
) comment '接口管理';
