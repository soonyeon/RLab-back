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
import kr.kh.RLab.service.GatherService;
import kr.kh.RLab.service.NotificationService;
import kr.kh.RLab.vo.AlarmVO.AlarmType;
import kr.kh.RLab.vo.BoardVO;
import kr.kh.RLab.vo.CommentVO;
import kr.kh.RLab.vo.GatherVO;
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
	private final GatherService gatherService;
	private final SseController sseController;
	@PostMapping("/create")
	public Map<String, Object> createComment(@RequestBody CommentVO comment,HttpSession session) {
		int result = commentService.createComment(comment);
		// 새 댓글이 생성되면 SSE 이벤트를 전송
		if (result > 0) {
			String al_table = comment.getCo_table();
			String userId, message = "";
			AlarmType al_type;
			Object eventData;
			
			// 댓글 달리면 게시글 작성자에게 알림
			if(al_table.equals("board")) {
				BoardVO board = boardService.getBoardByComment(comment.getCo_ex_num());
				userId = board.getBo_me_id();
				message = board.getBo_title()+"에 댓글이 달렸습니다";
				al_type = AlarmType.STUDY;
				eventData = board;
			}else if(al_table.equals("gather")) {
				GatherVO gather = gatherService.getGatherByComment(comment.getCo_ex_num());
				userId = gather.getGa_me_id();
				message = gather.getGa_title()+"에 댓글이 달렸습니다";
				al_type = AlarmType.GATHER;
				eventData = gather;
			}else
				return null;
			// 게시글 작성자 본인이 단 댓글은 알림 받지 않음
			if(!userId.equals(comment.getCo_me_id())) { 
				notificationService.sendNotificationToUser(userId, message, al_type, al_table, comment.getCo_ex_num());
				sseController.sseNewComment(userId,eventData,session);
			}
			// 대댓글 달리면 댓글 작성자에게도 알림
			if(comment.getCo_ori_num()!=0 && comment.getCo_ori_num()!=comment.getCo_num()) {
				CommentVO oriComment = commentService.getCommentByCoNum(comment.getCo_ori_num());
				userId = oriComment.getCo_me_id();
				message = oriComment.getCo_content()+"에 대댓글이 달렸습니다";
				notificationService.sendNotificationToUser(userId, message, al_type, al_table, comment.getCo_ex_num());
				sseController.sseNewComment(userId,eventData,session);
			}
		}
		Map<String, Object> map = new HashMap<>();
		map.put("result", result > 0 ? "success" : "fail");
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
