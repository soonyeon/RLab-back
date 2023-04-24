package kr.kh.RLab.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReservationVO {
	private int re_num;
	private String re_me_id;
	private int re_se_num;
	private int re_hours;
	private Date re_start_time;
	private Date re_valid_time;
	private Date re_register_date;
	private int re_to_num;
	
	private int br_num;
	private String se_name;
	
	public String getRe_start_time_str2() {
		SimpleDateFormat format = 
			new SimpleDateFormat("yy년 MM월 dd일 HH:mm:ss");
		if(re_start_time == null) 
			return "";
			return format.format(re_start_time);
	}
	
	public String getRe_valid_time_str2() {
		SimpleDateFormat format = 
			new SimpleDateFormat("yy년 MM월 dd일 HH:mm:ss");
		if(re_valid_time == null) 
			return "";
			return format.format(re_valid_time);
	}
	
	public String getRe_start_time_str3() {
		SimpleDateFormat format = 
			new SimpleDateFormat("yy년 MM월 dd일 HH:mm:ss");
		if(re_start_time == null) 
			return "";
			return format.format(re_start_time);
	}
	
	public String getRe_valid_time_str3() {
		SimpleDateFormat format = 
			new SimpleDateFormat("yy년 MM월 dd일 HH:mm:ss");
		if(re_valid_time == null) 
			return "";
			return format.format(re_valid_time);
	}
}
