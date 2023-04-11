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
import kr.kh.RLab.pagination.Criteria;
import kr.kh.RLab.pagination.PageMaker;
import kr.kh.RLab.service.CommentService;
import kr.kh.RLab.vo.CommentVO;
import kr.kh.RLab.vo.MemberVO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
@RequestMapping("/comment")
public class CommentController {

	private final CommentService commentService;

	@PostMapping("/create")
	public Map<String, Object> createComment(@RequestBody CommentVO comment) {
		int result = commentService.createComment(comment);

		Map<String, Object> map = new HashMap<>();
		map.put("result", result > 0? "success" : "fail");
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
	public Map<String,Object> comment(@RequestBody CommentVO comment,HttpSession session) {
		Map<String,Object> map = new HashMap<String, Object>();
		MemberVO user = (MemberVO) session.getAttribute("user");
		// 원댓글이면 co_state를 Y로 해서 상태를 삭제된 댓글로 변경함
		if(comment.getCo_num() == comment.getCo_ori_num()) {
			comment.setCo_state('Y');
			commentService.updateComment(comment, user);
		}
		boolean res = commentService.deleteComment(comment,user);
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
