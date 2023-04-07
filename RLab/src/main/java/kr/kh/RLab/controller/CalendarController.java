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
import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.StudyVO;
import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("/calendar")
public class CalendarController {
	
	private final StudyService studyService;
	private final CalendarService calendarService;
	
	@PostMapping
	public void insert(@RequestBody CalendarVO calendarVo,HttpSession session,Model model) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		StudyVO study = studyService.getStudyByMemberId(user.getMe_id());
		//ca_st_num 불러오기
		int ca_st_num = study.getSt_num();
		model.addAttribute("ca_st_num", ca_st_num);
		calendarService.insert(calendarVo,ca_st_num);
		
	}
	
	

}
