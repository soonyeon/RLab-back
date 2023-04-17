package kr.kh.RLab.controller;

import java.time.LocalDateTime;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.kh.RLab.service.MemberService;
import kr.kh.RLab.service.SessionService;
import kr.kh.RLab.service.StudyService;
import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.SessionVO;

@RestController
public class SessionController {
	@Autowired
	private SessionService sessionService;

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private StudyService studyService;

	@PostMapping("/login")
	public ModelAndView loginPost(ModelAndView mv, MemberVO member, HttpServletRequest request, HttpSession session) {
	    MemberVO user = memberService.login(member);
	    if (user != null) {
	        SessionVO sessionVO = new SessionVO();
	        sessionVO.setMember(user); // 로그인 사용자의 MemberVO 객체를 설정
	        sessionVO.setSs_in(LocalDateTime.now()); // 현재 시간을 설정
	        sessionService.login(sessionVO); // 로그인 사용자의 MemberVO 객체와 현재 시간을 전달
	        session.setAttribute("user", user);
	        user.setAutoLogin(member.isAutoLogin());
	        String prevUrl = request.getHeader("Referer"); // 이전 페이지 URL을 얻음
	        if (prevUrl != null && !prevUrl.isEmpty()) {
	            mv.setViewName("redirect:" + prevUrl);
	        } else {
	            mv.setViewName("redirect:/");
	        }
	    } else {
	        String msg = "아이디와 비밀번호가 일치하지 않습니다.";
	        String url = "/";
	        mv.addObject("msg", msg);
	        mv.addObject("url", url);
	        mv.setViewName("/common/message");
	    }
	    return mv;
	}

	@PostMapping("/logout")
	public ModelAndView logoutPost(ModelAndView mv, HttpSession session) {
	    if (session != null) {
	        MemberVO user = (MemberVO) session.getAttribute("user");
	        if (user != null) {
	            SessionVO sessionVO = new SessionVO();
	            sessionVO.setSs_me_id(user.getMe_id());
	            sessionVO.setSs_out(LocalDateTime.now()); // 로그아웃 시간 저장
	            sessionService.logout(sessionVO);
	            session.removeAttribute("user");
	            user.setMe_session_limit(null);
	            memberService.updateSession(user);
	        }
	    }
	    mv.setViewName("redirect:/");
	    return mv;
	}
	
	
	
}
