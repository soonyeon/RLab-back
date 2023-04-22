package kr.kh.RLab.controller;

import java.io.IOException;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import kr.kh.RLab.utils.SseEmitters;
import kr.kh.RLab.vo.MemberVO;

@RestController
public class SseController {

	@Autowired
	private SseEmitters sseEmitters;

	@Autowired
	public SseController(SseEmitters sseEmitters) {
		this.sseEmitters = sseEmitters;
	}

	@GetMapping(value = "/connect", produces = MediaType.TEXT_EVENT_STREAM_VALUE)
	public ResponseEntity<SseEmitter> connect(@RequestParam String id) {
		SseEmitter emitter = new SseEmitter(60 * 1000L);
		LocalDateTime sessionExpiryTime = LocalDateTime.now().plusMinutes(30);
		sseEmitters.add(id, emitter, sessionExpiryTime);
		try {
			emitter.send(SseEmitter.event().name("connect").data("connected!"));
			sseEmitters.count();
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		return ResponseEntity.ok(emitter);
	}

	@GetMapping("/onlineMembers")
	public ResponseEntity<List<String>> getOnlineMembers() {
		List<String> onlineMembers = new ArrayList<>();
		sseEmitters.forEach((id, userSessionInfo) -> {
			// 현재 시간과 마지막 활동 시간을 비교하여 5분 이내의 활동이 있는 사용자를 온라인으로 간주함
			if (Duration.between(userSessionInfo.getLastActivity(), LocalDateTime.now()).toMinutes() <= 5) {
				onlineMembers.add(id);
			}
		});
		return ResponseEntity.ok(onlineMembers);
	}

	@PostMapping("/sendNotification")
	public ResponseEntity<Void> sendNotification(@RequestParam String userId, @RequestParam String eventName,
			@RequestParam String message) {
		sseEmitters.sendNotification(userId, eventName, message);
		return ResponseEntity.ok().build();
	}

	@GetMapping("/sse")
	public SseEmitter sse(HttpSession session) {
		SseEmitter emitter = new SseEmitter();
		MemberVO user = (MemberVO) session.getAttribute("user");
		String userId = user.getMe_id();
		LocalDateTime sessionExpiryTime = LocalDateTime.now().plusMinutes(30);
		sseEmitters.add(userId, emitter, sessionExpiryTime);
		return emitter;
	}

}