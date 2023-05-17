package kr.kh.RLab.controller;

import java.awt.dnd.DragSourceMotionListener;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
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
import kr.kh.RLab.service.MypageService;
import kr.kh.RLab.service.NotificationService;
import kr.kh.RLab.service.StudyService;
import kr.kh.RLab.vo.AlarmVO.AlarmType;
import kr.kh.RLab.vo.FileVO;
import kr.kh.RLab.vo.GatherVO;
import kr.kh.RLab.vo.GrowthVO;
import kr.kh.RLab.vo.LikeVO;
import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.MissionFinishVO;
import kr.kh.RLab.vo.MissionVO;
import kr.kh.RLab.vo.PhotoTypeVO;
import kr.kh.RLab.vo.PhotoVO;
import kr.kh.RLab.vo.RegionVO;
import kr.kh.RLab.vo.StudyMemberVO;
import kr.kh.RLab.vo.StudyVO;
import kr.kh.RLab.vo.TagRegisterVO;
import kr.kh.RLab.vo.TagVO;
import kr.kh.RLab.vo.TodoVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@RequestMapping("/study")
@Slf4j
public class StudyController {

	private final StudyService studyService;
	private final MypageService mypageService;
	private final NotificationService notificationService;
	private final SseController sseController;

	@GetMapping("/photo/{st_num}")
	public String photo(HttpServletRequest request, Model model, HttpSession session,
			@PathVariable("st_num") int st_num) throws IOException {
		
		MemberVO user = (MemberVO) session.getAttribute("user");
		model.addAttribute("user", user);
		ArrayList<PhotoTypeVO> phototypeList = studyService.getListPhotoType();
		MemberVO member = (MemberVO) request.getSession().getAttribute("user");
		ArrayList<StudyVO> study = studyService.getStudyByMemberId(member.getMe_id());
		MissionFinishVO mf = studyService.selectTodayMissionFinsh(member.getMe_id());
		
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
		
		model.addAttribute("mf", mf);
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

		MissionVO mission = studyService.selectTodayMission(st_num);
		if(mission == null && photoVO.getPh_pt_num() == 2) {
			return "noMission";
		}
		MissionFinishVO mf = studyService.selectTodayMissionFinsh(member.getMe_id());
		if(mf != null && photoVO.getPh_pt_num() == 2) {
			return "already";
		}
		if (photoVO.getPh_pt_num() == 2) {
			studyService.insertMissionFinishMember(member, st_num);
		}
		if (studyService.insertCB(photoVO, files, member)) {
			return "success";
		} else {
			return "error";
		}

	}

	@PostMapping("/toggleLike")
	@ResponseBody
	public String toggleLike(@RequestParam("li_ph_num") int li_ph_num, HttpServletRequest request,
			HttpSession session) {
		MemberVO member = (MemberVO) request.getSession().getAttribute("user");
		String li_me_id = member.getMe_id();
		LikeVO likeVO = studyService.getLikeByUserIdAndPhotoId(li_me_id, li_ph_num);
		PhotoVO photo;
		String photoUser;
		String message;
		if (likeVO == null) {// 좋아요가 존재하지않으면,
			LikeVO newLike = new LikeVO();
			newLike.setLi_me_id(li_me_id);
			newLike.setLi_ph_num(li_ph_num);
			newLike.setLi_state(1);
			studyService.insertLike(newLike);

			photo = studyService.getPhotoByPhNum(li_ph_num);
			photoUser = photo.getPh_me_id();// photo 작성자 id
			message = member.getMe_name() + "님이 다음 게시글에 좋아요 표시를 했습니다." + photo.getPh_content();

			notificationService.sendNotificationToUser(photoUser, message, AlarmType.LIKE);
			sseController.sseNewLike(photo.getPh_num(), session);
			return "inserted";
		} else {// 좋아요가 존재하면,
			studyService.deleteLike(li_me_id, li_ph_num);
		}

		return "canceled";
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
		//st_me_id가 유저인 스터디 목록 불러오는 메소드인데 사용되는데가 없는데 지워도되는건가요?
		ArrayList<StudyVO> study = studyService.getStudyByMemberId(user.getMe_id());
		ArrayList<StudyVO> stList = studyService.getUserStudyList(user.getMe_id());
		StudyVO nowStudy = studyService.getStudyByStnum(st_num);
		StudyVO favoriteStudy = studyService.getStudyByStnum(user.getMe_study());
		// 해당 user가 가입한 스터디가 1개도 없으면 다른 경로로 리다이렉트
		if (study == null) {
			mv.addObject("msg", "로그인 후 사용가능한 기능입니다.");
			mv.addObject("url", "redirect:/");
			mv.setViewName("/common/message");
		}
		String memberId = user.getMe_id();
		double todoProgressRate = studyService.getTodoProgressRate(memberId);
	    int todoProgressRateint= (int) Math.round(todoProgressRate);
	    mv.addObject("todoProgressRateint",todoProgressRateint);
		
		
		ArrayList<TodoVO> tdList = studyService.getTodoList(user.getMe_id());
		mv.addObject("tdList", tdList);
		ArrayList<PhotoVO> photo = studyService.selectPhotos(st_num);
		
		mv.addObject("photo", photo);
		mv.addObject("st_num", st_num);
		mv.addObject("study", study);
		mv.addObject("loginUserId", user.getMe_id());
		mv.addObject("stList", stList);
		mv.addObject("now", nowStudy);
		mv.addObject("favorite", favoriteStudy);
		mv.addObject("userId", user.getMe_name());
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
		List<StudyMemberVO> onlineMembers = studyService.getOnlineMembers();
		return onlineMembers;
	}

	@RequestMapping(value = "/management", method = RequestMethod.GET)
	public ModelAndView management(ModelAndView mv, HttpSession session) {
		// HttpSession에서 "user"라는 이름의 속성을 가져와 MemberVO 객체로 형변환하여 변수 user에 저장
		// 로그인한 유저정보를 가져온다
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
		// StudyService 클래스의 getStudyMemberList메서드를 호출하여 멤버 리스트를 가져옴
		ArrayList<StudyMemberVO> memberList = studyService.getStudyMemberList(st_num, cri);
		int totalCount = studyService.getStudyTotalCount(st_num);
		PageMaker pm = new PageMaker(totalCount, 5, cri);
		// "myStudyList" 키와 함께 연구 목록을 ModelAndView 객체에 추가
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
		// 멤버를 삭제하고, 새로운 멤버 리스트를 가져옴
		studyService.deleteStudyMember(sm.getSm_st_num(), sm.getMe_name());
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/management/member/authorize", method = RequestMethod.POST)
	public HashMap<String, Object> authorizeMember(@RequestBody StudyMemberVO sm,
			HttpSession session) {
	    HashMap<String, Object> map = new HashMap<String, Object>();

	    studyService.authorizeStudyMember(sm.getSm_st_num(), sm.getMe_name());

	    String newLeaderId = sm.getSm_me_id();
	    
	    if (newLeaderId != null) {
	        String message = "스터디장을 위임 받았습니다.";
	        notificationService.sendNotificationToUser(newLeaderId, message, AlarmType.STUDY);
	    }

	    sseController.sseAuthorizeStudy(sm,session);

	    return map;
	}
	
	@RequestMapping(value = "/management/study/{st_num}", method = RequestMethod.GET)
	public ModelAndView managementStudy(ModelAndView mv, HttpSession session, @PathVariable("st_num") int st_num) {
		// HttpSession에서 "user"라는 이름의 속성을 가져와 MemberVO 객체로 형변환하여 변수 user에 저장
		// 로그인한 유저정보를 가져온다
		MemberVO user = (MemberVO) session.getAttribute("user");
		String memberId = user.getMe_id();
		int st_state = studyService.getStudyState(st_num);
		mv.addObject("user", user);
		mv.addObject("st_num", st_num); // 스터디 넘버를 ModelAndView에 추가
		mv.addObject("st_state", st_state);
		mv.setViewName("/study/management_study");
		return mv;
	}
  
	//스터디 삭제
	@ResponseBody
	@RequestMapping(value = "/management/study/delete/{st_num}", method = RequestMethod.POST)
	public HashMap<String, Object> deleteStudy(@RequestBody StudyVO st,HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		MemberVO user = (MemberVO) session.getAttribute("user");
		// 해당 스터디를 삭제
		studyService.deleteStudy(st.getSt_num());
		//member me_study업데이트
		ArrayList<MemberVO> meList = studyService.selectMemberListByStNum(st.getSt_num());
		for (MemberVO me : meList ) {
			ArrayList<StudyMemberVO> smList = studyService.selectStudyMemberByMeId(me.getMe_id());
			//id로 스터디가입이 없으면 null로 업데이트
			if(smList.size()==0) {
				studyService.updateMembersNull(me.getMe_id(),null);
			//id로 스터디가입이 된게 있으면 제일 첫번째걸로 업데이트
			}else {	
				studyService.updateMembersFirst(me.getMe_id(),smList.get(0).getSm_st_num());
			}
			//세션에 바뀐st_num저장
			user.setMe_study(smList.get(0).getSm_st_num());
			session.setAttribute("user", user);
		}
		return map;
	}

	// 스터디 상태 변경 1 -> 0
	@ResponseBody
	@RequestMapping(value = "/management/study/update/{st_num}", method = RequestMethod.POST)
	public HashMap<String, Object> stateUpdateStudy(@RequestBody StudyVO st) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		// 해당 스터디 상태를 1에서 0으로 변경
		studyService.stateUpdateStudy(st.getSt_num(), st.getSt_state());
		return map;
	}

	// 스터디 상태 변경 0 -> 1
	@ResponseBody
	@RequestMapping(value = "/management/study/update/undo/{st_num}", method = RequestMethod.POST)
	public HashMap<String, Object> stateUpdateStudyUndo(@RequestBody StudyVO st) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		// 해당 스터디 상태를 1에서 0으로 변경
		studyService.stateUpdateStudyUndo(st.getSt_num(), st.getSt_state());
		return map;
	}

	@RequestMapping(value = "/todo/{st_num}", method = RequestMethod.GET)
	public ModelAndView todoList(ModelAndView mv, HttpSession session,@PathVariable("st_num") int st_num,StudyMemberVO sm, TodoVO td) {
	    MemberVO user = (MemberVO) session.getAttribute("user");
	    String memberId = user.getMe_id();
	    
	    //유저의 투두 리스트 
	    ArrayList<TodoVO> tdList = studyService.getTodoList(memberId);
	    
	    //유저가 참여한 스터디 목록 조회
	    ArrayList<StudyMemberVO> myStudyList = studyService.getMyStudyList(memberId);
	    
	    //유저의 투두 진척도
	    double todoProgressRate = studyService.getTodoProgressRate(memberId);
	    int todoProgressRateint= (int) Math.round(todoProgressRate);
	    //System.out.println("투두 진척도 : " + todoProgressRate+"%");
	    
	    //스터디멤버 리스
	    ArrayList<StudyMemberVO> stMember = studyService.getStudyMember(st_num);
	    
	    //스터디넘버가 일치하는 스터디 멤버 투두 불러오기
	    ArrayList<TodoVO> stMemberTodo = studyService.getStudyMemberTodo(st_num);
	    
	    //멤버 투두 진행
	    //서비스에서 멤버의 투두 총개수,완료 개수를 구해 진척률을 전달받고 정수로 변환->TodoMemberVO에 me_prog_rate를 만들어 값으로 할 
	    ArrayList<StudyMemberVO> stMemberProgRateList = new ArrayList<>();
	    for (StudyMemberVO member : stMember) {
	        double membersTdProgRate = studyService.membersTdProgRate(member.getSm_me_id());
	        int membersTdProgRateint = (int) Math.round(membersTdProgRate);
	        member.setMe_prog_rate(membersTdProgRateint);
	        stMemberProgRateList.add(member);
	    }
	 
	    
	  //나의 펫 데려오기
	  GrowthVO myPet = mypageService.selectMyPet(memberId);
   
	    mv.addObject("myStudyList", myStudyList);
	    mv.addObject("tdList", tdList);
	    mv.addObject("memberId",memberId);
	    mv.addObject("myPet", myPet);
	    mv.addObject("stMember",stMember);
	    mv.addObject("stMemberTodo",stMemberTodo);
	    mv.addObject("todoProgressRateint",todoProgressRateint);
	    mv.addObject("stMemberProgRateList",stMemberProgRateList);
	    mv.setViewName("/study/to_do_list");
	    return mv;
	}

	//투두 인풋 입력값 가져오기
	@ResponseBody
	@PostMapping("/todo/create") // POST 요청 처리를 위한 매핑 경로 설정
	public HashMap<String, Object> insertTodo(ModelAndView mv, @RequestBody TodoVO td) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		studyService.createTodo(td.getTd_content(), td.getTd_me_id());
		return map;
	}

	// 투두 삭제
	@ResponseBody
	@RequestMapping(value = "/todo/delete", method = RequestMethod.POST)
	public HashMap<String, Object> deleteTodo(@RequestBody TodoVO td) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		// 해당 투두를 삭제
		studyService.deleteTodo(td.getTd_num());
		return map;
	}

	// 투두 상태 변경 0 -> 1
	@ResponseBody
	@RequestMapping(value = "/todo/finish", method = RequestMethod.POST)
	public HashMap<String, Object> finishTodo(@RequestBody TodoVO td) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		// 해당 투두 상태를 0에서 1로 변경
		studyService.finishTodo(td.getTd_num(), td.getTd_finish());
		return map;
	}

	// 투두 상태 변경 1 -> 0
	@ResponseBody
	@RequestMapping(value = "/todo/finish/undo", method = RequestMethod.POST)
	public HashMap<String, Object> finishTodoUndo(@RequestBody TodoVO td) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		// 해당 스터디 상태를 1에서 0으로 변경
		studyService.finishTodoUndo(td.getTd_num(), td.getTd_finish());
		return map;
	}
	
	//데일리미션 등록
	@PostMapping("/daily/{st_num}/insertmission")
	@ResponseBody
	public String insertMission(@RequestParam("mi_st_num") int st_num, @RequestParam("mi_content") String content,
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

	// 데일리미션 수정
	@PostMapping("/daily/{st_num}/updatemission")
	@ResponseBody
	public String updateMission(@RequestParam("mi_st_num") int st_num, @RequestParam("mi_content") String content,
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

	// 데일리미션 페이지
	@GetMapping("/daily/{st_num}")
	public ModelAndView studyInsert(ModelAndView mv, HttpServletRequest request, @PathVariable("st_num") int st_num) {
		
		MemberVO user = (MemberVO) request.getSession().getAttribute("user");
		ArrayList<StudyMemberVO> studyMember = studyService.selectStudyMemberByStNum(st_num);
		Integer authority = studyService.selectSmAuthority(user, st_num);
		MissionVO mission = studyService.selectMission(st_num);
		ArrayList<String> mfList = studyService.selectMissionFinishMember(st_num);
		mv.addObject("mfList", mfList);
		mv.addObject("mission", mission);
		mv.addObject("authority", authority);
		mv.addObject("studyMember", studyMember);
		mv.setViewName("/study/daily");
		return mv;
	}

	// 스터디 탈퇴하기
	@PostMapping("/leave/{st_num}")
	@ResponseBody
	public String leaveStudy(HttpSession session, @PathVariable("st_num") int st_num) {
		MemberVO user = (MemberVO) session.getAttribute("user");

		// 스터디 정보
		StudyVO study = studyService.getStudy(st_num);
		StudyMemberVO stMember = studyService.findStudyMember(st_num, user.getMe_id());
		
		
		if (stMember != null && stMember.getSm_authority() == 9) {
			return "leader";
		}
		if (stMember != null) {
			study.setSt_now_people(study.getSt_now_people() - 1);
		}
		String studyLeader = study.getSt_me_id();// 리더 id
		String message = user.getMe_name() + "님이 스터디를 탈퇴했습니다.";

		try {
			notificationService.sendNotificationToUser(studyLeader, message, AlarmType.MEMBER);
			sseController.sseLeaveStudy(st_num, session);
		}catch(Exception e){
			e.printStackTrace();
		}
		// 스터디 정보 업데이트
		studyService.leaveStudy(user, st_num);
		studyService.updateStudy(study);
		// studyMember에 user의 아이로 가입된 스터디 찾아서 업데이트
		ArrayList<MemberVO> findMember = studyService.selectMemberByMemberId(user.getMe_id());
		for (MemberVO me : findMember) {
			ArrayList<StudyMemberVO> smList = studyService.selectStudMemberyByMemberId(me.getMe_id());
			//user_id로 스터디가입이 없으면 null로 업데이트
			if(smList.size()==0) {
				studyService.updateMembersNull(me.getMe_id(), null);
				user.setMe_study(0);
			//user_id로 스터디가입이 있으면 첫번째걸로 업데이트
			}else {
				studyService.updateMembersFirst(me.getMe_id(), smList.get(0).getSm_st_num());
				user.setMe_study(smList.get(0).getSm_st_num());
			}
			//세션에 바뀐st_num저장
			session.setAttribute("user", user);
		}
		//st_num , me_id 일치하는 멤버
		return "success";
	}
  // 즐겨찾기 변경
	@ResponseBody
	@RequestMapping(value = "/setfavorite", method = RequestMethod.POST)
	public HashMap<String, Object> setFavorite(@RequestBody StudyVO st, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		studyService.updateUserFavorite(st.getSt_me_id(),st.getSt_num());
		MemberVO user = (MemberVO) session.getAttribute("user");
		user.setMe_study(st.getSt_num());
		session.setAttribute("user", user);
		return map;
	}
	

	
}
