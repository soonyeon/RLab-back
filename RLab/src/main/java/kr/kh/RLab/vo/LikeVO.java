package kr.kh.RLab.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class LikeVO {
	
	private int li_num;
	private String li_me_id;
	private int li_ph_num;
	private int li_state; // 0은 취소 1은 좋아요
	
	public LikeVO(String li_me_id, int li_ph_num, int li_state) {
		this.li_me_id = li_me_id;
		this.li_ph_num = li_ph_num;
		this.li_state = li_state;
	}
	
}
