package kr.kh.RLab.vo;

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

}
