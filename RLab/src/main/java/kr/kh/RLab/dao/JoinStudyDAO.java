package kr.kh.RLab.dao;

import kr.kh.RLab.vo.StudyMemberVO;

public interface JoinStudyDAO {

	StudyMemberVO findJoinStudyMember(StudyMemberVO studyMember);

	void insertStudyMember(StudyMemberVO studyMember);

	void updateJoinStudyMember(StudyMemberVO isJoin);

	int getJoinCountByStudy(int st_num);



}
