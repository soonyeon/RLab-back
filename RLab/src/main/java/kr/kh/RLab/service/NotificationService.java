package kr.kh.RLab.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import kr.kh.RLab.vo.AlarmVO;

public interface NotificationService {
	
	void registerUser(String userId, SseEmitter emitter);

    void removeUser(String userId);

	void sendNotificationToUser(String userId, String message, String al_table);

    void addAlarm(AlarmVO alarm);

    List<AlarmVO> getUserAlrams(String userId);



}
