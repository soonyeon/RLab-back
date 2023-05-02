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
	public Map<String, Object> toggleJoin(StudyMemberVO studyMember, MemberVO member) {
	    if (member != null && member.getMe_study() != 0) {
	        // 이미 가입된 스터디가 있으면 메시지를 반환
	        Map<String, Object> result = new HashMap<>();
	        result.put("joinState", -1);
	        result.put("message", "이미 가입된 스터디가 있습니다.기존 스터디를 탈퇴하고 가입해주세요.");
	        return result;
	    }

	    StudyMemberVO isJoin = joinstudyDao.findJoinStudyMember(studyMember);
	    int newJoinState;
	    if (isJoin == null) {
	        if (member == null) {
	            newJoinState = 0;
	        } else {
	            studyMember.setSm_authority(1);
	            studyMember.setSm_me_id(member.getMe_id());
	            member.setMe_study(studyMember.getSm_st_num());
	            joinstudyDao.insertStudyMember(studyMember);
	            joinstudyDao.updateStudyNumber(member); //me_study 추가
	            // study st_now_people 증가
	            joinstudyDao.updateStudyNowPeopleUp(studyMember.getSm_st_num());
	            newJoinState = 1;
	        }
	    } else {
	        // 가입되어 있을 때 isJoin을 통해서 delete
	        joinstudyDao.deleteStudyMember(isJoin);
	        // study st_now_people 감소
	        joinstudyDao.updateStudyNowPeopleDown(studyMember.getSm_st_num());
	        newJoinState = 0;
	    }

	    // 게시글에 대한 현재 스크랩 개수를 가져옴
	    int currentJoinCount = joinstudyDao.getJoinCountByStudy(studyMember.getSm_st_num());

	    Map<String, Object> result = new HashMap<>();
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
