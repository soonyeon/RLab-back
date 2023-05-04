package kr.kh.RLab.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CommentVO {
	
	private int co_num;
	private String co_me_id;
	private String co_content;
	private int co_ori_num;
	private String co_table;
	private int co_ex_num;
	private Date co_reg_date;
	private char co_delete;

	private String me_name;
	private String me_profile;
	
	public String getCo_reg_date() {
		SimpleDateFormat format = 
			new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if(co_reg_date == null)
			return "";
		return format.format(co_reg_date);
	}

}
