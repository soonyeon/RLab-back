package kr.kh.RLab.utils;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.function.BiConsumer;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

@Component
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

	public void add(SseEmitter emitter) {
		UserSessionInfo userSessionInfo = new UserSessionInfo(emitter, LocalDateTime.now().plusMinutes(30));
		this.emitters.put(emitter.toString(), userSessionInfo);

		emitter.onCompletion(() -> {
			this.emitters.remove(emitter.toString());
		});

		emitter.onTimeout(() -> {
			emitter.complete();
		});
	}

	public void remove(SseEmitter emitter) {
		this.emitters.remove(emitter.toString());
	}
}