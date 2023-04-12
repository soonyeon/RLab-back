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
		StudyMemberVO isJoin = joinstudyDao.findJoinStudyMember(studyMember);//select로 고치기
		int newJoinState;	    
	    if (isJoin == null) {
	        if (member == null) {
	            newJoinState = 0;
	        } else {
	            studyMember.setSm_authority(1);
	            studyMember.setSm_me_id(member.getMe_id());
	            joinstudyDao.insertStudyMember(studyMember);
	            // study st_now_people 증가
	            joinstudyDao.updateStudyNowPeopleUp(studyMember.getSm_st_num());
	            newJoinState = 1;
	        }
	    } else {
	        // 가입되어 있을 때 isJoin을 통해서 delete
	        joinstudyDao.deleteStudyMember(isJoin);
	        // study st_now_people 감소
	        joinstudyDao.updateStudyNowPeopleDown(studyMember.getSm_st_num());
	        newJoinState=0;
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

	@Override
	public int selectJoinCount() {
		return joinstudyDao.getJoinCount();
	}



	
	

}
