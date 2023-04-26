package kr.kh.RLab.vo;

import java.sql.Date;
import java.text.SimpleDateFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MissionVO {
	private int mi_num;
	private String mi_content;
	private Date mi_date;
	private int mi_st_num;
	
	public String getMi_date_str() {
		SimpleDateFormat format = 
			new SimpleDateFormat("yyyy.MM.dd");
		if(mi_date == null) 
			return "";
			return format.format(mi_date);
	}
	

	
}
