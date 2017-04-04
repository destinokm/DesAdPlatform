
‘affiliate’
CREATE TABLE `affiliate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company` varchar(255) DEFAULT NULL COMMENT '渠道名称',
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `status` enum('ACTIVE','PENDING') NOT NULL DEFAULT 'ACTIVE',
  `postback_url` varchar(1023) DEFAULT '' COMMENT '回调渠道的url',
  `code` char(32) NOT NULL DEFAULT '' COMMENT 'api接入token设置，32位',
  `adjusted` enum('ENABLE','DISABLE') NOT NULL DEFAULT 'DISABLE' COMMENT '是否已开启扣量',
  `access_type` enum('FULL','AFF') NOT NULL DEFAULT 'AFF' COMMENT '接入类型－FULL：查看全信息，包含广告主维度；AFF：查看渠道offer信息，渠道接入都是AFF',
  `cr_limit` decimal(6,4) DEFAULT '0.0004' COMMENT '渠道cr监控最低阀值,低于这个阀值的offer一般都会列入该渠道的黑名单',
  `description` varchar(255) DEFAULT NULL COMMENT '一般描述信息',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;





'affiliate_setting' // 渠道cap设置
CREATE TABLE `affiliate_setting` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL COMMENT '渠道id',
  `source_id` int(11) DEFAULT NULL COMMENT '广告主id',
  `conversion_cap_daily` int(11) DEFAULT NULL COMMENT '每日的转化cap',
  `account_cap_daily` decimal(11,2) DEFAULT NULL COMMENT '每日的金额cap',
  `operator_id` int(11) DEFAULT NULL COMMENT '平台管理账号id',
  `description` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_affiliateId` (`affiliate_id`),
  KEY `idx_sourceId` (`source_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;





'affiliate_sync_setting' //渠道api同步offer主动添加过滤
CREATE TABLE `affiliate_sync_setting` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL COMMENT '渠道id',
  `operation` enum('AND','OR') NOT NULL DEFAULT 'AND' COMMENT '过滤条件类型',
  `regex_text` varchar(255) NOT NULL DEFAULT '' COMMENT '渠道拉取offer的过滤规则，如筛选地区等',
  `operator_id` int(11) NOT NULL COMMENT '平台管理账号id',
  `description` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_affiliateId` (`affiliate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COMMENT='渠道api接口拉取offer根据渠道特性主动设置过滤条件';





'blacklist_affiliate_offer' //永久对渠道屏蔽offer记录表
CREATE TABLE `blacklist_affiliate_offer` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) DEFAULT NULL COMMENT '渠道id',
  `offer_id` int(11) DEFAULT NULL COMMENT '单id',
  `tag` varchar(255) DEFAULT NULL COMMENT '记录标签，添加入黑名单的类型，如转化异常还是质量太差',
  `description` varchar(255) DEFAULT NULL COMMENT '详情描述',
  `operator_id` int(11) DEFAULT NULL COMMENT '平台管理账号id',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_offerId` (`offer_id`),
  KEY `idx_affiliateId` (`affiliate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COMMENT='渠道屏蔽offer的黑名单记录';





'blacklist_affiliate_source' // 永久对渠道屏蔽广告主记录表
CREATE TABLE `blacklist_affiliate_source` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) DEFAULT NULL COMMENT '渠道id',
  `source_id` int(11) DEFAULT NULL COMMENT '广告主id',
  `tag` varchar(255) DEFAULT NULL COMMENT '记录标签，添加入黑名单的类型，如转化异常还是质量太差',
  `desc` varchar(255) DEFAULT NULL,
  `operator_id` int(11) DEFAULT NULL COMMENT '平台管理账号id',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_affiliateId` (`affiliate_id`),
  KEY `idx_sourceId` (`source_id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COMMENT='渠道屏蔽广告主的黑名单记录';





'block_affiliate' //按日期对渠道屏蔽广告主记录表
CREATE TABLE `block_affiliate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `block_date` date DEFAULT NULL COMMENT '生效日期',
  `affiliate_id` int(11) NOT NULL COMMENT '渠道id',
  `source_id` int(11) DEFAULT NULL COMMENT '广告主id',
  `operator_id` int(11) DEFAULT NULL COMMENT '平台管理账号id',
  `description` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_sourceId` (`source_id`),
  KEY `idx_blockDate` (`block_date`),
  KEY `idx_affiliateId` (`affiliate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COMMENT='渠道屏蔽广告主记录表';


'block_source' //按日期对全渠道屏蔽广告主记录
CREATE TABLE `block_source` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `block_date` date NOT NULL COMMENT '生效日期',
  `source_id` int(11) NOT NULL COMMENT '广告主id',
  `operator_id` int(11) DEFAULT NULL COMMENT '平台管理账号id',
  `description` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='按日期对全渠道屏蔽广告主记录';




'log_ad_transaction' //这是transaction记录表
CREATE TABLE `log_ad_transaction` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `offer_id` int(11) DEFAULT NULL COMMENT '单id',
  `affiliate_id` int(11) DEFAULT NULL COMMENT '渠道id',
  `source_id` int(11) DEFAULT NULL COMMENT '广告主id',
  `ip` varchar(255) DEFAULT NULL COMMENT '点击ip',
  `country` varchar(7) DEFAULT NULL COMMENT '点击地区的国家',
  `currency` varchar(31) DEFAULT NULL COMMENT '货币类型',
  `payout` decimal(11,4) DEFAULT NULL COMMENT '支付单价',
  `revenue` decimal(11,4) DEFAULT NULL COMMENT '收入单价',
  `transaction_id` varchar(255) DEFAULT NULL COMMENT '平台点击的编号',
  `click_id` varchar(1023) DEFAULT NULL COMMENT '渠道的点击编号',
  `aff_sub` varchar(1023) DEFAULT NULL COMMENT '渠道自定义参数',
  `aff_sub2` varchar(1023) DEFAULT NULL COMMENT '渠道自定义参数',
  `aff_sub3` varchar(1023) DEFAULT NULL COMMENT '渠道自定义参数',
  `aff_sub4` varchar(1023) DEFAULT NULL COMMENT '渠道自定义参数',
  `aff_sub5` varchar(1023) DEFAULT NULL COMMENT '渠道自定义参数',
  `gaid` varchar(511) DEFAULT NULL COMMENT 'google advertising id',
  `android_id` varchar(511) DEFAULT NULL COMMENT 'android device id',
  `idfa` varchar(511) DEFAULT NULL COMMENT 'apple advertising id',
  `click_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_transId` (`transaction_id`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='点击信息记录表';





'log_postback_access' //接收回调记录表，目前已废弃




'log_postback_bill' //回调记录表
CREATE TABLE `log_postback_bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_url` varchar(1023) DEFAULT NULL COMMENT '广告主回调的url',
  `redirect_url` varchar(1023) DEFAULT NULL COMMENT '回调渠道的url',
  `transaction_id` varchar(255) NOT NULL DEFAULT '' COMMENT '平台点击编号',
  `source_id` int(11) DEFAULT NULL COMMENT '广告主id',
  `offer_id` int(11) DEFAULT NULL COMMENT '单id',
  `affiliate_id` int(11) DEFAULT NULL COMMENT '渠道id',
  `affiliate_sub` varchar(1023) DEFAULT NULL COMMENT '子渠道号',
  `ip` varchar(255) DEFAULT NULL COMMENT '转化成功ip',
  `country` varchar(7) DEFAULT NULL COMMENT '转化成功地区',
  `track_ip` varchar(255) DEFAULT NULL COMMENT '点击ip',
  `track_country` varchar(7) DEFAULT NULL COMMENT '点击地区',
  `payout_value` decimal(11,5) DEFAULT NULL COMMENT '实时回调的单价',
  `aff_payout_value` decimal(11,5) DEFAULT NULL COMMENT '渠道点击时的单价',
  `adjusted` int(11) DEFAULT NULL COMMENT '0:没被调量；1:被调量',
  `response_code` int(11) DEFAULT NULL COMMENT '回调渠道接收的http status',
  `response_msg` varchar(511) DEFAULT NULL COMMENT '回调渠道接受的文本信息',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `postback_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL COMMENT '最近更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidx_transId` (`transaction_id`),
  KEY `idx_offer_id` (`offer_id`),
  KEY `idx_affiliate_id` (`affiliate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='广告主回调成果记录表';




'offer'
CREATE TABLE `offer` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `prod_id` int(11) DEFAULT NULL COMMENT '产品编号，对应product',
  `prod` varchar(255) DEFAULT NULL COMMENT '产品标志，对应product',
  `status` varchar(15) DEFAULT NULL COMMENT '单的状态',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_prod` (`prod`(191))
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COMMENT='单信息表';





'offer_description' // sign_code主要用于api同步的offer，手动录入可空
CREATE TABLE `offer_description` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `offer_id` int(11) DEFAULT NULL COMMENT '单id',
  `name` varchar(255) DEFAULT NULL COMMENT '单名称',
  `category` varchar(255) DEFAULT NULL COMMENT '单类型',
  `category_secondary` varchar(255) DEFAULT NULL COMMENT '单的次要类型',
  `preview_link` text COMMENT '预览链接',
  `short_description` text COMMENT '短描述',
  `description` text COMMENT 'kpi等描述信息',
  `traffic_allowed` text COMMENT '接入流量说明',
  `traffic_forbidden` text COMMENT '非法流量说明',
  `conversion_flow` varchar(511) DEFAULT NULL COMMENT '单要求',
  `sign_code` varchar(255) DEFAULT NULL COMMENT '当前描述信息唯一标识，md5',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidx` (`offer_id`),
  KEY `idx_offerId` (`offer_id`),
  KEY `idx_signCode` (`sign_code`(191))
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COMMENT='offer描述信息表';





'offer_payout' // remaining_cap_daily // api同步，非实时同步，约5分钟更新一次
CREATE TABLE `offer_payout` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `offer_id` int(11) DEFAULT NULL COMMENT '单id',
  `currency` varchar(31) DEFAULT NULL COMMENT '货币类型',
  `payout_value` decimal(11,4) DEFAULT NULL COMMENT '支付渠道的单价',
  `revenue_value` decimal(11,4) DEFAULT NULL COMMENT '单收入',
  `cap_daily` int(11) DEFAULT NULL COMMENT 'api同步的当日的cap',
  `remaining_cap_daily` int(11) DEFAULT NULL COMMENT 'api同步的当日剩余cap',
  `cap_monthly` int(11) DEFAULT NULL,
  `remaining_cap_monthly` int(11) DEFAULT NULL,
  `sign_code` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  `payout_type` varchar(255) DEFAULT NULL COMMENT 'CPI OR CPA OR OTHER',
  PRIMARY KEY (`id`),
  KEY `idx_offerId` (`offer_id`),
  KEY `idx_signCode` (`sign_code`(191))
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COMMENT='offer支付类信息表';





'offer_setting' // countries //国家不符是不能正常跑
CREATE TABLE `offer_setting` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `offer_id` int(11) DEFAULT NULL COMMENT '单id',
  `platforms` varchar(511) DEFAULT NULL COMMENT '投放平台，多个用`号分隔',
  `countries` varchar(2045) DEFAULT NULL COMMENT '投放区域，多个用`号分隔',
  `download_type` varchar(31) DEFAULT NULL COMMENT 'market，如GP，ITUNES等',
  `gid_idfa_needs` enum('YES','NO') DEFAULT 'YES' COMMENT '是否需要设备信息',
  `redirect_count` int(11) DEFAULT NULL COMMENT '点击到下载的跳转次数',
  `whitelist_limited` enum('YES','NO') DEFAULT 'YES' COMMENT '是否开启白名单',
  `sign_code` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_offerId` (`offer_id`),
  KEY `idx_signCode` (`sign_code`(191))
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COMMENT='offer信息设置表';





'offer_source'
CREATE TABLE `offer_source` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `offer_id` int(11) NOT NULL COMMENT '单id',
  `source_id` int(11) NOT NULL COMMENT '广告主id',
  `source_offer_id` varchar(255) DEFAULT NULL COMMENT '广告主offer id',
  `tracking_link` varchar(511) DEFAULT NULL COMMENT '广告主tracking link',
  `sign_code` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_offerId` (`offer_id`),
  KEY `idx_signCode` (`sign_code`(191)),
  KEY `idx_sourceOfferId` (`source_offer_id`(191))
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COMMENT='广告主offer信息表';





'product'
CREATE TABLE `product` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `prod` varchar(127) DEFAULT NULL COMMENT '产品标志',
  `category` varchar(255) DEFAULT NULL COMMENT '产品类型',
  `source_id` int(11) DEFAULT NULL COMMENT '广告主id',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidx` (`prod`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4;





'product_creatives' //素材
CREATE TABLE `product_creatives` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `prod_id` int(11) DEFAULT NULL COMMENT '产品id',
  `source_id` int(11) DEFAULT NULL COMMENT '广告主id',
  `pixel` varchar(31) DEFAULT NULL COMMENT '分辨率',
  `url` varchar(1023) DEFAULT NULL COMMENT '广告主物料url',
  `res_url` varchar(1023) DEFAULT NULL COMMENT '平台物料url',
  `language` varchar(31) DEFAULT NULL COMMENT '描述语言',
  `countries` varchar(1023) DEFAULT NULL COMMENT '相关国家',
  `sign_code` varchar(60) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidx` (`sign_code`),
  KEY `idx_proId` (`prod_id`),
  KEY `idx_createTime` (`create_time`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COMMENT='产品物料信息表';





'product_description'
CREATE TABLE `product_description` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `prod_id` int(11) DEFAULT NULL COMMENT '产品id',
  `name` varchar(255) DEFAULT NULL COMMENT '产品名称',
  `preview_link` text COMMENT '预览链接',
  `short_description` text COMMENT '短描述',
  `description` text COMMENT '产品长描述',
  `sign_code` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_prod` (`prod_id`),
  KEY `idx_signCode` (`sign_code`(191))
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COMMENT='产品描述信息表';




'product_icons'
CREATE TABLE `product_icons` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `prod_id` int(11) DEFAULT NULL COMMENT '产品id',
  `source_id` int(11) DEFAULT NULL COMMENT '广告主id',
  `pixel` varchar(31) DEFAULT NULL COMMENT '分辨率',
  `url` varchar(1023) DEFAULT NULL COMMENT '广告主图片url',
  `res_url` varchar(1023) DEFAULT NULL COMMENT '平台图片url',
  `language` varchar(31) DEFAULT NULL,
  `countries` varchar(1023) DEFAULT NULL,
  `sign_code` varchar(60) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidx` (`sign_code`),
  KEY `idx_proId` (`prod_id`),
  KEY `idx_createTime` (`create_time`),
  KEY `idx_updateTime` (`update_time`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COMMENT='产品图片信息表';





'setting_affiliate_offer_payout' //对渠道单独设某个offer的单价及cap
CREATE TABLE `setting_affiliate_offer_payout` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) DEFAULT NULL COMMENT '渠道id',
  `offer_id` int(11) DEFAULT NULL COMMENT '单id',
  `payout_value` decimal(11,4) DEFAULT NULL COMMENT '设定单价',
  `daily_cap` int(11) DEFAULT NULL COMMENT '设定每日cap',
  `operator_id` int(11) DEFAULT NULL COMMENT '平台管理账号id',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_affiliateId` (`affiliate_id`),
  KEY `idx_offerId` (`offer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='渠道单价或cap调整设置';





'setting_affiliate_offer_payout_pecent' // 对渠道全部offer按比例算单价
CREATE TABLE `setting_affiliate_offer_payout_pecent` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) DEFAULT NULL COMMENT '渠道id',
  `pecent` decimal(11,4) DEFAULT NULL COMMENT '调价百分比，如1.2为1.2倍',
  `operator_id` int(11) DEFAULT NULL COMMENT '平台管理账号id',
  `description` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_affiliateId` (`affiliate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COMMENT='渠道单价百分比调整设置';





'setting_postback_adjust_rate' // 扣量表
CREATE TABLE `setting_postback_adjust_rate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `affiliate_sub` varchar(255) DEFAULT NULL COMMENT '子渠道',
  `affiliate_id` int(11) DEFAULT NULL COMMENT '渠道id',
  `offer_id` int(11) DEFAULT NULL COMMENT '单id',
  `source_id` int(11) DEFAULT NULL COMMENT '广告主id',
  `rate_weight` int(11) DEFAULT NULL COMMENT '优先级',
  `rate` decimal(11,4) DEFAULT NULL COMMENT '扣量概率。20表示20%',
  `operator_id` int(11) DEFAULT NULL COMMENT '平台管理账号id',
  `description` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COMMENT='postback调量概率，优先级排序是 affiliate_id > offer_id > source_id';





'setting_postbck_affiliate_adjust' // 扣量的开始基数
CREATE TABLE `setting_postbck_affiliate_adjust` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `operator` int(11) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COMMENT='设置渠道调量基数，没有对应渠道号，则选取默认值';





'setting_whitelist_offer_affiliate' //offer-affilate的白名单?不在白名单内的渠道不能跑这个offer?
CREATE TABLE `setting_whitelist_offer_affiliate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `offer_id` int(11) DEFAULT NULL COMMENT '单id',
  `affiliate_id` int(11) DEFAULT NULL COMMENT '渠道id',
  `operator_id` int(11) DEFAULT NULL COMMENT '后台管理账号id',
  `description` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_offerId` (`offer_id`),
  KEY `idx_affiliateId` (`affiliate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COMMENT='开放offer给渠道';




'setting_whitelist_source_affiliate' //上游-affilate的白名单?
CREATE TABLE `setting_whitelist_source_affiliate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `source_id` int(11) DEFAULT NULL COMMENT '广告主id',
  `affiliate_id` int(11) DEFAULT NULL COMMENT '渠道id',
  `operator_id` int(11) DEFAULT NULL COMMENT '平台管理账号id',
  `description` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_sourceId` (`source_id`),
  KEY `idx_affiliateId` (`affiliate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COMMENT='开放某广告主全部offer给渠道';





'source' //广告主
CREATE TABLE `source` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `company` varchar(255) DEFAULT NULL COMMENT '名称',
  `addr` varchar(1023) DEFAULT NULL,
  `sign_name` varchar(63) NOT NULL DEFAULT '' COMMENT '标志名',
  `enable` enum('ENABLE','DISABLE') NOT NULL DEFAULT 'ENABLE' COMMENT '是否有效，无效则offer关闭',
  `whitelist_limited` enum('YES','NO') NOT NULL DEFAULT 'NO' COMMENT '是否开启白名单保护',
  `weightiness` int(11) DEFAULT NULL COMMENT '权重',
  `description` varchar(1023) DEFAULT NULL,
  `traffic_status` enum('PRIVATE','PUBLIC') DEFAULT 'PUBLIC' COMMENT '是否屏蔽referrer',
  `sync_url` varchar(2047) DEFAULT NULL COMMENT '同步api url',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COMMENT='广告主信息表';





'source_setting'
CREATE TABLE `source_setting` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `source_id` int(11) NOT NULL COMMENT '广告主id',
  `account_cap_daily` decimal(11,4) DEFAULT NULL COMMENT '每日金额cap',
  `conversion_cap_daily` int(11) DEFAULT NULL COMMENT '每日转化数cap',
  `operator_id` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COMMENT='广告主设置';





'sys_account'
CREATE TABLE `sys_account` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uname` varchar(255) DEFAULT NULL COMMENT '账号名称',
  `passwd` varchar(255) DEFAULT NULL COMMENT '密码md5',
  `enable` enum('ENABLE','DISABLE') DEFAULT 'ENABLE' COMMENT '是否有效',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(31) DEFAULT NULL COMMENT '联系电话',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COMMENT='后台账号信息表';





'sys_account_rights'
CREATE TABLE `sys_account_rights` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(11) DEFAULT NULL COMMENT '账号id',
  `right_id` int(11) DEFAULT NULL COMMENT '权限ID，对应sys_rights',
  `available` enum('ENABLE','DISABLE') DEFAULT 'ENABLE' COMMENT '是否有效',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COMMENT='账号功能权限配置表';





'sys_account_role'
CREATE TABLE `sys_account_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL COMMENT '账号id',
  `role` enum('ADMIN','AFF','AFF_SUB','SOURCE','AFF_SUB_ADMIN') NOT NULL DEFAULT 'AFF' COMMENT '角色类型',
  `aff_subs` varchar(1023) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COMMENT='平台账号角色信息表';





'sys_operator_affiliate'
CREATE TABLE `sys_operator_affiliate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) DEFAULT NULL COMMENT '渠道id',
  `operator_id` int(11) DEFAULT NULL COMMENT '账号id',
  `operator_name` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COMMENT='管理账号对应渠道关系表';





'sys_operator_source' // 废弃





'sys_rights'
CREATE TABLE `sys_rights` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `main` varchar(255) DEFAULT NULL COMMENT '系统标签名称',
  `request_path` varchar(255) DEFAULT NULL COMMENT '子标签访问uri',
  `sub_name` varchar(255) DEFAULT NULL COMMENT '子标签名称',
  `weightness` int(11) DEFAULT NULL COMMENT '排序权重',
  `available` enum('ENABLE','DISABLE') DEFAULT 'ENABLE' COMMENT '是否有效',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COMMENT='后台权限信息表';





'whitelist_s2s'
CREATE TABLE `whitelist_s2s` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `source_id` int(11) DEFAULT NULL COMMENT '源（广告主ID）',
  `ip_start` varchar(15) DEFAULT NULL COMMENT '起始IP',
  `ip_end` varchar(15) DEFAULT NULL COMMENT '结束IP',
  `ip_start_num` bigint(20) DEFAULT NULL COMMENT '起始ip移位运算数',
  `ip_end_num` bigint(20) DEFAULT NULL COMMENT '结束ip移位运算数',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '最近更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COMMENT='广告主回调ip白名单过滤表';
