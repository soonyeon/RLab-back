package kr.kh.RLab.vo;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class GatherVO {
	int ga_num;
	String ga_title;
	String ga_content;
	int ga_st_num;
	String ga_me_id;
	int ga_views;
	Date ga_reg_date;
	Date ga_upd_date;
	
}