package kr.kh.RLab.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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

}
