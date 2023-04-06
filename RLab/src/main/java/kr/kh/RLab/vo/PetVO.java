package kr.kh.RLab.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PetVO {
	String pe_name;
	String me_name;
	String me_pw;
	String me_email;
	String me_profile;
	int me_authority;
	int me_point;
	int me_rest_time;
	int me_use_time;
	


}
