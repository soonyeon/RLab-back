package kr.kh.RLab.controller;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.kh.RLab.service.HomeService;
import kr.kh.RLab.service.ReservationService;
import kr.kh.RLab.vo.BranchVO;
import kr.kh.RLab.vo.FileVO;
import kr.kh.RLab.vo.GatherVO;
import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.StudyVO;
import kr.kh.RLab.vo.TagRegisterVO;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class HomeController {
	
	@Autowired
	private ReservationService reservationService;

	private final HomeService homeService;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(ModelAndView mv,HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("user");
		
		//모집글 불러오기
		ArrayList<StudyVO> stList = homeService.selectStudyAll();
		ArrayList<GatherVO> gaList = homeService.selectGatherAll();
		ArrayList<FileVO> fileList = homeService.selectFileList();
		ArrayList<TagRegisterVO> tagList = homeService.selectTagList();
		ArrayList<Integer> waList =  homeService.selectWantedStudyList(user);
		mv.addObject("stList",stList);
		mv.addObject("gaList",gaList);
		mv.addObject("fileList",fileList);
		mv.addObject("tagList",tagList);
		mv.addObject("waList",waList);
		
		//지점목록 불러오기
		ArrayList<BranchVO> spot = reservationService.getAllBranchListToMain();
		mv.addObject("spot",spot);
  
		mv.setViewName("/main/home");
		return mv;
	}

}
