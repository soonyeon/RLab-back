package kr.kh.RLab.service;

import kr.kh.RLab.vo.MemberVO;

public interface MemberService {

	boolean signup(MemberVO member);

	boolean checkId(MemberVO user);

	boolean checkName(MemberVO user);

	boolean sendCheckMail(String me_id,String me_email);


}
