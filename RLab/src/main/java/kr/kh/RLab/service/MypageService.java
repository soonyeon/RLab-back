package kr.kh.RLab.service;

import java.util.ArrayList;

import kr.kh.RLab.pagination.Criteria;
import kr.kh.RLab.pagination.GatherCriteria;
import kr.kh.RLab.vo.BoardVO;
import kr.kh.RLab.vo.GatherVO;
import kr.kh.RLab.vo.GrowthVO;
import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.PayDTO;
import kr.kh.RLab.vo.ReservationVO;
import kr.kh.RLab.vo.StudyVO;
import kr.kh.RLab.vo.TagRegisterVO;

public interface MypageService {
	
	//[마이페이지 홈 > 이용 시간]
		ReservationVO getRes(String userId);
	
	//[마이페이지 홈 > 펫 경험치]
		GrowthVO getPetEx(String userId);
		
		int getLevelUpExp(int currentLevel);
		
		int updateExp(int currentEx, String userId);
		
	//[마이페이지 홈 > 적립 포인트]
		int getMyPoint(String userId);	
	
	//[마이페이지 홈 > 나의 예약]
		//좌석 예약 정보 가져오기
		ReservationVO getMySeat(String userId);
		//사물함 예약 정보 가져오기
		ReservationVO getMyLocker(String userId);
		
		ArrayList<ReservationVO> getResList(String userId);
		
	//[마이페이지 홈 > 나의 스터디]		
		ArrayList<StudyVO> getMainStudyList(String userId);
		
	//[마이페이지 홈 > 나의 스크랩]	
		ArrayList<BoardVO> getMainScrapList(String userId);
		
	
	//[예약 관리 > 나의 결제 내역]	
		//결제 정보 가져오기
		ArrayList<PayDTO> getPayList(String memberId, Criteria cri);
		
		//결제 전체 수 가져오기
		int getPayTotalCount(String memberId);
		
		
	//[예약 관리 > 나의 결제 내역 > 결제 상세 내역]
		//결제번호 가져오기
		String getPaOrderId(String memberId);
		
		//결제번호로 결제 정보 가져오기
		PayDTO getPayDto(String paOrderId);
		
		// 해당 결제 정보안의 구매목록 가져오기
		ArrayList<String> getItemList(String paOrderId);
		
	//[예약 관리 > 나의 예약 내역]
		//나의 예약 목록 가져오기
		ArrayList<ReservationVO> getBookList(String memberId, Criteria cri);
		
		//예약 전체 수 가져오기
		int getBookTotalCount(String memberId);
	
	//[예약 관리 > 나의 예약 내역 >  예약 상세 내역]
		//캐비넷 이용권 이름 가져오기
		String getTicketNameByBookInfo(ReservationVO rsv);
		
	///////////////////////	
	//[개인정보 수정 > 비밀번호 체크]
		boolean checkPw(MemberVO pw, MemberVO user);
		
	//[개인정보 수정 > 비밀번호 체크 > 개인정보 수정창]
		// 프로필 이미지 수정
		boolean editImg(MemberVO member, MemberVO user);
		
		// 나머지 개인정보 수정
		boolean editUser(MemberVO member, MemberVO user);
	
	///////////////////
		
	//[스터디 관리 > 내가 찜한 스터디]	
		// 아이디로 내가 찜한 스터디 가져오기	
		ArrayList<GatherVO> getFavoriteList(String memberId, GatherCriteria cri);	
		
		// 내가 찜한 스터디의 태그들 가져오기
		ArrayList<TagRegisterVO> getfavoriteTagList(GatherCriteria cri);
		
		// 내가 찜한 모집글의 수 
		int getFavoriteTotalCount(String memberId, GatherCriteria cri);
		
	//[스터디 관리 > 내가 개설한 스터디]	
		// 아이디로 내가 개설한 스터디 가져오기		
		ArrayList<StudyVO> getOpenList(String memberId, GatherCriteria cri);
		
		// 내가 개설한 스터디 개수
		int getOpenTotalCount(String memberId, GatherCriteria cri);
		
		
	//[스터디 관리 > 진행중인 스터디]	
		// 아이디로 진행중인 스터디 가져오기 (내가 회원으로 들어가 있는 스터디)
		ArrayList<StudyVO> getProgressList(String memberId, GatherCriteria cri);
		
		// 진행중인 스터디 개수
		int getProgressTotalCount(String memberId, GatherCriteria cri);
		
		
	/////////////////	
	//[작성글 관리 > 나의 게시글]
		// 아이디로 작성 게시글 목록 가져오기
		ArrayList<BoardVO> getBoardListById(String memberId, Criteria cri);
		
		// 로그인한 회원이 작성한 게시글 전체 수 가져오기
		int getPostBoardTotalCount(String memberId);
	
	
	//[작성글 관리 > 나의 스크랩]
		// 아이디로 스크랩한 게시글 목록 가져오기
		ArrayList<BoardVO> getScrapListById(String memberId, Criteria cri);	
		
		// 로그인한 회원이 스크랩한 게시글 전체 수 가져오기
		int getScrapBoardTotalCount(String memberId);

	
	//[작성글 관리 > 나의 모집글]
		// 아이디로 내가 쓴 모집글 가져오기
		ArrayList<GatherVO> getGatherListById(String memberId, GatherCriteria cri);	
		
		// 내가 쓴 모집글 스터디의 태그들 가져오기
		ArrayList<TagRegisterVO> selectTagListById(String memberId);
		
		// 로그인한 회원이 작성한 모집글 전체 수 가져오기
		int getGatherTotalCount(String memberId, GatherCriteria cri);
		
		// 내가 쓴 모집글의 찜 여부 가져오기
		ArrayList<Integer> selectWantListById(String memberId);

		
	//[마이페이지 > 펫]	
		//펫 불러오기
		GrowthVO selectMyPet(String memberId);

		//펫 경험치 가져오기
		GrowthVO selectPetExp(String memberId);




}
