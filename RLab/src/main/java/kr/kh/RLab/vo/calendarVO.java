package kr.kh.RLab.vo;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class calendarVO {
	
	private int ca_num;
	private int ca_st_num;
	private String ca_title;
	private LocalDateTime ca_start;
	private LocalDateTime ca_end;
	private int ca_all_day;

}
