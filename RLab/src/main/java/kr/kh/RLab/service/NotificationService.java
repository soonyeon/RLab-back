package kr.kh.RLab.service;

import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

public interface NotificationService {
	
	//유저를 등록하고 SseEmitter를 관리함
	void registerUser(String userId, SseEmitter emitter);
	
	//유저를 제거함
	void removeUser(String userId);
	
	//특정 유저에게 알림 보냄
	void sendNotificationToUser(String userId, String message);

}
