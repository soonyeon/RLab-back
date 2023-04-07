package kr.kh.RLab.service;

import kr.kh.RLab.vo.CalendarVO;

public interface CalendarService {
	//캘런더 등록
	void insert(CalendarVO calendarVo, int ca_st_num);

}
