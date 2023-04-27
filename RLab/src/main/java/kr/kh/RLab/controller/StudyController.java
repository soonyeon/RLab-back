package kr.kh.RLab.controller;

import java.io.IOException;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.kh.RLab.pagination.Criteria;
import kr.kh.RLab.pagination.PageMaker;
import kr.kh.RLab.service.StudyService;
import kr.kh.RLab.vo.LikeVO;
import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.MissionFinishVO;
import kr.kh.RLab.vo.MissionVO;
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

	@GetMapping("/photo/{st_num}")
	public String photo(HttpServletRequest request, Model model, HttpSession session,
			@PathVariable("st_num") int st_num) throws IOException {
		MemberVO user = (MemberVO) session.getAttribute("user");
		model.addAttribute("user", user);
		ArrayList<PhotoTypeVO> phototypeList = studyService.getListPhotoType();
		MemberVO member = (MemberVO) request.getSession().getAttribute("user");
		ArrayList<StudyVO> study = studyService.getStudyByMemberId(member.getMe_id());
		if (study == null) {
			return "redirect:/";
		}
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

	@PostMapping("/photo/insert")
	@ResponseBody
	public String photoInsert(@RequestParam("photo") MultipartFile[] files, @RequestParam("content") String content,
			@RequestParam("ph_pt_num") String ph_pt_num, @RequestParam("ph_st_num") int st_num,
			HttpServletRequest request) {
		MemberVO member = (MemberVO) request.getSession().getAttribute("user");
		PhotoVO photoVO = new PhotoVO();
		photoVO.setPh_st_num(st_num);
		photoVO.setPh_content(content);
		photoVO.setPh_pt_num(Integer.parseInt(ph_pt_num));
		int MissionFinishVO = studyService.insertMissionFinishMember(member,st_num);
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

	// 로그인하지 않고 스터디탭 눌렀을때 도달하는 url
	@RequestMapping(value = "", method = RequestMethod.GET)
	public ModelAndView mainUserNull(ModelAndView mv, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		if (user != null) {
			mv.setViewName("redirect:/study/" + user.getMe_study());
			return mv;
		}
		String msg = "로그인 후에 사용 가능한 기능입니다.";
		String url = "/";
		mv.addObject("msg", msg);
		mv.addObject("url", url);
		mv.setViewName("/common/message");
		return mv;
	}

	// 로그인했지만 가입한 스터디가 없는 경우 도달하는 url
	@RequestMapping(value = "/0", method = RequestMethod.GET)
	public ModelAndView main(ModelAndView mv, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		String msg, url;
		if (user == null) {
			msg = "로그인 후에 사용가능한 기능입니다.";
			url = "/";
		} else {
			msg = "스터디에 가입해보세요.";
			url = "/gather/list";
		}
		mv.addObject("msg", msg);
		mv.addObject("url", url);
		mv.setViewName("/common/message");
		return mv;
	}

	// 로그인O, me_study정보O 이상적으로 동작할때 도달하는 url
	@RequestMapping(value = "/{st_num}", method = RequestMethod.GET)
	public ModelAndView main(ModelAndView mv, HttpSession session, @PathVariable("st_num") int st_num) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		ArrayList<StudyVO> study = studyService.getStudyByMemberId(user.getMe_id());
		// 해당 user가 가입한 스터디가 1개도 없으면 다른 경로로 리다이렉트
		if (study == null) {
			mv.addObject("msg", "로그인 후 사용가능한 기능입니다.");
			mv.addObject("url", "redirect:/");
			mv.setViewName("/common/message");
		}
		ArrayList<PhotoVO> photo = studyService.selectPhotoPhNumTwo(st_num);
		mv.addObject("photo",photo);
		mv.addObject("st_num", st_num);
		mv.addObject("loginUserId", user.getMe_id());
		mv.setViewName("/study/study_basic");
		return mv;
	}
	
	@RequestMapping(value = "/getMembers/{st_num}", method = RequestMethod.GET)
	@ResponseBody
	public List<StudyMemberVO> getMembers(@PathVariable("st_num") int st_num) {
	    List<StudyMemberVO> members = studyService.selectList(st_num);
	    return members;
	}
	@RequestMapping(value = "/onlineMembers", method = RequestMethod.GET)
	@ResponseBody
	public List<StudyMemberVO> getOnlineMembers() {
		 List<StudyMemberVO> onlineMembers =studyService.getOnlineMembers();
		 return onlineMembers;
	}

	@RequestMapping(value = "/management", method = RequestMethod.GET)
	public ModelAndView management(ModelAndView mv, HttpSession session) {
		// HttpSession에서 "user"라는 이름의 속성을 가져와 MemberVO 객체로 형변환하여 변수 user에 저장
		// 로그인한 유저정보를 가져온다
		// MemberVO user = (MemberVO) session.getAttribute("user");

		// 세션에서 "user" 속성을 검색하고 MemberVO 객체로 캐스팅
		MemberVO user = (MemberVO) session.getAttribute("user");

		// 로그인한 사용자의 ID를 MemberVO 객체에서 가져옴
		String memberId = user.getMe_id();

		// StudyService 클래스의 getStudyListById 메서드를 호출하여 사용자가 속한 스터디 리스트를 가져옴
		ArrayList<StudyVO> myStudyList = studyService.getStudyListById(memberId);
		// System.out.println(myStudyList);

		// "myStudyList" 키와 함께 연구 목록을 ModelAndView 객체에 추가합니다.
		mv.addObject("myStudyList", myStudyList);
		mv.addObject("user", user);
		mv.setViewName("/study/management");
		return mv;
	}

	@RequestMapping(value = "/management", method = RequestMethod.POST)
	public ModelAndView managementPost(ModelAndView mv, StudyVO study) {
		mv.setViewName("redirect:/study/management/member/" + study.getSt_num());
		return mv;
	}

	@RequestMapping(value = "/management/member/{st_num}", method = RequestMethod.GET)
	public ModelAndView managementMember(ModelAndView mv, HttpSession session, MemberVO member, StudyVO study,
			@PathVariable("st_num") int st_num, Criteria cri) {

		// 세션에서 "user" 속성을 검색하고 MemberVO 객체로 캐스팅
		MemberVO user = (MemberVO) session.getAttribute("user");
		// 로그인한 사용자의 ID를 MemberVO 객체에서 가져옴
		String memberId = user.getMe_id();
		// StudyService 클래스의 getStudyListById 메서드를 호출하여 사용자가 속한 스터디 리스트를 가져옴
		ArrayList<StudyVO> myStudyList = studyService.getStudyListById(memberId);

		// cri.setPerPageNum(1);
		// StudyService 클래스의 getStudyMemberList메서드를 호출하여 멤버 리스트를 가져옴
		ArrayList<StudyMemberVO> memberList = studyService.getStudyMemberList(st_num, cri);
		int totalCount = studyService.getStudyTotalCount(st_num);
		System.out.println(totalCount);
		PageMaker pm = new PageMaker(totalCount, 5, cri);

		// "myStudyList" 키와 함께 연구 목록을 ModelAndView 객체에 추가
		mv.addObject("myStudyList", myStudyList);
		mv.addObject("memberList", memberList);
		mv.addObject("st_num", st_num);
		mv.addObject("pm", pm);
		mv.addObject("user", user);
		// 뷰 이름을 "/study/management_member"로 설정
		mv.setViewName("/study/management_member");
		// ModelAndView 객체를 반환
		return mv;
	}

	@ResponseBody
	@RequestMapping(value = "/management/member/delete", method = RequestMethod.POST)
	public HashMap<String, Object> deleteMember(@RequestBody StudyMemberVO sm) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		System.out.println(sm);

		// 멤버를 삭제하고, 새로운 멤버 리스트를 가져옴
		studyService.deleteStudyMember(sm.getSm_num(), sm.getMe_name());
		map.put("result", "success");

		return map;
	}

	@RequestMapping(value = "/management/study", method = RequestMethod.GET)
	public ModelAndView managementStudy(ModelAndView mv, HttpSession session, MemberVO member, StudyVO study) {
		// HttpSession에서 "user"라는 이름의 속성을 가져와 MemberVO 객체로 형변환하여 변수 user에 저장
		// 로그인한 유저정보를 가져온다

		MemberVO user = (MemberVO) session.getAttribute("user");
		String memberId = user.getMe_id();
		// System.out.println(user);

		ArrayList<StudyVO> myStudyList = studyService.getStudyListById(memberId);

		mv.addObject("myStudyList", myStudyList);
		mv.addObject("user", user);
		mv.setViewName("/study/management_study");
		return mv;
	}
	
	//데일리미션 등록
	@PostMapping("/daily/{st_num}/insertmission")
	@ResponseBody
	public String insertMission( @RequestParam("mi_st_num") int st_num,
			@RequestParam("mi_content") String content, 
			HttpServletRequest request) {
		MemberVO user = (MemberVO) request.getSession().getAttribute("user");
		MissionVO missionVO = new MissionVO();
		missionVO.setMi_st_num(st_num);
		missionVO.setMi_content(content);
		if (studyService.insertMission(missionVO)) {
			return "success";
		} else {
			return "error";
		}
	}
	
	//데일리미션 수정
	@PostMapping("/daily/{st_num}/updatemission")
	@ResponseBody
	public String updateMission( @RequestParam("mi_st_num") int st_num,
			@RequestParam("mi_content") String content, 
			HttpServletRequest request) {
		MemberVO user = (MemberVO) request.getSession().getAttribute("user");
		MissionVO missionVO = new MissionVO();
		missionVO.setMi_st_num(st_num);
		missionVO.setMi_content(content);
		if (studyService.updateMission(missionVO)) {
			return "success";
		} else {
			return "error";
		}
	}
	

	//데일리미션 페이지
	@GetMapping("/daily/{st_num}")
	public ModelAndView studyInsert(ModelAndView mv,HttpServletRequest request,@PathVariable("st_num") int st_num) {
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");	
		ArrayList<StudyMemberVO> studyMember = studyService.selectStudyMemberByStNum(st_num);
		Integer authority = studyService.selectSmAuthority(user,st_num);
		MissionVO mission = studyService.selectMission(st_num);
		ArrayList<String> mfList = studyService.selectMissionFinishMember(st_num);
		mv.addObject("mfList",mfList);
		mv.addObject("mission",mission);
		mv.addObject("authority",authority);
		mv.addObject("studyMember",studyMember);
	 	mv.setViewName("/study/daily");
	    return mv;
	}
	

}
