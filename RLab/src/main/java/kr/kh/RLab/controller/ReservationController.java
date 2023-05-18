package kr.kh.RLab.controller;

import java.util.ArrayList;
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
import kr.kh.RLab.pagination.PageMaker;
import kr.kh.RLab.pagination.ReservationCriteria;
import kr.kh.RLab.service.ReservationService;
import kr.kh.RLab.vo.BranchVO;
import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.PayDTO;
import kr.kh.RLab.vo.ReservationVO;
import kr.kh.RLab.vo.SeatVO;
import kr.kh.RLab.vo.TicketOwnVO;

@Controller
public class ReservationController {
	@Autowired
	ReservationService reservationService;

	@RequestMapping(value = "/reservation", method=RequestMethod.GET) 
	public ModelAndView reservation(ModelAndView mv, HttpSession session) {
		mv.setViewName("/reservation/basic");
		return mv;
	}
	
	
	@RequestMapping(value = "/reservation/buy", method=RequestMethod.GET) 
	public ModelAndView ticketBuy(ModelAndView mv, HttpSession session) {
		MemberVO user = (MemberVO)session.getAttribute("user");
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
		return map;
	}
	//결제 단건 조회
	@RequestMapping(value = "/receipt/{receipt_id}", method=RequestMethod.GET) 
	public ModelAndView receiptId(ModelAndView mv, @PathVariable("receipt_id")String receiptId,
			HttpSession session) {
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
		    
		    //결제 단건 조회: 보안상 클라이언트에서 수행된 결제는 서버간 통신으로 조회하여 정상적인 결제인지 검증해야함
		    HashMap<String, Object> token = bootpay.getAccessToken();
		    if(token.get("error_code") != null) { //failed
		    	System.out.println("토큰에러발생");
		    	System.out.println(token.get("error_code"));
		    	mv.setViewName("redirect:/reservation/buy");
		        return mv;
		    }
		    //receipt_id로 진행된 결제 정보를 가져옴
		    HashMap<String, Object> res2 = bootpay.getReceipt(receiptId);
		    if(res2.get("error_code") == null) { //success 
		        System.out.println("confirm success: " + res2);
		        
		        MemberVO user = (MemberVO)session.getAttribute("user");
		        String paOrderId = (String)res2.get("order_id");
		        //사전데이터 결제상태pd_state 변경(결제중->결제완료)
		        reservationService.setPaymentSuccessed(paOrderId, user);
		        
		        //결제정보에 담긴 pa_order_id(pay의 기본키)로 해당 pay 정보를 가져와서 DB에 등록
		        PayDTO pay = reservationService.getPayDto(paOrderId);
		      //결제결과 출력용: 결제된 이용권들 나열한 문자열 생성
		        String itemStr = reservationService.getItemStrList(paOrderId);
		       
		        mv.addObject("pay", pay);
		        mv.addObject("itemStr", itemStr);
		        mv.setViewName("/reservation/buy_complete");
		    } else {
		        System.out.println("confirm false: " + res2);
		        System.out.println("결제에러발생");
		    }
		} catch (Exception e) {
		    e.printStackTrace();
		}
		return mv;
	}
	@ResponseBody
	@RequestMapping(value = "/cancel", method=RequestMethod.POST) 
	public HashMap<String,Object> ticketBuyPost(ModelAndView mv,@RequestBody PayDTO canceledData) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		//사전등록된 pay, pay_detail의 데이터 삭제
		reservationService.deleteCanceledPayment(canceledData.getPa_order_id());
		return map;
	}
	/*
	//결제 서버 승인
	@RequestMapping(value = "/confirm", method=RequestMethod.POST) 
	public void confirm() {
		try {
		    Bootpay bootpay = new Bootpay("5b8f6a4d396fa665fdc2b5ea", 
		    		"rm6EYECr6aroQVG2ntW0A6LpWnkTgP4uQ3H18sDDUYw=");
		    HashMap<String, Object> token = bootpay.getAccessToken();
		    if(token.get("error_code") != null) { //failed
		        return;
		    }
		    String receiptId = "642d26f2755e27001dad6270";
		    HashMap<String, Object> res = bootpay.confirm(receiptId);
		    if(res.get("error_code") == null) { //success
		        System.out.println("confirm success: " + res);
		    } else {
		        System.out.println("confirm false: " + res);
		    }
		} catch (Exception e) {
		    e.printStackTrace();
		}
	}
	//결제 취소
	@RequestMapping(value = "/cancle", method=RequestMethod.POST) 
	public void cancle() {
		try {
		    Bootpay bootpay = new Bootpay("5b8f6a4d396fa665fdc2b5ea", "rm6EYECr6aroQVG2ntW0A6LpWnkTgP4uQ3H18sDDUYw=");
		    HashMap<String, Object> token = bootpay.getAccessToken();
		    if(token.get("error_code") != null) { //failed
		        return;
		    }
		    Cancel cancel = new Cancel();
		    cancel.receiptId = "628b2206d01c7e00209b6087";
		    cancel.cancelUsername = "관리자";
		    cancel.cancelMessage = "테스트 결제";

		    HashMap<String, Object> res = bootpay.receiptCancel(cancel);
		    if(res.get("error_code") == null) { //success
		        System.out.println("receiptCancel success: " + res);
		    } else {
		        System.out.println("receiptCancel false: " + res);
		    }
		} catch (Exception e) {
		    e.printStackTrace();
		}
	}*/
	
	
	@RequestMapping(value = "/reservation/book", method=RequestMethod.GET) 
	public ModelAndView book(ModelAndView mv) {
		mv.setViewName("/reservation/book");
		return mv;
	}
	@RequestMapping(value = "/reservation/spot/1", method=RequestMethod.GET) 
	public ModelAndView seatSpot(ModelAndView mv, ReservationCriteria cri) {
		ArrayList<BranchVO> brList = reservationService.getAllBranchList(cri);
		int totalCount = reservationService.getBranchTotalCount(cri);
		PageMaker pm = new PageMaker(totalCount, 1, cri);
		mv.addObject("cri", cri);
		mv.addObject("brList", brList);
		mv.addObject("search", cri.getSearch());
		mv.addObject("pm", pm);
		mv.setViewName("/reservation/seat_spot");
		return mv;
	}
	@RequestMapping(value = "/reservation/1/{br_num}", method=RequestMethod.GET) 
	public ModelAndView seatDetail(ModelAndView mv, @PathVariable("br_num")int br_num, HttpSession session) {
		BranchVO br = reservationService.getBranchByBrNum(br_num);
		MemberVO user = (MemberVO)session.getAttribute("user");
		// 해당 지점의 실시간 좌석상태 불러옴
		ArrayList<SeatVO> seList = reservationService.getBranchSeat(br_num,1);
		//사용자가 가지고 있는 이용권(좌석) 리스트
		ArrayList<TicketOwnVO> toList = reservationService.getSeatTicketOwnListById(user.getMe_id());
		//내 이름으로 현재 사용중인 좌석 정보가 있는지 찾아옴
		ReservationVO myRsv = reservationService.getMyReservation(1, user.getMe_id());
		System.out.println("내 예약정보: "+myRsv);
		mv.addObject("br", br);
		mv.addObject("br_num", br_num);
		mv.addObject("toList", toList);
		mv.addObject("myRsv", myRsv);
		mv.addObject("seList", seList);
		mv.setViewName("/reservation/seat_select");
		return mv;
	}
	@ResponseBody
	@RequestMapping(value = "/reservation/1/{br_num}", method=RequestMethod.POST) 
	public int seatDetailPost(ModelAndView mv, @PathVariable("br_num")int br_num, @RequestBody TicketOwnVO to) {
		int restTime = reservationService.getRestTime(to.getTo_num());
		return restTime;
	}
	@RequestMapping(value = "/reservation/1/book", method=RequestMethod.POST) 
	public ModelAndView seatDetailPost(ModelAndView mv, HttpSession session, 
			ReservationVO book) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		book.setRe_me_id(user.getMe_id());
		reservationService.reserveSeat(book);
		//예약완료 페이지 출력을 위해  book의 정보들로 해당 예약의 re_num을 가져와서 넘겨줌 (redirect로 보낼 수 있음)
		int reNum = reservationService.getReservationByBookInfo(book).getRe_num();
		mv.addObject("reNum", reNum);
		mv.setViewName("redirect:/reservation/1/complete");
		return mv;
	}
	@RequestMapping(value = "/reservation/1/complete", method=RequestMethod.GET) 
	public ModelAndView seatDetail(ModelAndView mv, HttpSession session, int reNum) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		ReservationVO rsv = reservationService.getReservation(reNum);
		BranchVO br  = reservationService.getBranchBySeNum(rsv.getRe_se_num());
		String ticketName = reservationService.getTicketNameByBookInfo(rsv);
		int restTime = reservationService.getRestTime(rsv.getRe_to_num());
		mv.addObject("user", user);
		mv.addObject("rsv", rsv);
		mv.addObject("br", br);
		mv.addObject("ticketName",ticketName);
		mv.addObject("restTime",restTime);
		mv.setViewName("/reservation/seat_complete");
		return mv;
	}
	@RequestMapping(value = "/reservation/spot/2", method=RequestMethod.GET) 
	public ModelAndView cabinetSpot(ModelAndView mv, ReservationCriteria cri) {
		ArrayList<BranchVO> brList = reservationService.getAllBranchList(cri);
		int totalCount = reservationService.getBranchTotalCount(cri);
		PageMaker pm = new PageMaker(totalCount, 1, cri);
		mv.addObject("cri", cri);
		mv.addObject("brList", brList);
		mv.addObject("search", cri.getSearch());
		mv.addObject("pm", pm);
		mv.setViewName("/reservation/cabinet_spot");
		return mv;
	}@RequestMapping(value = "/reservation/2/{br_num}", method=RequestMethod.GET) 
	public ModelAndView cabinetDetail(ModelAndView mv, @PathVariable("br_num")int br_num,
			HttpSession session) {
		BranchVO br = reservationService.getBranchByBrNum(br_num);
		MemberVO user = (MemberVO)session.getAttribute("user");
		// 해당 지점의 실시간 좌석상태 불러옴
		ArrayList<SeatVO> seList = reservationService.getBranchSeat(br_num,2);
		//사용자가 가지고 있는 이용권(사물함) 리스트
		ArrayList<TicketOwnVO> toList = reservationService.getCabinetTicketOwnListById(user.getMe_id());
		//이미 등록된 예약정보가 있으면 예약 못하게 막아줘야함
		ReservationVO myRsv = reservationService.getMyReservation(2, user.getMe_id());
		System.out.println("myRsv: "+myRsv);
		mv.addObject("br", br);
		mv.addObject("br_num", br_num);
		mv.addObject("toList", toList);
		mv.addObject("myRsv", myRsv);
		mv.addObject("seList", seList);
		mv.setViewName("/reservation/cabinet_select");
		return mv;
	}
	@RequestMapping(value = "/reservation/2/book", method=RequestMethod.POST) 
	public ModelAndView cabinetDetailPost(ModelAndView mv,
			HttpSession session, ReservationVO book) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		book.setRe_me_id(user.getMe_id());
		reservationService.reserveCabinet(book);
		//예약 후 결과출력 창으로 정보 보내주려고 book의 정보들로 re_num 가져와서 redirect로 넘김
		int reNum = reservationService.getReservationByBookInfo(book).getRe_num();
		mv.addObject("reNum", reNum);
		mv.setViewName("redirect:/reservation/2/complete"); 
		return mv;
	}
	@RequestMapping(value = "/reservation/2/complete", method=RequestMethod.GET) 
	public ModelAndView cabinetDetail(ModelAndView mv, HttpSession session, int reNum) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		ReservationVO rsv = reservationService.getReservation(reNum);
		BranchVO br  = reservationService.getBranchBySeNum(rsv.getRe_se_num());
		String ticketName = reservationService.getTicketNameByBookInfo(rsv);
		mv.addObject("user", user);
		mv.addObject("rsv", rsv);
		mv.addObject("br", br);
		mv.addObject("ticketName",ticketName);
		mv.setViewName("/reservation/cabinet_complete");
		return mv;
	}
}
