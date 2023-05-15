package kr.kh.RLab.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class GatherVO {
	int ga_num;
	String ga_title;
	String ga_content;
	int ga_st_num;
	String ga_me_id;
	int ga_views;
	Date ga_reg_date;
	Date ga_upd_date;
	String me_name;
	int wa_state;
	
	public String getGa_reg_date_str() {
		SimpleDateFormat format = 
			new SimpleDateFormat("yyyy-MM-dd");
		return format.format(ga_reg_date);
	}
}