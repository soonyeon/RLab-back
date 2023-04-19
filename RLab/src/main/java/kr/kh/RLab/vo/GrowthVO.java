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
	private EvolutionVO evolutionVO; // 펫데려오기에서 데이터 한꺼번에 조회할 때 필요
	
	public EvolutionVO evolutionVO() {
		return evolutionVO;
	}
	

}
