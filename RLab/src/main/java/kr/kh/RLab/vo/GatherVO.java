package kr.kh.RLab.vo;

import java.text.SimpleDateFormat;
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
	
	public String getGa_reg_date_str() {
		SimpleDateFormat format = 
			new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return format.format(ga_reg_date);
	}
}