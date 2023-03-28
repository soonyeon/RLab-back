package kr.kh.RLab.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.kh.RLab.service.GatherService;
import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.RegionVO;
import kr.kh.RLab.vo.StudyVO;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/gather")
public class GatherController {

	private final GatherService gatherService;

	@GetMapping("/insertstudy")
	public ModelAndView gatherInsert(ModelAndView mv,HttpServletRequest request) {
		MemberVO member = (MemberVO)request.getSession().getAttribute("user");
	    mv.setViewName("/gather/insertstudy");
	    return mv;
	}
	@PostMapping("/insertstudy")
	public ModelAndView gatherInsertPost(ModelAndView mv,StudyVO study,HttpServletRequest request,RegionVO region) {
		MemberVO member = (MemberVO)request.getSession().getAttribute("user");
		boolean res = gatherService.insertStudy(study,member,region);
		mv.setViewName("/gather/insertstudy");
		return mv;
	}
	
	
}