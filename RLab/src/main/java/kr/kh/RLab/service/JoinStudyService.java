package kr.kh.RLab.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.StudyMemberVO;


public interface JoinStudyService {


	Map<String, Object> toggleJoin(StudyMemberVO studyMember,MemberVO member,HttpSession session);
	
	int getJoinCount(int st_num);

	//int selectJoinCount();



}
