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

import kr.kh.RLab.pagination.CommentCriteria;
import kr.kh.RLab.pagination.PageMaker;
import kr.kh.RLab.service.BoardService;
import kr.kh.RLab.service.CommentService;
import kr.kh.RLab.service.NotificationService;
import kr.kh.RLab.utils.SseEmitters;
import kr.kh.RLab.vo.BoardVO;
import kr.kh.RLab.vo.CommentVO;
import kr.kh.RLab.vo.MemberVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@RestController
@RequestMapping("/comment")
@Slf4j
public class CommentController {

	private final CommentService commentService;
	private final NotificationService notificationService;
	private final BoardService boardService;
	private final SseEmitters sseEmitters;
	private final SseController sseController;
	@PostMapping("/create")
	public Map<String, Object> createComment(@RequestBody CommentVO comment) {
		int result = commentService.createComment(comment);
		System.out.println(result);
		// 새 댓글이 생성되면 SSE 이벤트를 전송
		if (result > 0) {
			BoardVO board = boardService.getBoardByComment(comment.getCo_ex_num());
			String userId = board.getBo_me_id(); // 게시물 작성자의 ID를 가져와야 함
			String message = "새로운 댓글이 작성되었습니다: " + comment.getCo_content();
			// 이벤트 전송 전 로그에 이벤트 정보 출력
			System.out.println("Sending event: newComment, user: " + userId + ", message: " + message);

			notificationService.sendNotificationToUser(userId, message);
		}

		Map<String, Object> map = new HashMap<>();
		map.put("result", result > 0 ? "success" : "fail");
		sseController.sseNewComment(comment.getCo_ex_num());
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
