package kr.kh.RLab.pagination;

import lombok.Data;

@Data
public class BoardCriteria extends Criteria{
	
	//정렬
	private String sort;

	public BoardCriteria(String sort) {
		super();
		this.sort = "";
	}
}
