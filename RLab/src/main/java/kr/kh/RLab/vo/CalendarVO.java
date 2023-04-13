package kr.kh.RLab.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import kr.kh.RLab.utils.CustomDateDeserializer;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CalendarVO {
	
	private int ca_num;
	private int ca_st_num;
	private String ca_title;
	@JsonDeserialize(using = CustomDateDeserializer.class)
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	private Date ca_start;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	@JsonDeserialize(using = CustomDateDeserializer.class)
	private Date ca_end;
	private int ca_all_day;
	
	public String getCa_start() {
		SimpleDateFormat format = 
			new SimpleDateFormat("yyyy-MM-dd HH:mm");
		return format.format(ca_start);
	}
	
	public String getCa_end() {
		SimpleDateFormat format = 
			new SimpleDateFormat("yyyy-MM-dd HH:mm");
		if(ca_end == null) 
			return null;
		return format.format(ca_end);
	}

}
