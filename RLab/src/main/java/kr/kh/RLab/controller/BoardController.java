package kr.kh.RLab.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.kh.RLab.service.BoardService;
import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Controller
@RequestMapping("/board")
public class BoardController {
	
	private final BoardService boardService;
	
	@GetMapping("/insert")
	public String boardInsert() {
		return "/board/insert";
	}

}
