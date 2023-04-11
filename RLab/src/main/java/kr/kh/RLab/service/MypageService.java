package kr.kh.RLab.service;

import java.util.ArrayList;

import kr.kh.RLab.pagination.Criteria;
import kr.kh.RLab.pagination.GatherCriteria;
import kr.kh.RLab.vo.BoardVO;
import kr.kh.RLab.vo.GatherVO;
import kr.kh.RLab.vo.TagRegisterVO;

public interface MypageService {
	// [나의 게시글 > 작성글 관리]
		// 아이디로 작성 게시글 목록 가져오기
		ArrayList<BoardVO> getBoardListById(String memberId, Criteria cri);
	
		// 로그인한 회원이 작성한 게시글 전체 수 가져오기
		int getPostBoardTotalCount(String memberId);
	
	
	// [나의 스크랩 > 작성글 관리]
		// 아이디로 스크랩한 게시글 목록 가져오기
		ArrayList<BoardVO> getScrapListById(String memberId, Criteria cri);
		
		// 로그인한 회원이 스크랩한 게시글 전체 수 가져오기
		int getScrapBoardTotalCount(String memberId);

	
	// [나의 모집글 > 작성글 관리]
		// 아이디로 내가 쓴 모집글 가져오기
		ArrayList<GatherVO> getGatherListById(String memberId, GatherCriteria cri);
		
		// 내가 쓴 모집글 스터디의 태그들 가져오기
		ArrayList<TagRegisterVO> selectTagListById(String memberId);
	
}
