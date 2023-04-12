package kr.kh.RLab.dao;

import kr.kh.RLab.vo.StudyMemberVO;

public interface JoinStudyDAO {

	StudyMemberVO selectJoinStudyMember(StudyMemberVO studyMember);

	void insertStudyMember(StudyMemberVO studyMember);

	void updateJoinStudyMember(StudyMemberVO isJoin);

	int getJoinCountByStudy(int st_num);

	void updateNowPeople(int sm_st_num);

	int getJoinCount();

	void updateUnJoinStudyMember(StudyMemberVO isJoin);


}
