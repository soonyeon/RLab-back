package kr.kh.RLab.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class TemporaryVO {
	
	  private int te_num;
	  private String te_title;
	  private String te_content;
	  private String te_me_id;
	  private int te_st_num;
	  private String te_table; // 자유게시판 모임게시판

}
