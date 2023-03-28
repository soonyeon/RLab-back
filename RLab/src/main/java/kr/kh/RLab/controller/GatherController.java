package kr.kh.RLab.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.kh.RLab.vo.GatherVO;
import kr.kh.RLab.vo.MemberVO;

@Controller
public class GatherController {
	

	@RequestMapping(value = "/gather/insertstudy", method=RequestMethod.GET)
	public ModelAndView makeStudy(ModelAndView mv) {
		
		mv.setViewName("/gather/insertstudy");
		return mv;
	}
}
