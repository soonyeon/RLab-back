package kr.kh.RLab.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.kh.RLab.pagination.Criteria;
import kr.kh.RLab.pagination.PageMaker;
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
			ModelAndView mv, HttpSession session, MemberVO member, BoardVO board, Criteria cri){		
		MemberVO user = (MemberVO)session.getAttribute("user");
		member.setMe_id(user.getMe_id());
		String memberId = user.getMe_id();
		ArrayList<BoardVO> myBoardList = boardService.getBoardListById(memberId);
		int totalCount = boardService.getPostBoardTotalCount(memberId);
		System.out.println(totalCount);
		PageMaker pm = new PageMaker(totalCount, 10, cri);
		mv.addObject("myBoardList", myBoardList);
		mv.addObject("pm", pm);
		mv.setViewName("/mypage/mypost_post");
		return mv;
	}

	@GetMapping("/mypost_scrap")
	public ModelAndView mypostScrap(ModelAndView mv, HttpSession session, BoardVO board, MemberVO member) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		member.setMe_id(user.getMe_id());
		String memberId = member.getMe_id();
		ArrayList<BoardVO> myScrapList = scrapService.getScrapListById(memberId);
		mv.addObject("myScrapList", myScrapList);
		mv.setViewName("/mypage/mypost_scrap");
		return mv;
	}
	
	@RequestMapping(value="/mypage/mypost_recruit", method=RequestMethod.GET)
	public ModelAndView mypostRecruit(ModelAndView mv) {
		mv.setViewName("/mypage/mypost_recruit");
		return mv;
	}

}