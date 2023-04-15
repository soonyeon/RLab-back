package kr.kh.RLab.service;

import java.util.List;

import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.SessionVO;

public interface SessionService {
	void login(SessionVO session);

	void logout(SessionVO session);
	
	List<MemberVO> getOnlineMembers();

}
