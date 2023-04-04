package kr.kh.RLab.pagination;

import lombok.Data;

@Data
public class Criteria {
	// 현재 페이지
	private int page;
	// 한 페이지 당 컨텐츠 갯수
	private int perPageNum;
	//검색어
	private String search;
	//게시판 번호
	private int type;
	//지역
	private String region;
	
	private String tag;
	
	// Criteria 디폴트 생성자 : 현재 페이지를 1페이지로, 한 페이지에 10개의 컨텐츠
	public Criteria() {
		this.page = 1;
		this.perPageNum=10;
		this.search ="";
		this.type = 0; //초기값을 지정하지 않아도 초기값 0으로 처리됨. 
		this.region="";
		this.tag="";
	}

	/* 쿼리문에서 limit에 사용되는 인덱스를 계산하는 getter */
	public int getPageStart() {
		return (this.page -1) * perPageNum;
	}
}
