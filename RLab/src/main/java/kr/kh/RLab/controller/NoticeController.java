package kr.kh.RLab.controller;


import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.kh.RLab.pagination.NoticeCriteria;
import kr.kh.RLab.pagination.PageMaker;
import kr.kh.RLab.service.NoticeService;
import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.NoticeTypeVO;
import kr.kh.RLab.vo.NoticeVO;
import lombok.RequiredArgsConstructor;
@RequiredArgsConstructor
@Controller
@RequestMapping("/notice")
public class NoticeController {
	@Autowired
	NoticeService noticeService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(ModelAndView mv, NoticeCriteria cri, HttpSession session) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		cri.setPerPageNum(2);
		ArrayList<NoticeVO> noList = noticeService.getAllNotice(cri);
		int totalCount = noticeService.getNoticeTotalCount(cri);
		PageMaker pm = new PageMaker(totalCount,1, cri);
		ArrayList<NoticeTypeVO> ntList = noticeService.getAllNoticeType();
		mv.addObject("ntList", ntList);
		mv.addObject("user", user);
		mv.addObject("noList", noList);
		mv.addObject("pm", pm);
		mv.setViewName("/notice/list");
		return mv;
	}
	@RequestMapping(value = "/detail/{no_num}", method = RequestMethod.GET)
	public ModelAndView list(ModelAndView mv, @PathVariable("no_num")int no_num) {
		NoticeVO no = noticeService.getNoticeByNonum(no_num);
		//조회수 1 증가
		
		mv.addObject("no", no);
		mv.setViewName("/notice/list");
		return mv;
	}
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public ModelAndView insert(ModelAndView mv, HttpSession session) {
		ArrayList<NoticeTypeVO> ntList = noticeService.getAllNoticeType();
		mv.addObject("ntList", ntList);
		mv.setViewName("/notice/insert");
		return mv;
	}
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public ModelAndView insertPost(ModelAndView mv, HttpSession session,NoticeVO notice) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		noticeService.insertNotice(user.getMe_id(),notice);
		System.out.println(notice);
		mv.setViewName("redirect:/notice/list");
		return mv;
	}
	
	
}
