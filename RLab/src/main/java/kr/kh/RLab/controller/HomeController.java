package kr.kh.RLab.controller;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.kh.RLab.pagination.ReservationCriteria;
import kr.kh.RLab.service.ReservationService;
import kr.kh.RLab.vo.BranchVO;

@Controller
public class HomeController {
	
	@Autowired
	private ReservationService reservationService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(ModelAndView mv) {
		
	    ArrayList<BranchVO> spot = reservationService.getAllBranchListToMain();
		
	    mv.addObject("spot",spot);
	    System.out.println(spot);
		mv.setViewName("/main/home");
		return mv;
	}
	
	
}
