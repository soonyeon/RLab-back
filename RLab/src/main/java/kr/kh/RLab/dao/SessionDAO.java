package kr.kh.RLab.dao;

import java.util.List;

import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.SessionVO;

public interface SessionDAO {
	void insertSession(SessionVO session);

	void updateSession(SessionVO session);

	List<MemberVO> getOnlineMembers();
}
