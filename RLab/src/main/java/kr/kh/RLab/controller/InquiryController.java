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
import kr.kh.RLab.service.InquiryService;
import kr.kh.RLab.vo.InquiryTypeVO;
import kr.kh.RLab.vo.InquiryVO;
import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.NoticeTypeVO;
import kr.kh.RLab.vo.NoticeVO;
import lombok.RequiredArgsConstructor;
@RequiredArgsConstructor
@Controller
@RequestMapping("/inquiry")
public class InquiryController {
	@Autowired
	InquiryService inquiryService;
	
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(ModelAndView mv, NoticeCriteria cri, HttpSession session) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		cri.setPerPageNum(2);
		ArrayList<InquiryVO> inList = inquiryService.getAllInquiry(cri);
		int totalCount = inquiryService.getInquiryTotalCount(cri);
		PageMaker pm = new PageMaker(totalCount,1, cri);
		ArrayList<InquiryTypeVO> itList = inquiryService.getAllInquiryType();
		//답변완료된 리스트를 가져와서 화면에 보내줘야함~~
		ArrayList<Integer> answered = inquiryService.getAnsweredInNum();
		System.out.println("답변완료된 게시글 번호:"+answered);
		mv.addObject("user", user);
		mv.addObject("inList", inList);
		mv.addObject("pm", pm);
		mv.addObject("itList", itList);
		mv.addObject("answered", answered);
		mv.setViewName("/inquiry/list");
		return mv;
	}
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public ModelAndView insert(ModelAndView mv, HttpSession session) {
		ArrayList<InquiryTypeVO> itList = inquiryService.getAllInquiryType();
		mv.addObject("itList", itList);
		mv.setViewName("/inquiry/insert");
		return mv;
	}
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public ModelAndView insertPost(ModelAndView mv, HttpSession session, InquiryVO inquiry) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		inquiryService.insertInquiry(user.getMe_id(), inquiry);
		mv.setViewName("redirect:/inquiry/list");
		return mv;
	}
	@RequestMapping(value = "/detail/{in_num}", method = RequestMethod.GET)
	public ModelAndView list(ModelAndView mv, @PathVariable("in_num")int in_num, HttpSession session) {
		InquiryVO in = inquiryService.getInquiryByInnum(in_num);
		//inquiryService.updateView(no_num);

		//ArrayList<NoticeTypeVO> ntList = inquiryService.getAllNoticeType();
		mv.addObject("in", in);
		//mv.addObject("ntList", ntList);
		mv.addObject("in_num", in_num);
		mv.setViewName("/notice/detail");
		return mv;
	}/*
	@RequestMapping(value = "/update/{no_num}", method = RequestMethod.GET)
	public ModelAndView update(ModelAndView mv, @PathVariable("no_num")int no_num, HttpSession session) {
		ArrayList<NoticeTypeVO> ntList = inquiryService.getAllNoticeType();
		NoticeVO no = inquiryService.getNoticeByNonum(no_num);
		mv.addObject("no", no);
		mv.addObject("ntList", ntList);
		mv.setViewName("/notice/update");
		return mv;
	}
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ModelAndView updatePost(ModelAndView mv, NoticeVO no, HttpSession session) {
		String msg, url;
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user==null) {
			msg = "로그인이 필요한 기능입니다. 로그인을 진행해주세요.";
			url = "/notice/detail/"+no.getNo_num();
		}else {
			if(!inquiryService.updateNotice(no)) {
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
			if(!inquiryService.deleteNotice(no_num)) {
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
	
	*/
}
