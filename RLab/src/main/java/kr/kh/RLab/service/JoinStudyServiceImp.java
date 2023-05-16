package kr.kh.RLab.service;



import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import kr.kh.RLab.dao.JoinStudyDAO;
import kr.kh.RLab.dao.NotificationDao;
import kr.kh.RLab.utils.SseEmitters;
import kr.kh.RLab.vo.AlarmVO;
import kr.kh.RLab.vo.AlarmVO.AlarmType;
import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.StudyMemberVO;
import kr.kh.RLab.vo.StudyVO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class JoinStudyServiceImp implements JoinStudyService{
	private final JoinStudyDAO joinstudyDao;
	private final SseEmitters sseEmitters;
	private final StudyService studyService;
	private final NotificationDao notificationDao;
	
	@Override
	public Map<String, Object> toggleJoin(StudyMemberVO studyMember, MemberVO member,
			HttpSession session) {

	    StudyMemberVO isJoin = joinstudyDao.findJoinStudyMember(studyMember);
	    int newJoinState;
	    if (isJoin == null) {
	        if (member == null) {
	            newJoinState = 0;
	        } else {
	            studyMember.setSm_authority(1);
	            studyMember.setSm_me_id(member.getMe_id());
	            joinstudyDao.insertStudyMember(studyMember);
	            if(member.getMe_study()==0) {
	            	member.setMe_study(studyMember.getSm_st_num());
	            	joinstudyDao.updateStudyNumber(member); //me_study 추가
	            }
	            // study st_now_people 증가
	            joinstudyDao.updateStudyNowPeopleUp(studyMember.getSm_st_num());
	            newJoinState = 1;
	         // SSE 알림 전송
	            StudyVO study = studyService.getStudy(studyMember.getSm_st_num());
	            sseEmitters.send("joinStudy", study, study.getSt_me_id(),session);
	            AlarmVO alarm = new AlarmVO(study.getSt_me_id(), "스터디 가입 신청이 도착했습니다.", 
	            		0, AlarmType.MEMBER, "study", studyMember.getSm_st_num());
	            notificationDao.createNotificationEvent(alarm);
	        }
	    } else {
	        // 가입되어 있을 때 isJoin을 통해서 delete
	        joinstudyDao.deleteStudyMember(isJoin);
	        // study st_now_people 감소
	        joinstudyDao.updateStudyNowPeopleDown(studyMember.getSm_st_num());
	        newJoinState = 0;
	    }

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
