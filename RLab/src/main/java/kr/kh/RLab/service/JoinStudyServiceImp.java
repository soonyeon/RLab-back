package kr.kh.RLab.service;



import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.kh.RLab.dao.JoinStudyDAO;
import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.StudyMemberVO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class JoinStudyServiceImp implements JoinStudyService{
	private final JoinStudyDAO joinstudyDao;
	
	@Override
	public Map<String, Object> toggleJoin(StudyMemberVO studyMember,MemberVO member) {
		StudyMemberVO isJoin = joinstudyDao.findJoinStudyMember(studyMember);
		int newJoinState;
		if(member == null) {
			newJoinState=0;
		}
		if(isJoin == null) {
			studyMember.setSm_authority(1);
			studyMember.setSm_me_id(member.getMe_id());
			joinstudyDao.insertStudyMember(studyMember);
			newJoinState =1;
		} else {
			if(isJoin.getSm_authority() == 0) {
				isJoin.setSm_authority(1);
				newJoinState =1;
			} else {
				isJoin.setSm_authority(0);
				newJoinState = 0;
			}
			joinstudyDao.updateJoinStudyMember(isJoin);
		}
		
		// 게시글에 대한 현재 스크랩 개수를 가져옴
		int currentJoinCount = joinstudyDao.getJoinCountByStudy(studyMember.getSm_st_num());
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("joinState", newJoinState);
		return result;
	}

	@Override
	public int getJoinCount(int st_num) {
		return joinstudyDao.getJoinCountByStudy(st_num);
	}
	
	

}
