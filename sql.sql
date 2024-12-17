DROP TABLE IF EXISTS `slides`;
CREATE TABLE `slides` (
  `slides_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '轮播图ID：',
  `title` varchar(64) DEFAULT NULL COMMENT '标题：',
  `content` varchar(255) DEFAULT NULL COMMENT '内容：',
  `url` varchar(255) DEFAULT NULL COMMENT '链接：',
  `img` varchar(255) DEFAULT NULL COMMENT '轮播图：',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击量：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`slides_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='轮播图';
DROP TABLE IF EXISTS `auth`;
CREATE TABLE `auth` (
  `auth_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '授权ID：',
  `user_group` varchar(64) DEFAULT NULL COMMENT '用户组：',
  `mod_name` varchar(64) DEFAULT NULL COMMENT '模块名：',
  `table_name` varchar(64) DEFAULT NULL COMMENT '表名：',
  `page_title` varchar(255) DEFAULT NULL COMMENT '页面标题：',
  `path` varchar(255) DEFAULT NULL COMMENT '路由路径：',
  `position` varchar(32) DEFAULT NULL COMMENT '位置：',
  `mode` varchar(32) NOT NULL DEFAULT '_blank' COMMENT '跳转方式：',
  `add` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可增加：',
  `del` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可删除：',
  `set` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可修改：',
  `get` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可查看：',
  `field_add` text COMMENT '添加字段：',
  `field_set` text COMMENT '修改字段：',
  `field_get` text COMMENT '查询字段：',
  `table_nav_name` varchar(500) DEFAULT NULL COMMENT '跨表导航名称：',
  `table_nav` varchar(500) DEFAULT NULL COMMENT '跨表导航：',
  `option` text COMMENT '配置：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`auth_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户权限管理';
DROP TABLE IF EXISTS `upload`;
CREATE TABLE `upload` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '上传ID',
  `name` varchar(64) DEFAULT NULL COMMENT '文件名',
  `path` varchar(255) DEFAULT NULL COMMENT '访问路径',
  `file` varchar(255) DEFAULT NULL COMMENT '文件路径',
  `display` varchar(255) DEFAULT NULL COMMENT '显示顺序',
  `father_id` int(11) DEFAULT '0' COMMENT '父级ID',
  `dir` varchar(255) DEFAULT NULL COMMENT '文件夹',
  `type` varchar(32) DEFAULT NULL COMMENT '文件类型',
  PRIMARY KEY (`upload_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文件上传';
insert into `upload` values ('1','movie.mp4','/upload/movie.mp4','',null,'0',null,'video');
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `notice_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '公告id：',
  `title` varchar(125) NOT NULL DEFAULT '' COMMENT '标题：',
  `content` longtext COMMENT '正文：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='公告';
insert into `notice` values ('1','网站公告','<p>公告，是指政府、团体对重大事件当众正式公布或者公开宣告，宣布。国务院2012年4月16日发布、2012年7月1日起施行的《党政机关公文处理工作条例》，对公告的使用表述为：“适用于向国内外宣布重要事项或者法定事项”。其中包含两方面的内容：一是向国内外宣布重要事项，公布依据政策、法令采取的重大行动等；二是向国内外宣布法定事项，公布依据法律规定告知国内外的有关重要规定和重大行动等。</p>','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0');
insert into `notice` values ('2','关于我们','<p>       一个网站要取得成功，要有先进的理念、先进的思想，更为重要的是抢占先机，及时行动。网络世界可谓一日千里、 日新月异，一个网站只有把握先机，抓住机遇，才</p><p>可能有更多的机会获得成功，可能处于网络行业发展的致高点，可能创建出成功的网站，才能能获得成功。要知道一种网站新模式在网络上只有保持几天的优势,因为人们很容易“COPY" 和模仿，因此，唯有不</p><p>断创新，不失时机地推出新的服务、新的模式、新的思想，网站才可能长久立于不败之地。</p>','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0');
insert into `notice` values ('3','联系方式','<h3>网站内容及品牌合作</h3><p>Email：xxxx@qq.com</p><h3>商务合作</h3><p>电话：010-xxxxxxx</p><p>Email：xxxx@qq.com</p><h3><br></h3><h3><br></h3><p><br></p>','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0');
insert into `notice` values ('4','网站介绍','<p>此处可上传文字、图片、视频、超链接、表格等内容区</p>','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0');
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group` (
  `group_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组ID：[0,8388607]',
  `display` smallint(4) unsigned NOT NULL DEFAULT '100' COMMENT '显示顺序：[0,1000]',
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '名称：[0,16]',
  `description` varchar(255) DEFAULT NULL COMMENT '描述：[0,255]描述该用户组的特点或权限范围',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  `register` smallint(1) unsigned DEFAULT '0' COMMENT '注册位置:',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`group_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户组：用于用户前端身份和鉴权';
DROP TABLE IF EXISTS `article_type`;
CREATE TABLE `article_type` (
  `type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID：[0,10000]',
  `display` smallint(4) unsigned NOT NULL DEFAULT '100' COMMENT '显示顺序：[0,1000]决定分类显示的先后顺序',
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '分类名称：[2,16]',
  `father_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID：[0,32767]',
  `description` varchar(255) DEFAULT NULL COMMENT '描述：[0,255]描述该分类的作用',
  `icon` text COMMENT '分类图标：',
  `url` varchar(255) DEFAULT NULL COMMENT '外链地址：[0,255]如果该分类是跳转到其他网站的情况下，就在该URL上设置',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='文章分类';
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `article_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章id：[0,8388607]',
  `title` varchar(125) NOT NULL DEFAULT '' COMMENT '标题：[0,125]用于文章和html的title标签中',
  `type` varchar(64) NOT NULL DEFAULT '0' COMMENT '文章分类：[0,1000]用来搜索指定类型的文章',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击数：[0,1000000000]访问这篇文章的人次',
  `praise_len` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source` varchar(255) DEFAULT NULL COMMENT '来源：[0,255]文章的出处',
  `url` varchar(255) DEFAULT NULL COMMENT '来源地址：[0,255]用于跳转到发布该文章的网站',
  `tag` varchar(255) DEFAULT NULL COMMENT '标签：[0,255]用于标注文章所属相关内容，多个标签用空格隔开',
  `content` longtext COMMENT '正文：文章的主体内容',
  `img` varchar(255) DEFAULT NULL COMMENT '封面图',
  `description` text COMMENT '文章描述',
  PRIMARY KEY (`article_id`,`title`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='文章：用于内容管理系统的文章';
DROP TABLE IF EXISTS `praise`;
CREATE TABLE `praise` (
  `praise_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '点赞ID：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点赞人：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '点赞状态:1为点赞，0已取消',
  PRIMARY KEY (`praise_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='点赞';
DROP TABLE IF EXISTS `access_token`;
CREATE TABLE `access_token` (
  `token_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '临时访问牌ID',
  `token` varchar(64) DEFAULT NULL COMMENT '临时访问牌',
  `info` text,
  `maxage` int(2) NOT NULL DEFAULT '2' COMMENT '最大寿命：默认2小时',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户编号:',
  PRIMARY KEY (`token_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='登陆访问时长';
insert into `access_token` values ('57','5accf85cb6a7f06f0aa2968deadaec1b',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('58','46ff1d4d07714f046ba07b34bffe0af9',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('59','ed9d6cba9826fda1beafcd9326be7a86',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('60','c99763c1833ea0785d9e2b81da3fd28f',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('61','33fbfaccd6d1cb9143e4129bd919d4b0',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('62','493e13da5f293ba67a56a0fe3e1fa6cf',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('63','c4b48e9e2160db09c703041a8fee0a1f',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('64','d13cdaefd3823c360c959a02a262f71d',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('65','6c6ff426fd77ea5a2025ce5ed2e42c8a',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('66','80930065a61ffcdd5cbb75f60932973c',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('67','94114763cf2e3b020495d8a27096d4ef',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('68','761052c551c97c9317bc3aa475c85b84',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('69','7c44ef14131a0ba7c16aa16cef104065',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('70','96380f3d9542c80d04bdade1cf7635a5',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('71','bfdc7acfcbf5763fda81945b60961222',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('72','170a598e51ae8ae2badde20a42fe171d',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('73','c82c357488c75926a92d8a9608d4b367',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('74','4d35290c023f407a820f37dbbb1ceb09',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('75','8d19162776682b695c0f62f3c7a92fec',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('76','a7ea2cdc9a2be179e19200e593ad5a69',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('77','c79a554f9832adc01f19682c5d576bc4',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('78','1c7d95001fa09951a679841c8100ad1f',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('79','776da1bcdd01ddb3cbf0a37fa13fc5b0',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('80','d336e88e57c329d0166931292c1fac41',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('81','37a40f526a6c82fc6110b512802d35bf',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('82','691ad331771f4109206d58aeee572371',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('83','9942e458886219960d3344b4a6a6fbec',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('84','e9939a8b7ccf9f548f0bbb5664981f96',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('85','f5b27912060d1909bef61fab9d96faae',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('86','7c5888682f1d449eb1b62f0054a79fbf',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('87','00dfdc6ac21c4a9da80fd71c990764d1',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('88','3cce592bc72840ab932ce96d85a194da',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('89','43fdaa989a644ad683ef4b4d488e8629',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('90','d6a3cecadacff0dbd6b43b25372cc2a2',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('91','5570bc5b07b3589f4ef8553bd46eb0d1',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('92','5570bc5b07b3589f4ef8553bd46eb0d1',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('93','26c553bd2ee2ab6605d18dfd310d85f9',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('94','3fd52f81236ed2c37ff91a6696d4e47a',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('95','893332e9ee67d60d8312b3700c58a359',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('96','b7844068ade535b2e517df4a40948703',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('97','179b37a5e1893c3af6b946bd5a1c8625',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('98','3a47b8a040a83ebbc9194cb255dc668c',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('99','afa60196afb77dcc2b520ed13a817560',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('100','7fc6d9b324f8c0a3a1784d04ef132692',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('101','84e31b291f2bde6b7ceb27af5fe8eee3',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
DROP TABLE IF EXISTS `hits`;
CREATE TABLE `hits` (
  `hits_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '点赞ID：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点赞人：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source_table` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  PRIMARY KEY (`hits_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='用户点击';
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论人ID：',
  `reply_to_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '回复评论ID：空为0',
  `content` longtext COMMENT '内容：',
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称：',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像地址：[0,255]',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='评论';
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `collect_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '收藏ID：',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏人ID：',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  `title` varchar(255) DEFAULT NULL COMMENT '标题：',
  `img` varchar(255) DEFAULT NULL COMMENT '封面：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`collect_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='收藏';
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID：[0,8388607]用户获取其他与用户相关的数据',
  `state` smallint(1) unsigned NOT NULL DEFAULT '1' COMMENT '账户状态：[0,10](1可用|2异常|3已冻结|4已注销)',
  `user_group` varchar(32) DEFAULT NULL COMMENT '所在用户组：[0,32767]决定用户身份和权限',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '上次登录时间：',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号码：[0,11]用户的手机号码，用于找回密码时或登录时',
  `phone_state` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '手机认证：[0,1](0未认证|1审核中|2已认证)',
  `username` varchar(16) NOT NULL DEFAULT '' COMMENT '用户名：[0,16]用户登录时所用的账户名称',
  `nickname` varchar(16) DEFAULT '' COMMENT '昵称：[0,16]',
  `password` varchar(64) NOT NULL DEFAULT '' COMMENT '密码：[0,32]用户登录所需的密码，由6-16位数字或英文组成',
  `email` varchar(64) DEFAULT '' COMMENT '邮箱：[0,64]用户的邮箱，用于找回密码时或登录时',
  `email_state` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '邮箱认证：[0,1](0未认证|1审核中|2已认证)',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像地址：[0,255]',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户账户：用于保存用户登录信息';
insert into `user` values ('1','1','管理员','2023-05-04 16:42:42.0',null,'0','admin','admin','bfd59291e825b5f2bbf1eb76569f8fe7','','0','/api/upload/admin_avatar.jpg','2023-05-30 17:35:13.0');
DROP TABLE IF EXISTS `student_users`;
CREATE TABLE `student_users`(student_users_id int(11) NOT NULL AUTO_INCREMENT COMMENT '学生用户ID',
`student_name` varchar(64) comment '学生姓名',
`student_gender` varchar(64) comment '学生性别',
`examine_state` varchar(16) DEFAULT '已通过' NOT NULL comment '审核状态',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`user_id` int(11) DEFAULT '0' NOT NULL comment '用户ID',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (student_users_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '学生用户';

DROP TABLE IF EXISTS `delivery_users`;
CREATE TABLE `delivery_users`(delivery_users_id int(11) NOT NULL AUTO_INCREMENT COMMENT '配送用户ID',
`user_name` varchar(64) comment '用户姓名',
`user_gender` varchar(64) comment '用户性别',
`examine_state` varchar(16) DEFAULT '已通过' NOT NULL comment '审核状态',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`user_id` int(11) DEFAULT '0' NOT NULL comment '用户ID',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (delivery_users_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '配送用户';

DROP TABLE IF EXISTS `merchant_users`;
CREATE TABLE `merchant_users`(merchant_users_id int(11) NOT NULL AUTO_INCREMENT COMMENT '商家用户ID',
`store_name` varchar(64) comment '店铺名称',
`merchant_name` varchar(64) comment '商家姓名',
`merchant_gender` varchar(64) comment '商家性别',
`examine_state` varchar(16) DEFAULT '已通过' NOT NULL comment '审核状态',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`user_id` int(11) DEFAULT '0' NOT NULL comment '用户ID',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (merchant_users_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '商家用户';

DROP TABLE IF EXISTS `food_information`;
CREATE TABLE `food_information`(food_information_id int(11) NOT NULL AUTO_INCREMENT COMMENT '美食信息ID',
`store_name` varchar(64) comment '店铺名称',
`merchant_users` int(11) DEFAULT 0 comment '商家用户',
`food_name` varchar(64) comment '美食名称',
`food_types` varchar(64) comment '美食类型',
`food_prices` int(11) DEFAULT 0 comment '美食价格',
`food_pictures` varchar(255) comment '美食图片',
`food_introduction` text comment '美食介绍',
`hits` int(11) DEFAULT 0 NOT NULL comment '点击数',
`praise_len` int(11) DEFAULT 0 NOT NULL comment '点赞数',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (food_information_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '美食信息';
insert into `food_information` values (1,'店铺名称1',0,'美食名称1','美食类型1',1,'/api/upload/1602855610443890689.jpg','美食介绍1',37,727,0,'2023-05-07 15:53:17','2023-05-07 15:53:17');
insert into `food_information` values (2,'店铺名称2',0,'美食名称2','美食类型2',2,'/api/upload/1602855643885076480.jpg','美食介绍2',761,60,0,'2023-05-07 15:53:17','2023-05-07 15:53:17');
insert into `food_information` values (3,'店铺名称3',0,'美食名称3','美食类型3',3,'/api/upload/1602855764534231041.jpg','美食介绍3',24,291,0,'2023-05-07 15:53:17','2023-05-07 15:53:17');
insert into `food_information` values (4,'店铺名称4',0,'美食名称4','美食类型4',4,'/api/upload/1602855574616145920.jpg','美食介绍4',108,848,0,'2023-05-07 15:53:17','2023-05-07 15:53:17');
insert into `food_information` values (5,'店铺名称5',0,'美食名称5','美食类型5',5,'/api/upload/1602855846679674880.jpg','美食介绍5',174,852,0,'2023-05-07 15:53:17','2023-05-07 15:53:17');
insert into `food_information` values (6,'店铺名称6',0,'美食名称6','美食类型6',6,'/api/upload/1602855689946923008.jpg','美食介绍6',395,751,0,'2023-05-07 15:53:17','2023-05-07 15:53:17');
insert into `food_information` values (7,'店铺名称7',0,'美食名称7','美食类型7',7,'/api/upload/1602855729784422400.jpg','美食介绍7',553,375,0,'2023-05-07 15:53:17','2023-05-07 15:53:17');
insert into `food_information` values (8,'店铺名称8',0,'美食名称8','美食类型8',8,'/api/upload/1602855428025221120.jpg','美食介绍8',509,267,0,'2023-05-07 15:53:17','2023-05-07 15:53:17');

DROP TABLE IF EXISTS `food_orders`;
CREATE TABLE `food_orders`(food_orders_id int(11) NOT NULL AUTO_INCREMENT COMMENT '美食订单ID',
`order_number` varchar(64) comment '订单编号',
`store_name` varchar(64) comment '店铺名称',
`merchant_users` int(11) DEFAULT 0 comment '商家用户',
`food_name` varchar(64) comment '美食名称',
`food_types` varchar(64) comment '美食类型',
`food_prices` varchar(64) comment '美食价格',
`student_users` int(11) DEFAULT 0 comment '学生用户',
`student_name` varchar(64) comment '学生姓名',
`contact_number` varchar(64) comment '联系电话',
`shipping_address` varchar(64) comment '收货地址',
`purchase_quantity` int(11) DEFAULT 0 comment '购买数量',
`total_purchase_price` varchar(64) comment '购买总价',
`order_remarks` varchar(64) comment '订单备注',
`order_status` varchar(64) comment '订单状态',
`pay_state` varchar(16) DEFAULT '未支付' NOT NULL comment '支付状态',
`pay_type` varchar(16) DEFAULT '' comment '支付类型: 微信、支付宝、网银',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (food_orders_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '美食订单';
insert into `food_orders` values (1,'订单编号1','店铺名称1',0,'美食名称1','美食类型1','美食价格1',0,'学生姓名1','联系电话1','收货地址1',1,'购买总价1','订单备注1','订单状态1','未支付','支付宝',0,'2023-05-07 15:53:17','2023-05-07 15:53:17');
insert into `food_orders` values (2,'订单编号2','店铺名称2',0,'美食名称2','美食类型2','美食价格2',0,'学生姓名2','联系电话2','收货地址2',2,'购买总价2','订单备注2','订单状态2','未支付','支付宝',0,'2023-05-07 15:53:17','2023-05-07 15:53:17');
insert into `food_orders` values (3,'订单编号3','店铺名称3',0,'美食名称3','美食类型3','美食价格3',0,'学生姓名3','联系电话3','收货地址3',3,'购买总价3','订单备注3','订单状态3','未支付','支付宝',0,'2023-05-07 15:53:17','2023-05-07 15:53:17');
insert into `food_orders` values (4,'订单编号4','店铺名称4',0,'美食名称4','美食类型4','美食价格4',0,'学生姓名4','联系电话4','收货地址4',4,'购买总价4','订单备注4','订单状态4','未支付','支付宝',0,'2023-05-07 15:53:17','2023-05-07 15:53:17');
insert into `food_orders` values (5,'订单编号5','店铺名称5',0,'美食名称5','美食类型5','美食价格5',0,'学生姓名5','联系电话5','收货地址5',5,'购买总价5','订单备注5','订单状态5','未支付','支付宝',0,'2023-05-07 15:53:17','2023-05-07 15:53:17');
insert into `food_orders` values (6,'订单编号6','店铺名称6',0,'美食名称6','美食类型6','美食价格6',0,'学生姓名6','联系电话6','收货地址6',6,'购买总价6','订单备注6','订单状态6','未支付','支付宝',0,'2023-05-07 15:53:17','2023-05-07 15:53:17');
insert into `food_orders` values (7,'订单编号7','店铺名称7',0,'美食名称7','美食类型7','美食价格7',0,'学生姓名7','联系电话7','收货地址7',7,'购买总价7','订单备注7','订单状态7','未支付','支付宝',0,'2023-05-07 15:53:17','2023-05-07 15:53:17');
insert into `food_orders` values (8,'订单编号8','店铺名称8',0,'美食名称8','美食类型8','美食价格8',0,'学生姓名8','联系电话8','收货地址8',8,'购买总价8','订单备注8','订单状态8','未支付','支付宝',0,'2023-05-07 15:53:17','2023-05-07 15:53:17');

DROP TABLE IF EXISTS `delivery_order`;
CREATE TABLE `delivery_order`(delivery_order_id int(11) NOT NULL AUTO_INCREMENT COMMENT '配送订单ID',
`order_number` varchar(64) comment '订单编号',
`store_name` varchar(64) comment '店铺名称',
`merchant_users` int(11) DEFAULT 0 comment '商家用户',
`food_name` varchar(64) comment '美食名称',
`food_types` varchar(64) comment '美食类型',
`food_prices` varchar(64) comment '美食价格',
`student_users` int(11) DEFAULT 0 comment '学生用户',
`student_name` varchar(64) comment '学生姓名',
`contact_number` varchar(64) comment '联系电话',
`shipping_address` varchar(64) comment '收货地址',
`purchase_quantity` varchar(64) comment '购买数量',
`delivery_users` int(11) DEFAULT 0 comment '配送用户',
`delivery_status` varchar(64) comment '配送状态',
`delivery_description` text comment '配送描述',
`receiving_status` varchar(64) comment '收货状态',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (delivery_order_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '配送订单';
insert into `delivery_order` values (1,'订单编号1','店铺名称1',0,'美食名称1','美食类型1','美食价格1',0,'学生姓名1','联系电话1','收货地址1','购买数量1',0,'配送状态1','配送描述1','收货状态1',0,'2023-05-07 15:53:17','2023-05-07 15:53:17');
insert into `delivery_order` values (2,'订单编号2','店铺名称2',0,'美食名称2','美食类型2','美食价格2',0,'学生姓名2','联系电话2','收货地址2','购买数量2',0,'配送状态2','配送描述2','收货状态2',0,'2023-05-07 15:53:17','2023-05-07 15:53:17');
insert into `delivery_order` values (3,'订单编号3','店铺名称3',0,'美食名称3','美食类型3','美食价格3',0,'学生姓名3','联系电话3','收货地址3','购买数量3',0,'配送状态3','配送描述3','收货状态3',0,'2023-05-07 15:53:17','2023-05-07 15:53:17');
insert into `delivery_order` values (4,'订单编号4','店铺名称4',0,'美食名称4','美食类型4','美食价格4',0,'学生姓名4','联系电话4','收货地址4','购买数量4',0,'配送状态4','配送描述4','收货状态4',0,'2023-05-07 15:53:17','2023-05-07 15:53:17');
insert into `delivery_order` values (5,'订单编号5','店铺名称5',0,'美食名称5','美食类型5','美食价格5',0,'学生姓名5','联系电话5','收货地址5','购买数量5',0,'配送状态5','配送描述5','收货状态5',0,'2023-05-07 15:53:17','2023-05-07 15:53:17');
insert into `delivery_order` values (6,'订单编号6','店铺名称6',0,'美食名称6','美食类型6','美食价格6',0,'学生姓名6','联系电话6','收货地址6','购买数量6',0,'配送状态6','配送描述6','收货状态6',0,'2023-05-07 15:53:17','2023-05-07 15:53:17');
insert into `delivery_order` values (7,'订单编号7','店铺名称7',0,'美食名称7','美食类型7','美食价格7',0,'学生姓名7','联系电话7','收货地址7','购买数量7',0,'配送状态7','配送描述7','收货状态7',0,'2023-05-07 15:53:17','2023-05-07 15:53:17');
insert into `delivery_order` values (8,'订单编号8','店铺名称8',0,'美食名称8','美食类型8','美食价格8',0,'学生姓名8','联系电话8','收货地址8','购买数量8',0,'配送状态8','配送描述8','收货状态8',0,'2023-05-07 15:53:17','2023-05-07 15:53:17');

DROP TABLE IF EXISTS `message_information`;
CREATE TABLE `message_information`(message_information_id int(11) NOT NULL AUTO_INCREMENT COMMENT '留言信息ID',
`order_number` varchar(64) comment '订单编号',
`store_name` varchar(64) comment '店铺名称',
`merchant_users` int(11) DEFAULT 0 comment '商家用户',
`food_name` varchar(64) comment '美食名称',
`student_users` int(11) DEFAULT 0 comment '学生用户',
`student_name` varchar(64) comment '学生姓名',
`contact_number` varchar(64) comment '联系电话',
`shipping_address` varchar(64) comment '收货地址',
`purchase_quantity` varchar(64) comment '购买数量',
`delivery_users` int(11) DEFAULT 0 comment '配送用户',
`message_content` text comment '留言内容',
`reply_content` text comment '回复内容',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (message_information_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '留言信息';
insert into `message_information` values (1,'订单编号1','店铺名称1',0,'美食名称1',0,'学生姓名1','联系电话1','收货地址1','购买数量1',0,'留言内容1','回复内容1',0,'2023-05-07 15:53:17','2023-05-07 15:53:17');
insert into `message_information` values (2,'订单编号2','店铺名称2',0,'美食名称2',0,'学生姓名2','联系电话2','收货地址2','购买数量2',0,'留言内容2','回复内容2',0,'2023-05-07 15:53:17','2023-05-07 15:53:17');
insert into `message_information` values (3,'订单编号3','店铺名称3',0,'美食名称3',0,'学生姓名3','联系电话3','收货地址3','购买数量3',0,'留言内容3','回复内容3',0,'2023-05-07 15:53:17','2023-05-07 15:53:17');
insert into `message_information` values (4,'订单编号4','店铺名称4',0,'美食名称4',0,'学生姓名4','联系电话4','收货地址4','购买数量4',0,'留言内容4','回复内容4',0,'2023-05-07 15:53:17','2023-05-07 15:53:17');
insert into `message_information` values (5,'订单编号5','店铺名称5',0,'美食名称5',0,'学生姓名5','联系电话5','收货地址5','购买数量5',0,'留言内容5','回复内容5',0,'2023-05-07 15:53:17','2023-05-07 15:53:17');
insert into `message_information` values (6,'订单编号6','店铺名称6',0,'美食名称6',0,'学生姓名6','联系电话6','收货地址6','购买数量6',0,'留言内容6','回复内容6',0,'2023-05-07 15:53:17','2023-05-07 15:53:17');
insert into `message_information` values (7,'订单编号7','店铺名称7',0,'美食名称7',0,'学生姓名7','联系电话7','收货地址7','购买数量7',0,'留言内容7','回复内容7',0,'2023-05-07 15:53:17','2023-05-07 15:53:17');
insert into `message_information` values (8,'订单编号8','店铺名称8',0,'美食名称8',0,'学生姓名8','联系电话8','收货地址8','购买数量8',0,'留言内容8','回复内容8',0,'2023-05-07 15:53:17','2023-05-07 15:53:17');

DROP TABLE IF EXISTS `type_management`;
CREATE TABLE `type_management`(type_management_id int(11) NOT NULL AUTO_INCREMENT COMMENT '类型管理ID',
`food_types` varchar(64) comment '美食类型',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (type_management_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '类型管理';
insert into `type_management` values (1,'美食类型1',0,'2023-05-07 15:53:17','2023-05-07 15:53:17');
insert into `type_management` values (2,'美食类型2',0,'2023-05-07 15:53:17','2023-05-07 15:53:17');
insert into `type_management` values (3,'美食类型3',0,'2023-05-07 15:53:17','2023-05-07 15:53:17');
insert into `type_management` values (4,'美食类型4',0,'2023-05-07 15:53:17','2023-05-07 15:53:17');
insert into `type_management` values (5,'美食类型5',0,'2023-05-07 15:53:17','2023-05-07 15:53:17');
insert into `type_management` values (6,'美食类型6',0,'2023-05-07 15:53:17','2023-05-07 15:53:17');
insert into `type_management` values (7,'美食类型7',0,'2023-05-07 15:53:17','2023-05-07 15:53:17');
insert into `type_management` values (8,'美食类型8',0,'2023-05-07 15:53:17','2023-05-07 15:53:17');

insert into `auth` values ('1','管理员','学生用户','student_users','学生用户','/student_users/table','','_blank','1','1','1','1','student_name,student_gender','student_name,student_gender','student_name,student_gender',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('2','管理员','学生用户','student_users','学生用户详情','/student_users/view','','_blank','1','1','1','1','student_name,student_gender','student_name,student_gender','student_name,student_gender',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('3','管理员','配送用户','delivery_users','配送用户','/delivery_users/table','','_blank','1','1','1','1','user_name,user_gender','user_name,user_gender','user_name,user_gender',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('4','管理员','配送用户','delivery_users','配送用户详情','/delivery_users/view','','_blank','1','1','1','1','user_name,user_gender','user_name,user_gender','user_name,user_gender',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('5','管理员','商家用户','merchant_users','商家用户','/merchant_users/table','','_blank','1','1','1','1','store_name,merchant_name,merchant_gender','store_name,merchant_name,merchant_gender','store_name,merchant_name,merchant_gender',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('6','管理员','商家用户','merchant_users','商家用户详情','/merchant_users/view','','_blank','1','1','1','1','store_name,merchant_name,merchant_gender','store_name,merchant_name,merchant_gender','store_name,merchant_name,merchant_gender',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('7','管理员','美食信息','food_information','美食信息','/food_information/table','','_blank','1','1','1','1','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction',null,'0','{"can_show_comment":true}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('8','管理员','美食信息','food_information','美食信息详情','/food_information/view','','_blank','1','1','1','1','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('9','管理员','美食信息','food_information','美食信息','/food_information/list','top','_blank','1','1','1','1','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('10','管理员','美食信息','food_information','美食信息详情','/food_information/details','','_blank','1','1','1','1','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction',null,'0','{"can_comment":true,"can_show_comment":true}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('11','管理员','美食订单','food_orders','美食订单','/food_orders/table','','_blank','1','1','1','1','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,total_purchase_price,order_remarks,order_status','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,total_purchase_price,order_remarks,order_status','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,total_purchase_price,order_remarks,order_status',null,'0','{"pay":true}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('12','管理员','美食订单','food_orders','美食订单详情','/food_orders/view','','_blank','1','1','1','1','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,total_purchase_price,order_remarks,order_status','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,total_purchase_price,order_remarks,order_status','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,total_purchase_price,order_remarks,order_status',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('13','管理员','美食订单','food_orders','美食订单','/food_orders/edit','','_blank','1','1','1','1','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,total_purchase_price,order_remarks,order_status','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,total_purchase_price,order_remarks,order_status','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,total_purchase_price,order_remarks,order_status',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('14','管理员','配送订单','delivery_order','配送订单','/delivery_order/table','','_blank','1','1','1','1','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,delivery_users,delivery_status,delivery_description,receiving_status','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,delivery_users,delivery_status,delivery_description,receiving_status','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,delivery_users,delivery_status,delivery_description,receiving_status',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('15','管理员','配送订单','delivery_order','配送订单详情','/delivery_order/view','','_blank','1','1','1','1','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,delivery_users,delivery_status,delivery_description,receiving_status','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,delivery_users,delivery_status,delivery_description,receiving_status','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,delivery_users,delivery_status,delivery_description,receiving_status',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('16','管理员','留言信息','message_information','留言信息','/message_information/table','','_blank','1','1','1','1','order_number,store_name,merchant_users,food_name,student_users,student_name,contact_number,shipping_address,purchase_quantity,delivery_users,message_content,reply_content','order_number,store_name,merchant_users,food_name,student_users,student_name,contact_number,shipping_address,purchase_quantity,delivery_users,message_content,reply_content','order_number,store_name,merchant_users,food_name,student_users,student_name,contact_number,shipping_address,purchase_quantity,delivery_users,message_content,reply_content',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('17','管理员','留言信息','message_information','留言信息详情','/message_information/view','','_blank','1','1','1','1','order_number,store_name,merchant_users,food_name,student_users,student_name,contact_number,shipping_address,purchase_quantity,delivery_users,message_content,reply_content','order_number,store_name,merchant_users,food_name,student_users,student_name,contact_number,shipping_address,purchase_quantity,delivery_users,message_content,reply_content','order_number,store_name,merchant_users,food_name,student_users,student_name,contact_number,shipping_address,purchase_quantity,delivery_users,message_content,reply_content',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('18','管理员','类型管理','type_management','类型管理','/type_management/table','','_blank','1','1','1','1','food_types','food_types','food_types',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('19','管理员','类型管理','type_management','类型管理详情','/type_management/view','','_blank','1','1','1','1','food_types','food_types','food_types',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('20','管理员','我的收藏','collect','我的收藏','/collect/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('21','管理员','评论','comment','评论列表','/comment/table','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('22','管理员','评论','comment','评论详情','/comment/view','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('23','管理员','评论','comment','我的评论','/comment/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('24','管理员','评论','comment','评论详情','/comment/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('25','管理员','新闻','article','新闻资讯','/article/table','','_blank','1','1','1','1','','','',null,'0','{"print":true,"export_db":true,"import_db":true}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('26','管理员','新闻','article','新闻资讯','/article/view','','_blank','1','1','1','1','','','',null,'0','{"print":true}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('27','管理员','新闻','article','新闻资讯','/article/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('28','管理员','新闻','article','新闻资讯','/article/details','','_blank','1','1','1','1','','','',null,'0','{"can_comment":true,"can_show_comment":true}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('29','管理员','新闻分类','article_type','新闻分类','/article_type/table','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('30','管理员','新闻分类','article_type','新闻分类','/article_type/view','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('31','管理员','公告','notice','公告列表','/notice/table','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('32','管理员','公告','notice','公告详情','/notice/view','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('33','管理员','公告','notice','公告','/notice/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('34','管理员','公告','notice','公告详情','/notice/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('35','游客','学生用户','student_users','学生用户','/student_users/table','','_blank','1','0','0','0','student_name,student_gender','student_name,student_gender','student_name,student_gender',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('36','游客','学生用户','student_users','学生用户详情','/student_users/view','','_blank','1','0','0','0','student_name,student_gender','student_name,student_gender','student_name,student_gender',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('37','游客','配送用户','delivery_users','配送用户','/delivery_users/table','','_blank','1','0','0','0','user_name,user_gender','user_name,user_gender','user_name,user_gender',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('38','游客','配送用户','delivery_users','配送用户详情','/delivery_users/view','','_blank','1','0','0','0','user_name,user_gender','user_name,user_gender','user_name,user_gender',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('39','游客','商家用户','merchant_users','商家用户','/merchant_users/table','','_blank','1','0','0','0','store_name,merchant_name,merchant_gender','store_name,merchant_name,merchant_gender','store_name,merchant_name,merchant_gender',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('40','游客','商家用户','merchant_users','商家用户详情','/merchant_users/view','','_blank','1','0','0','0','store_name,merchant_name,merchant_gender','store_name,merchant_name,merchant_gender','store_name,merchant_name,merchant_gender',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('41','游客','美食信息','food_information','美食信息','/food_information/table','','_blank','0','0','0','0','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction',null,'0','{"can_show_comment":false}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('42','游客','美食信息','food_information','美食信息详情','/food_information/view','','_blank','0','0','0','0','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('43','游客','美食信息','food_information','美食信息','/food_information/list','top','_blank','0','0','0','1','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('44','游客','美食信息','food_information','美食信息详情','/food_information/details','','_blank','0','0','0','1','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction',null,'0','{"can_comment":false,"can_show_comment":true}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('45','游客','美食订单','food_orders','美食订单','/food_orders/table','','_blank','0','0','0','0','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,total_purchase_price,order_remarks,order_status','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,total_purchase_price,order_remarks,order_status','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,total_purchase_price,order_remarks,order_status',null,'0','{"pay":false}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('46','游客','美食订单','food_orders','美食订单详情','/food_orders/view','','_blank','0','0','0','0','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,total_purchase_price,order_remarks,order_status','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,total_purchase_price,order_remarks,order_status','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,total_purchase_price,order_remarks,order_status',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('47','游客','美食订单','food_orders','美食订单','/food_orders/edit','','_blank','0','0','0','0','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,total_purchase_price,order_remarks,order_status','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,total_purchase_price,order_remarks,order_status','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,total_purchase_price,order_remarks,order_status',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('48','游客','配送订单','delivery_order','配送订单','/delivery_order/table','','_blank','0','0','0','0','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,delivery_users,delivery_status,delivery_description,receiving_status','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,delivery_users,delivery_status,delivery_description,receiving_status','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,delivery_users,delivery_status,delivery_description,receiving_status',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('49','游客','配送订单','delivery_order','配送订单详情','/delivery_order/view','','_blank','0','0','0','0','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,delivery_users,delivery_status,delivery_description,receiving_status','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,delivery_users,delivery_status,delivery_description,receiving_status','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,delivery_users,delivery_status,delivery_description,receiving_status',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('50','游客','留言信息','message_information','留言信息','/message_information/table','','_blank','0','0','0','0','order_number,store_name,merchant_users,food_name,student_users,student_name,contact_number,shipping_address,purchase_quantity,delivery_users,message_content,reply_content','order_number,store_name,merchant_users,food_name,student_users,student_name,contact_number,shipping_address,purchase_quantity,delivery_users,message_content,reply_content','order_number,store_name,merchant_users,food_name,student_users,student_name,contact_number,shipping_address,purchase_quantity,delivery_users,message_content,reply_content',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('51','游客','留言信息','message_information','留言信息详情','/message_information/view','','_blank','0','0','0','0','order_number,store_name,merchant_users,food_name,student_users,student_name,contact_number,shipping_address,purchase_quantity,delivery_users,message_content,reply_content','order_number,store_name,merchant_users,food_name,student_users,student_name,contact_number,shipping_address,purchase_quantity,delivery_users,message_content,reply_content','order_number,store_name,merchant_users,food_name,student_users,student_name,contact_number,shipping_address,purchase_quantity,delivery_users,message_content,reply_content',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('52','游客','类型管理','type_management','类型管理','/type_management/table','','_blank','0','0','0','0','food_types','food_types','food_types',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('53','游客','类型管理','type_management','类型管理详情','/type_management/view','','_blank','0','0','0','0','food_types','food_types','food_types',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('54','游客','我的收藏','collect','我的收藏','/collect/list','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('55','游客','评论','comment','评论列表','/comment/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('56','游客','评论','comment','评论详情','/comment/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('57','游客','评论','comment','我的评论','/comment/list','','_blank','0','0','0','1','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('58','游客','评论','comment','评论详情','/comment/details','','_blank','0','0','0','1','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('59','游客','新闻','article','新闻列表','/article/table','','_blank','0','0','0','0','','','',null,'0','{"print":false,"export_db":false,"import_db":false}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('60','游客','新闻','article','新闻详情','/article/view','','_blank','0','0','0','0','','','',null,'0','{"print":false}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('61','游客','新闻','article','新闻资讯','/article/list','','_blank','0','0','0','1','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('62','游客','新闻','article','新闻资讯','/article/details','','_blank','0','0','0','1','','','',null,'0','{"can_comment":false,"can_show_comment":true}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('63','游客','新闻分类','article_type','新闻分类列表','/article_type/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('64','游客','新闻分类','article_type','新闻分类详情','/article_type/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('65','游客','公告','notice','公告列表','/notice/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('66','游客','公告','notice','公告详情','/notice/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('67','游客','公告','notice','公告','/notice/list','','_blank','0','0','0','1','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('68','游客','公告','notice','公告详情','/notice/details','','_blank','0','0','0','1','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('69','学生用户','学生用户','student_users','学生用户','/student_users/table','','_blank','0','0','0','0','student_name,student_gender','student_name,student_gender','student_name,student_gender',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('70','学生用户','学生用户','student_users','学生用户详情','/student_users/view','','_blank','0','0','0','0','student_name,student_gender','student_name,student_gender','student_name,student_gender',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('71','学生用户','配送用户','delivery_users','配送用户','/delivery_users/table','','_blank','0','0','0','0','user_name,user_gender','user_name,user_gender','user_name,user_gender',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('72','学生用户','配送用户','delivery_users','配送用户详情','/delivery_users/view','','_blank','0','0','0','0','user_name,user_gender','user_name,user_gender','user_name,user_gender',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('73','学生用户','商家用户','merchant_users','商家用户','/merchant_users/table','','_blank','0','0','0','0','store_name,merchant_name,merchant_gender','store_name,merchant_name,merchant_gender','store_name,merchant_name,merchant_gender',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('74','学生用户','商家用户','merchant_users','商家用户详情','/merchant_users/view','','_blank','0','0','0','0','store_name,merchant_name,merchant_gender','store_name,merchant_name,merchant_gender','store_name,merchant_name,merchant_gender',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('75','学生用户','美食信息','food_information','美食信息','/food_information/table','','_blank','0','0','0','0','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction',null,'0','{"can_show_comment":false}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('76','学生用户','美食信息','food_information','美食信息详情','/food_information/view','','_blank','0','0','0','0','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('77','学生用户','美食信息','food_information','美食信息','/food_information/list','top','_blank','1','1','1','1','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('78','学生用户','美食信息','food_information','美食信息详情','/food_information/details','','_blank','1','1','1','1','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction',null,'0','{"can_comment":true,"can_show_comment":true}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('79','学生用户','美食订单','food_orders','美食订单','/food_orders/table','','_blank','0','0','0','1','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,total_purchase_price,order_remarks,order_status','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,total_purchase_price,order_remarks,order_status','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,total_purchase_price,order_remarks,order_status',null,'0','{"pay":true}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('80','学生用户','美食订单','food_orders','美食订单详情','/food_orders/view','','_blank','0','0','0','1','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,total_purchase_price,order_remarks,order_status','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,total_purchase_price,order_remarks,order_status','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,total_purchase_price,order_remarks,order_status',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('81','学生用户','美食订单','food_orders','美食订单','/food_orders/edit','','_blank','1','1','1','1','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,total_purchase_price,order_remarks','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,total_purchase_price,order_remarks','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,total_purchase_price,order_remarks',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('82','学生用户','配送订单','delivery_order','配送订单','/delivery_order/table','','_blank','0','0','1','1','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,delivery_users,delivery_status,delivery_description,receiving_status','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,delivery_users,delivery_status,delivery_description,receiving_status','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,delivery_users,delivery_status,delivery_description,receiving_status',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('83','学生用户','配送订单','delivery_order','配送订单详情','/delivery_order/view','','_blank','0','0','1','1','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,delivery_users,delivery_status,delivery_description,receiving_status','receiving_status','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,delivery_users,delivery_status,delivery_description,receiving_status',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('84','学生用户','留言信息','message_information','留言信息','/message_information/table','','_blank','1','0','0','1','order_number,store_name,merchant_users,food_name,student_users,student_name,contact_number,shipping_address,purchase_quantity,delivery_users,message_content,reply_content','order_number,store_name,merchant_users,food_name,student_users,student_name,contact_number,shipping_address,purchase_quantity,delivery_users,message_content,reply_content','order_number,store_name,merchant_users,food_name,student_users,student_name,contact_number,shipping_address,purchase_quantity,delivery_users,message_content,reply_content',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('85','学生用户','留言信息','message_information','留言信息详情','/message_information/view','','_blank','1','0','0','1','order_number,store_name,merchant_users,food_name,student_users,student_name,contact_number,shipping_address,purchase_quantity,delivery_users,message_content','order_number,store_name,merchant_users,food_name,student_users,student_name,contact_number,shipping_address,purchase_quantity,delivery_users,message_content,reply_content','order_number,store_name,merchant_users,food_name,student_users,student_name,contact_number,shipping_address,purchase_quantity,delivery_users,message_content,reply_content',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('86','学生用户','类型管理','type_management','类型管理','/type_management/table','','_blank','0','0','0','0','food_types','food_types','food_types',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('87','学生用户','类型管理','type_management','类型管理详情','/type_management/view','','_blank','0','0','0','0','food_types','food_types','food_types',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('88','学生用户','我的收藏','collect','我的收藏','/collect/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('89','学生用户','评论','comment','评论列表','/comment/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('90','学生用户','评论','comment','评论详情','/comment/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('91','学生用户','评论','comment','我的评论','/comment/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('92','学生用户','评论','comment','评论详情','/comment/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('93','学生用户','新闻','article','新闻列表','/article/table','','_blank','0','0','0','0','','','',null,'0','{"print":false,"export_db":false,"import_db":false}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('94','学生用户','新闻','article','新闻详情','/article/view','','_blank','0','0','0','0','','','',null,'0','{"print":false}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('95','学生用户','新闻','article','新闻资讯','/article/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('96','学生用户','新闻','article','新闻资讯','/article/details','','_blank','1','1','1','1','','','',null,'0','{"can_comment":true,"can_show_comment":true}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('97','学生用户','新闻分类','article_type','新闻分类列表','/article_type/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('98','学生用户','新闻分类','article_type','新闻分类详情','/article_type/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('99','学生用户','公告','notice','公告列表','/notice/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('100','学生用户','公告','notice','公告详情','/notice/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('101','学生用户','公告','notice','公告','/notice/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('102','学生用户','公告','notice','公告详情','/notice/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('103','配送用户','学生用户','student_users','学生用户','/student_users/table','','_blank','0','0','0','0','student_name,student_gender','student_name,student_gender','student_name,student_gender',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('104','配送用户','学生用户','student_users','学生用户详情','/student_users/view','','_blank','0','0','0','0','student_name,student_gender','student_name,student_gender','student_name,student_gender',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('105','配送用户','配送用户','delivery_users','配送用户','/delivery_users/table','','_blank','0','0','0','0','user_name,user_gender','user_name,user_gender','user_name,user_gender',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('106','配送用户','配送用户','delivery_users','配送用户详情','/delivery_users/view','','_blank','0','0','0','0','user_name,user_gender','user_name,user_gender','user_name,user_gender',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('107','配送用户','商家用户','merchant_users','商家用户','/merchant_users/table','','_blank','0','0','0','0','store_name,merchant_name,merchant_gender','store_name,merchant_name,merchant_gender','store_name,merchant_name,merchant_gender',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('108','配送用户','商家用户','merchant_users','商家用户详情','/merchant_users/view','','_blank','0','0','0','0','store_name,merchant_name,merchant_gender','store_name,merchant_name,merchant_gender','store_name,merchant_name,merchant_gender',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('109','配送用户','美食信息','food_information','美食信息','/food_information/table','','_blank','0','0','0','0','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction',null,'0','{"can_show_comment":false}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('110','配送用户','美食信息','food_information','美食信息详情','/food_information/view','','_blank','0','0','0','0','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('111','配送用户','美食信息','food_information','美食信息','/food_information/list','top','_blank','1','1','1','1','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('112','配送用户','美食信息','food_information','美食信息详情','/food_information/details','','_blank','1','1','1','1','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction',null,'0','{"can_comment":true,"can_show_comment":true}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('113','配送用户','美食订单','food_orders','美食订单','/food_orders/table','','_blank','0','0','0','0','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,total_purchase_price,order_remarks,order_status','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,total_purchase_price,order_remarks,order_status','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,total_purchase_price,order_remarks,order_status',null,'0','{"pay":false}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('114','配送用户','美食订单','food_orders','美食订单详情','/food_orders/view','','_blank','0','0','0','0','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,total_purchase_price,order_remarks,order_status','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,total_purchase_price,order_remarks,order_status','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,total_purchase_price,order_remarks,order_status',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('115','配送用户','美食订单','food_orders','美食订单','/food_orders/edit','','_blank','0','0','0','0','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,total_purchase_price,order_remarks,order_status','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,total_purchase_price,order_remarks,order_status','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,total_purchase_price,order_remarks,order_status',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('116','配送用户','配送订单','delivery_order','配送订单','/delivery_order/table','','_blank','0','0','1','1','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,delivery_users,delivery_status,delivery_description,receiving_status','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,delivery_users,delivery_status,delivery_description,receiving_status','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,delivery_users,delivery_status,delivery_description,receiving_status',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('117','配送用户','配送订单','delivery_order','配送订单详情','/delivery_order/view','','_blank','0','0','1','1','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,delivery_users,delivery_status,delivery_description,receiving_status','delivery_status,delivery_description','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,delivery_users,delivery_status,delivery_description,receiving_status',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('118','配送用户','留言信息','message_information','留言信息','/message_information/table','','_blank','0','0','1','1','order_number,store_name,merchant_users,food_name,student_users,student_name,contact_number,shipping_address,purchase_quantity,delivery_users,message_content,reply_content','order_number,store_name,merchant_users,food_name,student_users,student_name,contact_number,shipping_address,purchase_quantity,delivery_users,message_content,reply_content','order_number,store_name,merchant_users,food_name,student_users,student_name,contact_number,shipping_address,purchase_quantity,delivery_users,message_content,reply_content',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('119','配送用户','留言信息','message_information','留言信息详情','/message_information/view','','_blank','0','0','1','1','order_number,store_name,merchant_users,food_name,student_users,student_name,contact_number,shipping_address,purchase_quantity,delivery_users,message_content,reply_content','reply_content','order_number,store_name,merchant_users,food_name,student_users,student_name,contact_number,shipping_address,purchase_quantity,delivery_users,message_content,reply_content',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('120','配送用户','类型管理','type_management','类型管理','/type_management/table','','_blank','0','0','0','0','food_types','food_types','food_types',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('121','配送用户','类型管理','type_management','类型管理详情','/type_management/view','','_blank','0','0','0','0','food_types','food_types','food_types',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('122','配送用户','我的收藏','collect','我的收藏','/collect/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('123','配送用户','评论','comment','评论列表','/comment/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('124','配送用户','评论','comment','评论详情','/comment/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('125','配送用户','评论','comment','我的评论','/comment/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('126','配送用户','评论','comment','评论详情','/comment/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('127','配送用户','新闻','article','新闻列表','/article/table','','_blank','0','0','0','0','','','',null,'0','{"print":false,"export_db":false,"import_db":false}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('128','配送用户','新闻','article','新闻详情','/article/view','','_blank','0','0','0','0','','','',null,'0','{"print":false}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('129','配送用户','新闻','article','新闻资讯','/article/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('130','配送用户','新闻','article','新闻资讯','/article/details','','_blank','1','1','1','1','','','',null,'0','{"can_comment":true,"can_show_comment":true}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('131','配送用户','新闻分类','article_type','新闻分类列表','/article_type/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('132','配送用户','新闻分类','article_type','新闻分类详情','/article_type/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('133','配送用户','公告','notice','公告列表','/notice/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('134','配送用户','公告','notice','公告详情','/notice/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('135','配送用户','公告','notice','公告','/notice/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('136','配送用户','公告','notice','公告详情','/notice/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('137','商家用户','学生用户','student_users','学生用户','/student_users/table','','_blank','0','0','0','0','student_name,student_gender','student_name,student_gender','student_name,student_gender',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('138','商家用户','学生用户','student_users','学生用户详情','/student_users/view','','_blank','0','0','0','0','student_name,student_gender','student_name,student_gender','student_name,student_gender',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('139','商家用户','配送用户','delivery_users','配送用户','/delivery_users/table','','_blank','0','0','0','0','user_name,user_gender','user_name,user_gender','user_name,user_gender',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('140','商家用户','配送用户','delivery_users','配送用户详情','/delivery_users/view','','_blank','0','0','0','0','user_name,user_gender','user_name,user_gender','user_name,user_gender',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('141','商家用户','商家用户','merchant_users','商家用户','/merchant_users/table','','_blank','0','0','0','0','store_name,merchant_name,merchant_gender','store_name,merchant_name,merchant_gender','store_name,merchant_name,merchant_gender',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('142','商家用户','商家用户','merchant_users','商家用户详情','/merchant_users/view','','_blank','0','0','0','0','store_name,merchant_name,merchant_gender','store_name,merchant_name,merchant_gender','store_name,merchant_name,merchant_gender',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('143','商家用户','美食信息','food_information','美食信息','/food_information/table','','_blank','1','1','1','1','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction',null,'0','{"can_show_comment":false}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('144','商家用户','美食信息','food_information','美食信息详情','/food_information/view','','_blank','1','1','1','1','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('145','商家用户','美食信息','food_information','美食信息','/food_information/list','top','_blank','1','1','1','1','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('146','商家用户','美食信息','food_information','美食信息详情','/food_information/details','','_blank','1','1','1','1','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction','store_name,merchant_users,food_name,food_types,food_prices,food_pictures,food_introduction',null,'0','{"can_comment":true,"can_show_comment":true}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('147','商家用户','美食订单','food_orders','美食订单','/food_orders/table','','_blank','0','0','1','1','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,total_purchase_price,order_remarks,order_status','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,total_purchase_price,order_remarks,order_status','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,total_purchase_price,order_remarks,order_status',null,'0','{"pay":false}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('148','商家用户','美食订单','food_orders','美食订单详情','/food_orders/view','','_blank','0','0','1','1','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,total_purchase_price,order_remarks,order_status','order_status','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,total_purchase_price,order_remarks,order_status',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('149','商家用户','美食订单','food_orders','美食订单','/food_orders/edit','','_blank','0','0','0','0','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,total_purchase_price,order_remarks,order_status','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,total_purchase_price,order_remarks,order_status','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,total_purchase_price,order_remarks,order_status',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('150','商家用户','配送订单','delivery_order','配送订单','/delivery_order/table','','_blank','1','0','0','1','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,delivery_users,delivery_status,delivery_description,receiving_status','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,delivery_users,delivery_status,delivery_description,receiving_status','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,delivery_users,delivery_status,delivery_description,receiving_status',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('151','商家用户','配送订单','delivery_order','配送订单详情','/delivery_order/view','','_blank','1','0','0','1','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,delivery_users,delivery_status,delivery_description,receiving_status','order_number,store_name,merchant_users,food_name,food_types,food_prices,student_users,student_name,contact_number,shipping_address,purchase_quantity,delivery_users,delivery_status,delivery_description,receiving_status',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('152','商家用户','留言信息','message_information','留言信息','/message_information/table','','_blank','0','0','0','0','order_number,store_name,merchant_users,food_name,student_users,student_name,contact_number,shipping_address,purchase_quantity,delivery_users,message_content,reply_content','order_number,store_name,merchant_users,food_name,student_users,student_name,contact_number,shipping_address,purchase_quantity,delivery_users,message_content,reply_content','order_number,store_name,merchant_users,food_name,student_users,student_name,contact_number,shipping_address,purchase_quantity,delivery_users,message_content,reply_content',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('153','商家用户','留言信息','message_information','留言信息详情','/message_information/view','','_blank','0','0','0','0','order_number,store_name,merchant_users,food_name,student_users,student_name,contact_number,shipping_address,purchase_quantity,delivery_users,message_content,reply_content','order_number,store_name,merchant_users,food_name,student_users,student_name,contact_number,shipping_address,purchase_quantity,delivery_users,message_content,reply_content','order_number,store_name,merchant_users,food_name,student_users,student_name,contact_number,shipping_address,purchase_quantity,delivery_users,message_content,reply_content',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('154','商家用户','类型管理','type_management','类型管理','/type_management/table','','_blank','0','0','0','0','food_types','food_types','food_types',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('155','商家用户','类型管理','type_management','类型管理详情','/type_management/view','','_blank','0','0','0','0','food_types','food_types','food_types',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('156','商家用户','我的收藏','collect','我的收藏','/collect/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('157','商家用户','评论','comment','评论列表','/comment/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('158','商家用户','评论','comment','评论详情','/comment/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('159','商家用户','评论','comment','我的评论','/comment/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('160','商家用户','评论','comment','评论详情','/comment/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('161','商家用户','新闻','article','新闻列表','/article/table','','_blank','0','0','0','0','','','',null,'0','{"print":false,"export_db":false,"import_db":false}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('162','商家用户','新闻','article','新闻详情','/article/view','','_blank','0','0','0','0','','','',null,'0','{"print":false}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('163','商家用户','新闻','article','新闻资讯','/article/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('164','商家用户','新闻','article','新闻资讯','/article/details','','_blank','1','1','1','1','','','',null,'0','{"can_comment":true,"can_show_comment":true}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('165','商家用户','新闻分类','article_type','新闻分类列表','/article_type/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('166','商家用户','新闻分类','article_type','新闻分类详情','/article_type/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('167','商家用户','公告','notice','公告列表','/notice/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('168','商家用户','公告','notice','公告详情','/notice/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `auth` values ('169','商家用户','公告','notice','公告','/notice/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-07 15:53:18.0','2023-05-07 15:53:18.0');
insert into `auth` values ('170','商家用户','公告','notice','公告详情','/notice/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-07 15:53:18.0','2023-05-07 15:53:18.0');
insert into `user_group` values ('1','100','管理员',null,'','','0','0','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `user_group` values ('2','100','游客',null,'','','0','0','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `user_group` values ('3','100','学生用户',null,'student_users','student_users_id','0','3','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `user_group` values ('4','100','配送用户',null,'delivery_users','delivery_users_id','0','3','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `user_group` values ('5','100','商家用户',null,'merchant_users','merchant_users_id','0','3','2023-05-07 15:53:17.0','2023-05-07 15:53:17.0');
insert into `slides` values ('1','轮播图1','内容1','/article/details?article=1','/api/upload/1572762305291091969.jpg','874','2023-05-07 15:53:18.0','2023-05-07 15:53:18.0');
insert into `slides` values ('2','轮播图2','内容2','/article/details?article=2','/api/upload/1572762246713442305.jpg','825','2023-05-07 15:53:18.0','2023-05-07 15:53:18.0');
insert into `slides` values ('3','轮播图3','内容3','/article/details?article=3','/api/upload/1572762382504034304.jpg','403','2023-05-07 15:53:18.0','2023-05-07 15:53:18.0');
insert into `article` values ('1','形容美食的优美句子还是有多的，还有很多的那种色香，味儿俱全，还有那个，看着直流口水','餐饮','219','0','2023-05-07 15:53:18.0','2023-05-07 15:53:18.0',null,null,null,'<p><span class="ql-font-monospace" style="color: rgb(68, 68, 68);">人世间，唯有爱与美食不可辜负，爱已经辜负的太多了，美食就不能再辜负了。</span></p><p><span class="ql-font-monospace" style="color: rgb(68, 68, 68);">——青慕</span></p><p><span class="ql-font-monospace" style="color: rgb(68, 68, 68);">长江绕郭知鱼美，好竹连山觉笋香。</span></p><p><span class="ql-font-monospace" style="color: rgb(68, 68, 68);">——苏轼</span></p><p><span class="ql-font-monospace" style="color: rgb(68, 68, 68);">“美食者不必是饕餮客”---美食者重在食物的质，而非量。</span></p><p><span class="ql-font-monospace" style="color: rgb(68, 68, 68);">——梁实秋</span></p><p><span class="ql-font-monospace" style="color: rgb(68, 68, 68);">何时一饱与子同，更煎士茗浮甘菊。</span></p><p><span class="ql-font-monospace" style="color: rgb(68, 68, 68);">——陆游</span></p><p><span class="ql-font-monospace" style="color: rgb(68, 68, 68);">享受美食的时间是快乐的，但是等待美食出炉的时间是最快乐的。</span></p><p><span class="ql-font-monospace" style="color: rgb(68, 68, 68);">——天道总司</span></p><p><span class="ql-font-monospace" style="color: rgb(68, 68, 68);">小饼如嚼月，中有酥和饴。</span></p><p><span class="ql-font-monospace" style="color: rgb(68, 68, 68);">——苏轼</span></p><p><span class="ql-font-monospace" style="color: rgb(68, 68, 68);">世界上最治愈的东西，第一是美食，第二才是文字。</span></p><p><span class="ql-font-monospace" style="color: rgb(68, 68, 68);">——丁卉</span></p><p><span class="ql-font-monospace" style="color: rgb(68, 68, 68);">山暖已无梅可折，江清独有蟹堪持。</span></p><p><span class="ql-font-monospace" style="color: rgb(68, 68, 68);">——陆游</span></p><p><span class="ql-font-monospace" style="color: rgb(68, 68, 68);">鲜鲫食丝脍，香芹碧涧羹；蜀酒浓无敌，江鱼美可求。</span></p><p><span class="ql-font-monospace" style="color: rgb(68, 68, 68);">——杜甫</span></p><p><span class="ql-font-monospace" style="color: rgb(68, 68, 68);">秀色掩今古，荷花羞玉颜。</span></p><p><span class="ql-font-monospace" style="color: rgb(68, 68, 68);">——李白</span></p><p><span class="ql-font-monospace" style="color: rgb(68, 68, 68);">烹饪就像爱一样，要么全心全意投入，要么完全放弃。</span></p><p><span class="ql-font-monospace" style="color: rgb(68, 68, 68);">——哈里特·冯·霍恩</span></p><p><span class="ql-font-monospace" style="color: rgb(68, 68, 68);">青青竹笋迎船出，白白红鱼入馔来。</span></p><p><span class="ql-font-monospace" style="color: rgb(68, 68, 68);">——杜甫</span></p><p><span class="ql-font-monospace" style="color: rgb(68, 68, 68);">新津韭黄天下无，色如鹅黄三尺余，东门彘肉更奇绝，肥美不减胡羊酥。</span></p><p><span class="ql-font-monospace" style="color: rgb(68, 68, 68);">——陆游</span></p><p><span class="ql-font-monospace" style="color: rgb(68, 68, 68);">美食和风景，可以抵抗全世界所有的悲伤和迷惘。</span></p><p><span class="ql-font-monospace" style="color: rgb(68, 68, 68);">——张嘉佳</span></p><p><span class="ql-font-monospace" style="color: rgb(68, 68, 68);">生活就是魔法意大利面的结合。</span></p><p><span class="ql-font-monospace" style="color: rgb(68, 68, 68);">——弗雷德里·费里尼</span></p><p><span class="ql-font-monospace" style="color: rgb(68, 68, 68);">不要吃任何不会腐坏的东西。</span></p><p><span class="ql-font-monospace" style="color: rgb(68, 68, 68);">——迈克尔·波伦</span></p><p><span class="ql-font-monospace" style="color: rgb(68, 68, 68);">蜀酒浓无敌，江鱼美可求。</span></p><p><span class="ql-font-monospace" style="color: rgb(68, 68, 68);">——杜甫</span></p><p><span class="ql-font-monospace" style="color: rgb(68, 68, 68);">人间定无可意，怎换得玉脍丝莼。</span></p><p><span class="ql-font-monospace" style="color: rgb(68, 68, 68);">——陆游</span></p><p><br></p><p><br></p>','/api/upload/1577839363956408321.jpg',null);
insert into `article` values ('2','国内浪得虚名的8大美食，名声很大却吃一次就上头，你被坑过几回','餐饮','883','0','2023-05-07 15:53:18.0','2023-05-07 15:53:18.0',null,null,null,'<p>中国小吃是民间智慧的体现，是中国美食不可或缺的一部分。在这960万平方公里的土地上，每个地区都有着当地人引以为傲的特色小吃，这些小吃的存在绝非只是三餐之间填饱肚子，它们的存在更像是一种不可撼动的饮食文化。这种小吃，通常还是反映当地物质社会的生活风貌，中国如此之大食材也千差万别，每一种小吃都是地方文化，每一种小吃都是浓郁的思乡之情。</p><p><img src="http://n.sinaimg.cn/sinakd20108/734/w715h819/20220922/dd4e-4f65f62ceb6d476da7d70e98cbec1e56.jpg"></p><p>对于美食爱好者来说，每到一个新地方除了赏美景之外，最大的爱好就是“逛吃”了。不管是被称为“美食荒漠”的北京，还是“全国面食看山西”的山西面食，亦或是好吃到停不下嘴的成都，重庆……然而，由于地理位置的不同，南北方饮食文化的差异很大，所以南方人喜欢的食物，在北方人眼中有可能是“黑暗料理”。北方人爱吃的美食，在南方人看来有可能是“难以下咽”。今天咱们就聊一下，国内浪得虚名的8大小吃，不少网友说名声很大却吃一次就上头，你被坑过几回？</p><p><img src="http://n.sinaimg.cn/sinakd20108/404/w710h494/20220922/d436-283bbb0966b633a68e986a5545e7a4dc.jpg"></p><p>1：柳州螺蛳粉。说起它很多人都不陌生，近几年的网红食品。作为广西柳州的名小吃，同时具有辣，爽，鲜，香，酸，烫，臭的特点。于当地人来说，螺蛳粉如同“神”一般的存在，既有入口的层次感，还有鲜美至极的滋味。但，对于外地人来说，螺蛳粉存在完完全全是黑暗料理。想要吃一碗螺蛳粉，那得需要很大的勇气，而且还不一定能下得去嘴。好吃吃过螺蛳粉的人都说，一口就上头了，绝不会再吃第二次。</p><p><img src="http://n.sinaimg.cn/sinakd20108/352/w720h432/20220922/1f0d-fea34f480cd5e118e02dd02bcca97200.jpg"></p><p>2：新疆切糕。这是一种前几年比较受欢迎的食物，在大街小巷，景区，学校门口，小区门外，经常看到售卖新疆切糕的新疆人。撒满核桃，葡萄干，干果的切糕，看起来五颜六色很是诱人。但，曾经风靡一时的切糕如今沦落到众人嫌弃的地步。不少网友都说，先不说是不是真材实料，也不说好吃不好吃，光是这坑人的把戏就令人讨厌。一小块几百块很正常，而且还不允许退货。再说一下口感，吃第一口还不错，但再继续吃就有点齁嗓子的感觉，所以再好的食材，如果不用心经营也会变得无人问津。</p><p><img src="http://n.sinaimg.cn/sinakd20108/359/w721h438/20220922/a486-5ab8891555bc7a085c342e054f00640a.jpg"></p><p>3：河南胡辣汤。众所周知，胡辣汤在河南可是有着很高的社会地位。不管是早起的还是晚睡的，都要来上一碗胡辣汤。肚子饿的喝完汤暖暖胃，喝醉酒的喝完汤醒醒酒。在当地是非常受欢迎的。作为传统小吃，其实说其实汤又有点不像，更像是一种糊糊，喝起来辣辣的。虽然说河南人很爱胡辣汤，但在外地人眼中却如同“黑暗料理”一般的存在。黑漆漆，黏糊糊的一碗，闻着像方便面调料包，里面还有很多杂七杂八的东西，除了辣还是辣，真的是难以下咽。</p><p><img src="http://n.sinaimg.cn/sinakd20108/351/w716h435/20220922/030d-604297cd90d0223b88b23e35c0005ada.jpg"></p><p>4：上海xxx灌汤包。到上海的游客，灌汤包是必打卡的小吃之一，尤其是在城隍庙里面，排队买灌汤包的场景，让不少人历历在目！灌汤包皮薄馅大，汤汁多。但价格也是贵得离谱。前段时间网上曝光的，一家人在城隍庙游玩，点了3个凉菜，6屉包子，花了将近600块，关键的是还没吃饱。也有很多游客反映，绝不会再买第二次灌汤包，价格贵不说，包子皮还厚，里面的汤汁也不是很新鲜，喝起来有比较重的腥味。很失望。</p><p><img src="http://n.sinaimg.cn/sinakd20108/343/w708h435/20220922/5660-13674cfa60781f8f314357360efb7880.jpg"></p><p>5：杭州西湖醋鱼。作为杭州的传统名菜，它最远可追溯到宋朝时期。在当时，这鱼的做法极其复杂，时间要把控得刚刚好，多一分则老，少一分则生。到杭州旅游的人，西湖醋鱼也是必打卡的小吃之一，虽然价格不菲，但品尝一下珍味佳肴也是值得的。但是，真正吃过之后才发现，这闻名全国的西湖醋鱼并没有想象的那么好吃，除了酸就是腥。价格也很贵，小的一条就要158，大一点的得几百块。实在是难吃又贵，不会再吃第二次。</p><p><img src="http://n.sinaimg.cn/sinakd20108/365/w715h450/20220922/8c89-cc8098df7bfccf9ae658bc4228cdb396.jpg"></p><p>6：北京炸酱面。与胡同，四合院一样，炸酱面也成了极具北京特色的文化符号。对于老北京人来说，炸酱面是生活中最不能缺少的食物。几天不吃，肚子里的馋虫就勾得人心痒难耐，非得吃上几口才能解馋。但是，北京市面上的炸酱面馆大多数都是做做样子罢了，打着正宗的旗号，做的炸酱面一点也不正宗，不光不正宗而且还很难吃。尤其是景区，景点附近的炸酱面，真的是难吃得要死，价格还贵得吓人。不少游客对此都很失望，认为北京炸酱面名不副实。其实，想要吃到正宗的炸酱面，非北京人家里自己做的最地道，就一个字“香”。</p><p><img src="http://n.sinaimg.cn/sinakd20108/743/w716h827/20220922/a39a-e97499326f6f11abd1f1cd324c0cab35.jpg"></p><p>7：北京果脯。在早些年代，这可是比较流行的新鲜玩意儿，要是谁家孩子能吃上北京带回来的果脯，那在小伙伴们心中绝对是妥妥的“富豪”。但随着社会的发展，这玩意似乎被社会逐渐淘汰了。不过还有不少人买来尝尝，吃过之后才发现这玩意简直就是童年噩梦。前段时间看的一个关于北京小吃的纪录片，片中记载了北京果脯的发展历史，近几年经过了改良，降低了甜度。但似乎百姓们还是不买账，也许有情怀的人才会买来吃吧！</p><p><img src="http://n.sinaimg.cn/sinakd20108/354/w718h436/20220922/077e-c7ebc7637098ca00a432e89029e0e77b.jpg"></p><p>8：扬州炒饭，扬州炒饭的美名颇多，“碎金饭”，“金包银”，“金镶玉”等雅致的说法。在淮扬菜系里，扬州炒饭绝对能算得上是当家的主食。名气之大可谓是遍及全世界各地。扬州炒饭，最亮眼的地方就是它的辅料，虾仁，鸡腿肉，火腿，香菇，海参，笋，青豆等等，只有米饭和辅料比例得当，炒出来才会显得相得益彰。但似乎出了扬州，就很难吃到正宗的扬州炒饭。随便加点辅料，加点鸡蛋也叫扬州炒饭。加点黄瓜，火腿，鸡蛋一炒，也叫扬州炒饭。作为扬州的名片，扬州炒饭逐渐被丑化了，似乎并不怎么受欢迎。</p><p><img src="http://n.sinaimg.cn/sinakd20108/348/w715h433/20220922/2911-be27179ce505961cf2918c535274c2e8.jpg"></p>','/api/upload/1572765026987540481.jpg',null);
insert into `article` values ('3','“零碳餐厅”亮相北京首钢园','餐饮','613','0','2023-05-07 15:53:18.0','2023-05-07 15:53:18.0',null,null,null,'<p>本报讯（记者 杨天悦）北京麦当劳首钢园得来速餐厅日前正式开业，这是其在中国首家获能源与环境设计先锋评级认证的“零碳餐厅”。餐厅超过2000平方米的场地均采用<a href="https://finance.sina.com.cn/realstock/company/sz000591/nc.shtml" rel="noopener noreferrer" target="_blank" style="color: rgb(55, 83, 162);">太阳能</a>(7.180,&nbsp;0.01,&nbsp;0.14%)光伏发电系统，据估算每年可减少碳排放约200吨。</p><p>为了让消费者直观地体验绿色低碳生活方式，餐厅门外和餐厅内分别设置有4辆“环保充电单车”，吸引了不少人前来试骑。消费者踩动单车就能驱动发电，点亮面前的巨型黄色“M”标志后，单车前方的小桌板就可以为手机进行无线充电。单车的塑料部分是由回收再利用的塑料制作而成，海洋塑料回收椅也将在首钢园餐厅与顾客见面。</p><p>据悉，这家餐厅参照LEED零碳排放标准和零能耗标准进行设计、施工，预期将于12个月后获得认证，将成为亚太地区首家同时获得这两项认证的餐厅。</p>','/api/upload/1572764784166699009.jpg',null);
insert into `article` values ('4','“滤镜美食”不该“滤”掉消费者的信任','餐饮','633','0','2023-05-07 15:53:18.0','2023-05-07 15:53:18.0',null,null,null,'<p>餐饮商家、美食平台开展美食营销，必须遵守法律法规，遵守公序良俗，不损害消费者的合法权益。炮制“滤镜美食”进行促销等行为是短视表现，只是“做一锤子买卖”，影响自己的正面形象，后果难以预料。</p><p>何勇海</p><p>在美食推荐平台，有不少消费者吐槽被宣传图片或者文案吸引，结果吃到的食物与图文严重不符。（据9月20日《法治日报》报道）</p><p>给美食加上一层滤镜，能使图片中的美食看起来更加新鲜美味、有质感。用行内的话说，美食首先是视觉盛宴，其次才是味觉盛宴，滤镜可以让图片中的美食看上去更加“活色生香”。炮制“滤镜美食”的目的，与炮制“滤镜景点”一样，是以过度美化来吸引消费者。</p><p>那么，炮制“滤镜美食”到底是不是虚假宣传？理性地看，如果网络中的美食图片仅是消费者个人随手拍分享，从摄影爱好者的角度进行了美图、修图，并非营销，就不应一概而论定性为虚假宣传。对于这类分享，只需要提醒分享者真诚分享、展现真实的状况，如果要美化修饰美食图片，不可过度，以不会对其他人产生误导为宜。</p><p><br></p><p>如果“滤镜美食”的炮制者为商家、美食平台，则属于广告宣传，应当符合《广告法》《消费者权益保护法》的相关规定。食品采取多样化和个性化宣传的前提是不违反现有法律法规、不造成资源浪费和食品浪费。如果有消费者在网络平台“滤镜美食”的欺骗下，吃到的食物与图文严重不符，以经营者涉嫌消费欺诈、造成食品浪费为由而举报，相关部门均应受理，经调查取证能被认定为虚假广告的，应予以处罚。如果这类宣传推广文案采用了“最”“封神”“天花板”等用语，同样违反了《广告法》，理当处理。</p><p>据报道，除了颜色失真，越来越多的商家、美食推荐平台在推广美食时用一些夸张的容器装食物，比如用4公斤重的桶来装椰子水、用输液袋装奶茶、用泡菜坛子装面条和小龙虾等，给消费者制造美食分量大的感觉，实际消费时却严重缩水。这些行为可能被认定构成欺诈，消费者可以要求价款三倍的赔偿，并有权向平台、监管部门进行举报。</p><p>必须强调的是，餐饮商家、美食平台开展美食营销，必须遵守法律法规，遵守公序良俗，不损害消费者的合法权益。炮制“滤镜美食”进行促销等行为是短视的表现，只是“做一锤子买卖”，会影响自己的正面形象，后果难以预料。商家只有诚信守法经营，把主要精力放到提升产品质量和服务质量上，让消费者获得真正实惠和良好消费体验，才能真正提升品牌美誉度，促进自身和平台健康发展。</p>','/api/upload/1572764537197690881.jpg',null);
insert into `article` values ('5','闲说中国美食','餐饮','854','0','2023-05-07 15:53:18.0','2023-05-07 15:53:18.0',null,null,null,'<p><span style="color: rgb(51, 51, 51);">中国人吃饭，吃的是概念。或者用一种通俗的说法：吃的是文化。这使饮食问题带有了社会性（甚至艺术性），而不再仅仅是一项形而下的生理活动。</span></p><p><span style="color: rgb(51, 51, 51);"> 日本人饱食终日，自然把饮茶的过程，也提炼为向哲学靠拢的茶道，有点在清风、明月、插花与器皿中求真理的意思。中国人则更了不起，把一日三餐都当作兢兢业业的功课了，煞费苦心，追求着那令人拍案称绝的艺术效果。“好吃极了！”是较流行的一句赞美用语。所以，美食家的虔诚丝毫不亚于画家或雕塑家，对美的体会甚至更全面：色、香、味——连深藏不露的舌头都调动起来了，成为鉴赏的工具。</span></p><p><span style="color: rgb(51, 51, 51);"> 当一席大菜合盘托出，井然有序地布置在餐桌中央，简直就像揭开了蒙在某一尊艺术品上面的幕布，不时能听见一、两声由衷的喝采——当然，这是躲在后台掌勺的厨师所期待的。宾客们举杯相庆，仿佛在进行小小的剪彩仪式。然后就各司其职，频频挥动蜻蜓点水的筷子。金圣叹评《水浒》，脂砚斋评《红楼梦》，也不过如此吧：在字里行间作点小楷的眉批。不管是冷盘还是炒菜，最终都必须经得起筷子的“酷评”。</span></p><p><span style="color: rgb(51, 51, 51);"> 在中国，每一桌宴席的推出，都笼罩着新船下水般的热烈气氛。而每一位食客，都是动作熟练的老水手——或者说，都是潜在的评委。难怪开餐馆的老板，都很会看客人的脸色。看客人的脸色就能了解到厨师的水平。中国文化的最高境界，就是一个“喜”字。这也是中国人最热爱的一个汉字。而吃饭是最能烘托出这种喜气的。喜气洋洋，东道主自然满意。传统的喜宴，被清代的满汉全席发挥到极致。从其名称即能感受到“民族大团结”的意味，“强强联合”的意味。正宗的满汉全席要连吃三天三夜，茶肴不重复。这是具有中国特色的狂欢节：一场饮食文化的马拉松！吃饭，在中国是最日常的仪式，是最密集的节日。</span></p><p><span style="color: rgb(51, 51, 51);"> 信奉基督的西洋人就餐前习惯在胸前画十字，念叨一句“上帝保佑”，感谢上帝赐予的面包与盐，大多数中国人都是无神论者，把酒临风时反而充满了当家做主的感觉。饱餐一顿（若能持螯赋诗就更好了），是离他们最近的一种自由。由此可见，这个民族宗教感匮乏，艺术气息却很浓郁。在我想像中，美食家都是一些拥有古老传统的民间艺术家。</span></p><p><span style="color: rgb(51, 51, 51);"> 西餐折射出私有制的影子，各自为政，管理好自己的盘子——使用刀叉是为了便于分割利益。中餐则体现了最朴素的共产主义。中国人围桌而聚，继承了原始氏族公社的遗传基因，有肉大家吃，有酒大家喝，人人皆可分一杯羹。大锅饭的传统很难打破。好在中国的饭桌也是最有凝聚力的地方，有福同享、有难共担的绿林好汉作风颇受欢迎。中国人通过聚餐就能产生四海之内皆兄弟、天下大同的幻觉，这种虚拟的亲情毕竟大大增进了其食欲。所以中国人吃饭，也是在吃环境，吃气氛，甚至吃人际关系。边说边吃，边吃边听。这是一种超越了吃的吃。我一直认为中国人的吃是最有情调的，最有人情味的。</span></p><p><span style="color: rgb(51, 51, 51);"> 中国人有四大菜系八大风味。川菜、粤菜、湘菜、齐鲁菜、淮扬菜、东北菜乃至上海本邦菜……仿佛实行军阀割据似的。但在我眼中，这更像在划分艺术流派。出自圣人之乡的齐鲁菜，称得上古典主义。缠绵悱恻的淮扬菜，属于浪漫主义。假如说辛辣的湘菜是批判现实主义，麻辣的川菜则算魔幻现实主义了——一粒花椒，有时比炮弹还厉害，充分地调动起我们舌头的想像力。当然，也可以用别的方法换算：上海菜属于杨柳岸晓风残月的婉约派，东北菜则相当于大江东去、浪淘尽千古风流人物的豪放派……</span></p><p><span style="color: rgb(51, 51, 51);"> 我喜欢琢磨一系列特色菜名：宫爆肉丁、鱼香肉丝、麻婆豆腐、夫妻肺片、古老肉、梅菜扣肉、素什锦、糖醋里脊、豆瓣鱼、白斩鸡、地三鲜、拔丝菠萝……就像在玩味隽永生动的词牌：菩萨蛮、忆秦娥、浣溪沙、虞美人、临江仙、蝶恋花、满江红、雨霖铃、一剪梅、鹊桥仙、沁园春、青玉案呀什么的。毫不夸张地说，这些或雅致、或俗俚、或温柔、或高亢的菜名，经历了亿万人传诵、千百年陶冶，本身就如同一阕阕吸风饮露的“如梦令”。比梦还要豪奢、还要飘逸的中国菜哟！</span></p><p><span style="color: rgb(51, 51, 51);"> 我曾经有一个理想，开一家词牌餐馆，用词牌来命名各种新旧菜肴，譬如将水煮鳝鱼改称为水龙吟，将酸菜鱼改称为渔家傲，将辣子鸡改称为贺新郎，将小葱拌豆腐改称为念奴娇，将烤乳鸽改称为鹧鸪天，将冬瓜连锅汤改称为西江月，甚至将油炸花生米改称为卜算子，将沙锅鱼头改称为水调歌头……后来想一想，觉得太复杂，还是算了。况且像蚂蚁上树、狮子头、地三鲜，灯影牛肉呀什么的，是没法改的，它们本身就很有诗意了。许多菜名都有一种浑厚古朴之感，一改就没味了。譬如某皇帝将民间的青菜豆腐肉丸汤赐名为珍珠翡翠白玉汤，精美有余，但毕竟显得雕饰与做作。我最好还是别向那傻皇帝学习。</span></p><p><span style="color: rgb(51, 51, 51);"> 某些菜名之所以不同寻常，在于是有典故的。我们在吃菜的同时，无形中也在吃典故——用筷子就能把它晃晃悠悠地挟起来。譬如在叫化鸡弥漫的香气中，分明还晃动着那位无名的乞丐的身影——他哪是在乞讨呀，分明是给后人施舍了一道美味。还有东坡肉（以及东坡肘子），很明显沾了宋朝那位大诗人的光。而我们也在吃他老人家的遗产，吃他的名气。苏东坡的作品中确有一首《猪肉颂》（足以证明东坡肉不是讹传）：“净洗铛，少着水，柴头罨烟焰不起。待他自熟莫催他，火候足时他自美。黄州好猪肉，价贱如泥土，贵者不肯吃，贫者不解煮。早晨起来打两碗，饮得自家君莫管。”苏东坡无形中担任了红烧肉的形象大使，作了近千年的广告。我一向以为：苏学士有两大造福于平民百姓的功绩不可磨灭，其一是在杭州西湖修筑的苏堤，其二则是为中国饮食文化贡献了“东坡肉”——这确实是另一种意义的“古老肉”。英雄所见略同，当代也出过一个爱吃红烧肉的伟人：毛泽东。他相信肥腻的红烧肉补脑，使人聪明。毛主席的诗歌，在豪放程度上一点不比苏东坡逊色——最有意思的是，他甚至有勇气把“土豆烧牛肉”写进词里。在全国各地以毛家菜或韶山菜为金字招牌的湘菜馆，都会把毛氏红烧肉推举为主打项目。</span></p><p><span style="color: rgb(51, 51, 51);"> 你能说吃中国菜，不是在吃文化吗？文化是比油盐酱醋，姜茸葱花更重要的调味品。洒那么一点点文化味精，你就能吃出别样的感觉。</span></p><p><br></p><p><span style="color: rgb(51, 51, 51);"> 敢吃的中国人</span></p><p><span style="color: rgb(51, 51, 51);"> 中国人的勇敢尤其体现在饮食方面。这是一个几乎什么都敢吃的民族。灾荒时期吃树皮、野菜乃至观音土自然还可以算作迫不得已（包括长征路上的红军解下牛皮带炖汤喝），和平的年代，他们也照样热衷于吃各种稀奇古怪的食物。吃蛇（在西方的《圣经》里那是魔鬼的化身）也罢了，在古时岭南一带，还曾将其易名为“茅鳝”，有点附庸风雅或掩耳盗铃的架式。还吃蝎子。我在北京安定门外某餐馆出席酒宴，高潮处便是圆桌中央摆上了满满一大盘炸得黄灿灿的蝎子。那一瞬间我不禁联想：中国人的嘴巴真够“毒”的——才敢于如此“以毒攻毒”？当然，被传为佳话的是吃剧毒的河豚，“拼死吃河豚”这句江南古谚颇像烈士的绝命诗。所以我自小即有这样的印像：能够将生死置之度外的，第一是革命者，其次则当数美食家了。</span></p><p><span style="color: rgb(51, 51, 51);"> 不知西方社会，在政治家、思想家、艺术家、军事家等等之外，是否还产生过美食家的头衔？在中国，美食家几乎是一种传统。虽然它一直近似于“闲职”，却也是颇让人羡慕的。欧洲文明里，美食家一度缺席，正如它所推崇的探险家，对于中国而言，则是近代以后舶来的词汇。但我私下里以为：美食家也算是一种足不出户的探险家——“父母在，不远游”，中国人只好陶醉于另一种意义的探险，那就是对山珍海味的猎奇。美食家用菜谱来代替地图，用杯盏来代替罗盘，用筷子来代替桨橹，航行在自己的味觉里，同样也领略了无限风光。这种冒险心理在河豚的问题上发挥到极致。河豚相当于中国饮食文化里的“禁果”——一种致命的诱惑，它的鲜美因为神秘与危险而被夸张了。美食家们不仅没有望而却步，反而趋之若鹜。这份勇气，恐怕连渎职的亚当、夏娃都会自叹弗如。</span></p><p><span style="color: rgb(51, 51, 51);"> 神农氏（即炎帝）堪称史前的美食家。“神农尝百草”，不仅仅为了果腹，也为了辨识植物的种类、滋味、营养价值（包括药用价值）。他大大地丰富了后人的“菜篮子工程”。在我想像中，中国人的祖宗是个挖野菜的，其装束、表情有点类似于后来编撰《本草纲目》的老中医李时珍：穿着草鞋，挎着竹篓，扛着一把小锄头。湖北有座神农架，据说就是他的露天“食堂”。没有敢为天下先的神农，我们的口福将大打折扣。</span></p><p><span style="color: rgb(51, 51, 51);"> 甚至春秋时期的老学究孔子，也提倡“食不厌精，脍不厌细”。他本人在办私塾时，不爱收现金，更乐意接受弟子们孝敬的一束束干肉，以充抵学费。可见食物是最古老的“硬通货”。孔子，在方方面面都称得上是我们民族的教师爷呀。他同样也影响了一代又一代精益求精的美食家，使饮食发展为文化，登上大雅之堂。中国的菜谱（从线装的手抄本到铅字印刷品）若堆砌起来，绝对比四书五经要厚重许多。在美食家眼中，是可以当诗来读的。譬如苏轼讲解烧猪肉（后被命名为“东坡肉”）的秘诀：“多著火，少著水。”多么精炼呀。至于袁枚，既写了《随园诗话》，又写《随园食单》——左右开弓，拿筷子时像耍笔杆一样虔诚，耍笔杆时又像拿筷子一样奔放……当然，诗人的吃相毕竟比较文雅，《随园食单》仅可用来管窥中国人的食物。还有许多奢侈的吃或野蛮的吃，被有意无意地忽略了。譬如民间流传的所谓“活吃猴脑”（系将活猴用木枷锁定，敲开头盖骨，以麦管吸其脑汁），绝对是太残酷了。它反射出人性的黑暗。中国人的饮食里，也有一些反文化的东西，不是没有可批判之处。鲁迅先生说过：“饮食问题，不仅可以反映社会的物质文明程度，也可以反映出一定社会的社会状况以及暴露种种社会痼疾。”</span></p><p><span style="color: rgb(51, 51, 51);"> 路易斯·辛普森写过一道《美国诗歌》：“不论它是什么，都必须有／一个胃，能够消化／橡皮、煤、铀、月亮、诗。／就像鲨鱼，肚里盛只鞋子。／它必须游过茫茫的沙漠，／一路发出近似人声的吼叫。”想起古老的中国，我就仿佛看见一只巨大的胃：除了五谷杂粮，里面还填充着燕窝、鱼翅、熊掌、海参、虎骨等等，甚至还有愚昧年代里的金丹、胞衣、人血馒头呀什么的……这是一只消化能力惊人的胃，整整蠕动了几千年。它的胃酸简直能腐蚀石头抑或金属。中国人的胃口真是太大了，太好了。</span></p><p><span style="color: rgb(51, 51, 51);"> 自从二十世纪末以来，“环保”在世界范围成为越来越受到重视的课题，中国人那包罗万象的食谱，也是很值得推敲与挑剔的。</span></p><p><span style="color: rgb(51, 51, 51);"> 我查阅了清代满汉全席的菜单，发现其中有龙肝（多用娃娃鱼或穿山甲替代）、凤髓（多用孔雀或飞龙替代）、象披（即象鼻，亦可用犀牛鼻、犴鼻替代）、枭炙（烤猫头鹰）、狮乳（雌狮的乳房）、豹胎、猩唇、猴脑、虎眼、驼峰、鲨鱼翅及唇，熊胆及掌、仙鹤……甚至还有天鹅肉。涉及到许多目前已濒临灭绝的野生动物。我从字面上闻到了一股血腥气。不无汗颜：我那好吃的祖先们哟，是否无意识地加重了这种生态危机？对美食孜孜不倦地追求，无形中造成了他们的过失。都是欲望惹的祸。而贪吃的恶果，在目前已越来越显现了。</span></p><p><span style="color: rgb(51, 51, 51);"> 全中国，究竟还剩下多少头野生的老虎、豹子、大象、熊？还剩下多少扬子鳄、娃娃鱼？</span></p><p><span style="color: rgb(51, 51, 51);"> 合拢祖传的食谱，我以赎罪的心情，向这些濒危动物表示忏悔——包括写下此篇文章。野生动物保护法的出台，规范了中国人的食欲。有些东西是吃不得的，那无形中等于在蚕食自己的未来，蚕食这惟一的地球。受法律保护的珍稀动物，相当于现代社会的“禁果”。亚当、夏娃就是因为偷食“禁果”被逐出伊甸园的。唉，人类的原罪总是与吃有关。我把一些物种的灭亡，视为人类犯下的另一种原罪。</span></p><p><span style="color: rgb(51, 51, 51);"> 我们的环保意识，应该首先从每天的餐桌上开始。刀叉必须是合法的，必须是负责任的。</span></p><p><span style="color: rgb(51, 51, 51);"> 朋友邹静之去湘西时，曾遇见店家悄悄推销娃娃鱼，问他是否想吃？他断然拒绝。他并不是付不起那高价，而是觉得“自己早已在思想上加入了绿色和平组织。”（原话如此）假如每个中国人都有这样的觉悟，饮食文化的负作用将减少为零。邹静之写过一篇叫《吃的劣迹》的随笔。吃濒危动物，自然属于劣迹了。但愿中国人在这方面的劣迹能彻底根除。</span></p><p><span style="color: rgb(51, 51, 51);"> 可惜我近日去南方某省山区出差，还是听说当地的有钱人以穿山甲炖汤招待贵宾，一旦被执法部门发现，则谎称穿山甲是在爬过公路时被车辆撞死的。以违禁的食物来抬高身价及宴席的档次，这绝对是中国人的虚荣心在作怪。那天夜里，我梦见一只血淋淋的穿山甲。这无疑是一个噩梦。</span></p><p><span style="color: rgb(51, 51, 51);"> 中国人有吃狗肉的。在一衣带水的邻邦韩国，此风尤甚。这似乎并没有什么错，因为狗并不属于濒危的珍稀动物。欧美人对此却颇有微词，甚至恨不得要求以戒除此习来作为韩国举办世界杯足球赛的先决条件。欧美人不吃狗肉，并非有什么法律约束，而纯粹是感情上的：他们一直认为狗是人类最忠实的朋友。这似乎显得心太软甚至有点迂腐了。但我想，人类的心灵若是能更温柔、更善良一些，难道不是件好事吗？在欧美，严令禁止虐待动物，否则要承受高额罚款。更重要的，是大多数人都在自觉地遵守。是的，人类该到了良心发现的时候。</span></p>','/api/upload/1577840621383581696.jpg',null);
insert into `article` values ('6','传统美食──饺子','餐饮','516','0','2023-05-07 15:53:18.0','2023-05-07 15:53:18.0',null,null,null,'<p><span style="color: rgb(51, 51, 51);">说起饺子，可以说大家是再熟悉不过了。在我们中国，每当逢年过节，迎亲待友，总会包饺子。饺子滑润可口，味道鲜美，寓意深刻。每年除夕之夜，在我国北方家家户户都会围坐在一起包饺子。“水饺人人都爱吃，年饭尤数饺子香。”这句话代表着人们对饺子的钟爱之情。</span></p><p><span style="color: rgb(51, 51, 51);">饺子由来已久，始于东汉末年。“医圣”张仲景在冬至回乡路过南洋时，看见不少穷困老百姓耳朵冻伤，饥寒交迫，很多人染上风寒。张仲景顿生怜悯之心，于是便在当地搭了一个医棚，支起一口大锅，用羊肉、辣椒和袪寒提热的药材做馅，再用包成耳朵形状，盛给穷人们吃。人们从冬至吃到除夕，抵御了伤寒，治好了冻耳。为了感谢张仲景的善良、无私。每年的冬至和除夕，人们都要吃饺子。渐渐地，吃饺子就成了我们中国人的一种习俗。</span></p><p><span style="color: rgb(51, 51, 51);">在不同的时期，饺子的叫法也各不相同。东汉末年称饺子为“娇耳”。唐代却称之为“汤中牢丸”；元代称为“时岁角”；明末称为“粉角”；清朝又称为“扁食”……随着历史的发展，饺子渐渐开始变得名目繁多。如广东的澄粉虾饺、上海锅贴饺、扬州的蟹黄蒸饺、山东的高汤水饺、东北的老边饺子。四川的钏水饺等，都各有特色，受人欢迎。</span></p><p><span style="color: rgb(51, 51, 51);">饺子不仅好吃，而且做法独特、简单。首先需要将面团搓成长条，再把长条切成一个个小块，擀成面皮。然后将一些菜或肉剁碎，用油盐酱醋等佐料调成馅。再用面皮把馅包起来，用手把面皮一点点儿捏紧，这样一个漂亮的饺子就做好了。这些包好的饺子也是形状各异，蕴含深意：月牙形的叫“捏福”；元宝形的象征着财富遍地，金银满屋；麦穗形的象征着新的一年会五谷丰登……看来，这小小的饺子里也饱含着人们对美好生活的向往！</span></p><p><span style="color: rgb(51, 51, 51);">饺子可不仅仅是中国人的专利哦！外国的饺子也别有一番风味。如俄国人的饺子馅有牛肉、胡萝卜、鸡蛋、葱头、盐和味精等，除此之外他们还会在饺子馅中添加一些辣椒末，而且包的个头很大。最特别的是他们煮饺子用的是牛骨熬成的清汤。不过，对俄国人来说，喝煮饺子汤是第一道菜，吃饺子和是第二道菜。其他诸如匈牙利饺子、意大利饺子、朝鲜饺子等，也都很有特色，别具一格。</span></p><p><span style="color: rgb(51, 51, 51);">看到这里，你一定很馋了吧!那就让我们一起动手，做一份香喷喷的饺子吧!</span></p>','/api/upload/1577840993988771841.jpg',null);
insert into `article` values ('7','北京美食，真的都是“穷”讲究？','餐饮','820','0','2023-05-07 15:53:18.0','2023-05-07 15:53:18.0',null,null,null,'<p class="ql-align-center"><img src="https://n.sinaimg.cn/sinakd20220922s/290/w1080h810/20220922/491d-5103645026e4537d1a9d5d808d07744b.jpg"><strong>△ 爆肚，麻酱，羊杂汤，饼夹肉。</strong></p><p>一秒说出北京美食，你会想到什么？</p><p>北京烤鸭？卤煮？豆汁儿？铜火锅？</p><p>曾有朋友跟我说，去北京出差，当地人推荐的馆子，就没有一个是吃北京菜的。</p><p>烤鸭吧，北京人自己都不怎么爱吃。</p><p>卤煮吧，总觉得那就是个小吃，算不得菜。</p><p>豆汁儿吧，甭说外地人，有些北京人自己都吃不惯。</p><p>火锅吧，还得天冷了吃才对味儿……</p><p class="ql-align-center"><img src="https://n.sinaimg.cn/sinakd20220922s/198/w1080h718/20220922/dd5b-56ffe39d5868b91d8f8bda865158b579.jpg"><strong>△&nbsp;如果非得吃烤鸭，很多人会选择四季民福，看着确实诱人。图源：图虫创意</strong></p><p>愁人。</p><p>难不成真如坊间传闻，“北京无美食，全是穷讲究”？</p><p>那这误会可就大了。</p><p>北京，还真不是个美食荒漠。</p><p>不信，到北京街上瞧一瞧。</p><p>博四方精华，兼各族特色。</p><p>蒸、煮、煎、炸、烤、烙、爆、冲，各式技艺各显神通。</p><p class="ql-align-center"><img src="https://f.sinaimg.cn/sinakd20220922s/720/w974h546/20220922/2ec7-71506f0790d2f2adf4cc92538e31cc7c.gif"><strong>△ ‍北京特色早餐。</strong></p><p>更有各种百年传承的老字号美食，经过了时间的检验，诞生出一碗舌尖上的享受。</p><p>讲究，北京美食倒是真有。</p><p>喝面茶要吸溜儿，涮羊肉要手切，豆汁儿需得配焦圈。</p><p>就连熬个白菜，也独成一道风味。</p><p class="ql-align-center"><img src="https://n.sinaimg.cn/sinakd20220922s/200/w1080h720/20220922/5ca3-1a085ec2fdbc47eec9c6295c8c1a630d.jpg"><strong>△ 北京鲜鱼口胡同美食街。图源：图虫创意</strong></p><p>讲究归讲究，老北京人也极好养活。</p><p>窝头萝卜熬白菜，下棋聚酒溜溜鸟。</p><p>老北京的美食就如老北京的胡同一样，低调，但各有各的好。</p><p>01</p><p>炸烙烤，劈里啪啦、热闹！</p><p>炸、烙、烤三种技艺，在北京美食里是分不开的。</p><p>三种技艺随机组合，先炸再烤、先烙再烤、先炸再烤……</p><p>能将各种糕饼的样式儿翻腾出花儿来。</p><p class="ql-align-center"><strong>&nbsp;炸糕&nbsp;</strong></p><p class="ql-align-center"><img src="https://f.sinaimg.cn/sinakd20220922s/720/w974h546/20220922/a544-8e5b240fe6eb40556275ad830dcea983.gif"><strong>△ ‍掰炸糕。</strong></p><p>炸得金黄酥脆的外壳包裹着甜甜的豆沙馅，刚出锅时还能看到表皮上的滋滋油点。</p><p>细数北京的炸糕，有江米面炸糕、烫面炸糕、奶油炸糕……</p><p>其中当属<strong>奶油炸糕</strong>营养价值高，也算是北京一道独特的美食。</p><p>据传是由蒙古人将草原上的奶制品文化带到了当时的京城，后经过改良，又融入了炸糕中去，成了现在的北京奶油炸糕。</p><p>在以前生活水平不高的年代，炸糕因为用油多，算是个奢侈玩意儿。</p><p>那时候，在胡同口买个炸糕，小孩儿能开心一整天。</p><p>如今生活条件改善了，不吃糖油混合物成了大多数年轻人的饮食法则。</p><p>但偶尔吃个炸糕，也是吃个童年的快乐。</p><p class="ql-align-center"><strong>&nbsp;饼&nbsp;</strong></p><p class="ql-align-center"><img src="https://n.sinaimg.cn/sinakd20220922s/200/w1080h720/20220922/7c3e-34481184ee38ff62cc9df5f7f7a60c63.jpg"><strong>△ 麻酱烧饼。图源：图虫创意</strong></p><p>甜口的糖火烧、咸口的麻酱烧饼、带馅儿的门钉肉饼、酥脆的炸咯吱盒……</p><p>卖饼的，不管是小摊儿还是大饭店，到了下午六点左右都忙得是不可开交。</p><p>下班放学时间买袋<strong>麻酱烧饼</strong>回家，晚饭直接香一倍！</p><p>一层面一层麻酱地卷着，压成饼状，再将外皮裹满芝麻粒，最后烤至酥脆。</p><p>掰开烧饼，还能清晰地看到里边的纹理层次、闻到芝麻酱的独特香味儿。</p><p class="ql-align-center"><img src="https://n.sinaimg.cn/sinakd20220922s/640/w960h1280/20220922/326d-789bdb46f4e6d943cdda75217d346aaf.jpg"><strong>△ 北京南城南来顺柜台。图源：图虫创意</strong></p><p>香甜绵软的<strong>糖火烧</strong>，也是远近闻名。</p><p>擀面时加入红糖、麻酱，看似味道相冲的两个食物搭在一起，竟意外的适配。</p><p>红糖增加了麻酱的醇厚，麻酱更突出了红糖的香甜，二者相得益彰。</p><p class="ql-align-center"><strong>&nbsp;焦圈&nbsp;</strong></p><p class="ql-align-center"><img src="https://n.sinaimg.cn/sinakd20220922s/201/w1080h721/20220922/cf26-a6b2b3def585caf4dda58ddf0b66728f.jpg"><strong>△ 焦圈。图源：图虫创意</strong></p><p>北京人吃焦圈，可以烧饼夹焦圈、也可以豆汁儿泡焦圈。</p><p>上等的焦圈炸出来，色泽金黄，状似手镯，口感焦香酥脆。</p><p>配上一口芥菜丝，喝上一口豆汁儿，便是一顿京味儿满满的早餐。</p><p>一碗豆汁儿几个焦圈加上一碟儿辣咸菜丝儿，占了五味中的酸、辣、甜、咸四味，独没有苦味，是为人生的期盼。</p><p>02</p><p>来点喝的，各种滋味儿</p><p>干吃太噎，得来点喝的顺顺口。</p><p>不过，拿来顺口的也是有讲究的。</p><p>它们丝毫不逊色于餐桌上的任何一碗吃食，似乎也成了饭桌上的主角。</p><p>甜的、咸的、酸的、辣的，应有尽有。</p><p class="ql-align-center"><strong>&nbsp;豆汁儿&nbsp;</strong></p><p class="ql-align-center"><img src="https://n.sinaimg.cn/sinakd20220922s/87/w1080h607/20220922/f51b-5cf45e5db554737952e178596ba51b14.jpg"><strong>△ 一碗豆汁儿。图源：图虫创意</strong></p><p>不管北京人自己乐不乐意，在外人眼里，豆汁儿就是跟烤鸭、炸酱面齐名的北京菜代表。</p><p>喜欢的恨不得天天喝，几顿不喝就想得紧；</p><p>不喜欢的，闻着那股馊味儿直接绕着走。</p><p>这馊味儿，正是豆汁儿的精华所在。</p><p>豆汁儿用制作绿豆粉丝的下脚料制成，也就是糟粕部分。</p><p>据《燕都小食品杂咏》记载:</p><p>"糟粕居然可作粥，老浆风味论稀稠。无分男女齐来坐，适口酸盐各一瓯。"</p><p>再配上焦圈和咸菜，“食者自知，可谓精妙绝伦”。</p>','/api/upload/1572765192012431361.jpg',null);
insert into `article_type` values ('1','100','餐饮','0',null,null,null,'2023-05-07 15:53:18.0','2023-05-07 15:53:18.0');
