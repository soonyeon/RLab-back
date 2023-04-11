package kr.kh.RLab.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.kh.RLab.service.StudyService;
import kr.kh.RLab.vo.LikeVO;
import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.PhotoTypeVO;
import kr.kh.RLab.vo.PhotoVO;
import kr.kh.RLab.vo.StudyMemberVO;
import kr.kh.RLab.vo.StudyVO;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/study")
public class StudyController {

	private final StudyService studyService;

	@GetMapping("/certificationBoard")
	public String certificationBoard(HttpServletRequest request, Model model,HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		model.addAttribute("user", user);
		ArrayList<PhotoTypeVO> phototypeList = studyService.getListPhotoType();
		MemberVO member = (MemberVO) request.getSession().getAttribute("user");
		StudyVO study = studyService.getStudyByMemberId(member.getMe_id());
		int st_num = study.getSt_num();
		List<PhotoVO> photos = studyService.getPhotosByStudyNum(st_num);
		// 좋아요
		Map<Integer, Integer> likeCounts = new HashMap<>();
		Map<Integer, Boolean> userLikes = new HashMap<>();
		for (PhotoVO photo : photos) {
			int li_ph_num = photo.getPh_num();
			int likeCount = studyService.countLikesByPhotoId(li_ph_num);
			LikeVO userLike = studyService.getLikeByUserIdAndPhotoId(member.getMe_id(), li_ph_num);

			likeCounts.put(li_ph_num, likeCount);
			userLikes.put(li_ph_num, userLike != null && userLike.getLi_state() == 1);
		}

		model.addAttribute("memberId", member);
		model.addAttribute("ptList", phototypeList);
		model.addAttribute("photos", photos);
		model.addAttribute("likeCounts", likeCounts);
		model.addAttribute("userLikes", userLikes);
		return "/study/certification_board";
	}

	@PostMapping("/insertCB")
	@ResponseBody
	public String insertCB(@RequestParam("photo") MultipartFile[] files, @RequestParam("content") String content,
			@RequestParam("ph_pt_num") String ph_pt_num, HttpServletRequest request) {
		MemberVO member = (MemberVO) request.getSession().getAttribute("user");
		StudyVO study = studyService.getStudyByMemberId(member.getMe_id());
		PhotoVO photoVO = new PhotoVO();
		photoVO.setPh_content(content);
		photoVO.setPh_pt_num(Integer.parseInt(ph_pt_num));
		photoVO.setPh_st_num(study.getSt_num()); // 스터디 번호 가져오기

		if (studyService.insertCB(photoVO, files, member)) {
			return "success";
		} else {
			return "error";
		}
	}

	@PostMapping("/toggleLike")
	@ResponseBody
	public String toggleLike(@RequestParam("li_ph_num") int li_ph_num, HttpServletRequest request) {
		MemberVO member = (MemberVO) request.getSession().getAttribute("user");
		String li_me_id = member.getMe_id();

		LikeVO likeVO = studyService.getLikeByUserIdAndPhotoId(li_me_id, li_ph_num);

		if (likeVO == null) {
			// 좋아요가 존재하지않으면,
			LikeVO newLike = new LikeVO();
			newLike.setLi_me_id(li_me_id);
			newLike.setLi_ph_num(li_ph_num);
			newLike.setLi_state(1);
			studyService.insertLike(newLike);
			return "inserted";
		} else {
			// 좋아요가 존재하면,
			int new_li_state = likeVO.getLi_state() == 1 ? 0 : 1;
			studyService.updateLikeStatus(li_me_id, li_ph_num, new_li_state);
			return new_li_state == 1 ? "updated" : "canceled";
		}
	}

	@RequestMapping(value = "/")
	public ModelAndView main(ModelAndView mv, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		StudyVO study = studyService.getStudyByMemberId(user.getMe_id());
		// ca_st_num 불러오기
		//int ca_st_num = study.getSt_num(); // 에러떠서 일단 주석처리
		//mv.addObject("ca_st_num", ca_st_num);
		mv.setViewName("/study/study_basic");
		return mv;
	}

	
	
	@RequestMapping(value = "/management", method=RequestMethod.GET)
	public ModelAndView management(ModelAndView mv, HttpSession session) {
		// HttpSession에서 "user"라는 이름의 속성을 가져와 MemberVO 객체로 형변환하여 변수 user에 저장
		// 로그인한 유저정보를 가져온다
//	    MemberVO user = (MemberVO) session.getAttribute("user");


		// 세션에서 "user" 속성을 검색하고 MemberVO 객체로 캐스
	    MemberVO user = (MemberVO) session.getAttribute("user");

	    // 로그인한 사용자의 ID를 MemberVO 객체에서 가져옴
	    String memberId = user.getMe_id();	    	    
		    
	    // StudyService 클래스의 getStudyListById 메서드를 호출하여 사용자가 속한 스터디 리스트를 가져옴
	    ArrayList<StudyVO> myStudyList = studyService.getStudyListById(memberId);
	    System.out.println(myStudyList);
	 // "myStudyList" 키와 함께 연구 목록을 ModelAndView 객체에 추가합니다.
	    mv.addObject("myStudyList", myStudyList);

		
		mv.setViewName("/study/management");
		return mv;
	}
	
	@RequestMapping(value = "/management", method=RequestMethod.POST)
	public ModelAndView managementPost(ModelAndView mv, StudyVO study) {
		System.out.println(study);
		mv.setViewName("redirect:/study/management/member/"+study.getSt_num());
		return mv;
	}
	
	
	@RequestMapping(value = "/management/member/{st_num}", method=RequestMethod.GET)
	public ModelAndView managementMember(ModelAndView mv, HttpSession session, MemberVO member, StudyVO study, @PathVariable("st_num")int st_num) {
	    
	    // 세션에서 "user" 속성을 검색하고 MemberVO 객체로 캐스
	    MemberVO user = (MemberVO) session.getAttribute("user");

	    // 로그인한 사용자의 ID를 MemberVO 객체에서 가져옴
	    String memberId = user.getMe_id();	    	    
		    
	    // StudyService 클래스의 getStudyListById 메서드를 호출하여 사용자가 속한 스터디 리스트를 가져옴
	    ArrayList<StudyVO> myStudyList = studyService.getStudyListById(memberId);
	    
	    ArrayList<StudyMemberVO> memberList = studyService.getStudyMemberList(st_num);
	    System.out.println(memberList);
	    // "myStudyList" 키와 함께 연구 목록을 ModelAndView 객체에 추가합니다.
	    mv.addObject("myStudyList", myStudyList);
	    mv.addObject("memberList",memberList);

	    // 뷰 이름을 "/study/management_member"로 설정합니다.
	    mv.setViewName("/study/management_member");

	    // ModelAndView 객체를 반환합니다.
	    return mv;
	}
	
	
	
	

	@RequestMapping(value = "/management/study", method=RequestMethod.GET)
	public ModelAndView managementStudy(ModelAndView mv, HttpSession session,MemberVO member,StudyVO study) {
		// HttpSession에서 "user"라는 이름의 속성을 가져와 MemberVO 객체로 형변환하여 변수 user에 저장
		// 로그인한 유저정보를 가져온다
	    MemberVO user = (MemberVO) session.getAttribute("user");
	    String memberId = user.getMe_id();	    
	    System.out.println(user);
	    
	    ArrayList<StudyVO> myStudyList = studyService.getStudyListById(memberId);
	    System.out.println(myStudyList);
	    
	    mv.addObject("myStudyList", myStudyList);
		mv.setViewName("/study/management_study");
		return mv;
	}

}
