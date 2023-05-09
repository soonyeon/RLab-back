package kr.kh.RLab.vo;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PayDTO {
	String pa_order_id;
	String pa_me_id;
	Date pa_date;
	int pa_amount;
	String pa_order_name;
	int pa_point;
	int pa_used_point;
	ArrayList<ItemVO> itemList = new ArrayList<ItemVO>();
	
	public String getPa_date_str() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return format.format(pa_date);
	}
	
	public String getPa_date_str2() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd (HH시 mm분)");
		return format.format(pa_date);
	}
}
