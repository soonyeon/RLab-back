package kr.kh.RLab.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TicketVO {
	int ti_num;
	int ti_tt_num;
	String ti_name;
	int ti_period;
	int ti_price;
}
