package kr.kh.RLab.controller;

import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bootpay.Bootpay;
import kr.co.bootpay.model.request.Cancel;

@Controller
public class PayController {

	//토큰 발급 받기
	@RequestMapping(value = "/request/token", method=RequestMethod.POST) 
	public ModelAndView requestToken(ModelAndView mv) {
		try {
		    Bootpay bootpay = new Bootpay("642d26f2755e27001dad6270",
		    		"jPqzzyXRG5Qbpmy5Zgw8QKVx/KDTvIu1fTqoqZ5to78=");
		    HashMap res = bootpay.getAccessToken();
		    if(res.get("error_code") == null) { //success
		        System.out.println("goGetToken success: " + res);
		    } else {
		        System.out.println("goGetToken false: " + res);
		    }
		} catch (Exception e) {
		    e.printStackTrace();
		}
		return mv;
	}
	//결제 단건 조회: 보안상 클라이언트에서 수행된 결제는 서버간 통신으로 조회하여 정상적인 결제인지 검증해야함
	@RequestMapping(value = "/receipt/:id", method=RequestMethod.GET) 
	public void receiptId() {
		try {
		    Bootpay bootpay = new Bootpay("642d26f2755e27001dad6270", 
		    		"jPqzzyXRG5Qbpmy5Zgw8QKVx/KDTvIu1fTqoqZ5to78=");
		    HashMap<String, Object> token = bootpay.getAccessToken();
		    if(token.get("error_code") != null) { //failed
		        return;
		    }
		    String receiptId = "642d26f2755e27001dad6270"; 
		    HashMap<String, Object> res = bootpay.getReceipt(receiptId);
		    if(res.get("error_code") == null) { //success
		        System.out.println("confirm success: " + res);
		    } else {
		        System.out.println("confirm false: " + res);
		    }
		} catch (Exception e) {
		    e.printStackTrace();
		}
		return ;
	}
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
	}
}
