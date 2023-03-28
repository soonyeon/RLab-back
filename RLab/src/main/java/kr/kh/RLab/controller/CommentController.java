package kr.kh.RLab.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.kh.RLab.pagination.PageHandler;
import kr.kh.RLab.service.CommentService;
import kr.kh.RLab.vo.CommentVO;
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
	    map.put("offset", (page - 1) * pageSize);
	    map.put("pageSize", pageSize);
	    
	    List<CommentVO> commentList = commentService.getCommentList(map);
	    System.out.println("=====================" +commentList.toString());

	    Map<String, Object> resultMap = new HashMap<String, Object>();
	    resultMap.put("commentList", commentList);
	    resultMap.put("ph", pageHandler);
	    
	    return resultMap;
	}

}
