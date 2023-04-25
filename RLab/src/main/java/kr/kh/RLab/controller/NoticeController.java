package kr.kh.RLab.controller;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.kh.RLab.pagination.Criteria;
import kr.kh.RLab.pagination.PageMaker;
import kr.kh.RLab.service.NoticeService;
import kr.kh.RLab.vo.NoticeVO;
import lombok.RequiredArgsConstructor;
@RequiredArgsConstructor
@Controller
@RequestMapping("/notice")
public class NoticeController {
	@Autowired
	NoticeService noticeService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(ModelAndView mv) {
		mv.setViewName("/notice/list");
		return mv;
	}
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(ModelAndView mv, Criteria cri) {
		cri.setPerPageNum(10);
		ArrayList<NoticeVO> noList = noticeService.getAllNotice(cri);
		int totalCount = noticeService.getNoticeTotalCount(cri);
		PageMaker pm = new PageMaker(totalCount, 5, cri);
		mv.addObject("noList", noList);
		mv.addObject("pm", pm);
		mv.setViewName("/notice/list");
		return mv;
	}
	@RequestMapping(value = "/detail/{no_num}", method = RequestMethod.GET)
	public ModelAndView list(ModelAndView mv, @PathVariable("no_num")int no_num) {
		NoticeVO no = noticeService.getNoticeByNonum(no_num);
		mv.addObject("no", no);
		mv.setViewName("/notice/list");
		return mv;
	}
	
	
}
