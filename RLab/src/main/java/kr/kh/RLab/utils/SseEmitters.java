package kr.kh.RLab.utils;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.function.BiConsumer;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

@Component
/*
 * 서버에서 클라이언트로 이벤트를 전송하는 표준기술임 1. 이벤트 구성 : SeeEmitter.event() 메소드를 사용하여 이벤트 구성 할
 * 수 있음 2. 이벤트 전송 : SeeEmitter.send() 메소드를 사용하여 구성된 이벤트를 클라이언트에게 전송함 3. 타임아웃 및
 * 완료 처리
 * 
 */
public class SseEmitters {

	private final Map<String, UserSessionInfo> emitters = new ConcurrentHashMap<>();

	public void add(String id, SseEmitter emitter, LocalDateTime sessionExpiryTime) {
		UserSessionInfo userSessionInfo = new UserSessionInfo(emitter, sessionExpiryTime);
		this.emitters.put(id, userSessionInfo);

		emitter.onCompletion(() -> {
			this.emitters.remove(id);
		});

		emitter.onTimeout(() -> {
			emitter.complete();
		});
	}

	public void forEach(BiConsumer<? super String, ? super UserSessionInfo> action) {
		emitters.forEach(action);
	}

	public boolean isUserConnected(String id) {
		return emitters.containsKey(id);
	}

	// userId에 해당하는 UserSessionInfo 객체를 반환
	public UserSessionInfo get(String id) {
		return emitters.get(id);
	}

	// userId에 해당하는 유저에게 이벤트를 전송함
	public void sendNotification(String userId, String eventName, String message) {
		// userId에 해당하는 UserSessionInfo 객체를 가져옴
		UserSessionInfo userSessionInfo = get(userId);

		// userSessionInfo가 존재하는 경우에만 이벤트를 전송
		if (userSessionInfo != null) {
			try {
				// userSessionInfo에서 SseEmitter 객체를 가져와서 이벤트를 전송
				userSessionInfo.getEmitter().send(SseEmitter.event().name(eventName) // 이벤트 이름을 설정
						.data(message)); // 이벤트 데이터를 설정
			} catch (IOException e) {
				throw new RuntimeException(e);
			}
		}
	}

	public static class UserSessionInfo {
		private final SseEmitter emitter;
		private final LocalDateTime sessionExpiryTime;

		public UserSessionInfo(SseEmitter emitter, LocalDateTime sessionExpiryTime) {
			this.emitter = emitter;
			this.sessionExpiryTime = sessionExpiryTime;
		}

		public SseEmitter getEmitter() {
			return emitter;
		}

		public LocalDateTime getSessionExpiryTime() {
			return sessionExpiryTime;
		}

		public LocalDateTime getLastActivity() {
			return sessionExpiryTime;
		}
	}

	public void count() {
		long count = emitters.size();
		emitters.forEach((id, userSessionInfo) -> {
			try {
				userSessionInfo.getEmitter().send(SseEmitter.event().name("count").data(count));
			} catch (IOException e) {
				throw new RuntimeException(e);
			}
		});
	}
}