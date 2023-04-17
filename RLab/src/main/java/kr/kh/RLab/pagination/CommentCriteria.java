package kr.kh.RLab.pagination;

import lombok.Data;

@Data
public class CommentCriteria extends Criteria{
	
	private int co_ex_num;
	
	public CommentCriteria() {
		super();
		this.co_ex_num = co_ex_num;
	}

}
