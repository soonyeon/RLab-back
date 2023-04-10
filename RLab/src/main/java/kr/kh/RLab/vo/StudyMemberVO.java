package kr.kh.RLab.vo;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class StudyMemberVO {
	private int sm_num;
	private int sm_st_num;
	private String sm_me_id;
	private int sm_authority;
	private Date sm_join_date;

}
