package kr.kh.RLab.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class StudyMemberVO {
	
	private int sm_num;
	private int sm_st_num;
	private String sm_me_id;
	private int sm_authority;
	private Date sm_join_date;
	
	private String me_name;
	private String me_profile;
}
