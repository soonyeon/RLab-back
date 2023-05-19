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
	
	/**
	 * @param wantVO : 찜 상태 찾기, 찜 등록
	 * @param member : 로그인된 유저id찾아오기 위해
	 */
	@Override
	public Map<String, Object> toggleWant(WantVO wantVO,MemberVO member) {
		//좋아요한적이 있는지 wantVO에서 찾는다
		WantVO isWant = wantDAO.findWant(wantVO);
		//좋아요 상태를 구분
		int newWantState;
		if(member == null) {
			newWantState=0;
		}
		else if(isWant == null) {
			wantVO.setWa_state(1);
			wantVO.setWa_me_id(member.getMe_id());
			//찾아온 찜 기록이 없으면 찜 추가
			wantDAO.insertScrap(wantVO);
			newWantState =1;
		} else {
			if(isWant.getWa_state() == 0) {
				isWant.setWa_state(1);
				//찜한 기록이 있는데 찜 상태가 0이면 1로 바꾸고 하트 변경
				newWantState =1;
			} else {
				//그렇지 않으면 찜 상태 0
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
