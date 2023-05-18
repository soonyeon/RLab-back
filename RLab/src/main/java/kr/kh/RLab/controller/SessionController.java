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
import kr.kh.RLab.utils.SseEmitters;
import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.SessionVO;

@RestController
public class SessionController {
	@Autowired
	private SessionService sessionService;

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private SseEmitters sseEmitters;

	@PostMapping("/login")
	public ModelAndView loginPost(ModelAndView mv, MemberVO member, HttpServletRequest request, HttpSession session) {
	    //입력받은 member정보로 로그인하고, 성공할 경우 해당 회원정보를 가져옴
		MemberVO user = memberService.login(member);
	    if (user != null) {
	        mv.addObject("user", user);
	        //접속자id, 접속시간, 유저정보(MemberVO)로 SessionVO생성
	        SessionVO sessionVO = new SessionVO(user.getMe_id(),LocalDateTime.now(),user); 
	        sessionService.login(sessionVO);
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
	        session.removeAttribute("emitter");
	        if (user != null) {
	            SessionVO sessionVO = new SessionVO();
	            sessionVO.setSs_me_id(user.getMe_id());
	            sessionVO.setSs_out(LocalDateTime.now()); // 로그아웃 시간 저장
	            sessionService.logout(sessionVO);
	            session.removeAttribute("user");
	            user.setMe_session_limit(null);
	            memberService.updateSession(user);
	            
	            // 로그아웃한 사용자를 SseEmitters에서 제거
	            sseEmitters.remove(user.getMe_id());
	        }
	    }
	    mv.setViewName("redirect:/");
	    return mv;
	}
	
	
	
	
}
