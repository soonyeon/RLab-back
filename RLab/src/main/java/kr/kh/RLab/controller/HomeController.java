package kr.kh.RLab.controller;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@RequestMapping(value="/signup", method=RequestMethod.GET)
	public ModelAndView signup(ModelAndView mv) {
		mv.setViewName("/member/signup");
		return mv;
	}
	
	@RequestMapping(value = "/signup",method =RequestMethod.POST )
	public ModelAndView signupPost(ModelAndView mv , MemberVO member) {
		boolean isSignup = memberService.signup(member); 
		if(isSignup) {
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
	
	@RequestMapping(value="/mypage/pwcheck", method=RequestMethod.GET)
	public ModelAndView pwCheck(ModelAndView mv) {
		mv.setViewName("/mypage/pwcheck");
		return mv;
	}
	
	@RequestMapping(value="/mypage/pwcheck", method=RequestMethod.POST)
	public ModelAndView pwCheckPost(ModelAndView mv, MemberVO pw,
			HttpSession session) {
//		System.out.println(pw);
//		MemberVO user = (MemberVO)session.getAttribute("user");
		MemberVO user = new MemberVO("qwe123", "돌탕", "qwe123123", "kimsyty@naver.com", 1,0);
		boolean res = memberService.checkPw(pw, user);
		System.out.println(res);
		if(res) {
			mv.setViewName("redirect:/mypage/user");
		}
		mv.setViewName("redirect:/mypage/pwcheck");
		return mv;
	}
	
	

	@RequestMapping(value="/mypage/user", method=RequestMethod.GET)
	public ModelAndView editUser(ModelAndView mv) {
		mv.setViewName("/mypage/edit_user");
		return mv;
	}
	
	
}
