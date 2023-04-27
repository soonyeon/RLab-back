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
		mv.setViewName("redirect:/notice/list");
		return mv;
	}
	@RequestMapping(value = "/detail/{no_num}", method = RequestMethod.GET)
	public ModelAndView list(ModelAndView mv, @PathVariable("no_num")int no_num, HttpSession session) {
		NoticeVO no = noticeService.getNoticeByNonum(no_num);
		noticeService.updateView(no_num);

		ArrayList<NoticeTypeVO> ntList = noticeService.getAllNoticeType();
		mv.addObject("no", no);
		mv.addObject("ntList", ntList);
		mv.addObject("no_num", no_num);
		mv.setViewName("/notice/detail");
		return mv;
	}
	@RequestMapping(value = "/update/{no_num}", method = RequestMethod.GET)
	public ModelAndView update(ModelAndView mv, @PathVariable("no_num")int no_num, HttpSession session) {
		ArrayList<NoticeTypeVO> ntList = noticeService.getAllNoticeType();
		NoticeVO no = noticeService.getNoticeByNonum(no_num);
		mv.addObject("no", no);
		mv.addObject("ntList", ntList);
		mv.setViewName("/notice/update");
		return mv;
	}
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ModelAndView updatePost(ModelAndView mv, NoticeVO no, HttpSession session) {
		System.out.println(no);
		String msg, url;
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user==null) {
			msg = "로그인이 필요한 기능입니다. 로그인을 진행해주세요.";
			url = "/notice/detail/"+no.getNo_num();
		}else {
			if(!noticeService.updateNotice(no)) {
				msg = "게시글 수정에 실패했습니다.";
				url = "/notice/detail/"+no.getNo_num();
			}else {
				msg = "게시글을 수정했습니다.";
				url = "/notice/detail/"+no.getNo_num();
			}
		}
		mv.addObject("msg", msg);
		mv.addObject("url", url);
		mv.setViewName("/common/message");
		return mv;
	}
	@RequestMapping(value = "/delete/{no_num}", method = RequestMethod.GET)
	public ModelAndView delete(ModelAndView mv, @PathVariable("no_num")int no_num, HttpSession session) {
		String msg, url;
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user==null) {
			msg = "로그인이 필요한 기능입니다. 로그인을 진행해주세요.";
			url = "/notice/detail/"+no_num;
		}else {
			if(!noticeService.deleteNotice(no_num)) {
				msg = "게시글 삭제에 실패했습니다.";
				url = "/notice/detail/"+no_num;
			}else {
				msg = "게시글을 삭제했습니다.";
				url = "/notice/list";
			}
		}
		mv.addObject("msg", msg);
		mv.addObject("url", url);
		mv.setViewName("/common/message");
		return mv;
	}
	
	
}
