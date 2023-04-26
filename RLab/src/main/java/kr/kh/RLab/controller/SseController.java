package kr.kh.RLab.controller;

import java.io.IOException;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import kr.kh.RLab.service.BoardService;
import kr.kh.RLab.service.StudyService;
import kr.kh.RLab.utils.SseEmitters;
import kr.kh.RLab.vo.BoardVO;
import kr.kh.RLab.vo.PhotoVO;

@RestController
public class SseController {

    private final SseEmitters sseEmitters;
    private static final Logger logger = LoggerFactory.getLogger(SseController.class);

    @Autowired
    private BoardService boardService;
    @Autowired
    private StudyService studyService;

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
            logger.error("Error sending connect event to user {}", id, e);
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
    
    @GetMapping(value = "/sse/new/comment/{bo_num}", produces = MediaType.TEXT_EVENT_STREAM_VALUE)//이벤트 형식의 응답을 함
    public ResponseEntity<SseEmitters> sseNewComment(@PathVariable("bo_num") int bo_num) {
		//1. 이 게시글에 관한 작성자를 가져옴
    	BoardVO board = boardService.getBoard(bo_num);
    	//2. 에미터 send 
    	sseEmitters.send("newComment", board, board.getBo_me_id());
    	//3.에미터 생성
    	
        //4. 새로운 댓글이 작성된 게시글의 정보를 받음
        return ResponseEntity.ok(sseEmitters);

    }
    
    @GetMapping(value = "/sse/new/photo/{ph_num}", produces = MediaType.TEXT_EVENT_STREAM_VALUE)//이벤트 형식의 응답을 함
    public ResponseEntity<SseEmitters> sseNewLike(@PathVariable("ph_num") int ph_num) {
    	PhotoVO photo = studyService.getPhotoByPhNum(ph_num);
    	sseEmitters.send("newLike", photo, photo.getPh_me_id());
    	
        return ResponseEntity.ok(sseEmitters);

    }
}