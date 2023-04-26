package kr.kh.RLab.utils;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.function.BiConsumer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;


/*
 * 서버에서 클라이언트로 이벤트를 전송하는 표준기술임 1. 이벤트 구성 : SeeEmitter.event() 메소드를 사용하여 이벤트 구성 할
 * 수 있음 2. 이벤트 전송 : SeeEmitter.send() 메소드를 사용하여 구성된 이벤트를 클라이언트에게 전송함 3. 타임아웃 및
 * 완료 처리
 * 
 */
@Component
public class SseEmitters {
	private static final Logger logger = LoggerFactory.getLogger(SseEmitters.class);

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
	        if (userSessionInfo != null && userSessionInfo.getEmitter() != null) { // userSessionInfo와 emitter의 null 여부 확인
	            try {
	                userSessionInfo.getEmitter().send(SseEmitter.event().name("count").data(count));
	            } catch (IOException e) {
	                logger.error("Error sending count event to user {}", id, e);
	            }
	        }
	    });
	}
	public void add(SseEmitter emitter) {
	    if (emitter != null) {
	        UserSessionInfo userSessionInfo = new UserSessionInfo(emitter, LocalDateTime.now().plusMinutes(30));
	        this.emitters.put(emitter.toString(), userSessionInfo);

	        emitter.onCompletion(() -> {
	            this.emitters.remove(emitter.toString());
	        });

	        emitter.onTimeout(() -> {
	            emitter.complete();
	        });
	    }
	}

	public void remove(String id) {
	    if (id != null) {
	        this.emitters.remove(id);
	    }
	}
	public void send(String eventName, Object eventData, String targetId) {
	    emitters.forEach((id, userSessionInfo) -> {
	        if (id != null && userSessionInfo != null && userSessionInfo.getEmitter() != null) {
	            try {
	                if (id.equals(targetId)) {
	                    userSessionInfo.getEmitter().send(SseEmitter.event().name(eventName).data(eventData));
	                }
	            } catch (IOException e) {
	                logger.error("Error sending count event to user {}", id, e);
	            }
	        }
	    });
	}
}