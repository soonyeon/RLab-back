package kr.kh.RLab.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.kh.RLab.pagination.Criteria;
import kr.kh.RLab.pagination.GatherCriteria;
import kr.kh.RLab.pagination.PageMaker;
import kr.kh.RLab.service.MypageService;
import kr.kh.RLab.service.PetService;
import kr.kh.RLab.service.ReservationService;
import kr.kh.RLab.service.StudyService;
import kr.kh.RLab.vo.BoardVO;
import kr.kh.RLab.vo.BranchVO;
import kr.kh.RLab.vo.EvolutionVO;
import kr.kh.RLab.vo.FileVO;
import kr.kh.RLab.vo.GatherVO;
import kr.kh.RLab.vo.GrowthVO;
import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.PayDTO;
import kr.kh.RLab.vo.PetVO;
import kr.kh.RLab.vo.ReservationVO;
import kr.kh.RLab.vo.StudyMemberVO;
import kr.kh.RLab.vo.StudyVO;
import kr.kh.RLab.vo.TagRegisterVO;
import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Controller
@RequestMapping("/mypage")
public class MypageController {
	private final MypageService mypageService;
	private final PetService petService;
	private final StudyService studyService;
	private final ReservationService reservationService;
	
	//[마이페이지 홈]
	@GetMapping("")
	public ModelAndView mypage(ModelAndView mv, MemberVO member, HttpSession session) {
		// 현재 로그인한 사용자 정보를 가져옴
		MemberVO user = (MemberVO)session.getAttribute("user");
		// 현재 로그인한 사용자의 아이디를 userId에 담는다
		String userId = user.getMe_id();
		
		// 이용시간 안내
		ReservationVO res = reservationService.getMyReservation(1, userId);
		
		//나의 펫 데려오기
		GrowthVO myPet = mypageService.selectMyPet(userId);
		
		// 나의 펫이 존재하면...
		if(myPet != null) {
			// 레벨업까지의 경험치 정보
			// 현재 레벨
			int currentLevel = myPet.getGr_level();
			// 현재 누적경험치
			int currentExp = myPet.getGr_exp();
			// 현재 레벨의 최대경험치
			int	levelUpExp = mypageService.getLevelUpExp(currentLevel);	
			// 레벨 2이상이면 경험치 데이터를 누적->현재 레벨 시점으로 수정
			if(currentLevel >= 2) {
				// 이전 레벨의 최대경험치
				int exExp = mypageService.getLevelUpExp(currentLevel-1);
				currentExp -= exExp;
				levelUpExp -= exExp;
			}
//			mv.addObject("currentLevel", currentLevel);
			mv.addObject("currentExp", currentExp);
			mv.addObject("levelUpExp", levelUpExp);
		}
		
		// 펫
		ArrayList<PetVO> petList = petService.selectPetList();
		ArrayList<EvolutionVO> petFile = petService.selectPetFile();
		
		
		//적립 포인트 데이터 가져오기
		int myPoint = mypageService.getMyPoint(userId);
		System.out.println(5);
		
		//나의 예약 데이터 가져오기
			//좌석 예약 정보 가져오기		
			ReservationVO mySeat = mypageService.getMySeat(userId);
			System.out.println(6);

			//사물함 예약 정보 가져오기
			ReservationVO myLocker = mypageService.getMyLocker(userId);
			System.out.println(7);

		//나의 스터디 데이터 가져오기
		ArrayList<StudyVO> myStudyList = mypageService.getMainStudyList(userId);
		
		//나의 스크랩 데이터 가져오기
		ArrayList<BoardVO> myScrapList = mypageService.getMainScrapList(userId);

		mv.addObject("myPet",myPet);
		mv.addObject("myPoint", myPoint);
		mv.addObject("res", res);
		mv.addObject("mySeat", mySeat);
		mv.addObject("myLocker", myLocker);
		mv.addObject("myScrapList", myScrapList);
		mv.addObject("myStudyList", myStudyList);
		mv.addObject("petList",petList);
		mv.addObject("petFile",petFile);
		mv.setViewName("/mypage/mypage");
		return mv;
	}
	
	@ResponseBody
	@GetMapping("/timeGauge")
	public ReservationVO timeGauge (ModelAndView mv,  HttpSession session) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		ReservationVO res = reservationService.getMyReservation(1, user.getMe_id());
		return res;
	}
	
	//////////////////////////
	//[개인정보 수정 > 비밀번호 체크]
	@GetMapping("/pwcheck")
	public ModelAndView pwCheck(ModelAndView mv) {
		mv.setViewName("/mypage/pwcheck");
		return mv;
	}
	
	@PostMapping("/pwcheck")
	public ModelAndView pwCheckPost(ModelAndView mv, MemberVO pw,
			HttpSession session) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		boolean res = mypageService.checkPw(pw, user);
		if(res) {
			mv.setViewName("redirect:/mypage/user");
		}
		else
			mv.setViewName("redirect:/mypage/pwcheck");
		return mv;
	}
	
	
	//[개인정보 수정 > 비밀번호 체크 > 개인정보 수정창]
	@GetMapping("/user")
	public ModelAndView editUser(ModelAndView mv) {
		mv.setViewName("/mypage/edit_user");
		return mv;
	}

	@PostMapping("/user")
	public ModelAndView editUser(ModelAndView mv, MemberVO member, HttpSession session, MultipartFile file) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		String userId = user.getMe_id();
		member.setMe_id(user.getMe_id());	
		
		// 프로필 이미지 변경
		String filePath = "D:/uploadFiles";
		String originName = file.getOriginalFilename();
		String fileName = "/profile/" + userId + "_" + originName;
		File dest = new File(filePath + fileName);
		
		if(originName != "") {
			member.setMe_profile(fileName);
			try {
				file.transferTo(dest);
				boolean isImgEdited = mypageService.editImg(member, user); 
				if(isImgEdited) {
					user.setMe_profile(member.getMe_profile());
					mv.setViewName("redirect:/mypage/pwcheck");
				}else {
					mv.setViewName("redirect:/mypage/edit_user");
				}
			} catch (IllegalStateException e) {
				e.printStackTrace();
				mv.setViewName("redirect:/");
			} catch (IOException e) {
				e.printStackTrace();
				mv.setViewName("redirect:/");
			}	
		}else {
			member.setMe_profile(user.getMe_profile());
		}
		boolean isEdited = mypageService.editUser(member, user); 
		if(isEdited) {
			user.setMe_name(member.getMe_name());
			user.setMe_pw(member.getMe_pw());
			user.setMe_email(member.getMe_email());
			session.setAttribute("user", user);
			mv.setViewName("redirect:/");
		}else {
			mv.setViewName("redirect:/mypage/user");
			return mv;
		}
		return mv;
	}
	
	/////////////////////////////
	
	//[예약 관리 > 나의 결제 내역]
	@GetMapping("/myres_pay")
	public ModelAndView myPay(
			ModelAndView mv, HttpSession session, MemberVO member, Criteria cri){		
		// 세션 정보 가져오기
		MemberVO user = (MemberVO)session.getAttribute("user");
		String memberId = user.getMe_id();
		
		// 아이디로 나의 결제 목록 가져오기
		ArrayList<PayDTO> myPayList = mypageService.getPayList(memberId, cri);

		// 페이지 네이션
		// 로그인한 회원이 가진 결제 전체 수 가져오기
		int totalCount = mypageService.getPayTotalCount(memberId);
		PageMaker pm = new PageMaker(totalCount, 2, cri);
		
		mv.addObject("myPayList", myPayList);
		mv.addObject("pm", pm);
		mv.setViewName("/mypage/myres_pay");
		return mv;
	}
	
	//[예약 관리 > 나의 결제 내역 > 결제 상세 내역]
	@GetMapping("/myres_pay/{pa_order_id}")
	public ModelAndView myPayDetail(
			ModelAndView mv, HttpSession session, @PathVariable String pa_order_id, MemberVO member, Criteria cri){	
		// 세션 정보 가져오기
		MemberVO user = (MemberVO)session.getAttribute("user");
		String memberId = user.getMe_id();
		
		//결제번호로 결제 정보 가져오기
        PayDTO pay = mypageService.getPayDto(pa_order_id);
        //해당 결제 정보안의 구매목록 가져오기
        ArrayList<String> itemList = mypageService.getItemList(pa_order_id);
        
        mv.addObject("pa_order_id", pa_order_id);
		mv.addObject("pay", pay);
        mv.addObject("itemList", itemList);
        mv.setViewName("/mypage/pay_detail");
        return mv;
	}
	
	//[예약 관리 > 나의 예약 내역]
		@GetMapping("/myres_book")
		public ModelAndView myBook(
				ModelAndView mv, HttpSession session, MemberVO member, Criteria cri){		
			// 세션 정보 가져오기
			MemberVO user = (MemberVO)session.getAttribute("user");
			String memberId = user.getMe_id();
			
			// 아이디로 나의 예약 목록 가져오기
			ArrayList<ReservationVO> myBookList = mypageService.getBookList(memberId, cri);
			// 페이지 네이션
			// 로그인한 회원이 가진 예약 전체 수 가져오기
			int totalCount = mypageService.getBookTotalCount(memberId);
			PageMaker pm = new PageMaker(totalCount, 2, cri);
			mv.addObject("myBookList", myBookList);
			mv.addObject("pm", pm);
			mv.setViewName("/mypage/myres_book");
			return mv;
		}
		
	//[예약 관리 > 나의 예약 내역 > 좌석 예약 상세 내역]	
		@GetMapping("/myres_book/1/{re_num}")
		public ModelAndView myBookSeatDetail(
				ModelAndView mv, HttpSession session, @PathVariable int re_num, MemberVO member, Criteria cri){	
			MemberVO user = (MemberVO)session.getAttribute("user");
			ReservationVO rsv = reservationService.getReservation(re_num);
			BranchVO br  = reservationService.getBranchBySeNum(rsv.getRe_se_num());
			String ticketName = reservationService.getTicketNameByBookInfo(rsv);
			int restTime = reservationService.getRestTime(rsv.getRe_to_num());
			mv.addObject("user", user);
			mv.addObject("rsv", rsv);
			mv.addObject("br", br);
			mv.addObject("ticketName",ticketName);
			mv.addObject("restTime",restTime);
	        mv.setViewName("/mypage/book_seat_detail");
	        return mv;
		}
		
	//[예약 관리 > 나의 예약 내역 > 캐비넷 예약 상세 내역]	
		@GetMapping("/myres_book/2/{re_num}")
		public ModelAndView myBookLockerDetail(
				ModelAndView mv, HttpSession session, @PathVariable int re_num, MemberVO member, Criteria cri){	
			MemberVO user = (MemberVO)session.getAttribute("user");
			ReservationVO rsv = reservationService.getReservation(re_num);
			BranchVO br  = reservationService.getBranchBySeNum(rsv.getRe_se_num());
			String ticketName = mypageService.getTicketNameByBookInfo(rsv);
			mv.addObject("user", user);
			mv.addObject("rsv", rsv);
			mv.addObject("br", br);
			mv.addObject("ticketName",ticketName);
	        mv.setViewName("/mypage/book_locker_detail");
	        return mv;
		}
	
	//////////////////////////////////
	//[스터디 관리 > 내가 찜한 스터디]
		@GetMapping("/mystudy_favorite")
		public ModelAndView myStudyFavorite(
				ModelAndView mv, HttpSession session, MemberVO member, GatherCriteria cri){		
			/// 세션 정보 가져오기
			MemberVO user = (MemberVO)session.getAttribute("user");
			String memberId = user.getMe_id();
			
			// 아이디로 내가 찜한 스터디 가져오기
			ArrayList<GatherVO> myFavoriteList = mypageService.getFavoriteList(memberId, cri);
			
			// 내가 찜한 스터디의 태그들 가져오기
			ArrayList<TagRegisterVO>favoriteTagList = mypageService.getfavoriteTagList(cri);
			
			// 내가 찜한 스터디 찜 여부 가져오기
			ArrayList<Integer> wantList = mypageService.selectWantListById(memberId);
			
			// 내가 찜한 스터디 사진 가져오기
			ArrayList<FileVO> fileList = mypageService.selectFileList();
			
			// 페이지 네이션		
			int totalCount = mypageService.getFavoriteTotalCount(memberId, cri);
			PageMaker pm = new PageMaker(totalCount, 1, cri);
			
			mv.addObject("fileList",fileList);
			mv.addObject("myFavoriteList", myFavoriteList);
			mv.addObject("favoriteTagList", favoriteTagList);
			mv.addObject("wantList", wantList);
			mv.addObject("pm", pm);
			mv.setViewName("/mypage/mystudy_favorite");
			return mv;
		}
		
		//[스터디 관리 > 내가 개설한 스터디]
		@GetMapping("/mystudy_open")
		public ModelAndView myStudyOpen(
				ModelAndView mv, HttpSession session, MemberVO member, GatherCriteria cri){		
			/// 세션 정보 가져오기
			MemberVO user = (MemberVO)session.getAttribute("user");
			String memberId = user.getMe_id();
			
			// 아이디로 내가 개설한 스터디 가져오기
			ArrayList<StudyVO> myOpenList = mypageService.getOpenList(memberId, cri);
			
			// 페이지 네이션		
			int totalCount = mypageService.getOpenTotalCount(memberId, cri);
			PageMaker pm = new PageMaker(totalCount, 1, cri);
			
			mv.addObject("myOpenList", myOpenList);
			mv.addObject("pm", pm);
			mv.setViewName("/mypage/mystudy_open");
			return mv;
		}
		
		//[스터디 관리 > 진행중인 스터디]
		@GetMapping("/mystudy_progress")
		public ModelAndView myStudyProgress(
				ModelAndView mv, HttpSession session, MemberVO member, GatherCriteria cri){		
			/// 세션 정보 가져오기
			MemberVO user = (MemberVO)session.getAttribute("user");
			String memberId = user.getMe_id();
			
			// 아이디로 진행중인 스터디 가져오기 (내가 회원으로 들어가 있는 스터디)
			ArrayList<StudyVO> myProgressList = mypageService.getProgressList(memberId, cri);
			
			// sm_authority 가져오기
			ArrayList<StudyMemberVO> smAuthorities = mypageService.getSmAuthority(memberId, cri);
			
			// 페이지 네이션		
			int totalCount = mypageService.getProgressTotalCount(memberId, cri);
			PageMaker pm = new PageMaker(totalCount, 1, cri);
			
			mv.addObject("myProgressList", myProgressList);
			mv.addObject("smAuthority", smAuthorities);
			mv.addObject("pm", pm);
			mv.setViewName("/mypage/mystudy_progress");
			return mv;
		}

	///////////////////////////////
	//[작성글 관리 > 나의 게시글]
	@GetMapping("/mypost_post")
	public ModelAndView mypost(
			ModelAndView mv, HttpSession session, MemberVO member, BoardVO board, Criteria cri){		
		// 세션 정보 가져오기
		MemberVO user = (MemberVO)session.getAttribute("user");
		String memberId = user.getMe_id();
		
		// 아이디로 작성 게시글 목록 가져오기
		ArrayList<BoardVO> myBoardList = mypageService.getBoardListById(memberId, cri);
		
		// 페이지 네이션
		// 로그인한 회원이 작성한 게시글 전체 수 가져오기
		int totalCount = mypageService.getPostBoardTotalCount(memberId);
		PageMaker pm = new PageMaker(totalCount, 2, cri);
		
		mv.addObject("myBoardList", myBoardList);
		mv.addObject("pm", pm);
		mv.setViewName("/mypage/mypost_post");
		return mv;
	}
	
	//[작성글 관리 > 나의 스크랩]
	@GetMapping("/mypost_scrap")
	public ModelAndView mypostScrap(ModelAndView mv, HttpSession session, BoardVO board, MemberVO member, Criteria cri) {
		// 세션 정보 가져오기
		MemberVO user = (MemberVO)session.getAttribute("user");
		String memberId = user.getMe_id();
		
		// 아이디로 스크랩한 게시글 목록 가져오기
		ArrayList<BoardVO> myScrapList = mypageService.getScrapListById(memberId, cri);
		
		// 페이지 네이션
		// 로그인한 회원이 스크랩한 게시글 전체 수 가져오기
		int totalCount = mypageService.getScrapBoardTotalCount(memberId);
		PageMaker pm = new PageMaker(totalCount, 2, cri);
		mv.addObject("myScrapList", myScrapList);
		mv.addObject("pm", pm);
		mv.setViewName("/mypage/mypost_scrap");
		return mv;
	}
	
	//[작성글 관리 > 나의 모집글]
	@GetMapping("/mypost_recruit")
	public ModelAndView mypostRecruit(ModelAndView mv, HttpSession session, GatherVO gather, GatherCriteria cri) {
		// 세션 정보 가져오기
		MemberVO user = (MemberVO)session.getAttribute("user");
		String memberId = user.getMe_id();
		
		// 아이디로 내가 쓴 모집글 가져오기
		ArrayList<GatherVO> myGatherList = mypageService.getGatherListById(memberId, cri);
		
		// 내가 쓴 모집글 스터디의 태그들 가져오기
		ArrayList<TagRegisterVO> tagList = mypageService.selectTagListById(memberId);
		
		// 내가 쓴 모집글의 찜 여부 가져오기
		ArrayList<Integer> wantList = mypageService.selectWantListById(memberId);

		// 페이지 네이션		
		int totalCount = mypageService.getGatherTotalCount(memberId, cri);
		PageMaker pm = new PageMaker(totalCount, 1, cri);
		
		mv.addObject("myGatherList", myGatherList);
		mv.addObject("tagList", tagList);
		mv.addObject("wantList", wantList);
		mv.addObject("pm", pm);
		mv.setViewName("/mypage/mypost_recruit");
		return mv;
	}
	


}