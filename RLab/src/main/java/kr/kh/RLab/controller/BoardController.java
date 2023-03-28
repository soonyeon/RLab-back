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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.kh.RLab.pagination.PageHandler;
import kr.kh.RLab.service.BoardService;
import kr.kh.RLab.service.ScrapService;
import kr.kh.RLab.service.TemporaryService;
import kr.kh.RLab.vo.BoardVO;
import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.StudyVO;
import kr.kh.RLab.vo.TemporaryVO;
import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Controller
@RequestMapping("/board")
public class BoardController {
	
	private final BoardService boardService;
	private final ScrapService scrapService;
	private final TemporaryService temporaryService;
	
	@GetMapping("/insert")
	public ModelAndView boardInsert(ModelAndView mv,HttpServletRequest request) {
		MemberVO member = (MemberVO)request.getSession().getAttribute("user");
	    mv.addObject("memberId", member.getMe_id());
	    List<StudyVO> studies = new ArrayList<StudyVO>();
	    StudyVO study = new StudyVO(1, "정처기준비", member.getMe_id(), "정처기준비하는스터디입니다.", 1, 1, "서울 특별시", null);
	    studies.add(study);
	    mv.addObject("studies", studies);
	    mv.setViewName("/board/insert");
	    return mv;
	}
	@PostMapping("/insert")
	public ModelAndView boardInsertPost(ModelAndView mv,BoardVO board,HttpServletRequest request) {
		//회원 정보 가져옴 (작성자) 임시로 가짜데이터 생성
		MemberVO member = (MemberVO)request.getSession().getAttribute("user");
		boolean res = boardService.insertBoard(board, member);
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
	public ModelAndView boardGet(ModelAndView mv, @PathVariable int bo_num) {
		BoardVO board = boardService.getBoard(bo_num);
		mv.addObject("bd", board);
		
		//스크랩수 가져오기
	    int scrapCount = scrapService.getScrapCount(bo_num);
	    mv.addObject("scrapCount", scrapCount);
		
		mv.setViewName("/board/detail");
		return mv;
	}
	
	@GetMapping("/update/{bo_num}")
	public ModelAndView boardUpdate(ModelAndView mv, @PathVariable int bo_num,HttpServletRequest request) {
		MemberVO member = (MemberVO)request.getSession().getAttribute("user");
	    mv.addObject("memberId", member.getMe_id());
		BoardVO board = boardService.getBoard(bo_num);
		mv.addObject("bd", board);
		//스터디 가져오기
		ArrayList<StudyVO> studyList = boardService.selectStudyList(member.getMe_id());
		mv.addObject("study", studyList);
		mv.setViewName("/board/update");
		return mv;
	}
	@PostMapping("/update/{bo_num}")
	public ModelAndView boardUpdatePost(ModelAndView mv, @PathVariable int bo_num,BoardVO board) {
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
