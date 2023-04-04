package kr.kh.RLab.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberVO {
	String me_id;
	String me_name;
	String me_pw;
	String me_email;
	String me_profile;
	int me_authority;
	int me_point;
	int me_rest_time;
	int me_use_time;
	
	public MemberVO(String me_id, String me_name, String me_pw, String me_email, String me_profile, int me_authority,
			int me_point) {
		this.me_id = me_id;
		this.me_name = me_name;
		this.me_pw = me_pw;
		this.me_profile = me_profile;
		this.me_email = me_email;
		this.me_authority = me_authority;
		this.me_point = me_point;
	}

}
