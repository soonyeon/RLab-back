package kr.kh.RLab.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MemberVO {
	
	private String me_id;
	private String me_name;
	private String me_pw;
	private String me_email;
	private int me_authority;
	private int me_point;
	private int me_rest_time;
	private int me_use_time;
	
	public MemberVO(String me_id, String me_name, String me_pw, String me_email, int me_authority,
			int me_point) {
		this.me_id = me_id;
		this.me_name = me_name;
		this.me_pw = me_pw;
		this.me_email = me_email;
		this.me_authority = me_authority;
		this.me_point = me_point;
	}
	
	

}