package kr.kh.RLab.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class GrowthVO {

	private int gr_num;
	private String gr_me_id;
	private int gr_pe_num;
	private int gr_level;
	private int gr_exp;
	private int gr_ev_num;

	private String pe_name; // 마이페이지에 펫 뿌려줄 때 필요
	private String pe_prize;
	private String ev_img ;
	private int ex_experience;
	private int ex_level;

}