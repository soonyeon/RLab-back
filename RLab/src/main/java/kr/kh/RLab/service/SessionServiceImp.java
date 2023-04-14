package kr.kh.RLab.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.RLab.dao.SessionDAO;
import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.SessionVO;

@Service
public class SessionServiceImp implements SessionService {

	@Autowired
	private SessionDAO sessionDAO;

	@Override
	public void login(SessionVO session) {
	    session.setSs_me_id(session.getMember().getMe_id()); // 로그인 시도하는 사용자의 ID를 설정
	    sessionDAO.insertSession(session);
	}

	@Override
	public void logout(SessionVO session) {
		session.setSs_out(LocalDateTime.now()); // 로그아웃 시간을 설정
	    sessionDAO.updateSession(session);
	}

}
