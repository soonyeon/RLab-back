package kr.kh.RLab.pagination;

public class ReservationCriteria extends Criteria{
	//지역 필터링
	private String region;

	public ReservationCriteria(String region) {
		super();
		this.region = region;
	}
	
}
