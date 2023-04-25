package kr.kh.RLab.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NoticeVO {
	private int no_num;
	private String no_title;
	private String no_me_id;
	private String no_content;
	private Date no_register_date;
	private int no_views;
	
	public String getNo_register_date_str() {
		SimpleDateFormat format = 
			new SimpleDateFormat("yyyy.MM.dd");
		if(no_register_date == null) 
			return "";
			return format.format(no_register_date);
	}
}
