package kr.kh.RLab.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.kh.RLab.service.MemberService;
import kr.kh.RLab.vo.MemberVO;



@Controller
public class HomeController {
	
	@Autowired
	MemberService memberService;


	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView login(ModelAndView mv) {
		mv.setViewName("/main/home");
		return mv;
	}
	
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView loginPost(ModelAndView mv, MemberVO member) {
		MemberVO user = memberService.login(member);
		mv.addObject("user",user);
		if(user != null) {
			mv.setViewName("redirect:/");			
			
		}else {
			mv.setViewName("redirect:/");
		}
//		System.out.println(user);
		return mv;
	}
	
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logoutPost(ModelAndView mv,HttpSession session) {
		if(session != null)
			session.removeAttribute("user");
		mv.setViewName("redirect:/");
		return mv;
	}
	
}
