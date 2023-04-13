package kr.kh.RLab.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TicketOwnVO {
	int to_num;
	String to_me_id;
	int to_ti_num;
	String to_pa_order_id;
	int to_rest_time;
	Date to_valid_time;
	int to_state;
	
	String ti_name;
	String tt_name;
}
