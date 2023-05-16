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
	public int insert(CalendarVO calendarVo) {
	    if (calendarVo == null) {
	        return -1;
	    }
	    System.out.println(calendarVo);
	    try {
	    	calendarDao.insert(calendarVo);
	    	
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
	    return calendarVo.getCa_num();
	}

	@Override
	public List<CalendarVO> findAll(int st_num) {
		return calendarDao.findAll(st_num);
	}

	@Override
	public CalendarVO findCaNum(int ca_num) {
		return calendarDao.findByCaNum(ca_num);
	}

	@Override
	public void update(CalendarVO calendarVo) {
	    if (calendarVo.getCa_num() == 0) {
	        return;
	    }
	    calendarDao.update(calendarVo);
	}

	@Override
	public void delete(int ca_num) {
		if(ca_num == 0)
			return ;
		calendarDao.delete(ca_num);
	}


}
