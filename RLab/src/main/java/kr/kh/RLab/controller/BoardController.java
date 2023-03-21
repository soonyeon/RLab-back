package kr.kh.RLab.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.kh.RLab.service.BoardService;
import kr.kh.RLab.vo.BoardVO;
import kr.kh.RLab.vo.MemberVO;
import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Controller
@RequestMapping("/board")
public class BoardController {
	
	private final BoardService boardService;
	
	@GetMapping("/insert")
	public ModelAndView boardInsert(ModelAndView mv) {
		mv.setViewName("/board/insert");
		return mv;
	}
	
	@PostMapping("/insert")
	public ModelAndView boardInsertPost(ModelAndView mv,BoardVO board) {
		//회원 정보 가져옴 (작성자) 임시로 가짜데이터 생성
		MemberVO member = new MemberVO("qwe1234", "김돌탕", "asdf1234", "010-1234-5678", "a@a", 1, 0);
		boolean res = boardService.insertBoard(board, member);
		mv.setViewName("redirect:/board/list");
		return mv;
	}
	

}
