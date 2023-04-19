drop database if exists rlab;
create database if not exists rlab;

use rlab;

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
	`me_id`	varchar(13) primary key	NOT NULL,
	`me_name`	varchar(10)	NOT NULL,
	`me_pw`	varchar(255)	NOT NULL,
	`me_email`	varchar(30)	NOT NULL,
	`me_authority`	int not null default 0,
	`me_point`	int not null DEFAULT 0,
	`me_rest_time`	int	,
	`me_use_time`	int,
    `me_profile`	varchar(255),
    `me_study`	int,
    `me_session_id` varchar(45),
    `me_session_limit` date
);

DROP TABLE IF EXISTS `branch`;

CREATE TABLE `branch` (
	`br_num`	int auto_increment primary key	NOT NULL,
	`br_name`	VARCHAR(255) NOT NULL,
	`br_address`	VARCHAR(255),
	`br_road_address`	VARCHAR(255) NOT NULL,
	`br_tel`	VARCHAR(20) NOT NULL,
	`br_capacity`	INT NOT NULL,
	`br_re_name`	varchar(10)	NOT NULL,
    `br_img`	varchar(255)
);

DROP TABLE IF EXISTS `study_member`;

CREATE TABLE `study_member` (
	`sm_num`	int auto_increment primary key NOT NULL,
	`sm_st_num`	int NOT NULL,
	`sm_me_id`	varchar(13)	NOT NULL,
	`sm_authority`	int not null default 0,
    `sm_join_date` datetime not null
);

DROP TABLE IF EXISTS `calendar`;

CREATE TABLE `calendar` (
	`ca_num`	int auto_increment primary key	NOT NULL,
	`ca_st_num`	int	NOT NULL,
	`ca_title`	varchar(255) not null,
	`ca_start`	datetime not null,
	`ca_end`	datetime not null,
    `ca_all_day` tinyint default 0
);

DROP TABLE IF EXISTS `reservation`;

CREATE TABLE `reservation` (
	`re_num`	int auto_increment primary key	NOT NULL,
	`re_me_id`	varchar(13)	NOT NULL,
	`re_se_num`	int	NOT NULL,
	`re_start_time`	datetime not null DEFAULT NOW(),
	`re_valid_time`	datetime not null,
	`re_register_date`	datetime not null,
	`re_to_num`	int
);

DROP TABLE IF EXISTS `kind`;

CREATE TABLE `kind` (
	`ki_num`	int auto_increment primary key	NOT NULL,
	`ki_name`	varchar(5)	NULL
);

DROP TABLE IF EXISTS `gather`;

CREATE TABLE `gather` (
	`ga_num`	int auto_increment primary key	NOT NULL,
	`ga_title`	varchar(10)	NOT NULL,
	`ga_content`	longtext NOT NULL,
	`ga_st_num`	int	NOT NULL,
	`ga_me_id`	varchar(13)	NOT NULL,
	`ga_views`	int not null default 0,
    `ga_reg_date`	datetime,
    `ga_upd_date`	datetime
);

DROP TABLE IF EXISTS `board`;

CREATE TABLE `board` (
	`bo_num`	int auto_increment primary key NOT NULL,
	`bo_st_num`	int	NOT NULL,
	`bo_title`	varchar(10)	NULL,
	`bo_content`	longtext NOT NULL,
	`bo_me_id`	varchar(13)	NOT NULL,
	`bo_views`	int  not null default 0,
    `bo_reg_date`	datetime,
    `bo_upd_date`	datetime
);

DROP TABLE IF EXISTS `todo`;

CREATE TABLE `todo` (
	`td_num`	int auto_increment primary key NOT NULL,
	`td_date`	date NOT NULL,
	`td_st_num`	int	NOT NULL,
	`td_me_id`	varchar(13)	NOT NULL,
	`td_content`	varchar(50)	NOT NULL,
	`td_finish`	int	NOT NULL DEFAULT 0
);

DROP TABLE IF EXISTS `scrap`;

CREATE TABLE `scrap` (
	`sc_num`	INT auto_increment primary key	NOT NULL,
	`sc_me_id`	varchar(13)	NOT NULL,
	`sc_bo_num`	int	NOT NULL,
	`sc_state`	tinyint(1)	NOT NULL
);

DROP TABLE IF EXISTS `mission`;

CREATE TABLE `mission` (
	`mi_num`	int auto_increment primary key	NOT NULL,
	`mi_content`	varchar(100) NOT NULL,
	`mi_date`	date NOT NULL,
	`mi_st_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `mission_finish`;

CREATE TABLE `mission_finish` (
	`mf_num`	int auto_increment primary key	NOT NULL,
	`mf_mi_num`	int	NOT NULL,
	`mf_me_id`	varchar(13)	NOT NULL
);

DROP TABLE IF EXISTS `tag`;

CREATE TABLE `tag` (
	`ta_name`	varchar(10)	primary key NOT NULL
);

DROP TABLE IF EXISTS `tag_register`;

CREATE TABLE `tag_register` (
	`tr_num`	int auto_increment	primary key NOT NULL,
	`tr_st_num`	int	NOT NULL,
	`tr_name`	varchar(10)	NOT NULL
);

DROP TABLE IF EXISTS `photo`;

CREATE TABLE `photo` (
	`ph_num`	int auto_increment primary key	NOT NULL,
	`ph_pt_num`	int	NOT NULL,
	`ph_me_id`	varchar(13)	NOT NULL,
	`ph_register_date`	datetime default now()	NULL,
	`ph_img`	varchar(255) NOT NULL,
	`ph_content`	varchar(500),
	`ph_st_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `photo_type`;

CREATE TABLE `photo_type` (
	`pt_num`	int auto_increment primary key	NOT NULL,
	`pt_name`	varchar(5)
);

DROP TABLE IF EXISTS `alram`;

CREATE TABLE `alram` (
	`al_num`	int auto_increment primary key	NOT NULL,
	`al_me_id`	varchar(13) NOT NULL,
	`al_content`	varchar(255) not null,
	`al_view`	TINYINT(1) NOT NULL DEFAULT 0
);

DROP TABLE IF EXISTS `pay`;

CREATE TABLE `pay` (
	`pa_order_id`	varchar(27) primary key	NOT NULL,
	`pa_me_id`	varchar(13)	NOT NULL,
    `pa_order_name` varchar(50) not null,
	`pa_date`	datetime NOT NULL default NOW(),
	`pa_amount`	int	NOT NULL,
	`pa_point`	int	NOT NULL,
	`pa_used_point`	int	NULL
);

DROP TABLE IF EXISTS `ticket`;

CREATE TABLE `ticket` (
	`ti_num`	int auto_increment primary key	NOT NULL,
	`ti_tt_num`	int	NOT NULL,
	`ti_name`	varchar(20)	NOT NULL,
	`ti_period`	int not NULL,
	`ti_price`	int	NULL
);

DROP TABLE IF EXISTS `file`;

CREATE TABLE `file` (
	`fi_num`	int auto_increment primary key	NOT NULL,
	`fi_ori_name`	varchar(50)	not NULL,
	`fi_name`	varchar(255) not NULL,
	`fi_table`	varchar(15)	NOT NULL,
	`fi_ex_num`	int
);

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
	`co_num`	int auto_increment primary key	NOT NULL,
	`co_me_id`	varchar(13)	NOT NULL,
	`co_content`	varchar(500) NOT NULL,
    `co_reg_date` datetime not null,
	`co_ori_num`	int	NOT NULL,
	`co_table`	varchar(15)	NULL,
	`co_ex_num`	int	NOT NULL,
    `co_delete` char(1) not null default 'N'
);

DROP TABLE IF EXISTS `like`;

CREATE TABLE `like` (
	`li_num`	int auto_increment primary key	NOT NULL,
	`li_me_id`	varchar(13)	NOT NULL,
	`li_ph_num`	int	NOT NULL,
	`li_state`	int	NOT NULL DEFAULT 1
);

DROP TABLE IF EXISTS `pet`;

CREATE TABLE `pet` (
	`pe_num`	int auto_increment primary key	NOT NULL,
	`pe_name`	VARCHAR(255) NOT NULL,
	`pe_final_level`	int	NOT NULL,
	`pe_prize`	VARCHAR(255)
);

DROP TABLE IF EXISTS `growth`;

CREATE TABLE `growth` (
	`gr_num`	int auto_increment primary key	NOT NULL,
	`gr_me_id`	varchar(13)	NOT NULL,
	`gr_pe_num`	int	NOT NULL,
	`gr_level`	int not null default 1,
	`gr_exp`	int not null default 0,
	`gr_ev_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `evolution`;

CREATE TABLE `evolution` (
	`ev_num`	int auto_increment primary key	NOT NULL,
	`ev_pe_num`	int	NOT NULL,
	`ev_level`	int	NOT NULL,
	`ev_step`	int not NULL,
	`ev_img`	varchar(255) not NULL
);

DROP TABLE IF EXISTS `temporary`;

CREATE TABLE `temporary` (
	`te_num`	int(10) auto_increment primary key	NOT NULL,
	`te_title`	varchar(10)	NULL,
	`te_content`	longtext	NULL,
	`te_me_id`	varchar(13)	NOT NULL,
	`te_st_num`	int	NOT NULL,
	`te_table`	varchar(15)	NULL
);

DROP TABLE IF EXISTS `seat`;

CREATE TABLE `seat` (
	`se_num`	int auto_increment primary key	NOT NULL,
	`se_br_num`	int	NOT NULL,
	`se_ki_num`	int	NOT NULL,
	`se_name`	varchar(15) not null,
    `se_usable`	int not null default 0
);

DROP TABLE IF EXISTS `ticket_own`;

CREATE TABLE `ticket_own` (
	`to_num`	int auto_increment primary key	NOT NULL,
	`to_me_id`	varchar(13)	NOT NULL,
	`to_ti_num`	int	NOT NULL,
	`to_pa_order_id`	varchar(27)	NOT NULL,
	`to_rest_time`	int,
	`to_valid_date`	datetime,
	`to_state`	tinyint(1) not null default 1
);

DROP TABLE IF EXISTS `want`;

CREATE TABLE `want` (
	`wa_num`	int auto_increment primary key	NOT NULL,
	`wa_me_id`	varchar(13)	NOT NULL,
	`wa_ga_num`	int	NOT NULL,
    `wa_state` tinyint(1)
);

DROP TABLE IF EXISTS `session`;

CREATE TABLE `session` (
	`ss_num`	int auto_increment primary key	NOT NULL,
	`ss_me_id`	varchar(13)	NOT NULL,
	`ss_in`	datetime NOT NULL,
	`ss_out`	datetime DEFAULT NULL
);

DROP TABLE IF EXISTS `region`;

CREATE TABLE `region` (
	`re_name`	varchar(10) primary key	NOT NULL
);

DROP TABLE IF EXISTS `ticket_type`;

CREATE TABLE `ticket_type` (
	`tt_num`	int auto_increment primary key	NOT NULL,
	`tt_name`	varchar(10) NOT	NULL
);

DROP TABLE IF EXISTS `pay_detail`;

CREATE TABLE `pay_detail` (
	`pd_num`	int auto_increment primary key	NOT NULL,
	`pd_pa_order_id`	varchar(27)	NOT NULL,
	`pd_ti_num`	int	NOT NULL,
	`pd_amount`	int	NOT NULL,
	`pd_price`	int	NOT NULL,
	`pd_state`	varchar(10)	NOT NULL
);

DROP TABLE IF EXISTS `point`;

CREATE TABLE `point` (
	`po_num`	int auto_increment primary key	NOT NULL,
	`po_me_id`	varchar(13)	NOT NULL,
	`po_date`	datetime not null,
	`po_amount`	int	NOT NULL,
	`po_state`	tinyint(1) not null
);

DROP TABLE IF EXISTS `study`;

CREATE TABLE `study` (
	`st_num`	int auto_increment primary key	NOT NULL,
	`st_name`	varchar(10)	NOT NULL,
	`st_me_id`	varchar(13)	NOT NULL,
	`st_info`	varchar(100)	NULL,
	`st_now_people`	int(50)  not null default 1,
	`st_total_people`	int(50)  not null default 1,
	`st_re_name`	varchar(10),
	`st_image`	varchar(255),
    `st_state` int not null default 1
);

DROP TABLE IF EXISTS `exp`;

CREATE TABLE `exp` (
	`ex_level`	int NOT NULL,
	`ex_experience`	int NOT NULL
);

ALTER TABLE `branch` ADD CONSTRAINT `FK_region_TO_branch_1` FOREIGN KEY (
	`br_re_name`
)
REFERENCES `region` (
	`re_name`
);

ALTER TABLE `study_member` ADD CONSTRAINT `FK_study_TO_study_member_1` FOREIGN KEY (
	`sm_st_num`
)
REFERENCES `study` (
	`st_num`
);

ALTER TABLE `study_member` ADD CONSTRAINT `FK_member_TO_study_member_1` FOREIGN KEY (
	`sm_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `calendar` ADD CONSTRAINT `FK_study_TO_calendar_1` FOREIGN KEY (
	`ca_st_num`
)
REFERENCES `study` (
	`st_num`
);

ALTER TABLE `reservation` ADD CONSTRAINT `FK_member_TO_reservation_1` FOREIGN KEY (
	`re_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `reservation` ADD CONSTRAINT `FK_seat_TO_reservation_1` FOREIGN KEY (
	`re_se_num`
)
REFERENCES `seat` (
	`se_num`
);

ALTER TABLE `gather` ADD CONSTRAINT `FK_study_TO_gather_1` FOREIGN KEY (
	`ga_st_num`
)
REFERENCES `study` (
	`st_num`
);

ALTER TABLE `gather` ADD CONSTRAINT `FK_member_TO_gather_1` FOREIGN KEY (
	`ga_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `board` ADD CONSTRAINT `FK_study_TO_board_1` FOREIGN KEY (
	`bo_st_num`
)
REFERENCES `study` (
	`st_num`
);

ALTER TABLE `board` ADD CONSTRAINT `FK_member_TO_board_1` FOREIGN KEY (
	`bo_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `todo` ADD CONSTRAINT `FK_study_TO_todo_1` FOREIGN KEY (
	`td_st_num`
)
REFERENCES `study` (
	`st_num`
);

ALTER TABLE `todo` ADD CONSTRAINT `FK_member_TO_todo_1` FOREIGN KEY (
	`td_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `scrap` ADD CONSTRAINT `FK_member_TO_scrap_1` FOREIGN KEY (
	`sc_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `scrap` ADD CONSTRAINT `FK_board_TO_scrap_1` FOREIGN KEY (
	`sc_bo_num`
)
REFERENCES `board` (
	`bo_num`
);

ALTER TABLE `mission` ADD CONSTRAINT `FK_study_TO_mission_1` FOREIGN KEY (
	`mi_st_num`
)
REFERENCES `study` (
	`st_num`
);

ALTER TABLE `mission_finish` ADD CONSTRAINT `FK_mission_TO_mission_finish_1` FOREIGN KEY (
	`mf_mi_num`
)
REFERENCES `mission` (
	`mi_num`
);

ALTER TABLE `mission_finish` ADD CONSTRAINT `FK_member_TO_mission_finish_1` FOREIGN KEY (
	`mf_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `tag_register` ADD CONSTRAINT `FK_study_TO_tag_register_1` FOREIGN KEY (
	`tr_st_num`
)
REFERENCES `study` (
	`st_num`
);

ALTER TABLE `tag_register` ADD CONSTRAINT `FK_tag_TO_tag_register_1` FOREIGN KEY (
	`tr_name`
)
REFERENCES `tag` (
	`ta_name`
);

ALTER TABLE `photo` ADD CONSTRAINT `FK_photo_type_TO_photo_1` FOREIGN KEY (
	`ph_pt_num`
)
REFERENCES `photo_type` (
	`pt_num`
);

ALTER TABLE `photo` ADD CONSTRAINT `FK_member_TO_photo_1` FOREIGN KEY (
	`ph_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `photo` ADD CONSTRAINT `FK_study_TO_photo_1` FOREIGN KEY (
	`ph_st_num`
)
REFERENCES `study` (
	`st_num`
);

ALTER TABLE `alram` ADD CONSTRAINT `FK_member_TO_alram_1` FOREIGN KEY (
	`al_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `pay` ADD CONSTRAINT `FK_member_TO_pay_1` FOREIGN KEY (
	`pa_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `ticket` ADD CONSTRAINT `FK_ticket_type_TO_ticket_1` FOREIGN KEY (
	`ti_tt_num`
)
REFERENCES `ticket_type` (
	`tt_num`
);

ALTER TABLE `comment` ADD CONSTRAINT `FK_member_TO_comment_1` FOREIGN KEY (
	`co_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `like` ADD CONSTRAINT `FK_member_TO_like_1` FOREIGN KEY (
	`li_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `like` ADD CONSTRAINT `FK_photo_TO_like_1` FOREIGN KEY (
	`li_ph_num`
)
REFERENCES `photo` (
	`ph_num`
);

ALTER TABLE `growth` ADD CONSTRAINT `FK_member_TO_growth_1` FOREIGN KEY (
	`gr_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `growth` ADD CONSTRAINT `FK_pet_TO_growth_1` FOREIGN KEY (
	`gr_pe_num`
)
REFERENCES `pet` (
	`pe_num`
);

ALTER TABLE `growth` ADD CONSTRAINT `FK_evolution_TO_growth_1` FOREIGN KEY (
	`gr_ev_num`
)
REFERENCES `evolution` (
	`ev_num`
);

ALTER TABLE `evolution` ADD CONSTRAINT `FK_pet_TO_evolution_1` FOREIGN KEY (
	`ev_pe_num`
)
REFERENCES `pet` (
	`pe_num`
);

ALTER TABLE `temporary` ADD CONSTRAINT `FK_member_TO_temporary_1` FOREIGN KEY (
	`te_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `temporary` ADD CONSTRAINT `FK_study_TO_temporary_1` FOREIGN KEY (
	`te_st_num`
)
REFERENCES `study` (
	`st_num`
);

ALTER TABLE `seat` ADD CONSTRAINT `FK_branch_TO_seat_1` FOREIGN KEY (
	`se_br_num`
)
REFERENCES `branch` (
	`br_num`
);

ALTER TABLE `seat` ADD CONSTRAINT `FK_kind_TO_seat_1` FOREIGN KEY (
	`se_ki_num`
)
REFERENCES `kind` (
	`ki_num`
);

ALTER TABLE `ticket_own` ADD CONSTRAINT `FK_member_TO_ticket_own_1` FOREIGN KEY (
	`to_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `ticket_own` ADD CONSTRAINT `FK_ticket_TO_ticket_own_1` FOREIGN KEY (
	`to_ti_num`
)
REFERENCES `ticket` (
	`ti_num`
);

ALTER TABLE `ticket_own` ADD CONSTRAINT `FK_pay_TO_ticket_own_1` FOREIGN KEY (
	`to_pa_order_id`
)
REFERENCES `pay` (
	`pa_order_id`
);

ALTER TABLE `want` ADD CONSTRAINT `FK_member_TO_want_1` FOREIGN KEY (
	`wa_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `want` ADD CONSTRAINT `FK_gather_TO_want_1` FOREIGN KEY (
	`wa_ga_num`
)
REFERENCES `gather` (
	`ga_num`
);

ALTER TABLE `session` ADD CONSTRAINT `FK_member_TO_session_1` FOREIGN KEY (
	`ss_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `pay_detail` ADD CONSTRAINT `FK_pay_TO_pay_detail_1` FOREIGN KEY (
	`pd_pa_order_id`
)
REFERENCES `pay` (
	`pa_order_id`
);

ALTER TABLE `pay_detail` ADD CONSTRAINT `FK_ticket_TO_pay_detail_1` FOREIGN KEY (
	`pd_ti_num`
)
REFERENCES `ticket` (
	`ti_num`
);

ALTER TABLE `point` ADD CONSTRAINT `FK_member_TO_point_1` FOREIGN KEY (
	`po_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `study` ADD CONSTRAINT `FK_member_TO_study_1` FOREIGN KEY (
	`st_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `study` ADD CONSTRAINT `FK_region_TO_study_1` FOREIGN KEY (
	`st_re_name`
)
REFERENCES `region` (
	`re_name`
);

