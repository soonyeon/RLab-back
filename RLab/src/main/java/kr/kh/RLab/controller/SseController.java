package kr.kh.RLab.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import kr.kh.RLab.service.BoardService;
import kr.kh.RLab.service.NotificationService;
import kr.kh.RLab.service.StudyService;
import kr.kh.RLab.utils.SseEmitters;
import kr.kh.RLab.vo.BoardVO;
import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.PhotoVO;
import kr.kh.RLab.vo.StudyMemberVO;
import kr.kh.RLab.vo.StudyVO;

@RestController
public class SseController {

    private final SseEmitters sseEmitters;
    private static final Logger logger = LoggerFactory.getLogger(SseController.class);

    @Autowired
    private BoardService boardService;
    @Autowired
    private StudyService studyService;
    @Autowired
    private NotificationService notificationService;

    @Autowired
    public SseController(SseEmitters sseEmitters) {
        this.sseEmitters = sseEmitters;
    }

    // 사용자가 연결되면, 해당 사용자에게 SseEmitter를 반환하고 사용자 ID와 함께 SseEmitters에 등록
    @GetMapping(value = "/connect", produces = MediaType.TEXT_EVENT_STREAM_VALUE)
    public ResponseEntity<SseEmitter> connect(@RequestParam String id, HttpSession session) {
    	if(session.getAttribute("emitter") != null) 
    		return ResponseEntity.ok(sseEmitters.getEmitter(id));
        SseEmitter emitter = new SseEmitter(60*30 * 1000L);
        LocalDateTime sessionExpiryTime = LocalDateTime.now().plusMinutes(30);
        Object isEmitter = session.getAttribute("emitter");
        if(isEmitter != null )
        	return ResponseEntity.ok(emitter);
        sseEmitters.add(id, emitter, sessionExpiryTime, session);
        
        try {
            //emitter.send(SseEmitter.event().name("connect").data("connected!"));
            sseEmitters.send("connect", /*id,*/ id,session);

        } catch (Exception e) {
            logger.error("Error sending connect event to user {}", id, e);
        }
        
        return ResponseEntity.ok(emitter);
    }
    // 온라인 사용자 목록을 반환
    @GetMapping(value = "/onlineMembers")
    public ResponseEntity<List<String>> getOnlineMembers() {
        List<String> onlineMembers = sseEmitters.getOnlineUserIds();
        return ResponseEntity.ok(onlineMembers);
    }
    // 새로운 댓글이 작성된 게시글에 대한 이벤트를 전송 게시글의 작성자에게 알림을 보냄
    @GetMapping(value = "/sse/new/comment", produces = MediaType.TEXT_EVENT_STREAM_VALUE)//이벤트 형식의 응답을 함
    public ResponseEntity<SseEmitters> sseNewComment(/*@PathVariable("bo_num") int bo_num*/String userId, HttpSession session) {
    	sseEmitters.send("newComment", userId, session);
		/*
    	//1. 이 게시글에 관한 작성자를 가져옴
    	BoardVO board = boardService.getBoard(bo_num);
    	//2. 에미터 send 
    	sseEmitters.send("newComment", board, board.getBo_me_id(),session);
    	//3.에미터 생성
    	
        //4. 새로운 댓글이 작성된 게시글의 정보를 받음
         */
        return ResponseEntity.ok(sseEmitters);
    }
// 하단 알림 보내는 부분
    // 새로운 좋아요가 눌린 사진에 대한 이벤트를 전송 사진의 작성자에게 알림을 보냄
    @GetMapping(value = "/sse/new/photo/{ph_num}", produces = MediaType.TEXT_EVENT_STREAM_VALUE)//이벤트 형식의 응답을 함
    public ResponseEntity<SseEmitters> sseNewLike(@PathVariable("ph_num") int ph_num, HttpSession session) {
    	PhotoVO photo = studyService.getPhotoByPhNum(ph_num);
    	sseEmitters.send("newLike", /*photo,*/ photo.getPh_me_id(),session);
    	
        return ResponseEntity.ok(sseEmitters);
    }
    
    @GetMapping(value = "/sse/join/study/{st_num}", produces = MediaType.TEXT_EVENT_STREAM_VALUE)
    public ResponseEntity<SseEmitters> sseJoinStudy(@PathVariable("st_num") int st_num, HttpSession session) {
    	StudyVO study = studyService.getStudy(st_num);
    	sseEmitters.send("joinStudy", /*study,*/ study.getSt_me_id(),session);
        return ResponseEntity.ok(sseEmitters);
    }
    
    
    @GetMapping(value = "/sse/leave/study/{st_num}", produces = MediaType.TEXT_EVENT_STREAM_VALUE)
    public ResponseEntity<SseEmitters> sseLeaveStudy(@PathVariable("st_num") int st_num, HttpSession session) {
    	StudyVO study = studyService.getStudy(st_num);
    	sseEmitters.send("leaveStudy", /*study,*/ study.getSt_me_id(),session);
        return ResponseEntity.ok(sseEmitters);
    }
    
    @GetMapping(value = "/sse/authorize/study", produces = MediaType.TEXT_EVENT_STREAM_VALUE)
    public ResponseEntity<SseEmitters> sseAuthorizeStudy(StudyMemberVO sm, HttpSession session){
    	StudyVO sv = studyService.getStudy(sm.getSm_st_num()); 
    	StudyMemberVO stm = studyService.findStudyMember(sm.getSm_st_num(), sv.getSt_me_id());
    	sseEmitters.send("authorizeStudy", /*stm,*/ stm.getSm_me_id(),session);
        return ResponseEntity.ok(sseEmitters);
    }
    
    //알림 삭제
	@ResponseBody
	@RequestMapping(value = "/delete/alarm/{al_num}", method = RequestMethod.POST)
	public HashMap<String,Object> insertAnswerPost(@PathVariable("al_num")int al_num, HttpSession session) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		notificationService.deleteAlarm(al_num);
		return map;
	}
}