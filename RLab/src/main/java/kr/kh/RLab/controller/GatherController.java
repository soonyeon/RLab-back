package kr.kh.RLab.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.kh.RLab.pagination.PageMaker;
import kr.kh.RLab.pagination.gatherCriteria;
import kr.kh.RLab.service.GatherService;
import kr.kh.RLab.service.JoinStudyService;
import kr.kh.RLab.vo.FileVO;
import kr.kh.RLab.vo.GatherVO;
import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.RegionVO;
import kr.kh.RLab.vo.StudyVO;
import kr.kh.RLab.vo.TagRegisterVO;
import kr.kh.RLab.vo.TagVO;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/gather")
public class GatherController {

	private final GatherService gatherService;
	private final JoinStudyService joinstudyService;
	
	//스터디 생성
	@GetMapping("/insertstudy")
	public ModelAndView studyInsert(ModelAndView mv,HttpServletRequest request) {
		MemberVO member = (MemberVO)request.getSession().getAttribute("user");
	    mv.setViewName("/gather/insertstudy");
	    return mv;
	}
	@PostMapping("/insertstudy")
	public ModelAndView studyInsertPost(ModelAndView mv,StudyVO study,HttpServletRequest request,RegionVO region,MultipartFile [] files,
			FileVO file,TagVO tag,TagRegisterVO tagRegister) {
		MemberVO member = (MemberVO)request.getSession().getAttribute("user");
		boolean res = gatherService.insertStudy(study,member,region,files,file,tag,tagRegister);
		mv.setViewName("redirect:/gather/insertgather");
		return mv;
	}
	
	//모집글 생성
	@GetMapping("/insertgather")
	public ModelAndView gatherInsert(ModelAndView mv,HttpServletRequest request) {
		MemberVO member = (MemberVO)request.getSession().getAttribute("user");
		ArrayList<StudyVO> list = gatherService.selectStudyById(member);
		mv.addObject("studies",list);
		mv.setViewName("/gather/insertgather");
	    return mv;
	}
	
	@PostMapping("/insertgather")
	public ModelAndView gatherInsertPost(ModelAndView mv,HttpServletRequest request,GatherVO gather,StudyVO study) {
		MemberVO member = (MemberVO)request.getSession().getAttribute("user");
		boolean res = gatherService.insertGather(member,gather,study);
	    mv.setViewName("redirect:/gather/list");
	    return mv;
	}
	//게시글 리스트보기
	@GetMapping("/list")
	public ModelAndView mainlistgather(ModelAndView mv,gatherCriteria gcri,HttpServletRequest request) {
		 HttpSession session = request.getSession();
		 MemberVO user = (MemberVO) session.getAttribute("user");
		 gcri.sortCri();
		 gcri.setPerPageNum(9);
		int totalCount = gatherService.getStudyTotalCount(gcri);
		PageMaker pm = new PageMaker(totalCount, 5, gcri);
		ArrayList<StudyVO> stList = gatherService.selectStudyAll(gcri);
		ArrayList<GatherVO> gaList = gatherService.selectGatherAll();
 		ArrayList<FileVO> fileList = gatherService.selectFileList();
		ArrayList<TagRegisterVO> tagList = gatherService.selectTagList();
		ArrayList<Integer> waList =  gatherService.selectWantedStudyList(user);
		System.out.println(stList);
		mv.addObject("gaList",gaList);
		mv.addObject("fileList",fileList);
		mv.addObject("user",user);
		mv.addObject("waList",waList);
		mv.addObject("pm",pm);
		mv.addObject("stList",stList);
		mv.addObject("tagList",tagList);
		mv.setViewName("/gather/list");
	    return mv;
	}
	
	
	//모집글 상세보기
	@GetMapping("/detail/{st_num}")
	public ModelAndView gatherDetail(ModelAndView mv,@PathVariable("st_num")int st_num,HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("user");
		GatherVO gather = gatherService.getGather(st_num);
		StudyVO study = gatherService.getStudy(st_num);
		ArrayList<TagRegisterVO> tagList = gatherService.selectTagList();
		ArrayList<Integer> waList =  gatherService.selectWantedStudyList(user);
		ArrayList<Integer> smList = gatherService.selelctJoinStudyMemberList(user);
		int joinCount = joinstudyService.getJoinCount(st_num);
		mv.addObject("smList",smList);
		mv.addObject("joinCount",joinCount);
		mv.addObject("st_num",st_num);
		mv.addObject("waList",waList);
		mv.addObject("tgList",tagList);
		mv.addObject("st",study);
		mv.addObject("ga",gather);
		mv.setViewName("/gather/detail");
	    return mv;
	}
	
	

}