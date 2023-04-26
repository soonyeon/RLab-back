package kr.kh.RLab.pagination;

import lombok.Data;
import lombok.EqualsAndHashCode;


@Data
@EqualsAndHashCode(callSuper=false)
public class NoticeCriteria extends Criteria {

	//게시판 타입번호
	private int type;
	
	public NoticeCriteria() {
		super();
		this.type = 0;
	}

}
