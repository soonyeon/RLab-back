package kr.kh.RLab.dao;

import java.util.List;

import kr.kh.RLab.vo.AlarmVO;

public interface NotificationDao {
	// 알림 이벤트 생성
	void createNotificationEvent(AlarmVO alarm);

	// 사용자별 알림 이벤트 조회
	List<AlarmVO> getNotificationEventsByUserId(String userId);
}
