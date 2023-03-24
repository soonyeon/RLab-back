package kr.kh.RLab.vo;

import lombok.Data;

@Data
public class MemberVO {
	
	String me_id;
	String me_name;
	String me_pw;
	String me_phone;
	String me_email;
	int me_authority;
	int me_point;
	int me_rest_time;
	int me_use_time;
	
}
