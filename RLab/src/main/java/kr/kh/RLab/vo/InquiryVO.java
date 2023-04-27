package kr.kh.RLab.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class InquiryVO {
	private int in_num;
	private int in_it_num;
	private String in_title;
	private String in_me_id;
	private String in_content;	
	private Date in_reg_date;
	private int in_ori_num;
	
	public String getIn_reg_date_str() {
		SimpleDateFormat format = 
			new SimpleDateFormat("yyyy.MM.dd hh:mm");
		if(in_reg_date == null) 
			return "";
		return format.format(in_reg_date);
	}
}
