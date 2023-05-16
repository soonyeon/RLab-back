package kr.kh.RLab.service;

import java.util.Map;

import kr.kh.RLab.vo.GatherVO;
import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.WantVO;

public interface WantService {

	
	Map<String, Object> toggleWant(WantVO wantVO,MemberVO member);

	int selectGaNumByStNum(int st_num);


}
