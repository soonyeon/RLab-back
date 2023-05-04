package kr.kh.RLab.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.kh.RLab.pagination.Criteria;
import kr.kh.RLab.pagination.PageMaker;
import kr.kh.RLab.service.BoardService;
import kr.kh.RLab.service.CommentService;
import kr.kh.RLab.service.ScrapService;
import kr.kh.RLab.vo.BoardVO;
import kr.kh.RLab.vo.CommentVO;
import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.ScrapVO;
import kr.kh.RLab.vo.StudyVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	private final BoardService boardService;
	@Autowired
	private final ScrapService scrapService;
	@Autowired
	private final CommentService commentService;
	
	@GetMapping("/insert")
	public ModelAndView boardInsert(ModelAndView mv,HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("user");	    
		mv.addObject("memberId", user.getMe_id());
	    //스터디 가져오기
	    ArrayList<StudyVO> studyList = boardService.selectStudyList();
	    mv.addObject("studies", studyList);
	    mv.setViewName("/board/insert");
	    return mv;
	}
	@PostMapping("/insert")
	public ModelAndView boardInsertPost(ModelAndView mv, BoardVO board, HttpSession session,
	        @RequestParam int bo_st_num) {
	    MemberVO user = (MemberVO) session.getAttribute("user");
	    boolean res = boardService.insertBoard(board, user);
	    mv.setViewName("redirect:/board/list/" + bo_st_num);
	    return mv;
	}
	@GetMapping("/list/{st_num}")
	public ModelAndView boardList(ModelAndView mv,Criteria cri, @PathVariable int st_num) {
		cri.setPerPageNum(10); // 한 페이지당 컨텐츠 갯수
	    int totalCount = boardService.getCount();
	    PageMaker pm = new PageMaker(totalCount, 10, cri);
	    ArrayList<BoardVO> boardList = boardService.selectBoardList(cri,st_num);
	    mv.addObject("st_num", st_num);
	    mv.addObject("pm", pm);
	    mv.addObject("boardList", boardList);
	    mv.setViewName("/board/list");
	    return mv;
	}
	
	@GetMapping("/detail/{st_num}/{bo_num}")
	public ModelAndView boardGet(ModelAndView mv, @PathVariable int bo_num,HttpSession session,
			@PathVariable int st_num) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		BoardVO board = boardService.getBoard(bo_num);
		mv.addObject("bd", board);
		
		//스크랩수 가져오기
	    int scrapCount = scrapService.getScrapCount(bo_num);
	    mv.addObject("scrapCount", scrapCount);
	    //스크랩한 사람들 명단 가져오기
	    ArrayList<ScrapVO> scrapedList = scrapService.findScrap(bo_num);
	    for (ScrapVO scv : scrapedList) {
				mv.addObject("scv", scv);
		}
	    mv.addObject("st_num", st_num);
	    mv.setViewName("/board/detail");
		return mv;
	}
	
	@GetMapping("/update/{st_num}/{bo_num}")
	public ModelAndView boardUpdate(ModelAndView mv, @PathVariable int bo_num,HttpSession session,
			@PathVariable int st_num) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		mv.addObject("memberId", user.getMe_id());
		BoardVO board = boardService.getBoard(bo_num);
		mv.addObject("bd", board);
		//스터디 가져오기
		ArrayList<StudyVO> studyList = boardService.selectStudyList();
		mv.addObject("study", studyList);
	    mv.addObject("st_num", st_num);
		mv.setViewName("/board/update");
		return mv;
	}
	@PostMapping("/update/{st_num}/{bo_num}")
	public ModelAndView boardUpdatePost(ModelAndView mv, @PathVariable int st_num,
			@PathVariable int bo_num, BoardVO board) {
		boolean res = boardService.updateBoard(board);
		mv.setViewName("redirect:/board/detail/"+st_num+"/"+bo_num);
		return mv;
	}
	
	@PostMapping("/delete/{bo_num}")
	@ResponseBody
	public String deleteBoard(@PathVariable int bo_num,HttpSession session) {
	    MemberVO user = (MemberVO) session.getAttribute("user");
		boardService.deleteBoard(bo_num);
	    
	    //게시글 삭제할때 해당하는 댓글도 삭제되게 설정
	    ArrayList<CommentVO> comment = commentService.selectCommentByBoNum(bo_num);
	    commentService.deleteCommentAll(comment,user);
	    return "success";
	}
	


	
	

}