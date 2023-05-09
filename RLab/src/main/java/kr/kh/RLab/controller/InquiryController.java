package kr.kh.RLab.controller;


import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.kh.RLab.pagination.NoticeCriteria;
import kr.kh.RLab.pagination.PageMaker;
import kr.kh.RLab.service.InquiryService;
import kr.kh.RLab.vo.InquiryTypeVO;
import kr.kh.RLab.vo.InquiryVO;
import kr.kh.RLab.vo.MemberVO;
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
		ArrayList<Integer> answered = inquiryService.getAnsweredInNum();
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
		ArrayList<InquiryTypeVO> itList = inquiryService.getAllInquiryType();
		ArrayList<Integer> answered = inquiryService.getAnsweredInNum();
		InquiryVO ans = inquiryService.getInquiryAnswer(in_num);
		mv.addObject("in", in);
		mv.addObject("itList", itList);
		mv.addObject("in_num", in_num);
		mv.addObject("answered", answered);
		mv.addObject("ans", ans);
		mv.setViewName("/inquiry/detail");
		return mv;
	}
	@RequestMapping(value = "/update/{in_num}", method = RequestMethod.GET)
	public ModelAndView update(ModelAndView mv, @PathVariable("in_num")int in_num, HttpSession session) {
		InquiryVO in = inquiryService.getInquiryByInnum(in_num);
		ArrayList<InquiryTypeVO> itList = inquiryService.getAllInquiryType();
		mv.addObject("in", in);
		mv.addObject("itList", itList);
		mv.setViewName("/inquiry/update");
		return mv;
	}
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ModelAndView updatePost(ModelAndView mv, InquiryVO in, HttpSession session) {
		String msg, url;
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user==null) {
			msg = "로그인이 필요한 기능입니다. 로그인을 진행해주세요.";
			url = "/inquiry/detail/"+in.getIn_num();
		}else {
			
			InquiryVO pastIn = inquiryService.getInquiryByInnum(in.getIn_num());
			if(pastIn.getIn_ori_num()!=0) {
				msg = "이미 답변이 달려 수정이 불가한 게시글입니다. 답변을 확인한 후 새로운 문의글을 남겨주세요.";
				url = "/inquiry/detail/"+in.getIn_num();
			}else {
				if(!inquiryService.updateInquiry(in)) {
					msg = "게시글 수정에 실패했습니다.";
					url = "/inquiry/detail/"+in.getIn_num();
				}else {
					msg = "게시글을 수정했습니다.";
					url = "/inquiry/detail/"+in.getIn_num();
				}
			}
		}
		mv.addObject("msg", msg);
		mv.addObject("url", url);
		mv.setViewName("/common/message");
		return mv;
	}
	@RequestMapping(value = "/delete/{in_num}", method = RequestMethod.GET)
	public ModelAndView delete(ModelAndView mv, @PathVariable("in_num")int in_num, HttpSession session) {
		String msg, url; 
		InquiryVO in = inquiryService.getInquiryByInnum(in_num);
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(in.getIn_ori_num()==0) {//문의글 삭제 시
			if(user==null) {
				msg = "로그인이 필요한 기능입니다. 로그인을 진행해주세요.";
				url = "/inquiry/detail/"+in_num;
			}else {
				if(!inquiryService.deleteInquiry(in_num)) {
					msg = "게시글 삭제에 실패했습니다.";
					url = "/inquiry/detail/"+in_num;
				}else {
					msg = "게시글을 삭제했습니다.";
					url = "/inquiry/list";
				}
			}
		}else { //문의답변 삭제 시
			if(user==null) {
				msg = "로그인이 필요한 기능입니다. 로그인을 진행해주세요.";
				url = "/inquiry/detail/"+in.getIn_ori_num();
			}else {
				if(!inquiryService.deleteInquiry(in_num)) {
					msg = "답변 삭제에 실패했습니다.";
					url = "/inquiry/detail/"+in.getIn_ori_num();
				}else {
					msg = "문의 답변을 삭제했습니다.";
					url = "/inquiry/detail/"+in.getIn_ori_num();
				}
			}
		}
		mv.addObject("msg", msg);
		mv.addObject("url", url);
		mv.setViewName("/common/message");
		return mv;
	}
	@ResponseBody
	@RequestMapping(value = "/insert/answer", method = RequestMethod.POST)
	public HashMap<String,Object> insertAnswerPost(HttpSession session, @RequestBody InquiryVO inquiry) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		System.out.println(inquiry);
		MemberVO user = (MemberVO)session.getAttribute("user");
		inquiryService.insertInquiryAnswer(user.getMe_id(), inquiry);
		return map;
	}
	@ResponseBody
	@RequestMapping(value = "/update/answer", method = RequestMethod.POST)
	public HashMap<String,Object> updateAnswerPost(HttpSession session, @RequestBody InquiryVO inquiry) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		System.out.println(inquiry);
		inquiryService.updateInquiryAnswer(inquiry);
		return map;
	}
}
