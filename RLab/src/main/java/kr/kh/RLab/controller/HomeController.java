package kr.kh.RLab.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.kh.RLab.service.MemberService;
import kr.kh.RLab.vo.MemberOKVO;
import kr.kh.RLab.vo.MemberVO;

@Controller
public class HomeController {
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value = "/")
	public ModelAndView home(ModelAndView mv) {
		mv.setViewName("/main/home");
		return mv;
	}
	
	@RequestMapping(value="/signup", method=RequestMethod.GET)
	public ModelAndView signup(ModelAndView mv) {
		mv.setViewName("/member/signup");
		return mv;
	}
	
	@RequestMapping(value = "/signup",method =RequestMethod.POST )
	public ModelAndView signupPost(ModelAndView mv , MemberVO member) {
		boolean isSignup = memberService.signup(member); //회원가입 성공했는지 물어보기	
		if(isSignup) {
			
			memberService.sendEmail(member.getMe_id());
			mv.setViewName("redirect:/");
		}else {
			mv.setViewName("redirect:/signup");
			return mv;
		}
		return mv;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/check/id", method=RequestMethod.POST)
	public Map<String, Object> checkId(@RequestBody MemberVO user) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		boolean res = memberService.checkId(user);
		map.put("res", res);
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/check/name", method=RequestMethod.POST)
	public Map<String, Object> nameCheck(@RequestBody MemberVO user) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		boolean res = memberService.checkName(user);
		map.put("res", res);
		return map;
	}
	
	

	
}
