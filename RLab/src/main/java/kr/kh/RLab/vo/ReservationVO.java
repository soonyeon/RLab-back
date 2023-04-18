package kr.kh.RLab.vo;

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
	private Date re_start_time;
	private Date re_valid_time;
	private Date re_register_date;
	private int re_to_num;
	
	private int br_num;
	private String se_name;
	private int book_time;
}
