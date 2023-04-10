package kr.kh.RLab.service;

import java.util.List;

import kr.kh.RLab.vo.CalendarVO;

public interface CalendarService {
	//캘런더 등록
	void insert(CalendarVO calendarVo);
	
	List<CalendarVO> findAll();

	CalendarVO findCaNum(int ca_num);

}
