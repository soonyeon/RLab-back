package kr.kh.RLab.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ItemVO {
	int pd_num;
	String pd_pa_order_id;
	String pd_ti_num;//id
	int pd_amount;//qty
	int pd_price;//price
	String pd_state;
	String ti_name;
}
