package kr.kh.RLab.controller;

import java.util.ArrayList;
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

import kr.kh.RLab.service.ReservationService;
import kr.kh.RLab.vo.BranchVO;
import kr.kh.RLab.vo.MemberVO;

@Controller
public class ReservationController {
	@Autowired
	ReservationService reservationService;
	
	@RequestMapping(value = "/reservation/ticket/buy", method=RequestMethod.GET) 
	public ModelAndView ticketBuy(ModelAndView mv, HttpSession session) {
//		MemberVO user = session.getAttribute("user");
		MemberVO user = new MemberVO("qwe123","닉넴","qwe123123","kimsyty@naver.com",1,0);  
		//어떤 유저가 있다고 가정했을 때
		int point = reservationService.getUserPoint(user.getMe_id());
		mv.addObject("point", point);
		mv.setViewName("/reservation/buy");
		return mv;
	}
	@RequestMapping(value = "/reservation/ticket/buy", method=RequestMethod.POST) 
	public ModelAndView ticketBuyPost(ModelAndView mv) {
		MemberVO user = new MemberVO("qwe123","닉넴","qwe123123","kimsyty@naver.com",1,0);  
		//결제내역과 결제된 티켓정보들을 DTO로 받아서 DB에 반영하는 작업
		mv.setViewName("redirect:/reservation/buy");
		return mv;
	}
	@RequestMapping(value = "/reservation/book", method=RequestMethod.GET) 
	public ModelAndView book(ModelAndView mv) {

		mv.setViewName("/reservation/book");
		return mv;
	}
	@RequestMapping(value = "/reservation/1/spot", method=RequestMethod.GET) 
	public ModelAndView seatSpot(ModelAndView mv) {
		ArrayList<BranchVO> brList = reservationService.getAllBranchList();
		mv.addObject("brList", brList);
		mv.setViewName("/reservation/seat_spot");
		return mv;
	}
	@RequestMapping(value = "/reservation/1/spot", method=RequestMethod.POST) 
	public ModelAndView seatSpot(ModelAndView mv, BranchVO br) {
		ArrayList<BranchVO> brList = reservationService.searchBranchList(br);
		mv.addObject("keyword", br.getBr_name());
		mv.addObject("region", br.getBr_re_name());
		System.out.println(brList);
		mv.addObject("brList", brList);
		mv.setViewName("/reservation/seat_spot");
		return mv;
	}
}
