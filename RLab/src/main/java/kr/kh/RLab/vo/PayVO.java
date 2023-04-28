package kr.kh.RLab.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PayVO {
	String pa_order_id;
	String pa_me_id;
	String pa_order_name;
	Date pa_date;
	int pa_amount;
	int pa_point;
	int pa_used_point;

}
