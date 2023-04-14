package kr.kh.RLab.service;

import kr.kh.RLab.vo.SessionVO;

public interface SessionService {
	void login(SessionVO session);

	void logout(SessionVO session);

}
