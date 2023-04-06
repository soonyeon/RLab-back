package kr.kh.RLab.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.kh.RLab.service.ReservationService;
import kr.kh.RLab.vo.MemberVO;

@Controller
public class ReservationController {
	@Autowired
	ReservationService reservationService;
	
	@RequestMapping(value = "/reservation/buy", method=RequestMethod.GET) 
	public ModelAndView ticketBuy(ModelAndView mv, HttpSession session) {
//		MemberVO user = session.getAttribute("user");
		MemberVO user = new MemberVO("qwe123","닉넴","qwe123123","kimsyty@naver.com",1,0);  
		//어떤 유저가 있다고 가정했을 때
		int point = reservationService.getUserPoint(user.getMe_id());
		mv.addObject("user", user);
		mv.addObject("point", point);
		mv.setViewName("/reservation/buy");
		return mv;
	}
	@ResponseBody
	@RequestMapping(value = "/reservation/buy/", method=RequestMethod.POST) 
	public ModelAndView ticketBuyPost(ModelAndView mv) {
		MemberVO user = new MemberVO("qwe123","닉넴","qwe123123","kimsyty@naver.com",1,0);  
		//결제내역과 결제된 티켓정보들을 DTO로 받아서 DB에 반영하는 작업
		mv.setViewName("/reservation/buy_complete");
		return mv;
	}
}
