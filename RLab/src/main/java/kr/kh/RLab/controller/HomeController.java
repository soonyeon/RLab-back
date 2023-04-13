package kr.kh.RLab.controller;


import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.kh.RLab.service.BoardService;
import kr.kh.RLab.service.MemberService;
import kr.kh.RLab.vo.MemberVO;

@Controller
public class HomeController {
	
	@Autowired
	MemberService memberService;
	BoardService boardService;


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
	

	
	
	
	
/*	
	@RequestMapping(value="/mypage/edit_img", method=RequestMethod.GET)
	public ModelAndView editImg(ModelAndView mv) {
		mv.setViewName("/mypage/edit_img");
		return mv;
	}*/

	/*
	@RequestMapping(value="/mypage/user", method=RequestMethod.POST)
	public ModelAndView editImgPost(ModelAndView mv, MemberVO member, HttpSession session, MultipartFile file) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		String userId = user.getMe_id();
		member.setMe_id(user.getMe_id());
		String filePath = "D:/uploadFiles/profile/";
		String fileName = userId + "_" + file.getOriginalFilename();
		File dest = new File(filePath + fileName);
		member.setMe_profile("/" + fileName);
			try {
				file.transferTo(dest);
				boolean isEdited = memberService.editImg(member, user); 
				if(isEdited) {
					user.setMe_profile(member.getMe_profile());
					mv.setViewName("redirect:/mypage/pwcheck");
				}else {
					mv.setViewName("redirect:/mypage/edit_user");
				}
			} catch (IllegalStateException e) {
				e.printStackTrace();
				mv.setViewName("redirect:/");
			} catch (IOException e) {
				e.printStackTrace();
				mv.setViewName("redirect:/");
			}				
		return mv;
	}
	*/
	
	
}
