package kr.kh.RLab.pagination;

import lombok.Data;

@Data
public class ReservationCriteria extends Criteria{
	//지역 필터링
	private String region;

	public ReservationCriteria() {
		super();
		this.region = "";
	}
	
}
