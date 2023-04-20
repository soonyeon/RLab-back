package kr.kh.RLab.service;

import java.util.ArrayList;

import kr.kh.RLab.pagination.Criteria;
import kr.kh.RLab.pagination.GatherCriteria;
import kr.kh.RLab.vo.BoardVO;
import kr.kh.RLab.vo.GatherVO;
import kr.kh.RLab.vo.GrowthVO;
import kr.kh.RLab.vo.MemberVO;
import kr.kh.RLab.vo.StudyVO;
import kr.kh.RLab.vo.TagRegisterVO;

public interface MypageService {
	
	//[마이페이지 홈 > 적립 포인트]
		int getMyPoint(String userId);
		
	//[마이페이지 홈 > 나의 스터디]		
		ArrayList<StudyVO> getMainStudyList(String userId);
		
	//[마이페이지 홈 > 나의 스크랩]	
		ArrayList<BoardVO> getMainScrapList(String userId);
		
	
	//[개인정보 수정 > 비밀번호 체크]
		boolean checkPw(MemberVO pw, MemberVO user);
		
	//[개인정보 수정 > 비밀번호 체크 > 개인정보 수정창]
		// 프로필 이미지 수정
		boolean editImg(MemberVO member, MemberVO user);
		
		// 나머지 개인정보 수정
		boolean editUser(MemberVO member, MemberVO user);
	
		
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
		int getGatherTotalCount(String memberId);
		
		// 내가 쓴 모집글의 찜 여부 가져오기
		ArrayList<Integer> selectWantListById(String memberId);

		
	//[마이페이지 > 펫 불러오기]	
		GrowthVO selectMyPet(String memberId);




}
