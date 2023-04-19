package kr.kh.RLab.pagination;

import java.util.ArrayList;


import lombok.Data;


@Data
public class GatherCriteria extends Criteria {

	//지역
	private String region;
	//태그
	private String searchTag;
	//태그리스트
	private ArrayList<String> tagList = new ArrayList<String>();
	//onoff필터
	private String filter;
	
	public GatherCriteria() {
		super();
		this.region="";
		this.searchTag="";
		this.filter="";
	}
	
	public void sortCri() {
		for(int i = tagList.size()-1; i>=0; i--) {
			if(tagList.get(i) == null || tagList.get(i).trim().length() == 0)
				tagList.remove(i);
		}
	}

}
