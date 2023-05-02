package kr.kh.RLab.dao;

import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.StudyMemberVO;

public interface JoinStudyDAO {

	StudyMemberVO findJoinStudyMember(StudyMemberVO studyMember);

	void insertStudyMember(StudyMemberVO studyMember);	

	int getJoinCountByStudy(int st_num);

	void updateNowPeople(int sm_st_num);

	int getJoinCount();

	void updateStudyNowPeopleUp(int sm_st_num);

	void deleteStudyMember(StudyMemberVO isJoin);

	void updateStudyNowPeopleDown(int sm_st_num);

	void updateStudyNumber(MemberVO member);



}
