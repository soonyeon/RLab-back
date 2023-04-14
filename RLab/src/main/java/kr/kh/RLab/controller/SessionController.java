package kr.kh.RLab.controller;

import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.kh.RLab.service.MemberService;
import kr.kh.RLab.service.SessionService;
import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.SessionVO;

@RestController
public class SessionController {
	@Autowired
	private SessionService sessionService;

	@Autowired
	private MemberService memberService;

	@PostMapping("/login")
	public ModelAndView loginPost(ModelAndView mv, MemberVO member, HttpSession session) {
		MemberVO user = memberService.login(member);
		if (user != null) {
			SessionVO sessionVO = new SessionVO();
			sessionVO.setMember(user); // 로그인 사용자의 MemberVO 객체를 설정
			sessionVO.setSs_in(LocalDateTime.now()); // 현재 시간을 설정
			sessionService.login(sessionVO); // 로그인 사용자의 MemberVO 객체와 현재 시간을 전달
			session.setAttribute("user", user);
			mv.setViewName("redirect:/");
		} else {
			mv.addObject("msg", "로그인 실패");
			mv.setViewName("redirect:/login");
		}
		return mv;
	}

	@GetMapping("/logout")
	public ModelAndView logoutPost(ModelAndView mv, HttpSession session) {
		if (session != null) {
			MemberVO user = (MemberVO) session.getAttribute("user");
			if (user != null) {
				SessionVO sessionVO = new SessionVO();
				sessionVO.setSs_me_id(user.getMe_id());
				sessionVO.setSs_out(LocalDateTime.now());
				sessionService.logout(sessionVO);
				session.removeAttribute("user");
			}
		}
		mv.setViewName("redirect:/");
		return mv;
	}

}
