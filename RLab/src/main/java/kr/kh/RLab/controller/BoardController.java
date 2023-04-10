package kr.kh.RLab.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.kh.RLab.pagination.Criteria;
import kr.kh.RLab.pagination.PageHandler;
import kr.kh.RLab.service.BoardService;
import kr.kh.RLab.service.CommentService;
import kr.kh.RLab.service.ScrapService;
import kr.kh.RLab.service.TemporaryService;
import kr.kh.RLab.vo.BoardVO;
import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.ScrapVO;
import kr.kh.RLab.vo.StudyVO;
import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Controller
@RequestMapping("/board")
public class BoardController {
	
	private final BoardService boardService;
	private final ScrapService scrapService;
	
	@GetMapping("/insert")
	public ModelAndView boardInsert(ModelAndView mv,HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("user");	    
		mv.addObject("memberId", user.getMe_id());
	    //스터디 가져오기
	    ArrayList<StudyVO> studyList = boardService.selectStudyList(user.getMe_id());
	    mv.addObject("studies", studyList);
	    mv.setViewName("/board/insert");
	    return mv;
	}
	@PostMapping("/insert")
	public ModelAndView boardInsertPost(ModelAndView mv,BoardVO board,HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		boolean res = boardService.insertBoard(board, user);
		mv.setViewName("redirect:/board/list");
		return mv;
	}
	
	@GetMapping("/list")
	public ModelAndView boardList(
	        @RequestParam(value="page",defaultValue = "1") Integer page,
	        @RequestParam(value="pageSize",defaultValue = "10") Integer pageSize,
	        @RequestParam(required = false) String sort,
	        ModelAndView mv
	) {
	    int totalCnt = boardService.getCount();
	    PageHandler pageHandler = new PageHandler(totalCnt, page, pageSize);
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("offset", (page - 1) * pageSize);
	    map.put("pageSize", pageSize);

	    if (sort != null) {
	        switch (sort) {
	            case "newest":
	                map.put("orderBy", "bo_reg_date DESC");
	                break;
	            case "oldest":
	                map.put("orderBy", "bo_reg_date ASC");
	                break;
	            default:
	                map.put("orderBy", null);
	                break;
	        }
	    } else {
	    	map.put("orderBy", "bo_reg_date DESC");
	    }

	    ArrayList<BoardVO> boardList = boardService.selectBoardList(map);

	    mv.addObject("boardList", boardList);
	    mv.addObject("ph", pageHandler);
	    mv.setViewName("/board/list");
	    return mv;
	}
	
	@GetMapping("/detail/{bo_num}")
	public ModelAndView boardGet(ModelAndView mv, @PathVariable int bo_num,HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		BoardVO board = boardService.getBoard(bo_num);
		mv.addObject("bd", board);
		
		//스크랩수 가져오기
	    int scrapCount = scrapService.getScrapCount(bo_num);
	    mv.addObject("scrapCount", scrapCount);
	    //스크랩 정보 가져오기
	    ScrapVO scrap = scrapService.findScrap(user.getMe_id());
	    mv.addObject("sc", scrap);
		mv.setViewName("/board/detail");
		return mv;
	}
	
	@GetMapping("/update/{bo_num}")
	public ModelAndView boardUpdate(ModelAndView mv, @PathVariable int bo_num,HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		mv.addObject("memberId", user.getMe_id());
		BoardVO board = boardService.getBoard(bo_num);
		mv.addObject("bd", board);
		//스터디 가져오기
		ArrayList<StudyVO> studyList = boardService.selectStudyList(user.getMe_id());
		mv.addObject("study", studyList);
		mv.setViewName("/board/update");
		return mv;
	}
	@PostMapping("/update/{bo_num}")
	public ModelAndView boardUpdatePost(ModelAndView mv, @PathVariable int bo_num, BoardVO board) {
		boolean res = boardService.updateBoard(board);
		mv.setViewName("redirect:/board/detail/"+bo_num);
		return mv;
	}
	
	@PostMapping("/delete/{bo_num}")
	@ResponseBody
	public String deleteBoard(@PathVariable int bo_num) {
	    boardService.deleteBoard(bo_num);
	    return "success";
	}
	


	
	

}