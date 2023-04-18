package kr.kh.RLab.service;

import java.util.Map;

import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.StudyMemberVO;


public interface JoinStudyService {


	Map<String, Object> toggleJoin(StudyMemberVO studyMember,MemberVO member);
	
	int getJoinCount(int st_num);

	int selectJoinCount();



}
