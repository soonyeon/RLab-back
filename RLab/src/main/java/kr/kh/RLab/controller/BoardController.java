package kr.kh.RLab.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.kh.RLab.service.BoardService;
import kr.kh.RLab.vo.BoardVO;
import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.StudyVO;
import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Controller
@RequestMapping("/board")
public class BoardController {
	
	private final BoardService boardService;
	
	@GetMapping("/insert")
	public ModelAndView boardInsert(ModelAndView mv) {
	    MemberVO member = new MemberVO("qwe123", "김돌탕", "asdf1234", "01012345678", "a@a", 1, 0);
	    mv.addObject("memberId", member.getMe_id());
	    List<StudyVO> studies = new ArrayList<StudyVO>();
	    StudyVO study = new StudyVO(1, "정처기준비", member.getMe_id(), "정처기준비하는스터디입니다.", 0, 0, "서울 특별시", null);
		StudyVO study2 = new StudyVO(2, "토익스터디", member.getMe_id(), "토익 공부하는 스터디입니다.", 0, 0, "서울 특별시", null);
	    studies.add(study);
	    studies.add(study2);
	    mv.addObject("studies", studies);
	    mv.setViewName("/board/insert");
	    return mv;
	}
	@PostMapping("/insert")
	public ModelAndView boardInsertPost(ModelAndView mv,BoardVO board) {
		//회원 정보 가져옴 (작성자) 임시로 가짜데이터 생성
		MemberVO member = new MemberVO("qwe123", "김돌탕", "asdf1234", "01012345678", "a@a", 1, 0);
		boolean res = boardService.insertBoard(board, member);
		mv.setViewName("redirect:/board/list");
		return mv;
	}
	

}
