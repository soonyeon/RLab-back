package kr.kh.RLab.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PointVO {

	int po_num;
	String po_me_id;
	Date po_date;
	int po_amount;
	int po_state;
	
	


}
