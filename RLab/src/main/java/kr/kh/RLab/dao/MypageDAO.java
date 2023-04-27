package kr.kh.RLab.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

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
import kr.kh.RLab.vo.TicketOwnVO;

public interface MypageDAO {
	
	//[마이페이지 홈]
		// 이용 시간
		ReservationVO selectRes(String userId);
		
		// 펫 경험치
		GrowthVO selectPetEx(String userId);	
		
		int selectLevelUpExp(int currentLevel);
		
		int updateExp(@Param("currentEx")int currentEx, @Param("userId")String userId);
    
		// 내 펫 정보 가져오기
		GrowthVO selectMyPet(String memberId);
		
		// 펫 경험치 가져오기
		GrowthVO selectPetExp(String memberId);
		
		// 적립 포인트
		int selectMyPoint(@Param("userId")String userId);
		
		// 나의 예약
			//좌석 예약 정보 가져오기
			ReservationVO selectMySeat(String userId);
			//사물함 예약 정보 가져오기
			ReservationVO selectMyLocker(String userId);
			
			ArrayList<ReservationVO> selectResList(String userId);
		
		// 나의 스터디
		ArrayList<StudyVO> selectMainStudyList(String userId);
		
		// 나의 스크랩
		ArrayList<BoardVO> selectMainScrapList(String userId);
    
    
  
		

		
	//[개인정보 수정 > 비밀번호 체크 > 개인정보 수정창]
		// 프로필 이미지 수정
		int updateProfile(@Param("m")MemberVO member);
		
		// 나머지 개인정보 수정
		int updateMember(@Param("m")MemberVO member);
		
		
	//[예약 관리 > 나의 결제 내역]	
		//나의 결제 정보 가져오기	
		ArrayList<PayDTO> selectPayList(String memberId);
		
		//나의 결제 전체 수
		int selectPayTotalCount(String memberId);
		
		
	//[예약 관리 > 나의 결제 내역 > 결제 상세 내역]		
		String selectPaOrderId(String memberId);
		
		
	//[작성글 관리 > 나의 게시글]
		// 아이디로 작성 게시글 목록 가져오기
		ArrayList<BoardVO> selectBoardListById(@Param("memberId")String memberId, @Param("cri")Criteria cri);
	
		// 로그인한 회원이 스크랩한 게시글 전체 수 가져오기
		int selectPostBoardTotalCount(String memberId);
	
		
	//[작성글 관리 > 나의 스크랩]	
		// 아이디로 스크랩한 게시글 목록 가져오기
		ArrayList<BoardVO> selectScrapListById(@Param("memberId")String memberId, @Param("cri")Criteria cri);
		
		// 로그인한 회원이 스크랩한 게시글 전체 수 가져오기
		int selectScrapBoardTotalCount(String memberId);
		
		
	//[작성글 관리 > 나의 모집글]
		// 아이디로 내가 쓴 모집글 가져오기	
		ArrayList<GatherVO> selectGatherListById(@Param("memberId")String memberId, @Param("gatherCri")GatherCriteria cri);
		
		// 내가 쓴 모집글 스터디의 태그들 가져오기
		ArrayList<TagRegisterVO> selectTagListById(String memberId);
		
		// 로그인한 회원이 작성한 모집글 전체 수 가져오기
		int selectGatherTotalCount(String memberId);
		
		// 내가 쓴 모집글의 찜 여부 가져오기
		ArrayList<Integer> selectWantListById(String memberId);






}
