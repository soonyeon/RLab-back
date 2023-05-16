package kr.kh.RLab.service;



import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.kh.RLab.dao.WantDAO;

import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.WantVO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class WantServiceImp implements WantService{
	private final WantDAO wantDAO;
	
	@Override
	public Map<String, Object> toggleWant(WantVO wantVO,MemberVO member) {
		WantVO isWant = wantDAO.findWant(wantVO);
		int newWantState;
		if(member == null) {
			newWantState=0;
		}
		else if(isWant == null) {
			wantVO.setWa_state(1);
			wantVO.setWa_me_id(member.getMe_id());
			wantDAO.insertScrap(wantVO);
			newWantState =1;
		} else {
			if(isWant.getWa_state() == 0) {
				isWant.setWa_state(1);
				newWantState =1;
			} else {
				isWant.setWa_state(0);
				newWantState = 0;
			}
			wantDAO.updateWant(isWant);
		}
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("wantState", newWantState);
		return result;
	}


	@Override
	public int selectGaNumByStNum(int st_num) {
		return wantDAO.selectGaNumByStNum(st_num);
	}
	
}
