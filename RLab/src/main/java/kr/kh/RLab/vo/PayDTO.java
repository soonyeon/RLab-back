package kr.kh.RLab.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PayDTO {
	int pa_num;
	String pa_me_id;
	int pa_amount;
	String pa_order_name;
	int pa_point;
	int pa_used_point;
	ArrayList<ItemVO> itemList = new ArrayList<ItemVO>();
}
