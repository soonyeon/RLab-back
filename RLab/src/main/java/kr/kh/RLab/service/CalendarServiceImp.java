package kr.kh.RLab.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.kh.RLab.dao.CalendarDAO;
import kr.kh.RLab.vo.CalendarVO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class CalendarServiceImp implements CalendarService{
	
	private final CalendarDAO calendarDao;

	@Override
	public void insert(CalendarVO calendarVo) {
		if(calendarVo == null) 
			return ;
		calendarDao.insert(calendarVo);
	}

	@Override
	public List<CalendarVO> findAll() {
		return calendarDao.findAll();
	}

	@Override
	public CalendarVO findCaNum(int ca_num) {
		return calendarDao.findByCaNum(ca_num);
	}

}
