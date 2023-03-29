package kr.kh.RLab.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class FileVO {
	
	
	int fi_num;
	String fi_ori_name;
	String fi_name;
	String fi_table;
	int fi_ex_num;
	
	public FileVO(String fi_ori_name, String fi_name, int fi_ex_num) {
		this.fi_ori_name = fi_ori_name;
		this.fi_name = fi_name;
		this.fi_ex_num = fi_ex_num;
	}


	
	
}
