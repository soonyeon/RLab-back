package kr.kh.RLab.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.kh.RLab.pagination.PageHandler;
import kr.kh.RLab.service.BoardService;
import kr.kh.RLab.service.CommentService;
import kr.kh.RLab.service.ScrapService;
import kr.kh.RLab.service.TemporaryService;
import kr.kh.RLab.vo.BoardVO;
import kr.kh.RLab.vo.MemberVO;
import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	private final BoardService boardService;
	private final ScrapService scrapService;
	private final TemporaryService temporaryService;
	private final CommentService commtentService;
	
	@GetMapping("/mypost_post")
	public ModelAndView mypost(
			ModelAndView mv,  HttpSession session, BoardVO board, MemberVO member){
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		member.setMe_id(user.getMe_id());
		String memberId = member.getMe_id();
		System.out.println(member);
		ArrayList<BoardVO> myBoardList = boardService.getBoardListById(memberId);

		mv.addObject("myBoardList", myBoardList);
		mv.setViewName("/mypage/mypost_post");
		return mv;
	}

	
	

}