package kr.kh.RLab.service;



import java.util.HashMap;
import java.util.Map;

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
	         // SSE 알림 전송
	            StudyVO study = studyService.getStudy(studyMember.getSm_st_num());
	            sseEmitters.send("joinStudy", study, study.getSt_me_id());
	            AlarmVO alarm = new AlarmVO();
	            alarm.setAl_me_id(study.getSt_me_id());
	            alarm.setAl_content("스터디 가입 신청이 도착했습니다.");
	            alarm.setAl_view(0); // 확인되지 않은 알림으로 설정
	            alarm.setBo_title("스터디 가입"); // 게시물 제목 예시
	            alarm.setAl_type(AlarmType.STUDY); // 알림 유형 설정

	            notificationDao.createNotificationEvent(alarm);
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
