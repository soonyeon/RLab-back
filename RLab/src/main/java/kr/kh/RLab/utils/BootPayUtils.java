package kr.kh.RLab.utils;
import java.util.HashMap;

import kr.co.bootpay.Bootpay;

public class BootPayUtils {
	
	Bootpay bootpay = new Bootpay("5b8f6a4d396fa665fdc2b5ea", "rm6EYECr6aroQVG2ntW0A6LpWnkTgP4uQ3H18sDDUYw=");

	try {
	    HashMap<String, Object> res = bootpay.getAccessToken();
	    if(res.get("error_code") == null) { //success
	        System.out.println("goGetToken success: " + res);
	    } else {
	        System.out.println("goGetToken false: " + res);
	    }
	} catch (Exception e) {
	    e.printStackTrace();
	}
}
