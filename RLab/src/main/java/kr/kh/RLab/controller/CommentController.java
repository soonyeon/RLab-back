package kr.kh.RLab.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.kh.RLab.pagination.PageHandler;
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

		Map<String, Object> response = new HashMap<>();
		response.put("result", result > 0? "success" : "fail");
		return response;
	}
	
	@PostMapping("/list/{co_ex_num}")
	public Map<String, Object> commentList(@RequestParam(value="page",defaultValue = "1") Integer page,
	        @RequestParam(value="pageSize",defaultValue = "10") Integer pageSize, @PathVariable("co_ex_num") int co_ex_num) {
	    int totalCont = commentService.getCommentTotalCount(co_ex_num);
	    PageHandler pageHandler = new PageHandler(totalCont, page, pageSize);
	    
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("co_ex_num", co_ex_num);
	    map.put("offset", (page - 1) * pageSize);
	    map.put("pageSize", pageSize);
	    
	    List<CommentVO> commentList = commentService.getCommentList(map);

	    Map<String, Object> resultMap = new HashMap<String, Object>();
	    resultMap.put("commentList", commentList);
	    resultMap.put("ph", pageHandler);
	    
	    return resultMap;
	}
	
	@PostMapping("/delete")
	public Map<String,Object> comment(@RequestBody CommentVO comment,HttpSession session) {
		System.out.println(comment);
		Map<String,Object> map = new HashMap<String, Object>();
		MemberVO user = (MemberVO) session.getAttribute("user");
		boolean res = commentService.deleteComment(comment,user);
		map.put("result", res ? "success" : "fail");
		return map;
	}
	
	@PostMapping("/update")
	public Map<String, Object> commentUpdate(@RequestBody CommentVO comment,HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		MemberVO user = (MemberVO) session.getAttribute("user");
		boolean res = commentService.updateComment(comment,user);
		map.put("result", res);
		return map;
	}
	
	

}
