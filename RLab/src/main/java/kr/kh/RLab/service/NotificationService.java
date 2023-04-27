package kr.kh.RLab.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import kr.kh.RLab.vo.AlarmVO;
import kr.kh.RLab.vo.AlarmVO.AlarmType;

public interface NotificationService {
	
	void registerUser(String userId, SseEmitter emitter);

    void removeUser(String userId);

    void sendNotificationToUser(String userId, String message, AlarmType alarm_type);

    void addAlarm(AlarmVO alarm);

    List<AlarmVO> getUserAlrams(String userId);




}
