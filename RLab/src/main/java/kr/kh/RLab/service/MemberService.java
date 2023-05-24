package kr.kh.RLab.service;

import kr.kh.RLab.vo.MemberVO;

public interface MemberService {

	boolean signup(MemberVO member);

	boolean checkId(MemberVO user);

	boolean checkName(MemberVO user);

	MemberVO login(MemberVO member);

	boolean checkPw(MemberVO pw, MemberVO user);

	boolean editUser(MemberVO member, MemberVO user);

	boolean editImg(MemberVO member, MemberVO user);
	
	void updateSession(MemberVO user);

	MemberVO getMemberBySession(String me_session_id);
	
	String findIDByEmail(String email);

	MemberVO findPWByEmail(String id, String email);

	String generateTempPW();

	void updatePW(MemberVO memberVO, String tempPW);
	
	int checkEmail(MemberVO user);

}
