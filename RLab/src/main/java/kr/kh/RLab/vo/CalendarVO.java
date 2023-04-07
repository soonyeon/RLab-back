package kr.kh.RLab.vo;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CalendarVO {
	
	private int ca_num;
	private int ca_st_num;
	private String ca_title;
	private Date ca_start;
	private Date ca_end;
	private int ca_all_day;
	
	public String getCa_start() {
		SimpleDateFormat format = 
			new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return format.format(ca_start);
	}
	
	public String getCa_end() {
		SimpleDateFormat format = 
			new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if(ca_end == null) 
			return null;
		return format.format(ca_end);
	}

}
