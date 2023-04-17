package kr.kh.RLab.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReservationController {

	@RequestMapping(value = "/reservation/ticket/buy", method=RequestMethod.GET) 
	public ModelAndView ticketBuy(ModelAndView mv) {
		mv.setViewName("/reservation/buy");
		return mv;
	}
}
