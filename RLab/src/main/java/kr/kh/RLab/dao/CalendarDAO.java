package kr.kh.RLab.dao;

import java.util.List;

import kr.kh.RLab.vo.CalendarVO;

public interface CalendarDAO {

	void insert(CalendarVO calendarVo);

	List<CalendarVO> findAll();
	
	CalendarVO findByCaNum(int ca_num);

	void update(int ca_num);

	void delete(int ca_num);

}
