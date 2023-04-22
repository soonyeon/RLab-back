package kr.kh.RLab.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import kr.kh.RLab.pagination.CommentCriteria;
import kr.kh.RLab.pagination.PageMaker;
import kr.kh.RLab.service.BoardService;
import kr.kh.RLab.service.CommentService;
import kr.kh.RLab.service.GatherService;
import kr.kh.RLab.utils.SseEmitters;
import kr.kh.RLab.vo.BoardVO;
import kr.kh.RLab.vo.CommentVO;
import kr.kh.RLab.vo.GatherVO;
import kr.kh.RLab.vo.MemberVO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
@RequestMapping("/comment")
public class CommentController {

	private final CommentService commentService;
	private final GatherService gatherService;
	private final BoardService boardService;
	private final SseEmitters sseEmitters;

	@PostMapping("/create")
	public Map<String, Object> createComment(@RequestBody CommentVO comment) {
		int result = commentService.createComment(comment);
		Map<String, Object> map = new HashMap<>();
		RestTemplate restTemplate = new RestTemplate();
		String eventName = null;

		if (result > 0) {
			String tableName = comment.getCo_table();
			String userId = null;
			String message = null;

			if (tableName.equals("gather")) { // 모집게시판 댓글인 경우
				// 댓글 등록 성공
				GatherVO gather = gatherService.getGatherByComment(comment.getCo_num());
				userId = gather.getGa_me_id();
				eventName = "newComment";
				message = comment.getMe_name() + "님이 모집글에 댓글을 작성했습니다.";
			} else if (tableName.equals("board")) {// 자유게시판 댓글인 경우
				// 댓글 등록 성공
				BoardVO board = boardService.getBoardByComment(comment.getCo_num());
				userId = board.getBo_me_id();
				eventName = "newComment";
				message = comment.getMe_name() + "님이 자유게시판에 댓글을 작성했습니다.";
			}
			/*
			 * RestTemplate 은 HTTP 요청 및 응답을 다루기 위한 Spring 의 표준 클래스
			 * URI 템플릿을 사용하여 HTTP 요청을 보내고 JSON/XML과 같은 응답을 객체로 매핑해줌
			 * 
			 * userId,eventName,message 값으로 구성된 알람 메세지를 서비스에 보내는 역할을 함
			 */
			if (userId != null && message != null) {
			    sseEmitters.sendNotification(userId, eventName, message);
			}
			map.put("result", "success");
			map.put("co_num", comment.getCo_num());
		} else {
			// 댓글 등록에 실패하면
			map.put("result", "fail");
		}
		return map;
	}

	@PostMapping("/list/{co_ex_num}")
	public Map<String, Object> commentList(CommentCriteria cc, @PathVariable("co_ex_num") int co_ex_num) {
		cc.setPerPageNum(10); // 한 페이지당 컨텐츠 갯수
		int totalCount = commentService.getCommentTotalCount(co_ex_num);
		PageMaker pm = new PageMaker(totalCount, 10, cc);

		List<CommentVO> commentList = commentService.getCommentList(cc);

		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("commentList", commentList);
		resultMap.put("pm", pm);

		return resultMap;
	}

	@PostMapping("/delete")
	public Map<String, Object> comment(@RequestBody CommentVO comment, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		MemberVO user = (MemberVO) session.getAttribute("user");
		System.out.println("co_num" + comment.getCo_num());
		System.out.println("ori_num" + comment.getCo_ori_num());
		boolean res = commentService.deleteComment(comment, user);
		map.put("result", res ? "success" : "fail");
		return map;
	}

	@PostMapping("/update")
	public Map<String, Object> commentUpdate(@RequestBody CommentVO comment, HttpSession session) {
		Map<String, Object> map = new HashMap<>();
		MemberVO user = (MemberVO) session.getAttribute("user");
		boolean res = commentService.updateComment(comment, user);
		map.put("result", res ? "success" : "fail");
		return map;
	}

	@GetMapping("/count/{boardNum}")
	public int getCommentCount(@PathVariable int boardNum) {
		int commentCount = commentService.getCommentTotalCount(boardNum);
		return commentCount;
	}
	
}
