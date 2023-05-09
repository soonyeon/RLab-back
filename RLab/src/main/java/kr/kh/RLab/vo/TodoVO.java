package kr.kh.RLab.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TodoVO {
	
	
	private int td_num;
	private String td_date;
	private int td_st_num;
	private String td_me_id;
	private String td_content;
	private int td_finish;
	
	
	public void setTd_date(Date td_date) {
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		String strDate = transFormat.format(td_date);
		this.td_date = strDate;
	}
	

}