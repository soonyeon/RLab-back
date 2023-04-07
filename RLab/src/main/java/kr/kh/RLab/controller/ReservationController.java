package kr.kh.RLab.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bootpay.Bootpay;
import kr.kh.RLab.service.ReservationService;
import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.PayDTO;

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
	@RequestMapping(value = "/reservation/buy", method=RequestMethod.POST) 
	public Map<String,Object> ticketBuyPost(@RequestBody PayDTO payDto) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		//결제내역과 결제된 티켓정보들을 DTO로 받아서 DB에 반영하는 작업
		if(reservationService.insertPayment(payDto)) {
			System.out.println("성공");
		}
		//mv.setViewName("/reservation/buy_complete");
		return map;
	}
	//결제 단건 조회: 보안상 클라이언트에서 수행된 결제는 서버간 통신으로 조회하여 정상적인 결제인지 검증해야함
	@RequestMapping(value = "/receipt/{receipt_id}", method=RequestMethod.GET) 
	public ModelAndView receiptId(ModelAndView mv, @PathVariable("receipt_id")String receiptId) {
		System.out.println(receiptId);
		try {
			//토큰 발급 받기
		    Bootpay bootpay = new Bootpay("642d26f2755e27001dad6273", 
		    		"jPqzzyXRG5Qbpmy5Zgw8QKVx/KDTvIu1fTqoqZ5to78=");
		    HashMap res = bootpay.getAccessToken();
		    if(res.get("error_code") == null) { //success
		        System.out.println("goGetToken success: " + res);
		    } else {
		        System.out.println("goGetToken false: " + res);
		    }
		    
		    //결제 단건 조회
		    HashMap<String, Object> token = bootpay.getAccessToken();
		    if(token.get("error_code") != null) { //failed
		    	System.out.println("토큰에러발생");
		    	System.out.println(token.get("error_code"));
		        return mv;
		    }
		    HashMap<String, Object> res2 = bootpay.getReceipt(receiptId);
		    if(res2.get("error_code") == null) { //success
		        System.out.println("confirm success: " + res2);
		        reservationService.setPaymentSuccessed(receiptId);
//		        reservationService.updatePay();
//		        reservationService.updatePayDetail();
//		        reservationService.insertTicketOwn();
		    } else {
		        System.out.println("confirm false: " + res2);
		    }
		} catch (Exception e) {
		    e.printStackTrace();
		}
		
		
		mv.setViewName("/reservation/buy_complete");
		return mv;
	}
}
