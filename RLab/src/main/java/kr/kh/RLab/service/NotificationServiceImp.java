package kr.kh.RLab.service;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import java.io.IOException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@Service
public class NotificationServiceImp implements NotificationService {

	// 사용자 ID를 키로 갖고 SseEmitter를 값으로 갖는 ConcurrentHashMap
	private final Map<String, SseEmitter> emitters = new ConcurrentHashMap<>();

	// 사용자를 등록하고 SseEmitter를 관리하는 메서드의 구현
	@Override
	public void registerUser(String userId, SseEmitter emitter) {
		emitters.put(userId, emitter);

		// SseEmitter가 완료되거나 시간이 초과되면 사용자를 제거
		emitter.onCompletion(() -> emitters.remove(userId));
		emitter.onTimeout(() -> emitter.complete());
	}

	// 사용자를 제거하는 메서드의 구현
	@Override
	public void removeUser(String userId) {
		emitters.remove(userId);
	}

	// 특정 사용자에게 알림을 보내는 메서드의 구현
	@Override
	public void sendNotificationToUser(String userId, String message) {
		SseEmitter emitter = emitters.get(userId);
		if (emitter != null) {
			try {
				emitter.send(SseEmitter.event().name("notification").data(message));
			} catch (IOException e) {
				throw new RuntimeException(e);
			}
		}
	}

}