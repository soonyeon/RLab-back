package kr.kh.RLab.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.kh.RLab.service.ReservationService;
import kr.kh.RLab.vo.MemberVO;

@Controller
public class ReservationController {
	@Autowired
	ReservationService reservationService;
	
	@RequestMapping(value = "/reservation/ticket/buy", method=RequestMethod.GET) 
	public ModelAndView ticketBuy(ModelAndView mv, HttpSession session) {
//		MemberVO user = session.getAttribute("user");
		MemberVO user = new MemberVO(); //어떤 유저가 있다고 가정했을 때
		int point = reservationService.getUserPoint(user.getMe_id());
		mv.setViewName("/reservation/buy");
		return mv;
	}
	

}
