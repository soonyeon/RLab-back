package kr.kh.RLab.pagination;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class ReservationCriteria extends Criteria{
	//지역 필터링
	private String region;

	public ReservationCriteria() {
		super();
		this.region = "";
	}
	
}
