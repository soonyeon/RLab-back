package kr.kh.RLab.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ItemVO {
	String pd_ti_num;//id
	int pd_amount;//qty
	int pd_price;//price
	int pd_state;
}
