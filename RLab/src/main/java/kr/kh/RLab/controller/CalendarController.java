package kr.kh.RLab.controller;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.kh.RLab.service.CalendarService;
import kr.kh.RLab.service.StudyService;
import kr.kh.RLab.vo.CalendarVO;
import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("/calendar")
public class CalendarController {
	
	private final StudyService studyService;
	private final CalendarService calendarService;
	
	@PostMapping("/insert")
	public void insert(@RequestBody CalendarVO calendarVo) {
		calendarService.insert(calendarVo);
		
	}
	
	

}
